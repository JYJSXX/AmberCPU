`include "define.vh"
module id_stage
(
    input aclk,
    input aresetn,
    input [31:0] inst0,
    input [31:0] inst1,
    // input [31:0] pc0,
    // input [31:0] pc1,
    output is_ALU_0,
    output is_ALU_1,
    output is_syscall_0,
    output is_syscall_1,
    output is_break_0,
    output is_break_1,
    output is_priviledged_0,
    output is_priviledged_1,
    output [`WIDTH_UOP-1:0] uop0,
    output [`WIDTH_UOP-1:0] uop1,
    output [31:0] imm0,
    output [31:0] imm1,
    output [4:0] rd0,
    output [4:0] rd1,
    output [4:0] rj0,
    output [4:0] rj1,
    output [4:0] rk0,
    output [4:0] rk1
);
ID_decoder id_decoder1(
    .inst(inst0_i),
    //.pc(pc0),
    .is_ALU(is_ALU_0),
    .is_syscall(is_syscall),
    .is_break(is_break),
    .is_priviledged(is_priviledged),
    .uop(uop0),
    .imm(imm0),
    .rd(rd0),
    .rj(rj0),
    .rk(rk0)
);
ID_decoder id_decoder2(
    .inst(inst1_i),
    //.pc(pc1),
    .is_ALU(is_ALU_1),
    .is_syscall(is_syscall),
    .is_break(is_break),
    .is_priviledged(is_priviledged),
    .uop(uop1),
    .imm(imm1),
    .rd(rd1),
    .rj(rj1),
    .rk(rk1)
);
endmodule