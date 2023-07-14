`include "define.vh"
module ID_REG(
    input aclk,
    input aresetn,
    input inst0,
    input inst1,
    input pc0,
    input pc1,
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
    input [4:0] rk1,
    output reg is_syscall_0_o,
    output reg is_syscall_1_o,
    output reg is_break_0_o,
    output reg is_break_1_o,
    output reg is_priviledged_0_o,
    output reg is_priviledged_1_o,
    output reg [`WIDTH_UOP-1:0] uop0_o,
    output reg [`WIDTH_UOP-1:0] uop1_o,
    output reg [31:0] imm0_o,
    output reg [31:0] imm1_o,
    output reg [4:0] rd0_o,
    output reg [4:0] rd1_o,
    output reg [4:0] rj0_o,
    output reg [4:0] rj1_o,
    output reg [4:0] rk0_o,
    output reg [4:0] rk1_o
);
//没考虑flush stall，之后再说
always@(posedge aclk) begin
    if(~aresetn) begin
        is_syscall_0_o <= 0;
        is_syscall_1_o <= 0;
        is_break_0_o <= 0;
        is_break_1_o <= 0;
        is_priviledged_0_o <= 0;
        is_priviledged_1_o <= 0;
        uop0_o <= 0;
        uop1_o <= 0;
        imm0_o <= 0;
        imm1_o <= 0;
        rd0_o <= 0;
        rd1_o <= 0;
        rj0_o <= 0;
        rj1_o <= 0;
        rk0_o <= 0;
        rk1_o <= 0;
    end else begin
        is_syscall_0_o <= is_syscall_0;
        is_syscall_1_o <= is_syscall_1;
        is_break_0_o <= is_break_0;
        is_break_1_o <= is_break_1;
        is_priviledged_0_o <= is_priviledged_0;
        is_priviledged_1_o <= is_priviledged_1;
        uop0_o <= uop0;
        uop1_o <= uop1;
        imm0_o <= imm0;
        imm1_o <= imm1;
        rd0_o <= rd0;
        rd1_o <= rd1;
        rj0_o <= rj0;
        rj1_o <= rj1;
        rk0_o <= rk0;
        rk1_o <= rk1;
    
    end

end
endmodule