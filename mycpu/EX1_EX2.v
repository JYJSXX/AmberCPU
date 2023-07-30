`include "define.vh"
module EX1_EX2(
    input   clk,
    input   aresetn,
    input   flush_in,
    //output  flush_out,
    input   ex1_readygo,
    output  reg ex1_allowin,
    input   ex2_allowin,
    output  reg ex2_readygo,
    //input   forward_stall,

    input   csr_ren_ex1, 
    output reg csr_ren_ex2,
    input   [31:0] reg_ex1_pc0,//这些信号直接从REG_EX1中接入
    input   [31:0] reg_ex1_pc1,
    input   [31:0] reg_ex1_inst0,
    input   [31:0] reg_ex1_inst1,
    // input   reg_ex1_is_ALU_0,
    // input   reg_ex1_is_ALU_1,
    // input   reg_ex1_is_syscall_0,
    // input   reg_ex1_is_syscall_1,
    // input   reg_ex1_is_break_0,
    // input   reg_ex1_is_break_1,
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
    input           ex2_wb_excp_flag,
    

    output  reg [31:0] ex1_ex2_pc0,
    output  reg [31:0] ex1_ex2_pc1,
    output  reg [31:0] ex1_ex2_inst0,
    output  reg [31:0] ex1_ex2_inst1,
    // output  reg ex1_ex2_is_syscall_0,
    // output  reg ex1_ex2_is_syscall_1,
    // output  reg ex1_ex2_is_break_0,
    // output  reg ex1_ex2_is_break_1,
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
    output reg ex1_ex2_data_1_valid,

    //从ex1接入 exception相关
    input   [31:0] badv_in,
    input   excp_flag_in,
    input   [6:0] exception_in,
    input   [6:0] d_exception,
    input   [31:0] d_badv,
    output  reg [31:0] ex1_ex2_badv,
    output  reg ex1_ex2_excp_flag,
    output  reg [6:0] ex1_ex2_exception

    // input dcache_ready,
    // input div_ready

);
always@(posedge clk) begin
    if(~aresetn | (~ex1_readygo & ex2_allowin & ex2_readygo) | flush_in) begin
        ex1_ex2_pc0<=0;
        ex1_ex2_pc1<=0;
        ex1_ex2_inst0<=`INST_NOP;
        csr_ren_ex2<=0;
        ex1_ex2_inst1<=`INST_NOP;
        // ex1_ex2_is_syscall_0<=0;
        // ex1_ex2_is_syscall_1<=0;
        // ex1_ex2_is_break_0<=0;
        // ex1_ex2_is_break_1<=0;
         ex1_ex2_is_priviledged_0<=0;
         ex1_ex2_is_priviledged_1<=0;
        ex1_ex2_badv<=0;
        ex1_ex2_excp_flag<=0;
        ex1_ex2_exception<=0;
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
    end else if(ex1_readygo&&ex2_allowin&&ex1_allowin)begin
        ex1_ex2_pc0<=reg_ex1_pc0;
        ex1_ex2_pc1<=reg_ex1_pc1;
        ex1_ex2_inst0<=reg_ex1_inst0;
        ex1_ex2_inst1<=reg_ex1_inst1;
        csr_ren_ex2<=csr_ren_ex1;
        // ex1_ex2_is_syscall_0<=reg_ex1_is_syscall_0;
        // ex1_ex2_is_syscall_1<=reg_ex1_is_syscall_1;
        // ex1_ex2_is_break_0<=reg_ex1_is_break_0;
        // ex1_ex2_is_break_1<=reg_ex1_is_break_1;
         ex1_ex2_is_priviledged_0<=reg_ex1_is_priviledged_0;
         ex1_ex2_is_priviledged_1<=reg_ex1_is_priviledged_1;
        ex1_ex2_badv<=excp_flag_in? badv_in : d_badv;
        ex1_ex2_exception<=excp_flag_in? exception_in : d_exception;
        ex1_ex2_excp_flag<=(excp_flag_in | (|d_exception[6])) & ~ex1_ex2_excp_flag;

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
    else begin
        //~ex2_allowin,寄存器保持不变
        ex1_ex2_pc0<=ex1_ex2_pc0;
        ex1_ex2_pc1<=ex1_ex2_pc1;
        ex1_ex2_inst0<=ex1_ex2_inst0;
        ex1_ex2_inst1<=ex1_ex2_inst1;
        // ex1_ex2_is_syscall_0<=ex1_ex2_is_syscall_0;
        // ex1_ex2_is_syscall_1<=ex1_ex2_is_syscall_1;
        // ex1_ex2_is_break_0<=ex1_ex2_is_break_0;
        // ex1_ex2_is_break_1<=ex1_ex2_is_break_1;
         ex1_ex2_is_priviledged_0<=ex1_ex2_is_priviledged_0;
         ex1_ex2_is_priviledged_1<=ex1_ex2_is_priviledged_1;
        ex1_ex2_badv<=ex1_ex2_badv;
        ex1_ex2_exception<=ex1_ex2_exception;
        ex1_ex2_excp_flag<=ex1_ex2_excp_flag;
        ex1_ex2_uop0<=ex1_ex2_uop0;
        ex1_ex2_uop1<=ex1_ex2_uop1;
        ex1_ex2_imm0<=ex1_ex2_imm0;
        ex1_ex2_imm1<=ex1_ex2_imm1;
        ex1_ex2_rj0<=ex1_ex2_rj0;
        ex1_ex2_rj1<=ex1_ex2_rj1;
        ex1_ex2_rk0<=ex1_ex2_rk0;
        ex1_ex2_rk1<=ex1_ex2_rk1;
        ex1_ex2_rd0<=ex1_ex2_rd0;
        ex1_ex2_rd1<=ex1_ex2_rd1;
        ex1_ex2_data_0<=ex1_ex2_data_0;
        ex1_ex2_data_1<=ex1_ex2_data_1;
        ex1_ex2_data_0_valid<=ex1_ex2_data_0_valid;
        ex1_ex2_data_1_valid<=ex1_ex2_data_1_valid;
        ex1_ex2_mul_stage1_res_hh<=ex1_ex2_mul_stage1_res_hh;
        ex1_ex2_mul_stage1_res_hl<=ex1_ex2_mul_stage1_res_hl;
        ex1_ex2_mul_stage1_res_lh<=ex1_ex2_mul_stage1_res_lh;
        ex1_ex2_mul_stage1_res_ll<=ex1_ex2_mul_stage1_res_ll;
        ex1_ex2_mul_compensate<=ex1_ex2_mul_compensate;

    end
end
always@(*)begin
    ex1_allowin=ex2_allowin;
    ex2_readygo =  1; //由于forward_stall停顿
end

endmodule