`timescale 1ns / 1ps
`include "../config.vh"
`include "../exception.vh"

module dcache #(
    parameter INDEX_WIDTH       = 6,
    parameter WORD_OFFSET_WIDTH = 4
)(
    input                   clk,
    input                   rstn,
    /* from pipeline */
    input [31:0]            addr,               // read/write address
    input [31:0]            p_addr,             // physical address
    // read
    input                   rvalid,             // valid signal of read request from pipeline
    output reg              rready,             // ready signal of read request to pipeline
    output reg [31:0]       rdata,              // read data to pipeline
    //write
    input                   wvalid,             // valid signal of write request from pipeline
    output reg              wready,             // ready signal of write request to pipeline
    input [31:0]            wdata,              // write data from pipeline
    input [3:0]             wstrb,              // write mask of each write-back word from pipeline, if the request is a read request, wstrb is 4'b0
    
    input                   op,                 // 0: read, 1: write
    input                   uncache,            // indicate whether the request is an uncache request
    input                   signed_ext,         // indicate whether the request is a signed extension request
    output                  idle,               // indicate whether the cache is idle
    /* from AXI arbiter */
    // read
    output reg              d_rvalid,           // valid signal of read request to main memory
    input                   d_rready,           // ready signal of read request from main memory
    output [31:0]           d_raddr,            // read address to main memory
    input [511:0]           d_rdata,            // read data from main memory
   //input                   d_rlast,            // indicate the last beat of read data from main memory
   // output [2:0]            d_rsize,            // indicate the size of read data once, if d_rsize = n then read 2^n bytes once
    output reg [7:0]        d_rlen,             // indicate the number of read data, if d_rlen = n then read n+1 times
    // write
    output reg              d_wvalid,           // valid signal of write request to main memory
    input                   d_wready,           // ready signal of write request from main memory
    output [31:0]           d_waddr,            // write address to main memory
    output [511:0]          d_wdata,            // write data to main memory
    output reg [3:0]        d_wstrb,            // write mask of each write-back word to main memory
   // output reg              d_wlast,            // indicate the last beat of write data to main memory
   // output [2:0]            d_wsize,            // indicate the size of write data once, if d_wsize = n then write 2^n bytes once
    output reg [7:0]        d_wlen,             // indicate the number of write data, if d_wlen = n then write n+1 times

    // // back
    // input                   d_bvalid,           // valid signal of write back request from main memory
    // output reg              d_bready,           // ready signal of write back request to main memory

    // exception
    output            [6:0] exception,
    input                   exception_flag,
    input             [6:0] forward_exception,
    input             [6:0] tlb_exception,
    output           [31:0] badv,

    // cacop
    input             [1:0] cacop_code,
    input                   cacop_en,
    output reg              cacop_complete,
    output reg              cacop_ready,

    // atom load
    input                   is_atom,        // indicate whether the request is an atom load request
    output reg              llbit_set,      // indicate whether the request is an atom load request and the load is successful
    //atom store
    input                   llbit,          // indicate whether the request is an atom store request
    output reg              llbit_clear,      // indicate whether the request is an atom store request and the store is successful
    
    // ibar
    input                   ibar
    
    // diff test
    `ifdef DIFFTEST
    ,output            [31:0] vaddr_diff,
    output            [31:0] paddr_diff,
    output            [31:0] data_diff
    `endif
);
    localparam 
        BYTE_OFFSET_WIDTH   = WORD_OFFSET_WIDTH + 2,                // total offset bits
        TAG_WIDTH           = 32 - BYTE_OFFSET_WIDTH - INDEX_WIDTH, // tag bits
        SET_NUM             = 1 << INDEX_WIDTH,                     // block(set) number of one Road
        WORD_NUM            = 1 << WORD_OFFSET_WIDTH,               // words per block(set)
        BYTE_NUM            = 1 << BYTE_OFFSET_WIDTH,               // bytes per block(set)
        BIT_NUM             = BYTE_NUM << 3;                        // bits per block(set)                     

    localparam
        READ_OP              = 1'b0,
        WRITE_OP             = 1'b1,
        BYTE              = 4'b0001,
        HALF              = 4'b0011,
        WORD              = 4'b1111;
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
    reg  [INDEX_WIDTH-1:0]      lru; //0: way0, 1: way1
    wire [1:0]                  lru_sel;
    reg                         lru_we;
    //reg                         missbuf_we;

    // dirty table
    reg  [1:0]                  dirty_we;
    wire                        dirty_rdata;
    reg                         dirty_wdata;
    //wire                        dirty_info;

    // write back buffer
    reg     [BIT_NUM-1:0]       wbuf;
    reg                         wbuf_we;

    // miss buffer
    reg     [31:0]              m_buf;
    reg                         mbuf_we;

    // communication between write fsm and main fsm
    reg                         wfsm_en, wfsm_reset, wrt_finish;

    /* op、 signed_ext、 is_atom、 llbit buffer */
    reg op_buf, signed_ext_buf, is_atom_buf, llbit_buf;
    always @(posedge clk) begin
        if(!rstn) begin
            op_buf <= 0;
            signed_ext_buf <= 0;
            is_atom_buf <= 0;
            llbit_buf <= 0;
        end
        else if(req_buf_we) begin
            op_buf <= op;
            signed_ext_buf <= signed_ext;
            is_atom_buf <= is_atom;
            llbit_buf <= llbit;
        end
    end

    // cache operation
    reg tagv_clear;
    reg [1:0] cacop_code_buf;
    reg cacop_en_buf;
    wire [1:0] tagv_way_sel;
    //wire [INDEX_WIDTH-1:0] tagv_index;
    wire store_tag, index_invalid, hit_invalid;
    assign store_tag     = (cacop_code_buf == 2'b00);
    assign index_invalid = (cacop_code_buf == 2'b01);
    assign hit_invalid   = (cacop_code_buf == 2'b10);
    assign tagv_way_sel      = req_buf[0] ? 2 : 1;
    //assign tagv_index        = req_buf[INDEX_WIDTH + BYTE_OFFSET_WIDTH - 1: BYTE_OFFSET_WIDTH];

    // exception
    wire [6:0] exception_cache, exception_temp, exception_obuf;
    reg [6:0] exception_temp1, exception_buf;
    reg exception_sel;
    assign badv = (exception != 0) ? address : 0;

    /* exception */
    always @(*) begin
        case(wstrb_pipe)
        HALF: if(address[0] == 1) exception_temp1 = `EXP_ALE;
        WORD: if(address[1:0] != 0) exception_temp1 = `EXP_ALE;
        default: exception_temp1 = 0;
        endcase
    end
    assign exception_cache = ({7{!(op_buf && !llbit_buf && is_atom_buf)}} | {7{~cacop_en_buf}}) & exception_temp1;
    assign exception_temp  = {7{!((cacop_en_buf && hit_invalid) || (op_buf && is_atom_buf && !llbit_buf))}} 
                            & (tlb_exception == `EXP_ADEM ? tlb_exception : (exception_cache == 0 ? tlb_exception : exception_cache));
    assign exception_obuf = {7{((rready || wready) || cacop_en_buf)}} & (exception_sel ? exception_buf : exception_temp);
    reg  [6:0] exception_old;
    wire [6:0] exception_new;
    assign exception_new = exception_obuf;
    always @(posedge clk) 
        if(~rstn) exception_old <= 0;
        else exception_old <= exception_new;
    assign exception = ~exception_old & exception_new;

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
    assign wstrb_pipe   = cacop_en ? 4'b1111 : req_buf[67:64];
    assign we_pipe      = (op_buf == WRITE_OP) && (|wstrb_pipe);  // if wstrb_pipe == 0, we_pipe = 0

    /* return buffer : cat the return data */
    always @(posedge clk) begin
        if(!rstn) begin
            ret_buf <= 0;
        end
        else if(d_rvalid && d_rready) begin
            ret_buf <= {d_rdata, ret_buf[BIT_NUM-1:32]};
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

    `ifdef DIFFTEST
        assign paddr_diff = paddr_buf;
        always @(posedge clk) begin
            if(!rstn) begin
                vaddr_diff <= 0;
                data_diff <= 0;
            end
            else if(1) begin
                vaddr_diff <= address;
                data_diff <= wdata_pipe;
            end
        end
    `endif

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
    wire valid[1:0];
    wire [TAG_WIDTH:0] tag_in;
    assign valid[0] = tag_rdata[0][TAG_WIDTH];
    assign valid[1] = tag_rdata[1][TAG_WIDTH];
    // the tag ready to be written to tagv table
    assign w_tag = paddr_buf[31:32-TAG_WIDTH];
    assign tag_in = tagv_clear ? 0 : {1'b1, w_tag};
    wire [INDEX_WIDTH-1:0] tag_index;
    assign tag_index = tagv_clear ? req_buf[INDEX_WIDTH+BYTE_OFFSET_WIDTH-1:BYTE_OFFSET_WIDTH] : paddr_buf[INDEX_WIDTH+BYTE_OFFSET_WIDTH-1:BYTE_OFFSET_WIDTH];
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

    /* hit */
    assign tag          = p_addr[31:32-TAG_WIDTH];     // the tag of the request
    assign hit[0]       = valid[0] && (tag_rdata[0][TAG_WIDTH-1:0] == tag); // hit in way 0
    assign hit[1]       = valid[1] && (tag_rdata[1][TAG_WIDTH-1:0] == tag); // hit in way 1
    assign cache_hit    = |hit;
    assign hit_way      = hit[0] ? 0 : 1; // 0 for way 0, 1 for way 1
    wire hit_way_valid;
    assign hit_way_valid = cache_hit ? hit_way : 0;

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
    wire [BIT_NUM-1:0] o_rdata;
    reg [31:0]        rdata_cache;
    assign o_rdata = data_from_mem ? mem_rdata[hit_way_valid] : ret_buf; 
    always @(*) begin
        case(req_buf[5:2])
        4'd0:  rdata_cache = o_rdata[31:0];
        4'd1:  rdata_cache = o_rdata[63:32];
        4'd2:  rdata_cache = o_rdata[95:64];
        4'd3:  rdata_cache = o_rdata[127:96];
        4'd4:  rdata_cache = o_rdata[159:128];
        4'd5:  rdata_cache = o_rdata[191:160];
        4'd6:  rdata_cache = o_rdata[223:192];
        4'd7:  rdata_cache = o_rdata[255:224];
        4'd8:  rdata_cache = o_rdata[287:256];
        4'd9:  rdata_cache = o_rdata[319:288];
        4'd10: rdata_cache = o_rdata[351:320];
        4'd11: rdata_cache = o_rdata[383:352];
        4'd12: rdata_cache = o_rdata[415:384];
        4'd13: rdata_cache = o_rdata[447:416];
        4'd14: rdata_cache = o_rdata[479:448];
        4'd15: rdata_cache = o_rdata[511:480];
        endcase
    end
    // uncached read
    wire [31:0] rdata_temp;
    assign rdata_temp = uncache_buf ? ret_buf[511:448] : rdata_cache;
    // 根据掩码和符号位拓展，给出最终的读数据
    always @(*) begin
        case(wstrb_pipe)
        BYTE: begin
            case(req_buf[1:0])
            2'b00: rdata = {{24{rdata_temp[7]&signed_ext_buf}}, rdata_temp[7:0]};
            2'b01: rdata = {{24{rdata_temp[15]&signed_ext_buf}}, rdata_temp[15:8]};
            2'b10: rdata = {{24{rdata_temp[23]&signed_ext_buf}}, rdata_temp[23:16]};
            2'b11: rdata = {{24{rdata_temp[31]&signed_ext_buf}}, rdata_temp[31:24]};
            default: rdata = 0;
            endcase
        end
        HALF: begin
            case(req_buf[1:0])
            2'b00: rdata = {{16{rdata_temp[15]&signed_ext_buf}}, rdata_temp[15:0]};
            2'b10: rdata = {{16{rdata_temp[31]&signed_ext_buf}}, rdata_temp[31:16]};
            default: rdata = 0;
            endcase
        end
        WORD: begin
            rdata = rdata_temp;
        end
        default: rdata = 0;
        endcase
    end


    /* LRU replace */
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


    /* dirty table */
    // record the dirty information of each set
    dirty_table diety_table(
        .clk(clk),
        .we(dirty_we),
        .re(lru_sel),
        .r_addr(w_index),
        .w_addr(w_index),
        .w_data(dirty_wdata),
        .r_data(dirty_rdata)
    );


    /* write buffer */
    always @(*) begin
        if(!rstn) begin
            wbuf <= 0;
        end
        else if(wbuf_we) begin
            if(uncache_buf)     // 要写入的数据来自于uncache
                wbuf <= {{(BIT_NUM-32){1'b0}}, wdata_pipe};
            else
                wbuf <= lru_sel[1] ? mem_rdata[1] : mem_rdata[0];
        end
    end

    /* miss buffer */
    // reg dirty_mbuf;
    always @(posedge clk) begin
        if(!rstn) begin
            m_buf <= 0;
        end
        else if(mbuf_we) begin
            m_buf <= {tag_rdata[tag_index][19:0], w_index, 6'b0};
        end
    end
    always @(posedge clk) begin
        if(!rstn) begin
            // dirty_mbuf <= 0;
            exception_buf <= 0;
        end
        else if(mbuf_we) begin
            // dirty_mbuf <= dirty_rdata;
            exception_buf <= exception_temp;
        end
    end
    
    /* memory visit settings*/
    assign d_raddr  = uncache_buf ? paddr_buf : {paddr_buf[31:6], 6'b0};
    assign d_waddr  = uncache_buf ? paddr_buf : m_buf;
    assign d_wdata  = wbuf[31:0];

    /* main FSM */
    localparam 
        IDLE        = 4'd0,
        LOOKUP      = 4'd1,
        MISS        = 4'd2,
        REFILL      = 4'd3,
        WAIT_WRITE  = 4'd4,
        CACOP       = 4'd5,
        UNCACHE     = 4'd6,     //处理uncache写
        IBAR        = 4'd7,
        CACOP_WB    = 4'd8;
    
    reg [2:0] uncache_rwsize;
    always @(*) begin
        case(wstrb_pipe)
        BYTE: uncache_rwsize = 3'd0;
        HALF: uncache_rwsize = 3'd1;
        WORD: uncache_rwsize = 3'd2;
        default: uncache_rwsize = 3'd0;
        endcase
    end

    reg [3:0] state, next_state;
    assign idle = (state == IDLE);
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
            if(exception != 0) 
                next_state = IDLE;
            else if(cacop_en) 
                next_state = CACOP;
            else if(rvalid || wvalid) begin
                next_state = LOOKUP;
            end
            else begin
                next_state = IDLE;
            end
        end
        LOOKUP: begin
            if(exception_temp != 0)
                next_state = IDLE;
            else if(uncache_buf) begin
                if(op_buf == READ_OP)
                    next_state = MISS;
                else 
                    next_state = WAIT_WRITE;
            end
            else if(is_atom_buf && (op_buf == WRITE_OP) && !llbit_buf) begin
                next_state = WAIT_WRITE;
            end
            else if(cacop_en) begin
                next_state = CACOP;
            end
            else if(cache_hit) begin
                next_state = (rvalid || wvalid) ? LOOKUP : IDLE;
            end
            else begin
                next_state = MISS;
            end
        end
        MISS: begin
            if(d_rvalid && d_rready) begin
                if(uncache_buf) 
                    next_state = WAIT_WRITE;
                else
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
                if(cacop_en)
                    next_state = CACOP;
                else
                    next_state = (rvalid || wvalid) ? LOOKUP : IDLE;
            end
            else begin
                next_state = WAIT_WRITE;
            end
        end
        CACOP: begin//! IBAR待完成
            if((exception_temp != 0) || ibar)     
                next_state = IDLE;
            else                    
                next_state = WAIT_WRITE;
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
        d_rlen               = 8'd15;
        d_wlen               = 8'd15;
        lru_we               = 0;
        way_visit            = 0;
        cacop_complete       = 0;
        cacop_ready          = 0;
        tagv_clear           = 0;
        exception_sel        = 0;
        dirty_we             = 0;
        dirty_wdata          = 0;
        d_wstrb              = 4'b1111;
        case(state)
        IDLE: begin
            req_buf_we = 1;
            lru_we     = 1;
            if(cacop_en)
                cacop_ready = 1;
            if(cacop_en_buf)
                cacop_complete  = 1;
        end
        LOOKUP: begin
            if(exception_temp == 0) begin
                pbuf_we = 1;
                lru_we  = 0;
                if(cacop_en)
                    cacop_ready = 1;
                if(is_atom_buf)begin
                    if( op_buf == READ_OP)
                    llbit_set = 1;
                    else if(op_buf == WRITE_OP)
                    llbit_clear = 1;
                end
                if(!cacop_en_buf) begin
                    if(cache_hit && !uncache_buf) begin //命中
                        //读
                        way_visit               = hit_way;
                        lru_we                  = 1;
                        req_buf_we              = (rvalid || wvalid || cacop_en);
                        rready                  = !we_pipe;
                        //写
                        if(op_buf == WRITE_OP) begin
                            mem_we[hit_way]     = {{(BYTE_NUM-4){1'b0}}, wstrb_pipe} << {address[BYTE_OFFSET_WIDTH-1:2], 2'b0};
                            dirty_we            = hit;
                            dirty_wdata         = 1;
                            wready              = we_pipe;
                        end
                    end
                    else begin // miss write
                        wbuf_we = 1;
                        mbuf_we = 1;
                        wfsm_en = 1;
                    end
                end
                if(uncache_buf && op_buf == WRITE_OP) begin
                    wbuf_we = 1;
                    d_wlen  = 8'd0;
                    d_wstrb = wstrb_pipe;
                    wfsm_en = 1;
                end
            end
            else begin
                rready = !we_pipe;
                wready = we_pipe;
            end
        end
        MISS: begin
            d_rvalid = 1;
            if(uncache_buf) begin
                d_rlen = 8'd0;
            end
        end
        REFILL: begin
            tagv_we[lru_sel[1]]       = 1;
            mem_we[lru_sel[1]]        = -1;
            wdata_from_pipe           = 0;
            // set lru
            lru_we                    = 1;
            way_visit                 = lru_sel[1];
            // clear dirty
            dirty_we                  = lru_sel;
            dirty_wdata               = 0;
        end
        WAIT_WRITE: begin
            wfsm_reset      = 1;
            exception_sel   = 1;
            cacop_ready     = 1;
            rready          = wrt_finish & !we_pipe;
            wready          = wrt_finish & we_pipe;
            data_from_mem   = 0;
            req_buf_we      = wrt_finish & (rvalid || wvalid);
            if(cacop_en_buf)
                cacop_complete  = 1;
        end
        CACOP: begin
            if(exception_temp != 0) cacop_complete = 1;
            else if(store_tag || index_invalid) begin
                tagv_clear = 1;
                tagv_we    = tagv_way_sel;
                if(index_invalid && dirty_rdata)begin
                    dirty_we   = tagv_way_sel;
                    dirty_wdata= 0;
                    wbuf_we = 1;
                    mbuf_we = 1;
                    wfsm_en = 1;
                end
            end
            else if(hit_invalid && cache_hit) begin
                tagv_clear = 1;
                tagv_we    = hit;
                if(dirty_rdata)begin
                    dirty_we   = tagv_way_sel;
                    dirty_wdata= 0;
                    wbuf_we = 1;
                    mbuf_we = 1;
                    wfsm_en = 1;
                end
            end
        end
        endcase
    end

    /* write fsm */
    localparam 
        INIT    = 3'd0,
        WRITE   = 3'd1,
        FINISH  = 3'd2;
    reg [2:0] wfsm_state, wfsm_next_state;
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
                wfsm_next_state = uncache_buf ? WRITE : dirty_rdata ? WRITE : FINISH;
            end
            else begin
                wfsm_next_state = INIT;
            end
        end
        WRITE: begin
            if(d_wvalid && d_wready) begin
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
        d_wvalid            = 0;
        case(wfsm_state)
        INIT: begin
        end
        WRITE: begin
            d_wvalid            = 1;
        end
        FINISH: begin
            wrt_finish = 1;
        end
        endcase
    end

endmodule
