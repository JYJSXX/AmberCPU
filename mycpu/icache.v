
`timescale 1ns / 1ps
`include "config.vh"
`include "exception.vh"

module icache #(
    parameter INDEX_WIDTH       = 6,
    parameter WORD_OFFSET_WIDTH = 4,
    parameter COOKIE_WIDTH      = 33
)(
    input               clk,            
    input               rstn,           
    // for pipeline 
    input               rvalid,         // valid signal of read request from pipeline
    output              rready,         // ready signal of read request to pipeline
    input [31:0]        raddr,          // read address from pipeline
    input [31:0]        p_addr,         // physical address from pipeline
    output [63:0]       rdata,          // read data to pipeline
    output [31:0]       pc_out,         // pc to pipeline
    output              idle,           // idle signal to pipeline
    // for AXI arbiter
    output reg          i_rvalid,       // valid signal of read request to main memory
    input               i_rready,       // ready signal of read request from main memory
    output [31:0]       i_raddr,        // read address to main memory
    input [511:0]       i_rdata,        // read data from main memory
    // 暂时用不到
    // input               i_rlast,        // indicate the last beat of read data from main memory
    // output reg [2:0]    i_rsize,        // indicate the size of read data once, if i_rsize = n then read 2^n bytes once
    output reg [7:0]    i_rlen,          // indicate the number of read data, if i_rlen = n then read n+1 times

    output [1:0]  i_exception_flag,
    input  [6:0]  tlb_exception,         
    output [31:0] badv,               // 无效虚拟地址
    output [6:0]  exception,
    input               flush,          // flush signal from pipeline
    input               uncache,        // uncache signal from pipeline
    input  [COOKIE_WIDTH-1:0] cookie_in, // cookie from pipeline
    output [COOKIE_WIDTH-1:0] cookie_out, // cookie to pipeline  

    input cacop_en,
    input [1:0] cacop_code,
    output reg cacop_ready,         // ready signal of cacop
    output reg cacop_complete,      // complete signal of cacop

    input ibar                      // 栅障指令
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
    assign  pc_out             = req_buf;
    
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
    reg  [63:0]                lru; //0: way0, 1: way1
    wire [1:0]                  lru_sel;
    reg                         lru_we;
    reg                         missbuf_we;

    // read control
    reg                         data_from_mem;


    // flush signal -> valid signal
    reg                         flush_valid;
    reg                         rready_temp;
    assign rready = rready_temp & flush_valid;

    // statistics
    reg     [63:0]              total_time;
    reg     [63:0]              total_request;
    reg     [63:0]              total_hit;
    reg     [64:0]              miss_time;
    always @(posedge clk) begin
        if(!rstn) begin
            total_time <= 0;
            total_hit <= 0;
            miss_time <= 0;
            total_request <= 0;
        end
        else if(state == LOOKUP) begin
            total_hit <= total_hit + {63'b0, cache_hit};
            total_request <= total_request +1;
            total_time <= total_time + 1;
        end
        else if(state == MISS || state == MISS_FLUSH) begin
            total_time <= total_time + 1;
            miss_time <= miss_time +1;
        end
        else begin
            total_time <= state == IDLE ? total_time +1 : total_time;
            total_hit <= total_hit ;
            miss_time <= miss_time ;
        end
    end

    // cache operation
    reg tagv_clear;
    reg [1:0] cacop_code_buf;
    reg cacop_en_buf;
    wire [1:0] tagv_way_sel;
    //wire [INDEX_WIDTH-1:0] tagv_index;
    wire store_tag, index_invalid, hit_invalid;
    assign store_tag     = cacop_en_buf ? (cacop_code_buf == 2'b00) : 0;
    assign index_invalid = cacop_en_buf ? (cacop_code_buf == 2'b01) : 0;
    assign hit_invalid   = cacop_en_buf ? (cacop_code_buf == 2'b10) : 0;
    assign tagv_way_sel      = req_buf[0] ? 2 : 1;
    //assign tagv_index        = req_buf[INDEX_WIDTH + BYTE_OFFSET_WIDTH - 1: BYTE_OFFSET_WIDTH];

    // cookie
    reg [COOKIE_WIDTH-1:0] cookie_buf;
    assign cookie_out = cookie_buf;

    // exception
    wire [6:0] exception_temp1, exception_normal;
    reg [6:0] exception_temp, exception_buf;
    reg exception_sel;
    assign badv = (exception != 0) ? req_buf : 0;


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

    /* exception */
    always @(*) begin
        if(req_buf[1:0] != 0) exception_temp = `EXP_ADEF;
        else exception_temp = 0;
    end
    always @(posedge clk) begin
        if(!rstn) begin
            exception_buf <= 0;
        end
        else if(missbuf_we) begin
            exception_buf <= exception_normal;
        end
    end
    assign exception_temp1 = {7{~cacop_en_buf}} & exception_temp;
    assign exception_normal = (exception_temp1 == 0 || tlb_exception == `EXP_ADEF)? tlb_exception : exception_temp1;
    assign exception = exception_sel ? exception_buf : exception_normal;
    assign i_exception_flag = exception != 0 ? 1 : 0;

    /* flush signal */
    always @(posedge clk)
        if(flush || !rstn) begin
            flush_valid <= 0;
        end
        else if((req_buf_we && (state != MISS_FLUSH))|| i_rready) begin
            flush_valid <= rvalid;
        end

    /* 2-way data memory */
    // read index
    assign r_index = (state == MISS_FLUSH) ? w_index : raddr[BYTE_OFFSET_WIDTH+INDEX_WIDTH-1:BYTE_OFFSET_WIDTH];
    
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
    wire valid[1:0];
    // reg  valid_buf[1:0];
    wire [TAG_WIDTH:0] tag_in;
    assign valid[0] = tag_rdata[0][TAG_WIDTH];
    assign valid[1] = tag_rdata[1][TAG_WIDTH];
    // always @(*)begin
    //     if(!rstn) begin
    //         valid_buf[0] = 0;
    //         valid_buf[1] = 0;
    //     end
    //     else if(req_buf_we) begin
    //         valid_buf[0] = valid[0];
    //         valid_buf[1] = valid[1];
    //     end
    //     else
    //         valid_buf[0] = valid_buf[0];
    //         valid_buf[1] = valid_buf[1];
    // end
    // the tag ready to be written to tagv table
    assign w_tag = paddr_buf[31:32-TAG_WIDTH];
    assign tag_in = tagv_clear ? 0 : {1'b1, w_tag};
    wire [INDEX_WIDTH-1:0] tag_index;
    // assign tag_index = tagv_clear ? req_buf[INDEX_WIDTH+BYTE_OFFSET_WIDTH-1:BYTE_OFFSET_WIDTH] : paddr_buf[INDEX_WIDTH+BYTE_OFFSET_WIDTH-1:BYTE_OFFSET_WIDTH];
    assign tag_index = w_index;
    BRAM_tagv #(
      .DATA_WIDTH(TAG_WIDTH+1),
      .ADDR_WIDTH (INDEX_WIDTH)
    ) tagv_mem0 (
      .clk      (clk ),
      .raddr    (r_index),
      .waddr    (tag_index),
      .din      (tag_in),
      .we       (tagv_we[0]),
      .ibar     (ibar),
      .dout     (tag_rdata[0])
    );
    BRAM_tagv #(
      .DATA_WIDTH(TAG_WIDTH+1),
      .ADDR_WIDTH (INDEX_WIDTH)
    ) tagv_mem1 (
      .clk      (clk ),
      .raddr    (r_index),
      .waddr    (tag_index),
      .din      (tag_in),
      .we       (tagv_we[1]),
      .ibar     (ibar),
      .dout     (tag_rdata[1])
    );

    /* victim cache */
    wire victim_hit;
    wire [511:0] victim_data;
    wire victim_sel;
    assign victim_sel = lru_sel[0] ? 0 : 1;
    wire victim_we;
    assign victim_we = missbuf_we && valid[victim_sel] && flush_valid;  //&& !miss_flush_flag
    reg [25:0] victim_w_tag_buf;
    reg        victim_flush_miss;
    reg [25:0] victim_w_tag;
    always @(posedge clk) begin
        if(!rstn) begin
            victim_w_tag <= 0;
        end
        else begin
            victim_w_tag <= {tag_rdata[victim_sel][TAG_WIDTH-1:0], req_buf[11:6]};
        end
    end
    always@(posedge clk) begin
        if(!rstn) begin
            victim_w_tag_buf <= 0;
            victim_flush_miss <= 0;
        end
        else begin
            victim_w_tag_buf <= victim_w_tag;
            victim_flush_miss <= miss_flush_flag;
        end
    end

    reg [BIT_NUM - 1 : 0] victim_data_in;
    always @(posedge clk) begin
        if(!rstn) begin
            victim_data_in <= 0;
        end
        else begin
            victim_data_in <= mem_rdata[victim_sel];
        end
    end

    victim_cache #(
        .CAPACITY(8)
    ) victim_cache (
        .clk        (clk),
        .rstn       (rstn),
        .r_tag      ({tag,req_buf[11:6]}),
        .victim_hit (victim_hit),
        .data_out   (victim_data),
        .w_tag      (victim_flush_miss? victim_w_tag_buf : victim_w_tag),
        .we         (victim_we), // missbuf_we && valid[victim_sel] && victim_hit
        .data_in    (victim_data_in)
    );
    
    /* settings of miss request */
    //assign i_rsize  = 3'h2;                                                         // 2 ^ 2 = 4 bytes per beat
    assign i_raddr  = uncache_buf ? {paddr_buf[31:3], 3'b0} : {paddr_buf[31:12], req_buf[11:6],6'b0};

    /* hit TODO:*/
    assign tag          = p_addr[31:32-TAG_WIDTH]; // the tag of the request
    assign hit[0]       = valid[0] && (tag_rdata[0][TAG_WIDTH-1:0] == tag); // hit in way 0
    assign hit[1]       = valid[1] && (tag_rdata[1][TAG_WIDTH-1:0] == tag); // hit in way 1
    assign hit_way      = hit[0] ? 0 : 1;           
    assign cache_hit    = |hit || victim_hit;
    // assign cache_hit    = |hit ;
    // only when cache_hit, hit_way is valid
    wire hit_way_valid;
    assign hit_way_valid = cache_hit && ~victim_hit ? hit_way : 0;
    // assign hit_way_valid = cache_hit ? hit_way : 0;
    

    /* read control */
    // choose data from mem or return buffer 
    // 双发射因此一次读取64位
    wire [BIT_NUM-1:0] o_rdata;
    reg [63:0]        rdata_cache;
    assign o_rdata = victim_hit ? victim_data : data_from_mem ? mem_rdata[hit_way_valid] : ret_buf; 
    always @(*) begin
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
    /* miss_flush counter */
    wire miss_flush_counter_new;
    assign miss_flush_counter_new = missbuf_we ? (raddr != 0) : 0;
    reg miss_flush_counter_old;
    reg miss_flush_counter_old_buf;
    always @(posedge clk) begin
        if(!rstn || flush) begin
            miss_flush_counter_old <= 0;
            miss_flush_counter_old_buf <= 0;
        end
        else begin
            miss_flush_counter_old <= miss_flush_counter_new;
            miss_flush_counter_old_buf <= miss_flush_counter_old;
        end
    end

    /* main FSM */
    localparam [2:0] 
        IDLE    = 3'b000, 
        LOOKUP  = 3'b001,
        MISS    = 3'b010, 
        REFILL  = 3'b011,
        //extra
        CACOP   = 3'b100,
        MISS_FLUSH = 3'b101;
    reg [2:0] state, next_state;
    assign idle = (state == IDLE);
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
                if((exception != 0) || ibar || flush)      next_state = IDLE;
                else if(uncache_buf)    next_state = flush || ~flush_valid ? MISS_FLUSH : MISS;
                else if(cacop_en)       next_state = CACOP;
                else if(cache_hit) begin
                    if(rvalid)          next_state = LOOKUP;
                    else                next_state = IDLE;
                end
                else                    next_state = flush || ~flush_valid ? MISS_FLUSH : MISS; 
            end
            MISS: begin
                // if(i_rready && i_rlast) next_state = REFILL;
                if(flush)               next_state = MISS_FLUSH;
                else if(i_rready)            next_state = REFILL;
                else                    next_state = MISS;
            end
            MISS_FLUSH: begin   //TODO flush掉的miss块充填到cache中
                if(i_rready)            next_state = LOOKUP;
                else                    next_state = MISS_FLUSH;
            end
            REFILL: begin
                if(ibar || flush)           next_state = IDLE;
                else if(cacop_en)       next_state = CACOP;
                else if(rvalid)          next_state = LOOKUP;
                else                    next_state = IDLE;
            end
            CACOP: begin
                if((exception != 0) || ibar)     next_state = IDLE;
                else                    next_state = REFILL;
            end
            //                    next_state = rvalid ? LOOKUP : IDLE;
            default:                    next_state = IDLE;
        endcase
    end
    // stage 2: output
    reg miss_flush_flag;
    always @(posedge clk) begin
        if(!rstn)
            miss_flush_flag <= 0;
        else
            miss_flush_flag <= (state == MISS_FLUSH);
    end

    reg i_rready_reg;
    always @(posedge clk) begin
        if(!rstn)
            i_rready_reg <= 0;
        else
            i_rready_reg <= i_rready;
    end

    always @(*) begin
        req_buf_we              = 0;
        i_rvalid                = 0;
        rready_temp             = 0;
        tagv_we                 = 0;
        mem_we                  = 0;
        data_from_mem           = 1;
        pbuf_we                 = 0;
        lru_we                  = 0;
        way_visit               = 0;
        i_rlen                  = 8'd15;
        
        cacop_complete          = 0;
        cacop_ready             = 0;
        tagv_clear              = 0;

        exception_sel           = 0;

        missbuf_we              = 0;

        case(state)
        IDLE: begin
            req_buf_we      = 1;
            lru_we          = 0;
            if(cacop_en)
                cacop_ready     = 1;
            if(cacop_en_buf)
                cacop_complete  = 1;
        end
        LOOKUP: begin
            if(exception == 0)begin
                pbuf_we                = ((miss_flush_flag && !cache_hit) ? 0 : 1) || (miss_flush_counter_old && !miss_flush_counter_old_buf);
                // pbuf_we                = 1;         //寻找两全之策！！！！
                lru_we                  = 0;
                if(cacop_en)
                    cacop_ready         = 1;
                if(!cache_hit || uncache_buf) missbuf_we = 1;
                else begin
                    rready_temp              = 1;
                    req_buf_we          = rvalid;
                    way_visit           = hit_way;
                    lru_we              = 1;
                end
            end
            else rready_temp = 1;
        end
        MISS: begin
            missbuf_we = 1;
            i_rvalid        = 1;
            if(uncache_buf) begin
                i_rlen = 8'd1;
            end
        end
        MISS_FLUSH: begin
            missbuf_we = 1;
            i_rvalid        = 1;
            if(miss_flush_counter_new && !miss_flush_counter_old) begin
                req_buf_we     = 1;
            end
            if(miss_flush_counter_old && !miss_flush_counter_old_buf) begin
                pbuf_we         = 1;
            end
            if(uncache_buf) begin
                i_rlen = 8'd1;
            end
        end
        // ! 这里存在一个问题，lru_sel在miss的情况下是否需要缓存？
        REFILL: begin
            if(!uncache_buf && !cacop_en_buf) begin
                tagv_we                 = lru_sel;
                mem_we                  = lru_sel;
                way_visit               = lru_sel[1];
                lru_we                  = 1;
            end
            rready_temp                  = 1;
            req_buf_we              = rvalid;
            data_from_mem           = 0;
            cacop_ready             = 1;
            exception_sel           = 1;
            if(cacop_en_buf) cacop_complete = 1;
        end
        CACOP: begin
            if(exception != 0) cacop_complete = 1;
            else if(store_tag || index_invalid) begin
                tagv_clear = 1;
                tagv_we    = tagv_way_sel;
                //rready_temp     = 1;
            end
            else if(hit_invalid && cache_hit) begin
                tagv_clear = 1;
                tagv_we    = hit;
               // rready_temp     = 1;
            end
        end
        default:;
        endcase
    end

endmodule
