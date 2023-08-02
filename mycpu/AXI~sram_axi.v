`timescale 1ns/1ps

module sram_axi(
    input                       aclk,           //时钟信号
    input                       aresetn,        //复位信号

    //ar channel    
    output  reg     [3:0]       ar_id,          //读ID 0 for instruction, 1 for data
    output  reg     [31:0]      ar_addr,        //读地址
    output  reg     [7:0]       ar_len,         //读长度 默认为0xf
    output  reg     [2:0]       ar_size,        //读大小即粒度 num of bytes = 2^size 默认为2
    output  reg     [1:0]       ar_burst,       //读突发类型 默认为1 increamental
    output  reg                 ar_valid,       //读有效
    input                       ar_ready,       //读准备好

    //r channel 
    input           [3:0]       r_id,           //读数据对应读地址ID
    input           [31:0]      r_data,         //读数据
    input                       r_last,         //读数据结束
    input                       r_valid,        //读数据有效
    output  reg                 r_ready,        //读数据准备好

    //aw channel    
    output          [31:0]      aw_addr,        //写地址
    output  reg     [2:0]       aw_size,        //写大小
    output  reg     [7:0]       aw_len,         //写长度
    output  reg     [1:0]       aw_burst,       //写突发类型
    output  reg                 aw_valid,       //写有效
    input                       aw_ready,       //写准备好

    //w channel
    output          [31:0]      w_data,         //写数据
    output  reg                 w_valid,        //写有效
    input                       w_ready,        //写准备好
    output                      w_last,         //写使能
    output          [3:0]       w_strb,         //字节写通位

    //b channel 
    input                       b_valid,        //写响应有效
    output  reg                 b_ready,        //写响应准备好

    //sram
    input           [31:0]      i_raddr,        //指令cache读地址
    output  reg     [511:0]     i_rdata,        //指令cache读数据
    input                       i_rvalid,       //指令cache读有效
    output  reg                 i_rready,       //指令cache读准备好
    input           [7:0]       i_rlen,         //指令cache读长度
    // input           [2:0]       i_rsize,        //指令cache读大小
    // output                      i_rlast,     //指令cache读结束

    input           [31:0]      d_raddr,        //数据cache读地址
    output  reg     [511:0]     d_rdata,        //数据cache读数据
    input                       d_rvalid,       //数据cache读有效
    output  reg                 d_rready,       //数据cache读准备好
    input           [7:0]       d_rlen,         //数据cache读长度
    input           [2:0]       d_rsize,        //数据cache读大小
    // output                      d_rlast,     //数据cache读结束

    input           [31:0]      d_waddr,        //数据cache写地址
    input           [511:0]     d_wdata,        //数据cache写数据
    input                       d_wvalid,       //数据cache写有效
    output  reg                 d_wready,       //数据cache写准备好
    input           [7:0]       d_wlen,         //数据cache写长度
    input           [2:0]       d_wsize,         //数据cache写大小
    input           [3:0]       d_wstrb         //数据cache写使能
    // input                       d_wlast      //数据cache写结束

);

localparam [2:0] 
                R_IDLE = 0,
                R_IADDR = 1,
                R_IDATA = 2,
                R_DADDR = 3,
                R_DDATA = 4;

reg [2:0] r_state = R_IDLE, r_next_state = R_IDLE;

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
                // if(ar_ready) r_next_state = R_DDATA;
                // else 
                r_next_state = R_DADDR;
            else if(i_rvalid)
                // if(ar_ready) r_next_state = R_IDATA;
                // else 
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
    default:
        r_next_state = R_IDLE;
    endcase
end

wire [479:0] rdata_buffer;

shift_register#(.WIDTH(480)) OUTPUT_BUFFER(
    .clk(aclk),
    .rstn(aresetn),
    .flush(r_valid & r_ready & r_last),
    .data_in(r_data),
    .data_out(rdata_buffer),
    .ready(r_ready & r_valid)
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
    d_rdata = 0;
    d_rready = 1'b0;
    case(r_state)
        R_IDLE:
        begin
            if(d_rvalid)
            begin
                ar_valid = 1'b1;
                ar_addr = d_raddr;
                ar_id = 4'b0001;
                ar_len = d_rlen;
                ar_size = d_rsize;
            end
            else if(i_rvalid)
            begin
                ;
                // ar_valid = 1'b1;
                // ar_len = i_rlen;
                // ar_addr = i_raddr;
            end
        end
        R_IADDR:
        begin
            ar_valid = 1'b1;
            ar_addr = i_raddr;
            ar_len = i_rlen;
        end
        R_IDATA:
        begin
            r_ready = 1'b1;
            if(r_last & r_valid & r_ready)
            begin
                i_rdata = {r_data, rdata_buffer};
                i_rready = 1'b1;
            end
        end
        R_DADDR:
        begin
            ar_valid = 1'b1;
            ar_addr = d_raddr;
            ar_len = d_rlen;
            ar_size = d_rsize;
        end
        R_DDATA:
        begin
            r_ready = 1'b1;
            if (r_last & r_valid & r_ready)
            begin
                d_rdata = {r_data, rdata_buffer};
                d_rready = 1'b1;
            end
        end
        
    endcase
end

assign aw_addr = d_waddr;

localparam [1:0] 
                W_IDLE = 0,
                W_DADDR = 1,
                W_DDATA = 2,
                W_DLAST = 3;

reg [1:0] w_state = W_IDLE, w_next_state = W_IDLE;

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
                if (aw_ready) w_next_state = W_DDATA;
                else w_next_state = W_DADDR;
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
        default:
            w_next_state = W_IDLE;
    endcase
end

wire [511:0] d_wdata_true = d_wdata << ({d_waddr[1:0], 3'b0});
shift_register_n INPUT_BUFFER(
    .clk(aclk),
    .rstn(aresetn),
    .data_in(d_wdata_true),
    .data_out(w_data),
    .ready(w_ready),
    .data_in_valid(d_wvalid & (~|w_state))
);

reg [4:0] w_count = 5'b0;

always @(posedge aclk or negedge aresetn)
begin
    if(~aresetn)
        w_count <= 5'b0;
    else if (w_last & w_valid & w_ready)
        w_count <= 5'b0;
    else if(w_ready)
        w_count <= w_count + 1;
    else
        w_count <= w_count;
end

assign w_last = (w_count == d_wlen[4:0]);
wire [3:0] d_wstrb_true = d_wstrb << d_waddr[1:0];
assign w_strb = d_wstrb_true;
always @(*)
begin
    aw_len = 15;
    aw_size = 2;
    aw_burst = 2'b01;

    aw_valid = 1'b0;

    w_valid = 1'b0;
    b_ready = 1'b0;
    d_wready = 1'b0;
    case(w_state)
        W_IDLE:
        begin
            if(d_wvalid)
            begin
                aw_valid = 1'b1;
                aw_len = d_wlen;
                aw_size = d_wsize;
            end
        end
        W_DADDR:
        begin
            aw_valid = 1'b1;
            aw_len = d_wlen;
            aw_size = d_wsize;
        end
        W_DDATA:
        begin
            w_valid = 1'b1;
            // if (w_ready) w_valid = 1'b1;
            if (w_last & w_valid & w_ready) begin
                d_wready = 1'b1;
            end
        end
        W_DLAST:
        begin
            b_ready = 1'b1;
        end
        default:
            w_valid = 1'b0;
    endcase
    
end

endmodule
