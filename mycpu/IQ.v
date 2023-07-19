`include "define.vh"
module IQ (
    input clk,
    input rstn,

    input is_ALU_0,
    input is_ALU_1,
    input is_syscall_0,
    input is_syscall_1,
    input is_break_0,
    input is_break_1,
    input is_priviledged_0,
    input is_priviledged_1,
    input [`WIDTH_UOP-1:0] uop0,
    input [`WIDTH_UOP-1:0] uop1,
    input [31:0] imm0,
    input [31:0] imm1,
    input [4:0] rd0,
    input [4:0] rd1,
    input [4:0] rj0,
    input [4:0] rj1,
    input [4:0] rk0,
    input [4:0] rk1

    // input [31:0] TODO


    
);
    
endmodule