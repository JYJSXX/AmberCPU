`include "define.vh"
module EX2(
    input [`WIDTH_UOP-1:0] uop0,
    input [`WIDTH_UOP-1:0] uop1,
    input [31:0] ex1_ex2_data_0,
    input [31:0] ex1_ex2_data_1,
    input ex1_ex2_data_0_valid, //可不可以前递，没算好不能前递
    input ex1_ex2_data_1_valid,
    //mul
    input [31:0] mul_stage1_res_hh,
    input [31:0] mul_stage1_res_hl,
    input [31:0] mul_stage1_res_lh,
    input [31:0] mul_stage1_res_ll,
    input [31:0] mul_compensate,


    output [31:0] rd0_data,
    output [31:0] rd1_data,
    output ex2_data0_valid,
    output ex2_data1_valid


);
wire [3:0] cond0;
wire [3:0] cond1;
assign cond0 = uop0[`UOP_COND];
assign cond1 = uop1[`UOP_COND];
wire [63:0] mul_result;
Mul_Stage_2 mul_stage_2(
    .mul_stage1_res_hh(mul_stage1_res_hh),
    .mul_stage1_res_hl(mul_stage1_res_hl),
    .mul_stage1_res_lh(mul_stage1_res_lh),
    .mul_stage1_res_ll(mul_stage1_res_ll),
    .mul_compensate(mul_compensate),
    .mul_stage2_res(mul_result)
);
assign ex2_data0_valid = ex1_ex2_data_0_valid | uop0[`INS_MUL];
assign ex2_data1_valid = ex1_ex2_data_1_valid | uop1[`INS_MUL];
assign rd0_data = ex1_ex2_data_0_valid ? ex1_ex2_data_0 :
 uop0[`INS_MUL] &&  cond0[0] ? mul_result[63:32] : 
 uop0[`INS_MUL] &&  ~cond0[0] ? mul_result[31:0] :
 32'b0;
assign rd1_data = ex1_ex2_data_1_valid ? ex1_ex2_data_1 :32'b0;
endmodule