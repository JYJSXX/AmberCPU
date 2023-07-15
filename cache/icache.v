
`timescale 1ns / 1ps
`include "../config.vh"
`include "../exception.vh"

module icache #(
    parameter INDEX_WIDTH       = 6,
    parameter WORD_OFFSET_WIDTH = 4,
    parameter COOKIE_WIDTH      = 32
)(
    input               clk,            
    input               rstn,           
    // for pipeline 
    input               rvalid,         // valid signal of read request from pipeline
    output reg          rready,         // ready signal of read request to pipeline
    input [31:0]        raddr,          // read address from pipeline
    input [31:0]        p_addr,         // physical address from pipeline
    output [63:0]       rdata,          // read data to pipeline
    // for AXI arbiter
    output reg          i_rvalid,       // valid signal of read request to main memory
    input               i_rready,       // ready signal of read request from main memory
    output [31:0]       i_raddr,        // read address to main memory
    input [511:0]        i_rdata,        // read data from main memory
    // 暂时用不到
    // input               i_rlast,        // indicate the last beat of read data from main memory
    // output [2:0]        i_rsize,        // indicate the size of read data once, if i_rsize = n then read 2^n bytes once
    // output [7:0]        i_rlen          // indicate the number of read data, if i_rlen = n then read n+1 times
    
    output [31:0] badv,               // 无效虚拟地址
    output [6:0] exception,
    input               flush,          // flush signal from pipeline
    input               uncache,        // uncache signal from pipeline
    input  [COOKIE_WIDTH-1:0] cookie_in, // cookie from pipeline
    output [COOKIE_WIDTH-1:0] cookie_out, // cookie to pipeline
    output [63:0]       r_data_cpu,     // read data to pipeline    

    input cacop_en,
    input [1:0] cacop_code,
    output reg cacop_ready,
    output reg cacop_complete,

    input [6:0] tlb_exception         
);
    localparam 
        BYTE_OFFSET_WIDTH   = WORD_OFFSET_WIDTH + 2,                // total offset bits
        TAG_WIDTH           = 32 - BYTE_OFFSET_WIDTH - INDEX_WIDTH, // tag bits
        SET_NUM             = 1 << INDEX_WIDTH,                     // block(set) number of one Road
        WORD_NUM            = 1 << WORD_OFFSET_WIDTH,               // words per block(set)
        BYTE_NUM            = 1 << BYTE_OFFSET_WIDTH,               // bytes per block(set)
        BIT_NUM             = BYTE_NUM << 3;                        // bits per block(set)
    
    // request buffer
    reg     [31:0]              req_buf;
    reg                         req_buf_we;
    
    // return buffer
    reg     [BIT_NUM-1:0]       ret_buf;

    // data memory
    wire    [INDEX_WIDTH-1:0]   r_index, w_index;
    reg     [1:0]               mem_we;                
    wire    [BIT_NUM-1:0]       mem_rdata [0:1];     

    // tagv memory
    reg     [1:0]               tagv_we;          
    wire    [TAG_WIDTH-1:0]     w_tag;
    wire    [TAG_WIDTH:0]       tag_rdata [0:1]; 

    // hit
    wire    [1:0]               hit;
    wire                        hit_way;
    wire                        cache_hit;
    wire    [TAG_WIDTH-1:0]     tag;

    // LRU
    reg  [INDEX_WIDTH-1:0]      lru_index; //0: way0, 1: way1
    wire [1:0]                      lru_sel;
    reg                         lru_we;

    // read control
    reg                         data_from_mem;

    // // statistics 统计信息
    // reg     [63:0]              total_time;
    // reg     [63:0]              total_hit;

    // cache operation
    reg tagv_clear;
    reg [1:0] cacop_code_buf;
    reg cacop_en_buf;
    wire tagv_sel;
    wire [INDEX_WIDTH-1:0] tagv_index;
    wire store_tag, index_invalid, hit_invalid;
    assign store_tag     = (cacop_code_buf == 2'b00);
    assign index_invalid = (cacop_code_buf == 2'b01);
    assign hit_invalid   = (cacop_code_buf == 2'b10);
    assign tagv_way_sel      = req_buf[0] ? 2 : 1;
    assign tagv_index        = req_buf[INDEX_WIDTH + BYTE_OFFSET_WIDTH - 1: BYTE_OFFSET_WIDTH];

    // cookie
    reg [COOKIE_WIDTH-1:0] cookie_buf;

    // exception
    wire [6:0] exception_temp, exception_normal, exception_buf;
    wire exception_sel;


    /* request buffer: lock the read request addr */
    always @(posedge clk) begin
        if(!rstn) begin
            req_buf <= 0;
        end
        else if(req_buf_we) begin
            req_buf <= raddr;
        end
    end

    /* return buffer: cat the return 32-bit data */
    always @(posedge clk) begin
        if(!rstn) begin
            ret_buf <= 0;
        end
        else if(i_rvalid && i_rready) begin
            ret_buf <= i_rdata;
        end
    end

    /* physical address buffer */
    reg [31:0] paddr_buf;
    reg pbuf_we;
    always @(posedge clk) begin
        if(!rstn) begin
            paddr_buf <= 0;
        end
        else if(pbuf_we) begin
            paddr_buf <= p_addr;
        end
    end

    /* uncache buffer*/
    reg uncache_buf;
    always @(posedge clk) begin
        if(!rstn) begin
            uncache_buf <= 0;
        end
        else if(req_buf_we) begin
            uncache_buf <= uncache;
        end
    end

    /* cookie buffer */
    always @(posedge clk) begin
        if(!rstn) begin
            cookie_buf <= 0;
        end
        else if(req_buf_we) begin
            cookie_buf <= cookie_in;
        end
    end

    /* cache operation */
    always @(posedge clk) begin
        if(!rstn) begin
            cacop_en_buf <= 0;
            cacop_code_buf <= 0;
        end
        else if(req_buf_we) begin
            cacop_en_buf <= cacop_en;
            cacop_code_buf <= cacop_code;
        end
    end

    /* 2-way data memory */
    // read index
    assign r_index = raddr[BYTE_OFFSET_WIDTH+INDEX_WIDTH-1:BYTE_OFFSET_WIDTH];
    // write index 
    assign w_index = req_buf[BYTE_OFFSET_WIDTH+INDEX_WIDTH-1:BYTE_OFFSET_WIDTH];

    BRAM_common #(
        .DATA_WIDTH(BIT_NUM),
        .ADDR_WIDTH (INDEX_WIDTH)
    ) data_mem0 (
        .clk      (clk ),
        .raddr    (r_index),
        .waddr    (w_index),
        .din      (ret_buf),
        .we       (mem_we[0]),
        .dout     (mem_rdata[0])
    );
    BRAM_common #(
        .DATA_WIDTH(BIT_NUM),
        .ADDR_WIDTH (INDEX_WIDTH)
    ) data_mem1 (
        .clk      (clk ),
        .raddr    (r_index),
        .waddr    (w_index),
        .din      (ret_buf),
        .we       (mem_we[1]),
        .dout     (mem_rdata[1])
    );

    /* 2-way tagv memory: the highest bit is the valid bit */
    wire vaild[1:0];
    wire [TAG_WIDTH:0] tag_in;
    assign valid[0] = tag_rdata[0][TAG_WIDTH];
    assign valid[1] = tag_rdata[1][TAG_WIDTH];
    // the tag ready to be written to tagv table
    assign w_tag = paddr_buf[31:32-TAG_WIDTH];
    assign tag_in = tagv_clear ? 0 : {1'b1, w_tag};
    BRAM_common #(
      .DATA_WIDTH(TAG_WIDTH+1),
      .ADDR_WIDTH (INDEX_WIDTH)
    ) tagv_mem0 (
      .clk      (clk ),
      .raddr    (r_index),
      .waddr    (w_index),
      .din      (tag_in),
      .we       (tagv_we[0]),
      .dout     (tag_rdata[0])
    );
    BRAM_common #(
      .DATA_WIDTH(TAG_WIDTH+1),
      .ADDR_WIDTH (INDEX_WIDTH)
    ) tagv_mem1 (
      .clk      (clk ),
      .raddr    (r_index),
      .waddr    (w_index),
      .din      (tag_in),
      .we       (tagv_we[1]),
      .dout     (tag_rdata[1])
    );
    
    /* settings of miss request */
    assign i_rlen   = WORD_NUM-1;                                                   // WORD_NUM words per visit
    assign i_rsize  = 3'h2;                                                         // 2 ^ 2 = 4 bytes per beat
    assign i_raddr  = uncache_buf ? {paddr_buf[31:3], 3'b0} : {paddr_buf[31:6], 6'b0};

    /* hit */
    assign tag          = p_addr[31:32-TAG_WIDTH]; // the tag of the request
    assign hit[0]       = valid[0] && (tag_rdata[0][TAG_WIDTH-1:0] == tag); // hit in way 0
    assign hit[1]       = valid[1] && (tag_rdata[1][TAG_WIDTH-1:0] == tag); // hit in way 1
    assign hit_way      = hit[0] ? 0 : 1;           
    assign cache_hit    = |hit;
    // only when cache_hit, hit_way is valid
    wire hit_way_valid;
    assign hit_way_valid = cache_hit ? hit_way : 0;
    

    /* read control */
    // choose data from mem or return buffer 
    // 双发射因此一次读取64位
    wire [BIT_NUM-1:0] o_rdata;
    reg [63:0]        rdata_cache;
    assign o_rdata = data_from_mem ? mem_rdata[hit_way_valid] : ret_buf; 
    always (@*) begin
        case(req_buf[5:3])
        3'd0: rdata_cache = o_rdata[63:0];
        3'd1: rdata_cache = o_rdata[127:64];
        3'd2: rdata_cache = o_rdata[191:128];
        3'd3: rdata_cache = o_rdata[255:192];
        3'd4: rdata_cache = o_rdata[319:256];
        3'd5: rdata_cache = o_rdata[383:320];
        3'd6: rdata_cache = o_rdata[447:384];
        3'd7: rdata_cache = o_rdata[511:448];
        endcase
    end
    //uncache操作（直接取返回缓冲区的最低的数据，因为前面已经判断了uncache，申请地址的低3位必然为0）
    assign rdata = uncache_buf ? ret_buf[511:448] : rdata_cache;

    
    /* LRU */
    reg way_visit;  // 0: way0, 1: way1
    always @(posedge clk) begin
        if(!rstn) begin
            lru <= 0;
        end
        else if(lru_we) begin
            lru[w_index] <= way_visit;
        end
    end
    assign lru_sel = (store_tag || index_invalid) ? tagv_way_sel : (hit_invalid) ? hit : lru[w_index] ? 1 : 2;

    /* main FSM */
    localparam [2:0] 
        IDLE    = 3'b000, 
        LOOKUP  = 3'b001,
        MISS    = 3'b010, 
        REFILL  = 3'b011,
        //extra
        CACOP   = 3'b100,
    reg [2:0] state, next_state;
    // stage 1
    always @(posedge clk) begin
        if(!rstn) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end
    // stage 2
    always @(*) begin
        case(state)
            IDLE: begin
                if(cacop_en)            next_state = CACOP;
                else if(rvalid)         next_state = LOOKUP;
                else                    next_state = IDLE;
            end
            LOOKUP: begin
                if(exception != 0)      next_state = IDLE;
                else if(uncache_buf)    next_state = MISS;
                else if(cache_hit) begin
                    if(cacop_en)        next_state = CACOP;
                    else if(rvalid)     next_state = LOOKUP;
                    else                next_state = IDLE;
                end
                else                    next_state = MISS;
            end
            MISS: begin
                // if(i_rready && i_rlast) next_state = REFILL;
                if(i_rready) next_state = REFILL;
                else                    next_state = MISS;
            end
            REFILL: begin
                if(cacop_en)           next_state = CACOP;
                else if(rvalid)         next_state = LOOKUP;
                else                    next_state = IDLE;
            end
            CACOP: begin
                if(exception != 0)      next_state = IDLE;
                else                    next_state = REFILL;
            end
            //                    next_state = rvalid ? LOOKUP : IDLE;
            default:                    next_state = IDLE;
        endcase
    end
    // stage 2: output
    always @(*) begin
        req_buf_we              = 0;
        i_rvalid                = 0;
        rready                  = 0;
        tagv_we                 = 0;
        mem_we                  = 0;
        data_from_mem           = 1;
        pbuf_we                 = 0;
        lru_we                  = 0;
        way_visit               = 0;
        
        cacop_complete          = 0;
        cacop_ready             = 0;
        tagv_clear              = 0;

        case(state)
        IDLE: begin
            req_buf_we      = 1;
            lru_we          = 0;
            cacop_ready     = 1;
        end
        LOOKUP: begin
            if(exception == 0)begin
                pbuf_we                 = 1;
                lru_we                  = 0;
                if(cache_hit) begin
                    rready              = 1;
                    req_buf_we          = rvalid;
                    way_visit           = hit_way;
                    lru_we              = 1;
                    cacop_ready         = 1;
                end
            end
            else rready = 1;
        end
        MISS: begin
            i_rvalid        = 1;
        end
        REFILL: begin
            if(!uncache_buf) begin
                tagv_we                 = lru_sel;
                mem_we                  = lru_sel;
                way_visit               = lru_sel[1];
                lru_we                  = 1;
            end
            rready                  = 1;
            req_buf_we              = rvalid;
            data_from_mem           = 0;
            cacop_ready             = 1;
            if(cacop_en_buf) cacop_complete = 1;
        end
        CACOP: begin
            if(exception != 0) cacop_complete = 1;
            else if(store_tag || index_invalid) begin
                tagv_clear = 1;
                tagv_we    = tagv_way_sel;
                rready     = 1;
            end
            else if(hit_invalid) begin
                tagv_clear = 1;
                tagv_we    = hit;
                rready     = 1;
            end
        end
        default:;
        endcase
    end
    // // 统计信息更新
    // always @(posedge clk) begin
    //     if(!rstn) begin
    //         total_time <= 0;
    //         total_hit <= 0;
    //     end
    //     else if(state == LOOKUP) begin
    //         total_hit <= total_hit + {63'b0, cache_hit};
    //         total_time <= total_time + 1;
    //     end
    // end

endmodule
