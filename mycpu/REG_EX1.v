`include "define.vh"
//regfile内嵌于本模块，直接本模块直接与ID_REG相连
module  REG_EX1(
    input   clk,
    input   aresetn,
    input   flush,
    input   forward_stall,
    input   reg_readygo,
    output  reg reg_allowin,
    input   ex_allowin,
    output  reg ex_readygo,
    input   [31:0] id_reg_pc0,
    input   [31:0] id_reg_pc1,
    input   [31:0] id_reg_pc_next,
    input   [31:0] id_reg_inst0,
    input   [31:0] id_reg_inst1,
    input   [6:0] id_reg_exception,
    input   id_reg_excp_flag,
    input   id_reg_branch_flag,
    input   [31:0] id_reg_badv,
    input   id_reg_is_ALU_0,
    input   id_reg_is_ALU_1,
    input   id_reg_is_syscall_0,
    input   id_reg_is_syscall_1,
    input   id_reg_is_break_0,
    input   id_reg_is_break_1,
    input   id_reg_is_priviledged_0,
    input   id_reg_is_priviledged_1,
    input   [`WIDTH_UOP-1:0] id_reg_uop0,
    input   [`WIDTH_UOP-1:0] id_reg_uop1,
    input   [31:0] id_reg_imm0,
    input   [31:0] id_reg_imm1,
    input   [4:0] wb_rd0,
    input   [4:0] wb_rd1,
    input   we_0,
    input   we_1,
    input  [31:0] rd0_data,
    input  [31:0] rd1_data,
    input   [4:0] id_reg_rj0,
    input   [4:0] id_reg_rj1,
    input   [4:0] id_reg_rk0,
    input   [4:0] id_reg_rk1,
    input   [4:0] id_reg_rd0,
    input   [4:0] id_reg_rd1,

    output  reg [31:0] reg_ex_pc0,
    output  reg [31:0] reg_ex_pc1,
    output  reg [31:0] reg_ex_pc_next,
    output  reg [31:0] reg_ex_inst0,
    output  reg [31:0] reg_ex_inst1,
    output  reg reg_ex_branch_flag,
    output  reg reg_ex_excp_flag,
    output  reg [6:0] reg_ex_exception,
    output  reg [31:0] reg_ex_badv,
    output  reg reg_ex_is_ALU_0,
    output  reg reg_ex_is_ALU_1,
    output  reg reg_ex_is_syscall_0,
    output  reg reg_ex_is_syscall_1,
    output  reg reg_ex_is_break_0,
    output  reg reg_ex_is_break_1,
    output  reg reg_ex_is_priviledged_0,
    output  reg reg_ex_is_priviledged_1,
    output  reg [`WIDTH_UOP-1:0] reg_ex_uop0,
    output  reg [`WIDTH_UOP-1:0] reg_ex_uop1,
    output  reg [31:0] reg_ex_imm0,
    output  reg [31:0] reg_ex_imm1,

    output  reg [31:0] reg_ex_rj0_data,
    output  reg [31:0] reg_ex_rj1_data,
    output  reg [31:0] reg_ex_rk0_data,
    output  reg [31:0] reg_ex_rk1_data,
    output  reg [4:0] reg_ex_rj0,
    output  reg [4:0] reg_ex_rj1,
    output  reg [4:0] reg_ex_rk0,
    output  reg [4:0] reg_ex_rk1,
    output  reg [4:0] reg_ex_rd0,
    output  reg [4:0] reg_ex_rd1

    `ifdef DIFFTEST
    ,output [31:0] reg_diff0,
    ,output [31:0] reg_diff1,
    ,output [31:0] reg_diff2,
    ,output [31:0] reg_diff3,
    ,output [31:0] reg_diff4,
    ,output [31:0] reg_diff5,
    ,output [31:0] reg_diff6,
    ,output [31:0] reg_diff7,
    ,output [31:0] reg_diff8,
    ,output [31:0] reg_diff9,
    ,output [31:0] reg_diff10,
    ,output [31:0] reg_diff11,
    ,output [31:0] reg_diff12,
    ,output [31:0] reg_diff13,
    ,output [31:0] reg_diff14,
    ,output [31:0] reg_diff15,
    ,output [31:0] reg_diff16,
    ,output [31:0] reg_diff17,
    ,output [31:0] reg_diff18,
    ,output [31:0] reg_diff19,
    ,output [31:0] reg_diff20,
    ,output [31:0] reg_diff21,
    ,output [31:0] reg_diff22,
    ,output [31:0] reg_diff23,
    ,output [31:0] reg_diff24,
    ,output [31:0] reg_diff25,
    ,output [31:0] reg_diff26,
    ,output [31:0] reg_diff27,
    ,output [31:0] reg_diff28,
    ,output [31:0] reg_diff29,
    ,output [31:0] reg_diff30,
    ,output [31:0] reg_diff31,
    input  [63:0] stable_counter,
    output reg [63:0] stable_counter_diff
    `endif
);
`ifdef DIFFTEST

always @(posedge clk) begin
    //if(!stall) stable_counter_diff<=stable_counter;
    stable_counter_diff<=stable_counter;
end
`endif
wire [31:0] rj0_data;
wire [31:0] rj1_data;
wire [31:0] rk0_data;
wire [31:0] rk1_data;
regfile regfile1( //内部自带写优先
    .clk(clk),
    .aresetn(aresetn),
    .we1(we_0),
    .waddr1(wb_rd0),
    .wdata1(rd0_data),
    .we2(we_1),
    .waddr2(wb_rd1),
    .wdata2(rd1_data),
    .raddr1(id_reg_rj0),
    .rdata1(rj0_data),
    .raddr2(id_reg_rj1),
    .rdata2(rj1_data),
    .raddr3(id_reg_rk0),
    .rdata3(rk0_data),
    .raddr4(id_reg_rk1),
    .rdata4(rk1_data)
    `ifdef DIFFTEST
    ,.reg_diff0(reg_diff0),
    .reg_diff1(reg_diff1),
    .reg_diff2(reg_diff2),
    .reg_diff3(reg_diff3),
    .reg_diff4(reg_diff4),
    .reg_diff5(reg_diff5),
    .reg_diff6(reg_diff6),
    .reg_diff7(reg_diff7),
    .reg_diff8(reg_diff8),
    .reg_diff9(reg_diff9),
    .reg_diff10(reg_diff10),
    .reg_diff11(reg_diff11),
    .reg_diff12(reg_diff12),
    .reg_diff13(reg_diff13),
    .reg_diff14(reg_diff14),
    .reg_diff15(reg_diff15),
    .reg_diff16(reg_diff16),
    .reg_diff17(reg_diff17),
    .reg_diff18(reg_diff18),
    .reg_diff19(reg_diff19),
    .reg_diff20(reg_diff20),
    .reg_diff21(reg_diff21),
    .reg_diff22(reg_diff22),
    .reg_diff23(reg_diff23),
    .reg_diff24(reg_diff24),
    .reg_diff25(reg_diff25),
    .reg_diff26(reg_diff26),
    .reg_diff27(reg_diff27),
    .reg_diff28(reg_diff28),
    .reg_diff29(reg_diff29),
    .reg_diff30(reg_diff30),
    .reg_diff31(reg_diff31)
    `endif
);
always@(posedge clk)begin
    if(~aresetn | flush | (~reg_readygo & ex_allowin) ) begin
        reg_ex_pc0 <= 0;
        reg_ex_pc1 <= 0;
        reg_ex_pc_next <= 0;
        reg_ex_inst0 <= 0;
        reg_ex_inst1 <= 0;
        reg_ex_branch_flag <= 0;
        reg_ex_excp_flag <= 0;
        reg_ex_exception <= 0;
        reg_ex_badv <= 0;
        reg_ex_is_ALU_0 <= 0;
        reg_ex_is_ALU_1 <= 0;
        reg_ex_is_syscall_0 <= 0;
        reg_ex_is_syscall_1 <= 0;
        reg_ex_is_break_0 <= 0;
        reg_ex_is_break_1 <= 0;
        reg_ex_is_priviledged_0 <= 0;
        reg_ex_is_priviledged_1 <= 0;
        reg_ex_uop0 <= 0;
        reg_ex_uop1 <= 0;
        reg_ex_imm0 <= 0;
        reg_ex_imm1 <= 0;
        reg_ex_rj0_data <= 0;
        reg_ex_rj1_data <= 0;
        reg_ex_rk0_data <= 0;
        reg_ex_rk1_data <= 0;
        reg_ex_rj0 <= 0;
        reg_ex_rj1 <= 0;
        reg_ex_rk0 <= 0;
        reg_ex_rk1 <= 0;
        reg_ex_rd0 <= 0;
        reg_ex_rd1 <= 0;

    end
    else if(reg_readygo&&ex_allowin)begin
        reg_ex_pc0 <= id_reg_pc0;
        reg_ex_pc1 <= id_reg_pc1;
        reg_ex_pc_next <= id_reg_pc_next;
        reg_ex_inst0 <= id_reg_inst0;
        reg_ex_inst1 <= id_reg_inst1;
        reg_ex_branch_flag <= id_reg_branch_flag;
        reg_ex_excp_flag <= id_reg_excp_flag;
        reg_ex_exception <= id_reg_exception;
        reg_ex_badv <= id_reg_badv;
        reg_ex_is_ALU_0 <= id_reg_is_ALU_0;
        reg_ex_is_ALU_1 <= id_reg_is_ALU_1;
        reg_ex_is_syscall_0 <= id_reg_is_syscall_0;
        reg_ex_is_syscall_1 <= id_reg_is_syscall_1;
        reg_ex_is_break_0 <= id_reg_is_break_0;
        reg_ex_is_break_1 <= id_reg_is_break_1;
        reg_ex_is_priviledged_0 <= id_reg_is_priviledged_0;
        reg_ex_is_priviledged_1 <= id_reg_is_priviledged_1;
        reg_ex_uop0 <= id_reg_uop0;
        reg_ex_uop1 <= id_reg_uop1;
        reg_ex_imm0 <= id_reg_imm0;
        reg_ex_imm1 <= id_reg_imm1;
        reg_ex_rj0_data <= rj0_data;
        reg_ex_rj1_data <= rj1_data;
        reg_ex_rk0_data <= rk0_data;
        reg_ex_rk1_data <= rk1_data;
        reg_ex_rj0 <= id_reg_rj0;
        reg_ex_rj1 <= id_reg_rj1;
        reg_ex_rk0 <= id_reg_rk0;
        reg_ex_rk1 <= id_reg_rk1;
        reg_ex_rd0 <= id_reg_rd0;
        reg_ex_rd1 <= id_reg_rd1;

    end
    else begin
        //寄存器保持不变
        reg_ex_pc0 <= reg_ex_pc0;
        reg_ex_pc1 <= reg_ex_pc1;
        reg_ex_pc_next <= reg_ex_pc_next;
        reg_ex_inst0 <= reg_ex_inst0;
        reg_ex_inst1 <= reg_ex_inst1;
        reg_ex_branch_flag <= reg_ex_branch_flag;
        reg_ex_excp_flag <= reg_ex_excp_flag;
        reg_ex_exception <= reg_ex_exception;
        reg_ex_badv <= reg_ex_badv;
        reg_ex_is_ALU_0 <= reg_ex_is_ALU_0;
        reg_ex_is_ALU_1 <= reg_ex_is_ALU_1;
        reg_ex_is_syscall_0 <= reg_ex_is_syscall_0;
        reg_ex_is_syscall_1 <= reg_ex_is_syscall_1;
        reg_ex_is_break_0 <= reg_ex_is_break_0;
        reg_ex_is_break_1 <= reg_ex_is_break_1;
        reg_ex_is_priviledged_0 <= reg_ex_is_priviledged_0;
        reg_ex_is_priviledged_1 <= reg_ex_is_priviledged_1;
        reg_ex_uop0 <= reg_ex_uop0;
        reg_ex_uop1 <= reg_ex_uop1;
        reg_ex_imm0 <= reg_ex_imm0;
        reg_ex_imm1 <= reg_ex_imm1;
        reg_ex_rj0_data <= reg_ex_rj0_data;
        reg_ex_rj1_data <= reg_ex_rj1_data;
        reg_ex_rk0_data <= reg_ex_rk0_data;
        reg_ex_rk1_data <= reg_ex_rk1_data;
        reg_ex_rj0 <= reg_ex_rj0;
        reg_ex_rj1 <= reg_ex_rj1;
        reg_ex_rk0 <= reg_ex_rk0;
        reg_ex_rk1 <= reg_ex_rk1;
        reg_ex_rd0 <= reg_ex_rd0;
        reg_ex_rd1 <= reg_ex_rd1;

    end
    
    

end
always@(*)begin
    ex_readygo = ~forward_stall; 
    reg_allowin=ex_allowin;
end
endmodule