module Mul_Stage_1(
    // input           mul_en,
    input   [31:0]  mul_src1,
    input   [31:0]  mul_src2,
    input           sign,
    output  [31:0]  mul_stage1_res_hh,
    output  [31:0]  mul_stage1_res_hl,
    output  [31:0]  mul_stage1_res_lh,
    output  [31:0]  mul_stage1_res_ll,
    output  [31:0]  mul_compensate
);

assign mul_stage1_res_hh = mul_src1[31:16] * mul_src2[31:16];
assign mul_stage1_res_hl = mul_src1[31:16] * mul_src2[15:0];
assign mul_stage1_res_lh = mul_src1[15:0] * mul_src2[31:16];
assign mul_stage1_res_ll = mul_src1[15:0] * mul_src2[15:0];

wire [31:0] compensate1, compensate2;
assign compensate1 = mul_src1[31] ? (-mul_src2) : 0;
assign compensate2 = mul_src2[31] ? (-mul_src1) : 0;
assign mul_compensate = sign ? compensate1 + compensate2 : 32'b0;

endmodule

module Mul_Stage_2(
    input  [31:0]  mul_stage1_res_hh,
    input  [31:0]  mul_stage1_res_hl,
    input  [31:0]  mul_stage1_res_lh,
    input  [31:0]  mul_stage1_res_ll,
    input  [31:0]  mul_compensate,
    output [63:0]  mul_stage2_res
);
    wire [32:0] mul_stage1_res_mid = mul_stage1_res_hl + mul_stage1_res_lh;
    assign mul_stage2_res = {mul_stage1_res_hh, mul_stage1_res_ll} + {15'b0, mul_stage1_res_mid, 16'b0} + {mul_compensate, 32'b0};

endmodule