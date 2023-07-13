`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Author: Ma Zirui
// Course: Coputer Organization and Design
// Module: Instruction Cache
// TODO: something in the TODO list can be copied from icache
//     1. Complete hit logic in hit module
//     2. Correctly choose the correct read data in read control module
//     3. Complete LRU module
//     4. Complete the main FSM
//     5. Complete the input of miss buffer
//     6. Complete the dirty table
// 
//////////////////////////////////////////////////////////////////////////////////

module dcache #(
    parameter INDEX_WIDTH       = 4,
    parameter WORD_OFFSET_WIDTH = 2
)(
    input                   clk,
    input                   rstn,
    /* from pipeline */
    input [31:0]            addr,               // read/write address
    // read
    input                   rvalid,             // valid signal of read request from pipeline
    output reg              rready,             // ready signal of read request to pipeline
    output [31:0]           rdata,              // read data to pipeline
    //write
    input                   wvalid,             // valid signal of write request from pipeline
    output reg              wready,             // ready signal of write request to pipeline
    input [31:0]            wdata,              // write data from pipeline
    input [3:0]             wstrb,              // write mask of each write-back word from pipeline, if the request is a read request, wstrb is 4'b0

    /* from AXI arbiter */
    // read
    output reg              d_rvalid,           // valid signal of read request to main memory
    input                   d_rready,           // ready signal of read request from main memory
    output [31:0]           d_raddr,            // read address to main memory
    input [31:0]            d_rdata,            // read data from main memory
    input                   d_rlast,            // indicate the last beat of read data from main memory
    output [2:0]            d_rsize,            // indicate the size of read data once, if d_rsize = n then read 2^n bytes once
    output [7:0]            d_rlen,             // indicate the number of read data, if d_rlen = n then read n+1 times
    // write
    output reg              d_wvalid,           // valid signal of write request to main memory
    input                   d_wready,           // ready signal of write request from main memory
    output [31:0]           d_waddr,            // write address to main memory
    output [31:0]           d_wdata,            // write data to main memory
    output [3:0]            d_wstrb,            // write mask of each write-back word to main memory
    output reg              d_wlast,            // indicate the last beat of write data to main memory
    output [2:0]            d_wsize,            // indicate the size of write data once, if d_wsize = n then write 2^n bytes once
    output [7:0]            d_wlen,             // indicate the number of write data, if d_wlen = n then write n+1 times

    // back
    input                   d_bvalid,           // valid signal of write back request from main memory
    output reg              d_bready            // ready signal of write back request to main memory
);
    localparam 
        BYTE_OFFSET_WIDTH   = WORD_OFFSET_WIDTH + 2,                // total offset bits
        TAG_WIDTH           = 32 - BYTE_OFFSET_WIDTH - INDEX_WIDTH, // tag bits
        SET_NUM             = 1 << INDEX_WIDTH,                     // block(set) number of one Road
        WORD_NUM            = 1 << WORD_OFFSET_WIDTH,               // words per block(set)
        BYTE_NUM            = 1 << BYTE_OFFSET_WIDTH,               // bytes per block(set)
        BIT_NUM             = BYTE_NUM << 3;                        // bits per block(set)                     

    // request buffer
    reg     [67:0]              req_buf;
    reg                         req_buf_we;
    wire    [31:0]              wdata_pipe, address;
    wire    [3:0]               wstrb_pipe;
    wire                        we_pipe;

    // return buffer
    reg     [BIT_NUM-1:0]       ret_buf;

    // data memory
    wire    [INDEX_WIDTH-1:0]   r_index, w_index;
    reg     [BYTE_NUM-1:0]      mem_we [0:1];
    wire    [BIT_NUM-1:0]       mem_rdata [0:1];
    reg     [BIT_NUM-1:0]       mem_wdata;

    // tagv memory
    reg     [1:0]               tagv_we;           
    wire    [TAG_WIDTH-1:0]     w_tag;
    wire    [TAG_WIDTH:0]       tag_rdata [0:1]; 

    // hit
    wire    [1:0]               hit;
    wire                        cache_hit;
    wire    [TAG_WIDTH-1:0]     tag;
    wire                        hit_way;

    // wdata control
    wire    [BIT_NUM-1:0]       wdata_pipe_512;
    wire    [BIT_NUM-1:0]       wstrb_pipe_512;
    reg                         wdata_from_pipe;

    // rdata control
    reg     [BIT_NUM-1:0]       rdata_512;
    reg                         data_from_mem;

    // LRU replace
    wire                        lru_sel;

    // dirty table
    wire                        dirty_info;

    // write back buffer
    reg     [BIT_NUM-1:0]       wbuf;
    reg                         wbuf_we;

    // miss buffer
    reg     [31:0]              m_buf;
    reg                         mbuf_we;

    // communication between write fsm and main fsm
    reg                         wfsm_en, wfsm_reset, wrt_finish;

    // a counter for write back
    reg     [3:0]               write_counter;
    reg                         write_counter_reset, write_counter_en;

    // statistics
    reg     [63:0]              total_time;
    reg     [63:0]              total_hit;

    /* request buffer : lock the read request addr */
    // [31:0] addr, [63:32] wdata [67:64] wstrb
    always @(posedge clk) begin
        if(!rstn) begin
            req_buf <= 0;
        end
        else if(req_buf_we) begin
            req_buf <= {wstrb, wdata, addr};
        end
    end
    assign address      = req_buf[31:0];
    assign wdata_pipe   = req_buf[63:32];
    assign wstrb_pipe   = req_buf[67:64];
    assign we_pipe      = |wstrb_pipe;

    /* return buffer : cat the return data */
    always @(posedge clk) begin
        if(!rstn) begin
            ret_buf <= 0;
        end
        else if(d_rvalid && d_rready) begin
            ret_buf <= {d_rdata, ret_buf[BIT_NUM-1:32]};
        end
    end

    /* 2-way data memory */
    assign r_index = addr[BYTE_OFFSET_WIDTH+INDEX_WIDTH-1:BYTE_OFFSET_WIDTH];
    assign w_index = address[BYTE_OFFSET_WIDTH+INDEX_WIDTH-1:BYTE_OFFSET_WIDTH];

    BRAM_bytewrite #(
        .DATA_WIDTH   (BIT_NUM),
        .ADDR_WIDTH   (INDEX_WIDTH)
    )
    data_mem0 (
        .clk      (clk ),
        .raddr    (r_index),
        .waddr    (w_index),
        .din      (mem_wdata),
        .we       (mem_we[0]),
        .dout     (mem_rdata[0])
    );
    BRAM_bytewrite #(
        .DATA_WIDTH   (BIT_NUM),
        .ADDR_WIDTH   (INDEX_WIDTH)
    )
    data_mem1 (
        .clk      (clk ),
        .raddr    (r_index),
        .waddr    (w_index),
        .din      (mem_wdata),
        .we       (mem_we[1]),
        .dout     (mem_rdata[1])
    );

    /* 2-way tagv memory */
    assign w_tag = address[31:32-TAG_WIDTH];
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

    /* hit */
    // TODO
    assign tag          = address[31:32-TAG_WIDTH];     // the tag of the request
    assign hit[0]       = 0;        // TODO
    assign hit[1]       = 0;        // TODO
    assign cache_hit    = |hit;
    assign hit_way      = hit[0] ? 0 : 1;               // only when cache_hit, hit_way is valid

    /* write control */
    assign wdata_pipe_512 = ({{(BIT_NUM-32){1'b0}}, wdata_pipe} << address[1:0]) << {address[BYTE_OFFSET_WIDTH-1:2], 5'b0};
    assign wstrb_pipe_512 = {
            {(BIT_NUM-32){1'b0}}, ({{8{wstrb_pipe[3]}}, {8{wstrb_pipe[2]}}, {8{wstrb_pipe[1]}}, {8{wstrb_pipe[0]}}})
        } << {address[BYTE_OFFSET_WIDTH-1:2], 5'b0};
    always @(*) begin
        if(wdata_from_pipe) begin
            mem_wdata = wdata_pipe_512;
        end
        else begin
            mem_wdata = ret_buf & ~wstrb_pipe_512 | wdata_pipe_512 & wstrb_pipe_512;
        end
    end

    /* read control */
    // choose data from mem or return buffer 
    // TODO: use the signal 'data_from_mem' and address in request buffer to choose the data source
    assign rdata = 0;

    /* LRU replace */
    /* 
        TODO:
            1. Design a LRU module to record the Least Recent Use information of each set
            2. Design some signals in the main FSM to update the LRU information when cache_hit or refill
    */
    assign lru_sel = 0; // TODO

    /* dirty table */
    // record the dirty information of each set
        /* 
        TODO:
            1. Design a dirty table for the two way to record if the data in the set has been written
            2. Design some signals in the main FSM to update the dirty table when cache_hit or refill
    */
    assign dirty_info = 1; // TODO

    /* write buffer */
    always @(posedge clk) begin
        if(!rstn) begin
            wbuf <= 0;
        end
        else if(wbuf_we) begin
            wbuf <= lru_sel ? mem_rdata[1] : mem_rdata[0];
        end
        else if(d_wvalid && d_wready) begin
            wbuf <= {32'b0, wbuf[BIT_NUM-1:32]};
        end
    end

    /* miss buffer */
    // TODO: when mbuf_we is 1, write the writeback address to the miss buffer
    always @(posedge clk) begin
        if(!rstn) begin
            m_buf <= 0;
        end
        else if(mbuf_we) begin
            m_buf <= 0; // TODO
        end
    end
    
    /* memory visit settings*/
    assign d_raddr  = {address[31:BYTE_OFFSET_WIDTH], {BYTE_OFFSET_WIDTH{1'b0}}};
    assign d_rsize  = 3'h2;
    assign d_rlen   = WORD_NUM - 1;
    assign d_waddr  = m_buf;
    assign d_wsize  = 3'h2;
    assign d_wlen   = WORD_NUM - 1;
    assign d_wdata  = wbuf[31:0];
    assign d_wstrb  = 4'b1111;

    /* main FSM */
    // TODO: No.2 TODO in LRU module and No.2 TODO in dirty table
    localparam 
        IDLE        = 3'd0,
        LOOKUP      = 3'd1,
        MISS        = 3'd2,
        REFILL      = 3'd3,
        WAIT_WRITE  = 3'd4;
    reg [2:0] state, next_state;
    always @(posedge clk) begin
        if(!rstn) begin
            state <= IDLE;
        end
        else begin
            state <= next_state;
        end
    end
    always @(*) begin
        case(state)
        IDLE: begin
            if(rvalid || wvalid) begin
                next_state = LOOKUP;
            end
            else begin
                next_state = IDLE;
            end
        end
        LOOKUP: begin
            if(cache_hit) begin
                next_state = (rvalid || wvalid) ? LOOKUP : IDLE;
            end
            else begin
                next_state = MISS;
            end
        end
        MISS: begin
            if(d_rvalid && d_rready && d_rlast) begin
                next_state = REFILL;
            end
            else begin
                next_state = MISS;
            end
        end
        REFILL: begin
            next_state = WAIT_WRITE;
        end
        WAIT_WRITE: begin
            if(wrt_finish) begin
                next_state = (rvalid || wvalid) ? LOOKUP : IDLE;
            end
            else begin
                next_state = WAIT_WRITE;
            end
        end
        default: begin
            next_state = IDLE;
        end
        endcase
    end
    always @(*) begin
        // default assignments
        req_buf_we           = 0;
        wbuf_we              = 0;
        mbuf_we              = 0;
        d_rvalid             = 0;
        wfsm_en              = 0;
        wfsm_reset           = 0;
        mem_we[0]            = 0;
        mem_we[1]            = 0;
        tagv_we[0]           = 0;
        tagv_we[1]           = 0;
        rready               = 0;
        wready               = 0;
        data_from_mem        = 1;
        wdata_from_pipe      = 1;
        case(state)
        IDLE: begin
            req_buf_we = 1;
        end
        LOOKUP: begin
            if(cache_hit) begin
                mem_we[hit_way]         = {{(BYTE_NUM-4){1'b0}}, wstrb_pipe} << {address[BYTE_OFFSET_WIDTH-1:2], 2'b0};
                req_buf_we              = (rvalid || wvalid);
                rready                  = !we_pipe;
                wready                  = we_pipe;
            end
            else begin
                wbuf_we = 1;
                mbuf_we = 1;
                wfsm_en = 1;
            end
        end
        MISS: begin
            d_rvalid = 1;
        end
        REFILL: begin
            tagv_we[lru_sel]        = 1;
            mem_we[lru_sel]         = -1;
            wdata_from_pipe         = 0;
        end
        WAIT_WRITE: begin
            wfsm_reset      = 1;
            rready          = wrt_finish & !we_pipe;
            wready          = wrt_finish & we_pipe;
            data_from_mem   = 0;
            req_buf_we      = wrt_finish & (rvalid || wvalid);
        end
        endcase
    end

    /* write fsm */
    localparam 
        INIT    = 3'd0,
        WRITE   = 3'd1,
        FINISH  = 3'd2;
    reg [2:0] wfsm_state, wfsm_next_state;
    /* counter of write back */
    always @(posedge clk) begin
        if(!rstn) begin
            write_counter <= 0;
        end
        else if(write_counter_reset) begin
            write_counter <= 0;
        end
        else if(write_counter_en) begin
            write_counter <= write_counter == WORD_NUM-1 ? WORD_NUM-1 : write_counter + 1;
        end
    end
    /* stage 1 */
    always @(posedge clk) begin
        if(!rstn) begin
            wfsm_state <= INIT;
        end
        else begin
            wfsm_state <= wfsm_next_state;
        end
    end
    /* stage 2 */
    always @(*) begin
        case(wfsm_state)
        INIT: begin
            if(wfsm_en) begin
                wfsm_next_state = dirty_info ? WRITE : FINISH;
            end
            else begin
                wfsm_next_state = INIT;
            end
        end
        WRITE: begin
            if(d_bvalid && d_bready) begin
                wfsm_next_state = FINISH;
            end
            else begin
                wfsm_next_state = WRITE;
            end
        end
        FINISH: begin
            if(wfsm_reset) begin
                wfsm_next_state = INIT;
            end
            else begin
                wfsm_next_state = FINISH;
            end
        end
        default: begin
            wfsm_next_state = INIT;
        end
        endcase
    end
    /* stage 2: output */
    always @(*) begin
        wrt_finish          = 0;
        write_counter_reset = 0;
        write_counter_en    = 0;
        d_wvalid            = 0;
        d_wlast             = 0;
        d_bready            = 0;
        case(wfsm_state)
        INIT: begin
            write_counter_reset = 1;
        end
        WRITE: begin
            d_wvalid            = 1;
            d_wlast             = (write_counter == WORD_NUM-1);
            write_counter_en    = d_wready;
            d_bready            = 1;
        end
        FINISH: begin
            wrt_finish = 1;
        end
        endcase
    end

    // statistics
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
