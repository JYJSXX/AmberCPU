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
    output [4:0] rk1,
    output invalid_instruction
);
wire invalid_instruction1;
wire invalid_instruction2;
assign invalid_instruction = invalid_instruction1 | invalid_instruction2;
ID_decoder id_decoder1(
    .inst(inst0),
    //.pc(pc0),
    .is_ALU(is_ALU_0),
    .is_syscall(is_syscall_0),
    .is_break(is_break_0),
    .is_priviledged(is_priviledged_0),
    .uop(uop0),
    .imm(imm0),
    .rd(rd0),
    .rj(rj0),
    .rk(rk0),
    .invalid_instruction(invalid_instruction1)
);
ID_decoder id_decoder2(
    .inst(inst1),
    //.pc(pc1),
    .is_ALU(is_ALU_1),
    .is_syscall(is_syscall_1),
    .is_break(is_break_1),
    .is_priviledged(is_priviledged_1),
    .uop(uop1),
    .imm(imm1),
    .rd(rd1),
    .rj(rj1),
    .rk(rk1),
    .invalid_instruction(invalid_instruction2)
);
endmodule