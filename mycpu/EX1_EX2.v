`include "define.vh"
module EX1_EX2(
    input   clk,
    input   aresetn,
    input   flush_in,
    output  flush_out,

    input   [31:0] reg_ex1_pc0,//这些信号直接从REG_EX1中接入
    input   [31:0] reg_ex1_pc1,
    input   reg_ex1_is_ALU_0,
    input   reg_ex1_is_ALU_1,
    input   reg_ex1_is_syscall_0,
    input   reg_ex1_is_syscall_1,
    input   reg_ex1_is_break_0,
    input   reg_ex1_is_break_1,
    input   reg_ex1_is_priviledged_0,
    input   reg_ex1_is_priviledged_1,
    input   [`WIDTH_UOP-1:0] reg_ex1_uop0,
    input   [`WIDTH_UOP-1:0] reg_ex1_uop1,
    input   [31:0] reg_ex1_imm0,
    input   [31:0] reg_ex1_imm1,
    input   [4:0] reg_ex1_rj0,
    input   [4:0] reg_ex1_rj1,
    input   [4:0] reg_ex1_rk0,
    input   [4:0] reg_ex1_rk1,
    input   [4:0] reg_ex1_rd0,
    input   [4:0] reg_ex1_rd1,
    input   [31:0] mul_stage1_res_hh,
    input   [31:0] mul_stage1_res_hl,
    input   [31:0] mul_stage1_res_lh,
    input   [31:0] mul_stage1_res_ll,
    input   [31:0] mul_compensate,

    output  reg ex1_ex2_is_syscall_0,
    output  reg ex1_ex2_is_syscall_1,
    output  reg ex1_ex2_is_break_0,
    output  reg ex1_ex2_is_break_1,
    output  reg ex1_ex2_is_priviledged_0,
    output  reg ex1_ex2_is_priviledged_1,
    output  reg [`WIDTH_UOP-1:0] ex1_ex2_uop0,
    output  reg [`WIDTH_UOP-1:0] ex1_ex2_uop1,
    output  reg [31:0] ex1_ex2_imm0,
    output  reg [31:0] ex1_ex2_imm1,
    output  reg [4:0] ex1_ex2_rj0,
    output  reg [4:0] ex1_ex2_rj1,
    output  reg [4:0] ex1_ex2_rk0,
    output  reg [4:0] ex1_ex2_rk1,
    output  reg [4:0] ex1_ex2_rd0,
    output  reg [4:0] ex1_ex2_rd1,
    output  reg [31:0] ex1_ex2_mul_stage1_res_hh,
    output  reg [31:0] ex1_ex2_mul_stage1_res_hl,
    output  reg [31:0] ex1_ex2_mul_stage1_res_lh,
    output  reg [31:0] ex1_ex2_mul_stage1_res_ll,
    output  reg [31:0] ex1_ex2_mul_compensate,

    input [31:0] alu_result0,
    input [31:0] alu_result1,
    input alu_result0_valid,
    input alu_result1_valid,
    output reg [31:0] ex1_ex2_data_0,
    output reg [31:0] ex1_ex2_data_1,
    output reg ex1_ex2_data_0_valid,
    output reg ex1_ex2_data_1_valid


);
always@(posedge clk) begin
    if(~aresetn) begin
        ex1_ex2_is_syscall_0<=0;
        ex1_ex2_is_syscall_1<=0;
        ex1_ex2_is_break_0<=0;
        ex1_ex2_is_break_1<=0;
        ex1_ex2_is_priviledged_0<=0;
        ex1_ex2_is_priviledged_1<=0;
        ex1_ex2_uop0<=0;
        ex1_ex2_uop1<=0;
        ex1_ex2_imm0<=0;
        ex1_ex2_imm1<=0;
        ex1_ex2_rj0<=0;
        ex1_ex2_rj1<=0;
        ex1_ex2_rk0<=0;
        ex1_ex2_rk1<=0;
        ex1_ex2_rd0<=0;
        ex1_ex2_rd1<=0;
        ex1_ex2_data_0<=0;
        ex1_ex2_data_1<=0;
        ex1_ex2_data_0_valid<=0;
        ex1_ex2_data_1_valid<=0;
        ex1_ex2_mul_stage1_res_hh<=0;
        ex1_ex2_mul_stage1_res_hl<=0;
        ex1_ex2_mul_stage1_res_lh<=0;
        ex1_ex2_mul_stage1_res_ll<=0;
        ex1_ex2_mul_compensate<=0;
    end else begin
        ex1_ex2_is_syscall_0<=reg_ex1_is_syscall_0;
        ex1_ex2_is_syscall_1<=reg_ex1_is_syscall_1;
        ex1_ex2_is_break_0<=reg_ex1_is_break_0;
        ex1_ex2_is_break_1<=reg_ex1_is_break_1;
        ex1_ex2_is_priviledged_0<=reg_ex1_is_priviledged_0;
        ex1_ex2_is_priviledged_1<=reg_ex1_is_priviledged_1;
        ex1_ex2_uop0<=reg_ex1_uop0;
        ex1_ex2_uop1<=reg_ex1_uop1;
        ex1_ex2_imm0<=reg_ex1_imm0;
        ex1_ex2_imm1<=reg_ex1_imm1;
        ex1_ex2_rj0<=reg_ex1_rj0;
        ex1_ex2_rj1<=reg_ex1_rj1;
        ex1_ex2_rk0<=reg_ex1_rk0;
        ex1_ex2_rk1<=reg_ex1_rk1;
        ex1_ex2_rd0<=reg_ex1_rd0;
        ex1_ex2_rd1<=reg_ex1_rd1;
        ex1_ex2_data_0<=alu_result0;
        ex1_ex2_data_1<=alu_result1;
        ex1_ex2_data_0_valid<=alu_result0_valid;
        ex1_ex2_data_1_valid<=alu_result1_valid;
        ex1_ex2_mul_stage1_res_hh<=mul_stage1_res_hh;
        ex1_ex2_mul_stage1_res_hl<=mul_stage1_res_hl;
        ex1_ex2_mul_stage1_res_lh<=mul_stage1_res_lh;
        ex1_ex2_mul_stage1_res_ll<=mul_stage1_res_ll;
        ex1_ex2_mul_compensate<=mul_compensate;
    end
end
endmodule