`include "define.vh"
module MEMBUF(
    input clk,
    input aresetn,
    input flush,
    input forward_stall,
    input flush_by_priv,
    input tlb_readygo,
    output tlb_allowin,
    input ex_allowin,
    output ex_readygo,
    input [31:0] reg_ex_pc0,
    input [31:0] reg_ex_pc1,
    input [31:0] reg_ex_pc_next,
    input [31:0] reg_ex_inst0,
    input [31:0] reg_ex_inst1,
    input reg_ex_branch_flag,
    input reg_ex_excp_flag,
    input [6:0] reg_ex_exception,
    input [31:0] reg_ex_badv,
    input reg_ex_is_ALU_0,
    input reg_ex_is_ALU_1,
    input reg_ex_is_syscall_0,
    input reg_ex_is_syscall_1,
    input reg_ex_is_break_0,
    input reg_ex_is_break_1,
    input reg_ex_is_priviledged_0,
    input reg_ex_is_priviledged_1,
    input [`WIDTH_UOP-1:0] reg_ex_uop0,
    input [`WIDTH_UOP-1:0] reg_ex_uop1,
    input [31:0] reg_ex_imm0,
    input [31:0] reg_ex_imm1,
    input [31:0] reg_ex_rj0_data,
    input [31:0] reg_ex_rj1_data,
    input [31:0] reg_ex_rk0_data,
    input [31:0] reg_ex_rk1_data,
    input [4:0] reg_ex_rj0,
    input [4:0] reg_ex_rj1,
    input [4:0] reg_ex_rk0,
    input [4:0] reg_ex_rk1,
    input [4:0] reg_ex_rd0,
    input [4:0] reg_ex_rd1,
    output reg [31:0]           tlb_ex_pc0,
    output reg [31:0]           tlb_ex_pc1,
    output reg [31:0]           tlb_ex_pc_next,
    output reg [31:0]           tlb_ex_inst0,
    output reg [31:0]           tlb_ex_inst1,
    output reg                  tlb_ex_branch_flag,
    output reg                  tlb_ex_excp_flag,
    output reg [6:0]            tlb_ex_exception,
    output reg [31:0]           tlb_ex_badv,
    output reg                  tlb_ex_is_ALU_0,
    output reg                  tlb_ex_is_ALU_1,
    output reg                  tlb_ex_is_syscall_0,
    output reg                  tlb_ex_is_syscall_1,
    output reg                  tlb_ex_is_break_0,
    output reg                  tlb_ex_is_break_1,
    output reg                  tlb_ex_is_priviledged_0,
    output reg                  tlb_ex_is_priviledged_1,
    output reg [`WIDTH_UOP-1:0] tlb_ex_uop0,
    output reg [`WIDTH_UOP-1:0] tlb_ex_uop1,
    output reg [31:0]           tlb_ex_imm0,
    output reg [31:0]           tlb_ex_imm1,
    output reg [31:0]           tlb_ex_rj0_data,
    output reg [31:0]           tlb_ex_rj1_data,
    output reg [31:0]           tlb_ex_rk0_data,
    output reg [31:0]           tlb_ex_rk1_data,
    output reg [4:0]            tlb_ex_rj0,
    output reg [4:0]            tlb_ex_rj1,
    output reg [4:0]            tlb_ex_rk0,
    output reg [4:0]            tlb_ex_rk1,
    output reg [4:0]            tlb_ex_rd0,
    output reg [4:0]            tlb_ex_rd1
);

always @ (posedge clk)begin
    if(~aresetn | flush | flush_by_priv)begin
        tlb_ex_pc0 <= 0;
        tlb_ex_pc1 <= 0;
        tlb_ex_pc_next <= 0;
        tlb_ex_inst0 <= `INST_NOP;
        tlb_ex_inst1 <= `INST_NOP;
        tlb_ex_branch_flag <= 0;
        tlb_ex_excp_flag <= 0;
        tlb_ex_exception <= 0;
        tlb_ex_badv <= 0;
        tlb_ex_is_ALU_0 <= 0;
        tlb_ex_is_ALU_1 <= 0;
        tlb_ex_is_syscall_0 <= 0;
        tlb_ex_is_syscall_1 <= 0;
        tlb_ex_is_break_0 <= 0;
        tlb_ex_is_break_1 <= 0;
        tlb_ex_is_priviledged_0 <= 0;
        tlb_ex_is_priviledged_1 <= 0;
        tlb_ex_uop0 <= 0;
        tlb_ex_uop1 <= 0;
        tlb_ex_imm0 <= 0;
        tlb_ex_imm1 <= 0;
        tlb_ex_rj0_data <= 0;
        tlb_ex_rj1_data <= 0;
        tlb_ex_rk0_data <= 0;
        tlb_ex_rk1_data <= 0;
        tlb_ex_rj0 <= 0;
        tlb_ex_rj1 <= 0;
        tlb_ex_rk0 <= 0;
        tlb_ex_rk1 <= 0;
        tlb_ex_rd0 <= 0;
        tlb_ex_rd1 <= 0;
    end
    else if (tlb_readygo && tlb_allowin && ex_allowin)begin
        tlb_ex_pc0 <= reg_ex_pc0;
        tlb_ex_pc1 <= reg_ex_pc1;
        tlb_ex_pc_next <= reg_ex_pc_next;
        tlb_ex_inst0 <= reg_ex_inst0;
        tlb_ex_inst1 <= reg_ex_inst1;
        tlb_ex_branch_flag <= reg_ex_branch_flag;
        tlb_ex_excp_flag <= reg_ex_excp_flag;
        tlb_ex_exception <= reg_ex_exception;
        tlb_ex_badv <= reg_ex_badv;
        tlb_ex_is_ALU_0 <= reg_ex_is_ALU_0;
        tlb_ex_is_ALU_1 <= reg_ex_is_ALU_1;
        tlb_ex_is_syscall_0 <= reg_ex_is_syscall_0;
        tlb_ex_is_syscall_1 <= reg_ex_is_syscall_1;
        tlb_ex_is_break_0 <= reg_ex_is_break_0;
        tlb_ex_is_break_1 <= reg_ex_is_break_1;
        tlb_ex_is_priviledged_0 <= reg_ex_is_priviledged_0;
        tlb_ex_is_priviledged_1 <= reg_ex_is_priviledged_1;
        tlb_ex_uop0 <= reg_ex_uop0;
        tlb_ex_uop1 <= reg_ex_uop1;
        tlb_ex_imm0 <= reg_ex_imm0;
        tlb_ex_imm1 <= reg_ex_imm1;
        tlb_ex_rj0_data <= reg_ex_rj0_data;
        tlb_ex_rj1_data <= reg_ex_rj1_data;
        tlb_ex_rk0_data <= reg_ex_rk0_data;
        tlb_ex_rk1_data <= reg_ex_rk1_data;
        tlb_ex_rj0 <= reg_ex_rj0;
        tlb_ex_rj1 <= reg_ex_rj1;
        tlb_ex_rk0 <= reg_ex_rk0;
        tlb_ex_rk1 <= reg_ex_rk1;
        tlb_ex_rd0 <= reg_ex_rd0;
        tlb_ex_rd1 <= reg_ex_rd1;
    end
end

assign ex_readygo = ~forward_stall;
assign tlb_allowin = ex_allowin;

endmodule