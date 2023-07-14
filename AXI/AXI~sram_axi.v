```timescale 1ns/1ps

module sram_axi(
    input                       aclk,       //时钟信号
    input                       aresetn,    //复位信号

    //ar channel
    output  reg     [3:0]       ar_id,      //读ID 0 for instruction, 1 for data
    output  reg     [31:0]      ar_addr,    //读地址
    output  reg     [7:0]       ar_len,     //读长度 默认为0xf
    output  reg     [2:0]       ar_size,    //读大小即粒度 num of bytes = 2^size 默认为2
    output  reg     [1:0]       ar_burst,   //读突发类型 默认为1 increamental
    output  reg                 ar_valid,   //读有效
    input                       ar_ready,   //读准备好

    //r channel
    input           [3:0]       r_id,       //读数据对应读地址ID
    input           [31:0]      r_data,     //读数据
    input                       r_last,     //读数据结束
    input                       r_valid,    //读数据有效
    output  reg                 r_ready,    //读数据准备好

    //aw channel
    output  reg     [31:0]      aw_addr,
    output  reg     [2:0]       aw_size,
    output  reg     [7:0]       aw_len,
    output  reg     [1:0]       aw_burst,
    output  reg                 aw_valid,
    input                       aw_ready,

    //w channel
    output  reg     [31:0]      w_data,
    output  reg                 w_valid,
    input                       w_ready,

    //b channel
    input                       b_valid,
    output                      b_ready,

    //sram
    input           [31:0]      i_raddr,    //指令cache读地址
    output          [511:0]      i_rdata,    //指令cache读数据
    input                       i_rvalid,   //指令cache读有效
    output                      i_rready,   //指令cache读准备好
    // input           [7:0]       i_rlen,     //指令cache读长度
    // input           [2:0]       i_rsize,    //指令cache读大小
    // output              i_rlast,    //指令cache读结束

    input           [31:0]      d_raddr,    //数据cache读地址
    output          [511:0]     d_rdata,    //数据cache读数据
    input                       d_rvalid,   //数据cache读有效
    output                      d_rready,   //数据cache读准备好
    // input           [7:0]       d_rlen,     //数据cache读长度
    // input           [2:0]       d_rsize,    //数据cache读大小
    // output                      d_rlast,    //数据cache读结束

    input           [31:0]      d_waddr,
    input           [511:0]     d_wdata,
    input                       d_wvalid,
    output                      d_wready
    // input           [7:0]       d_wlen,
    // input           [2:0]       d_wsize,
    // input           [3:0]       d_wstrb,
    // input                       d_wlast

);

localparam [2:0] 
                R_IDLE = 0,
                R_IADDR = 1,
                R_IDATA = 2,
                R_DADDR = 3,
                R_DDATA = 4;

reg [2:0] r_state, r_next_state;

always @(posedge aclk or negedge aresetn)
begin
    if(~aresetn)
        r_state <= R_IDLE;
    else
        r_state <= r_next_state;
end

always @(*)
begin
    r_next_state = r_state;
    case(r_state)
        R_IDLE:
        begin
            if(d_rvalid) 
                r_next_state = R_DADDR;
            else if(i_rvalid)
                r_next_state = R_IADDR;
        end
        R_IADDR:
        begin
            if(ar_valid & ar_ready)
                r_next_state = R_IDATA;
        end
        R_IDATA:
        begin
            if(r_valid & r_ready & r_last)
                r_next_state = R_IDLE;
        end
        R_DADDR:
        begin
            if(ar_valid & ar_ready)
                r_next_state = R_DDATA;
        end
        R_DDATA:
        begin
            if(r_valid & r_ready & r_last)
                r_next_state = R_IDLE;
        end
    endcase
end

wire [479:0] rdata_buffer;

shift_register#(.WIDTH(480)) OUTPUT_BUFFER(
    .clk(aclk),
    .rstn(aresetn),
    .data_in(r_data),
    .data_out(rdata_buffer),
    .ready(r_ready),
);

always @(*)
begin
    ar_id = 4'b0000;
    ar_addr = 0;

    ar_len = 15;
    ar_size = 2;
    ar_burst = 2'b01;

    ar_valid = 1'b0;
    r_ready = 1'b0;

    i_rdata = 0;
    i_rready = 1'b0;
    case(r_state)
        R_IDLE:
        begin
            if(d_rvalid)
            begin
                ar_valid = 1'b1;
                ar_addr = d_raddr;
                ar_id = 4'b0001;
            end
            else if(i_rvalid)
            begin
                ar_valid = 1'b1;
                ar_addr = i_raddr;
            end
        end
        R_IADDR:
        begin
            ar_valid = 1'b1;
            ar_addr = i_raddr;
        end
        R_IDATA:
        begin
            r_ready = 1'b1;
            // if (r_valid) r_ready = 1'b1;
            if (r_last) begin
                i_rdata = {rdata_buffer, r_data[31:0]};
                i_rready = 1'b1;
            end
        end
        R_DADDR:
        begin
            ar_valid = 1'b1;
            ar_addr = d_raddr;
        end
        R_DDATA:
        begin
            r_ready = 1'b1;
            // if (r_valid) r_ready = 1'b1;
            if (r_last) begin
                d_rdata = {rdata_buffer, r_data[31:0]};
                d_rready = 1'b1;
            end
        end
    endcase
end

assign aw_id = 4'b0000;
assign aw_addr = d_waddr;

localparam [1:0] 
                W_IDLE = 0,
                W_DADDR = 1,
                W_DDATA = 2,
                W_DLAST = 3;

reg [1:0] w_state, w_next_state;

always @(posedge aclk or negedge aresetn)
begin
    if(~aresetn)
        w_state <= W_IDLE;
    else
        w_state <= w_next_state;
end

always @(*)
begin
    w_next_state = w_state;
    case(w_state)
        W_IDLE:
        begin
            if(d_wvalid) 
                w_next_state = W_DADDR;
        end
        W_DADDR:
        begin
            if(aw_valid & aw_ready)
                w_next_state = W_DDATA;
        end
        W_DDATA:
        begin
            if(w_valid & w_ready & w_last)
                w_next_state = W_DLAST;
        end
        W_DLAST:
        begin
            if(b_valid & b_ready)
                w_next_state = W_IDLE;
        end        
    endcase
end

shift_register_n INPUT_BUFFER(
    .clk(aclk),
    .rstn(aresetn),
    .data_in(d_wdata),
    .data_out(w_data),
    .ready(w_ready),
    .data_in_valid(d_wvalid & (~|w_state)),
);

always @(*)
begin
    aw_len = 15;
    aw_size = 2;
    aw_burst = 2'b01;

    aw_valid = 1'b0;

    w_valid = 1'b0;
    b_ready = 1'b0;
    case(w_state)
        W_IDLE:
        begin
            if(d_wvalid)
            begin
                aw_valid = 1'b1;
            end
        end
        W_DADDR:
        begin
            aw_valid = 1'b1;
        end
        W_DDATA:
        begin
            w_valid = 1'b1;
            // if (w_ready) w_valid = 1'b1;
            if (w_last) begin
                d_wready = 1'b1;
            end
        end
        W_DLAST:
        begin
            b_ready = 1'b1;
        end
    endcase
end

endmodule
