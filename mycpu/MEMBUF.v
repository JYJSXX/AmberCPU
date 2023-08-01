`include "define.vh"
module MEMBUF(
    input clk,
    input aresetn,
    input flush,
    input forward_stall,
    input flush_by_exception,
    input tlb_readygo,
    output tlb_allowin,
    input ex_allowin,
    output ex_readygo,
    input [31:0] reg_ex_pc0,
    input [31:0] reg_ex_pc1,
    input [31:0] reg_ex_pc_next,
    input reg_ex_pc_taken,
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
    input privilege_ready,
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

    input [31:0] csr_rd_data,

    //从ex1_ex2段间输入
    input [4:0] ex1_ex2_rd0,
    input [4:0] ex1_ex2_rd1,
    input [31:0] ex1_ex2_data_0,
    input [31:0] ex1_ex2_data_1,
    input ex1_ex2_data_0_valid, //可不可以前递，没算好不能前递
    input ex1_ex2_data_1_valid,
    //从ex2_wb段间输入
    input [4:0] ex2_wb_rd0,
    input [4:0] ex2_wb_rd1,
    input [4:0] ex2_wb_rd2,
    input [31:0] ex2_wb_data_0,
    input [31:0] ex2_wb_data_1,
    input [31:0] ex2_wb_data_2,
    input ex2_wb_data_0_valid,
    input ex2_wb_data_1_valid,
    input ex2_wb_data_2_valid,
    input [31:0]    tlb_alu_result0,
    input [31:0]    tlb_alu_result1,
    input            tlb_alu_result0_valid,
    input            tlb_alu_result1_valid,
    input [31:0]    tlb_mul_stage1_res_hh,
    input [31:0]    tlb_mul_stage1_res_hl,
    input [31:0]    tlb_mul_stage1_res_lh,
    input [31:0]    tlb_mul_stage1_res_ll,
    input [31:0]    tlb_mul_compensate,
    // input [31:0]    tlb_quotient,
    // input [31:0]    tlb_remainder,
    // input [0:0]     tlb_stall_divider,
    // input [0:0]     tlb_div_ready,
    input [31:0]    tlb_badv_out,
    input [0:0]     tlb_excp_flag,
    input [6:0]     tlb_exception,
    output reg  [31:0]    ex0_ex1_csr_data,
    output reg  [31:0]    ex1_alu_result0,
    output reg  [31:0]    ex1_alu_result1,
    output reg             ex1_alu_result0_valid,
    output reg             ex1_alu_result1_valid,
    output reg  [31:0]    ex1_mul_stage1_res_hh,
    output reg  [31:0]    ex1_mul_stage1_res_hl,
    output reg  [31:0]    ex1_mul_stage1_res_lh,
    output reg  [31:0]    ex1_mul_stage1_res_ll,
    output reg  [31:0]    ex1_mul_compensate,
    // output reg  [31:0]    ex1_quotient,
    // output reg  [31:0]    ex1_remainder,
    // output reg  [0:0]     ex1_stall_divider,
    // output reg  [0:0]     ex1_div_ready,
    output reg  [31:0]    ex1_badv_out,
    output reg  [0:0]     ex1_excp_flag,
    output reg  [6:0]     ex1_exception,
    output tlb_forward_stall, //需要前递，但还没算出来，给段间寄存器ready信号用
    output forward_flag_j0,
    output forward_flag_k0,
    output forward_flag_j1,
    output forward_flag_k1,
    output [31:0] forward_data_j0,
    output [31:0] forward_data_k0,
    output [31:0] forward_data_j1,
    output [31:0] forward_data_k1,

    //to dcache
    output  op_dcache,
    output [3:0] write_type_dcache,
    output [31:0] addr_dcache,
    output [31:0] w_data_dcache,
    output  is_atom_dcache,

    output reg [31:0]           tlb_ex_pc0,
    output reg [31:0]           tlb_ex_pc1,
    output reg [31:0]           tlb_ex_pc_next,
    output reg                  tlb_ex_pc_taken,
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
wire[3:0] cond0 = reg_ex_uop0[`UOP_COND];
assign op_dcache=cond0[2];
assign write_type_dcache=(cond0[1:0]==0)?4'b0001:(cond0[1:0]==1)?4'b0011:4'b1111;
assign addr_dcache = rj0_data_o+reg_ex_imm0;
assign is_atom_dcache = reg_ex_uop0[`UOP_MEM_ATM];
assign w_data_dcache = rk0_data_o;

always @ (posedge clk)begin
    if(~aresetn | flush & (ex_allowin) | flush_by_exception)begin
        tlb_ex_pc0 <= 0;
        tlb_ex_pc1 <= 0;
        tlb_ex_pc_next <= 0;
        tlb_ex_pc_taken <= 0;
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
        ex1_alu_result0 <= 0;
        ex1_alu_result1 <= 0;
        ex1_alu_result0_valid <= 0;
        ex1_alu_result1_valid <= 0;
        ex1_mul_stage1_res_hh <= 0;
        ex1_mul_stage1_res_hl <= 0;
        ex1_mul_stage1_res_lh <= 0;
        ex1_mul_stage1_res_ll <= 0;
        ex1_mul_compensate <= 0;
        // ex1_quotient <= 0;
        // ex1_remainder <= 0;
        // ex1_stall_divider <= 0;
        // ex1_div_ready <= 0;
        ex1_badv_out <= 0;
        ex1_excp_flag <= 0;
        ex1_exception <= 0;
        ex0_ex1_csr_data <= 0;
    end
    else if (tlb_readygo && tlb_allowin && ex_allowin)begin
        tlb_ex_pc0 <= reg_ex_pc0;
        tlb_ex_pc1 <= reg_ex_pc1;
        tlb_ex_pc_next <= reg_ex_pc_next;
        tlb_ex_pc_taken <= reg_ex_pc_taken;
        tlb_ex_inst0 <= reg_ex_inst0;
        tlb_ex_inst1 <= reg_ex_inst1;
        tlb_ex_branch_flag <= reg_ex_branch_flag;
        tlb_ex_excp_flag <= reg_ex_excp_flag;
        tlb_ex_exception <= reg_ex_exception != 0 ? reg_ex_exception : tlb_exception;
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
        tlb_ex_rj0_data <= rj0_data_o;
        tlb_ex_rj1_data <= rj1_data_o;
        tlb_ex_rk0_data <= rk0_data_o;
        tlb_ex_rk1_data <= rk1_data_o;
        tlb_ex_rj0 <= reg_ex_rj0;
        tlb_ex_rj1 <= reg_ex_rj1;
        tlb_ex_rk0 <= reg_ex_rk0;
        tlb_ex_rk1 <= reg_ex_rk1;
        tlb_ex_rd0 <= reg_ex_rd0;
        tlb_ex_rd1 <= reg_ex_rd1;
        ex1_alu_result0 <= tlb_alu_result0;
        ex1_alu_result1 <= tlb_alu_result1;
        ex1_alu_result0_valid <= tlb_alu_result0_valid;
        ex1_alu_result1_valid <= tlb_alu_result1_valid;
        ex1_mul_stage1_res_hh <= tlb_mul_stage1_res_hh;
        ex1_mul_stage1_res_hl <= tlb_mul_stage1_res_hl;
        ex1_mul_stage1_res_lh <= tlb_mul_stage1_res_lh;
        ex1_mul_stage1_res_ll <= tlb_mul_stage1_res_ll;
        ex1_mul_compensate <= tlb_mul_compensate;
        // ex1_quotient <= tlb_quotient;
        // ex1_remainder <= tlb_remainder;
        // ex1_stall_divider <= tlb_stall_divider;
        // ex1_div_ready <= tlb_div_ready;
        ex1_badv_out <= tlb_badv_out;
        ex1_excp_flag <= tlb_excp_flag;
        ex1_exception <= tlb_exception;
        ex0_ex1_csr_data <= csr_rd_data;


    end
end

wire forward_stall1, forward_stall2;
wire [31:0] rj0_data_o, rj1_data_o, rk0_data_o, rk1_data_o;

EX1_FORWARD ex1_forward1(
    .ex1_rj(reg_ex_rj0),
    .ex1_rk(reg_ex_rk0),

    .ex1_ex2_data_0_valid(ex1_ex2_data_0_valid),
    .ex1_ex2_data_1_valid(ex1_ex2_data_1_valid),
    .ex1_ex2_data_0(ex1_ex2_data_0),
    .ex1_ex2_data_1(ex1_ex2_data_1),
    .ex1_ex2_rd0(ex1_ex2_rd0),
    .ex1_ex2_rd1(ex1_ex2_rd1),
    .ex2_wb_data_0_valid(ex2_wb_data_0_valid),
    .ex2_wb_data_1_valid(ex2_wb_data_1_valid),
    .ex2_wb_data_2_valid(ex2_wb_data_2_valid),
    .ex2_wb_data_0(ex2_wb_data_0),
    .ex2_wb_data_1(ex2_wb_data_1),
    .ex2_wb_data_2(ex2_wb_data_2),
    .ex2_wb_rd0(ex2_wb_rd0),
    .ex2_wb_rd1(ex2_wb_rd1),
    .ex2_wb_rd2(ex2_wb_rd2),

    .ex1_rj_data(reg_ex_rj0_data),
    .ex1_rk_data(reg_ex_rk0_data),
    .ex1_rj_data_o(rj0_data_o),
    .ex1_rk_data_o(rk0_data_o),
    .forward_stall(forward_stall1),
    .forward_flag_j(forward_flag_j0),
    .forward_data_j(forward_data_j0),
    .forward_flag_k(forward_flag_k0),
    .forward_data_k(forward_data_k0)
);

EX1_FORWARD ex1_forward2(
    .ex1_rj(reg_ex_rj1),
    .ex1_rk(reg_ex_rk1),
    .ex1_ex2_data_0_valid(ex1_ex2_data_0_valid),
    .ex1_ex2_data_1_valid(ex1_ex2_data_1_valid),
    .ex1_ex2_data_0(ex1_ex2_data_0),
    .ex1_ex2_data_1(ex1_ex2_data_1),
    .ex1_ex2_rd0(ex1_ex2_rd0),
    .ex1_ex2_rd1(ex1_ex2_rd1),
    .ex2_wb_data_0_valid(ex2_wb_data_0_valid),
    .ex2_wb_data_1_valid(ex2_wb_data_1_valid),
    .ex2_wb_data_2_valid(ex2_wb_data_2_valid),
    .ex2_wb_data_0(ex2_wb_data_0),
    .ex2_wb_data_1(ex2_wb_data_1),
    .ex2_wb_data_2(ex2_wb_data_2),
    .ex2_wb_rd0(ex2_wb_rd0),
    .ex2_wb_rd1(ex2_wb_rd1),
    .ex2_wb_rd2(ex2_wb_rd2),

    .ex1_rj_data(reg_ex_rj1_data),
    .ex1_rk_data(reg_ex_rk1_data),
    .ex1_rj_data_o(rj1_data_o),
    .ex1_rk_data_o(rk1_data_o),
    .forward_stall(forward_stall2),
    .forward_flag_j(forward_flag_j1),
    .forward_data_j(forward_data_j1),
    .forward_flag_k(forward_flag_k1),
    .forward_data_k(forward_data_k1)
);

reg exception_tobedone = 0;
always @ (posedge clk)begin
    if(~aresetn) exception_tobedone <= 0;
    else if (flush_by_exception) exception_tobedone <= 0;
    else if (|ex1_exception) exception_tobedone <= 1;
end

assign tlb_forward_stall = forward_stall1 | forward_stall2;

assign ex_readygo = ~forward_stall;
assign tlb_allowin = ex_allowin & ~(reg_ex_is_priviledged_0 & ~privilege_ready) & ~(|ex1_exception || exception_tobedone);

endmodule