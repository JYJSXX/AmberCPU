`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/15 14:51:53
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb(

    );
    
    reg                rst;
    reg                 clk;
    reg   [31:0]       din;
    reg                wr_en=1;
    reg                rd_en=0;
    wire  [31:0]       dout;
    wire               full;
    wire               empty;
    wire               wr_rst_busy;
    wire               rd_rst_busy;
    fifo_generator_0 your_instance_name (
        .clk(clk),                  // input wire clk
        .rst(rst),                  // input wire rst
        .din(din),                  // input wire [31 : 0] din
        .wr_en(wr_en),              // input wire wr_en
        .rd_en(rd_en),              // input wire rd_en
        .dout(dout),                // output wire [31 : 0] dout
        .full(full),                // output wire full
        .empty(empty)              // output wire empty
    );
    always #1 clk=~clk;

    always @(posedge clk) begin
        din<=din+1;
    end
    initial begin
        clk<=0;
        rst<=0;#5;
        // rst=0;
        din=0;
    end
endmodule
