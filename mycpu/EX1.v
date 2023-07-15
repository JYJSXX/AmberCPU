`include "define.vh"
module EX1(
    input   clk,
    input   aresetn,
    input   flush,
    input   pc0,
    input   pc1,
    input   is_ALU_0,
    input   is_ALU_1,
    input   is_syscall_0,
    input   is_syscall_1,
    input   is_break_0,
    input   is_break_1,
    input   is_priviledged_0,
    input   is_priviledged_1,
    input   [`WIDTH_UOP-1:0] uop0,
    input   [`WIDTH_UOP-1:0] uop1,
    input   [31:0] imm0,
    input   [31:0] imm1,
    input   [31:0] rj0_data,
    input   [31:0] rj1_data,
    input   [31:0] rk0_data,
    input   [31:0] rk1_data,
    input   [4:0] ex_rj0,
    input   [4:0] ex_rj1,
    input   [4:0] ex_rk0,
    input   [4:0] ex_rk1,
    input   [4:0] ex_rd0,
    input   [4:0] ex_rd1,

    output  is_syscall_0_o,
    output  is_syscall_1_o,
    output  is_break_0_o,
    output  is_break_1_o,
    output  is_priviledged_0_o,
    output  is_priviledged_1_o,
    output  [`WIDTH_UOP-1:0] uop0_o,
    output  [`WIDTH_UOP-1:0] uop1_o,
    output  [31:0] imm0_o,
    output  [31:0] imm1_o,
    output  [31:0] rj0_data_o,
    output  [31:0] rj1_data_o,
    output  [31:0] rk0_data_o,
    output  [31:0] rk1_data_o,
    output  [4:0] ex_rj0_o,
    output  [4:0] ex_rj1_o,
    output  [4:0] ex_rk0_o,
    output  [4:0] ex_rk1_o,
    output  [4:0] ex_rd0_o,
    output  [4:0] ex_rd1_o


);
wire [3:0] ctrl0;
wire [31:0] a;
wire [31:0] b;
wire [31:0] y;
assign ctrl0 = uop0[`UOP_ALUOP];
assign a = 
EX_ALU ex_alu1(
    .ctrl(ctrl0),
    .a(a),
    .b(b),
    .y(y)
);

endmodule