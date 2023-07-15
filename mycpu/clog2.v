```timescale 1ns/1ps


module clog2(
    input       [31:0]      in,
    output      [5:0]       out
);

wire r_0, r_1, r_2, r_3, r_4;

wire [15:0] in16 = in[31:16] | in[15:0];
wire [7:0] in8 = in16[15:8] | in16[7:0];
wire [3:0] in4 = in8[7:4] | in8[3:0];

assign r_4 = |in[31:16];
assign r_3 = |in16[15:8];
assign r_2 = |in8[7:4];
assign r_1 = |in4[3:2];
assign r_0 = in4[3] | in4[1];
endmodule