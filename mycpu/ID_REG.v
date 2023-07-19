`include "define.vh"
//regfile内嵌于REG_EX1模块，直接本模块直接与REG_EX1相连
module ID_REG(
    input aclk,
    input aresetn,
    input           id_readygo,
    output  reg     id_allowin,
    input           reg_allowin,
    output  reg     reg_readygo,
    input [31:0] fifo_id_inst0, //前一个段间寄存器的
    input [31:0] fifo_id_inst1,
    input [31:0] fifo_id_pc0,
    input [31:0] fifo_id_pc1,
    input [31:0] fifo_id_badv,
    input fifo_id_excp_flag,
    input [6:0] fifo_id_exception,
    input is_ALU_0, //id段内生成的
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
    input [4:0] rk1,

    output reg [31:0] id_reg_pc0,
    output reg [31:0] id_reg_pc1,
    output reg [31:0] id_reg_inst0,
    output reg [31:0] id_reg_inst1,
    output reg [31:0] id_reg_badv,
    output reg id_reg_excp_flag,
    output reg [6:0] id_reg_exception,
    output reg id_reg_is_ALU_0 ,
    output reg id_reg_is_ALU_1 ,
    output reg id_reg_is_syscall_0 ,
    output reg id_reg_is_syscall_1 ,
    output reg id_reg_is_break_0 ,
    output reg id_reg_is_break_1 ,
    output reg id_reg_is_priviledged_0 ,
    output reg id_reg_is_priviledged_1 ,
    output reg [`WIDTH_UOP-1:0] id_reg_uop0 ,
    output reg [`WIDTH_UOP-1:0] id_reg_uop1 ,
    output reg [31:0] id_reg_imm0 ,
    output reg [31:0] id_reg_imm1 ,
    output reg [4:0] id_reg_rd0 ,
    output reg [4:0] id_reg_rd1 ,
    output reg [4:0] id_reg_rj0 ,
    output reg [4:0] id_reg_rj1 ,
    output reg [4:0] id_reg_rk0 ,
    output reg [4:0] id_reg_rk1 
);
//没考虑flush stall，之后再说
always@(posedge aclk) begin
    if(~aresetn | (~id_readygo && reg_allowin && reg_readygo)) begin
        id_reg_pc0  <= 0;
        id_reg_pc1  <= 0;
        id_reg_inst0  <= 0;
        id_reg_inst1  <= 0;
        id_reg_badv  <= 0;
        id_reg_excp_flag  <= 0;
        id_reg_exception  <= 0;
        id_reg_is_ALU_0  <= 0;
        id_reg_is_ALU_1  <= 0;
        id_reg_is_syscall_0  <= 0;
        id_reg_is_syscall_1  <= 0;
        id_reg_is_break_0  <= 0;
        id_reg_is_break_1  <= 0;
        id_reg_is_priviledged_0  <= 0;
        id_reg_is_priviledged_1  <= 0;
        id_reg_uop0  <= 0;
        id_reg_uop1  <= 0;
        id_reg_imm0  <= 0;
        id_reg_imm1  <= 0;
        id_reg_rd0  <= 0;
        id_reg_rd1  <= 0;
        id_reg_rj0  <= 0;
        id_reg_rj1  <= 0;
        id_reg_rk0  <= 0;
        id_reg_rk1  <= 0;
    end else if(id_readygo && reg_allowin)begin
        id_reg_pc0  <= fifo_id_pc0;
        id_reg_pc1  <= fifo_id_pc1;
        id_reg_inst0  <= fifo_id_inst0;
        id_reg_inst1  <= fifo_id_inst1;
        id_reg_badv  <= fifo_id_badv;
        id_reg_excp_flag  <= fifo_id_excp_flag;
        id_reg_exception  <= fifo_id_exception;
        id_reg_is_ALU_0  <= is_ALU_0;
        id_reg_is_ALU_1  <= is_ALU_1;
        id_reg_is_syscall_0  <= is_syscall_0;
        id_reg_is_syscall_1  <= is_syscall_1;
        id_reg_is_break_0  <= is_break_0;
        id_reg_is_break_1  <= is_break_1;
        id_reg_is_priviledged_0  <= is_priviledged_0;
        id_reg_is_priviledged_1  <= is_priviledged_1;
        id_reg_uop0  <= uop0;
        id_reg_uop1  <= uop1;
        id_reg_imm0  <= imm0;
        id_reg_imm1  <= imm1;
        id_reg_rd0  <= rd0;
        id_reg_rd1  <= rd1;
        id_reg_rj0  <= rj0;
        id_reg_rj1  <= rj1;
        id_reg_rk0  <= rk0;
        id_reg_rk1  <= rk1;
    
    end
    else if(~reg_allowin) begin
        id_reg_pc0  <= id_reg_pc0;
        id_reg_pc1  <= id_reg_pc1;
        id_reg_inst0  <= id_reg_inst0;
        id_reg_inst1  <= id_reg_inst1;
        id_reg_badv  <= id_reg_badv;
        id_reg_excp_flag  <= id_reg_excp_flag;
        id_reg_exception  <= id_reg_exception;
        id_reg_is_ALU_0  <= id_reg_is_ALU_0;
        id_reg_is_ALU_1  <= id_reg_is_ALU_1;
        id_reg_is_syscall_0  <= id_reg_is_syscall_0;
        id_reg_is_syscall_1  <= id_reg_is_syscall_1;
        id_reg_is_break_0  <= id_reg_is_break_0;
        id_reg_is_break_1  <= id_reg_is_break_1;
        id_reg_is_priviledged_0  <= id_reg_is_priviledged_0;
        id_reg_is_priviledged_1  <= id_reg_is_priviledged_1;
        id_reg_uop0  <= id_reg_uop0;
        id_reg_uop1  <= id_reg_uop1;
        id_reg_imm0  <= id_reg_imm0;
        id_reg_imm1  <= id_reg_imm1;
        id_reg_rd0  <= id_reg_rd0;
        id_reg_rd1  <= id_reg_rd1;
        id_reg_rj0  <= id_reg_rj0;
        id_reg_rj1  <= id_reg_rj1;
        id_reg_rk0  <= id_reg_rk0;
        id_reg_rk1  <= id_reg_rk1;

    end

end
always @(*) begin//combinational logic for hand shake
    id_allowin=reg_allowin;
end
always @(*) begin//combinational logic for hand shake
    reg_readygo=1;
end
endmodule