`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2023 12:45:26 AM
// Design Name: 
// Module Name: divider_tb
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


module divider_tb(
    
    );
    reg clk = 0;
    always #1 clk = ~clk;
    reg [31:0] dividend = 0;
    reg [31:0] divisor = 0;
    reg en = 0;
    initial begin
        #2 dividend[31:0] <= 32'h00000009;
        divisor[31:0] <= 32'h00000003;
        en <= 1;
        #2 dividend <= 0;
        divisor <= 0;
        en <= 0;
        #2 dividend <= 1;
        #2 dividend <= 2;
        #2 dividend <= 3;
        #2 dividend <= 4;
        #2 dividend <= 5;
        #2 dividend <= 6;
        #2 dividend <= 7;
        #2 dividend <= 8;
        #2 dividend <= 9;
        #2 dividend <= 10;
        #2 dividend <= 11;
        #2 dividend <= 12;
        #2 dividend <= 13;
        #2 dividend <= 14;
    end
    wire [31:0] quotient, remainder;
    wire stall_divider, ready;
    divider dvd(
        .clk(clk),
        .rstn(1),
        .dividend(dividend),
        .divisor(divisor),
        .en(en),
        .flush_exception(0),
        .sign(0),

        .quotient(quotient),
        .remainder(remainder),
        .stall_divider(stall_divider),
        .ready(ready)
    );
endmodule
