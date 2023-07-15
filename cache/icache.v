
`timescale 1ns / 1ps
`include "../config.vh"
`include "../exception.vh"
//////////////////////////////////////////////////////////////////////////////////
//
// Author: Ma Zirui
// Course: Coputer Organization and Design
// Module: Instruction Cache
// TODO:
//     1. Complete hit logic in hit module
//     2. Correctly choose the correct read data in read control module
//     3. Complete LRU module
//     4. Complete the main FSM
// 
//////////////////////////////////////////////////////////////////////////////////


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
    
    output [31:0] badv,
    output [6:0] exception,
    input               flush,          // flush signal from pipeline
    input               uncache,        // uncache signal from pipeline
    input  [COOKIE_WIDTH-1:0] cookie_in, // cookie from pipeline
    output [COOKIE_WIDTH-1:0] cookie_out, // cookie to pipeline
    output [63:0]       r_data_cpu,     // read data to pipeline    
    // 
    input cacop_en,
    input [1:0] cacop_code,
    output cacop_ready,
    output cacop_complete,

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
    wire                        lru_sel;
    reg                         lru_we;

    // read control
    reg                         data_from_mem;

    // statistics 统计信息
    reg     [63:0]              total_time;
    reg     [63:0]              total_hit;

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

    reg uncache_buf;
    always @(posedge clk) begin
        if(!rstn) begin
            uncache_buf <= 0;
        end
        else if(req_buf_we) begin
            uncache_buf <= uncache;
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
    assign valid[0] = tag_rdata[0][TAG_WIDTH];
    assign valid[1] = tag_rdata[1][TAG_WIDTH];
    // the tag ready to be written to tagv table
    assign w_tag = paddr_buf[31:32-TAG_WIDTH];
    BRAM_common #(
      .DATA_WIDTH(TAG_WIDTH+1),
      .ADDR_WIDTH (INDEX_WIDTH)
    ) tagv_mem0 (
      .clk      (clk ),
      .raddr    (r_index),
      .waddr    (w_index),
      .din      ({1'b1, w_tag}),
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
      .din      ({1'b1, w_tag}),
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
    assign o_rdata = data_from_mem ? mem_rdata[hit_way_valid] : ret_buf; 
    always (@*) begin
        case(req_buf[5:3])
        3'd0: rdata <= o_rdata[63:0];
        3'd1: rdata <= o_rdata[127:64];
        3'd2: rdata <= o_rdata[191:128];
        3'd3: rdata <= o_rdata[255:192];
        3'd4: rdata <= o_rdata[319:256];
        3'd5: rdata <= o_rdata[383:320];
        3'd6: rdata <= o_rdata[447:384];
        3'd7: rdata <= o_rdata[511:448];
        endcase
    end

    
    /* LRU */
    always @(posedge clk) begin
        if(!rstn) begin
            lru <= 0;
        end
        else if(lru_we) begin
            lru[w_index] <= hit_way;
        end
    end
    assign lru_sel = !lru[w_index];

    /* main FSM */
    localparam [2:0] 
        IDLE    = 3'b000, 
        LOOKUP  = 3'b001,
        MISS    = 3'b010, 
        REFILL  = 3'b011;
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
                if(rvalid)              next_state = LOOKUP;
                else                    next_state = IDLE;
            end
            LOOKUP: begin
                if(cache_hit)           next_state = rvalid ? LOOKUP : IDLE;
                else                    next_state = MISS;
            end
            MISS: begin
                // if(i_rready && i_rlast) next_state = REFILL;
                if(i_rready) next_state = REFILL;
                else                    next_state = MISS;
            end
            REFILL:                     next_state = rvalid ? LOOKUP : IDLE;
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

        case(state)
        IDLE: begin
            req_buf_we      = 1;
            lru_we          = 0;
        end
        LOOKUP: begin
            pbuf_we                 = 1;
            lru_we                  = 0;
            if(cache_hit) begin
                rready              = 1;
                req_buf_we          = rvalid;
                lru_we              = 1;
            end
        end
        MISS: begin
            i_rvalid        = 1;
        end
        REFILL: begin
            tagv_we                 = lru_sel ? 1 : 2;
            mem_we                  = lru_sel ? 1 : 2;
            rready                  = 1;
            req_buf_we              = rvalid;
            data_from_mem           = 0;
        end
        default:;
        endcase
    end
    always @(posedge clk) begin
        if(!rstn) begin
            total_time <= 0;
            total_hit <= 0;
        end
        else if(state == LOOKUP) begin
            total_hit <= total_hit + {63'b0, cache_hit};
            total_time <= total_time + 1;
        end
    end

endmodule
