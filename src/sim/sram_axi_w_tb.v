`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/17 13:38:48
// Design Name: 
// Module Name: sram_axi_w_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sram_axi_w_tb(

    );

    reg aclk = 0;
    always #1 aclk = ~aclk;

    wire [3:0] ar_id;
    wire [31:0] ar_addr;
    wire [7:0] ar_len;
    wire [2:0] ar_size;
    wire [1:0] ar_burst;
    wire ar_valid;

    wire r_ready;

    wire [31:0] aw_addr;
    wire [2:0] aw_size;
    wire [7:0] aw_len;
    wire [1:0] aw_burst;
    wire aw_valid;
    reg aw_ready = 0;

    always @(posedge aclk)
    begin
        if (aw_valid & ~aw_ready) #2 aw_ready <= 1;
        else aw_ready <= 0;
    end

    wire [31:0] w_data;
    wire w_valid;
    reg w_ready = 0;
    wire w_last;

    always @(posedge aclk)
    begin
        if (w_valid & ~w_ready) #2 w_ready <= 1;
        else w_ready <= 0;
    end

    reg b_valid = 1;
    wire b_ready;

    wire [31:0] i_rdata;
    wire [31:0] d_rdata;
    wire i_rready, d_rready;

    reg d_wvalid = 0;
    wire d_wready;

    always @(posedge aclk)
    begin
        if (~d_wvalid) d_wvalid <= 1;
        else if (d_wready) d_wvalid <= 0;
    end

    sram_axi sa(
        .aclk(aclk),
        .aresetn(1),

        //ar channel    
        .ar_id(ar_id),
        .ar_addr(ar_addr),
        .ar_len(ar_len),
        .ar_size(ar_size),
        .ar_burst(ar_burst),
        .ar_valid(ar_valid),
        .ar_ready(1),

        //r channel 
        .r_id(0),
        .r_data(0),
        .r_last(0),
        .r_valid(0),
        .r_ready(r_ready),

        //aw channel    
        .aw_addr(aw_addr),
        .aw_len(aw_len),
        .aw_size(aw_size),
        .aw_burst(aw_burst),
        .aw_valid(aw_valid),
        .aw_ready(aw_ready),

        //w channel
        .w_data(w_data),
        .w_last(w_last),
        .w_valid(w_valid),
        .w_ready(w_ready),

        //b channel 
        .b_valid(b_valid),
        .b_ready(b_ready),

        //sram
        .i_raddr(0),
        .i_rdata(i_rdata),
        .i_rvalid(0),
        .i_rready(i_rready),
        .i_rlen(0),

        .d_raddr(0),
        .d_rdata(d_rdata),
        .d_rvalid(0),
        .d_rready(d_rready),
        .d_rlen(2),

        .d_waddr(32'h12344321),
        .d_wdata(512'h00000000111111112222222233333333444444445555555566666666777777778888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff),
        .d_wvalid(d_wvalid),
        .d_wready(d_wready),
        .d_wlen(15)
    );
endmodule
