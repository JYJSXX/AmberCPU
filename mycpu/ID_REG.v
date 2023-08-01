`timescale 1ns/1ps
`include "define.vh"
`include "exception.vh"
//regfile内嵌于REG_EX1模块，直接本模块直接与REG_EX1相连
module ID_REG(
    input aclk,
    input aresetn,
    input           flush,
    input           id_readygo,
    output          id_allowin,
    input           reg_allowin,
    output          reg_readygo,
    
    input [31:0] fifo_id_inst0, //前一个段间寄存器的
    input [31:0] fifo_id_inst1,
    input [31:0] fifo_id_pc0,
    input [31:0] fifo_id_pc1,
    input [31:0] fifo_id_pc_next,
    input         fifo_id_pc_taken,
    input [31:0] fifo_id_badv,
    input [1:0]  fifo_id_excp_flag,
    input [6:0]  fifo_id_exception,
    input [1:0]  fifo_id_priv_flag,
    input [1:0]  fifo_id_branch_flag,

    input is_ALU_0, //id段内生成的
    input is_ALU_1,
    input is_syscall_0,
    input is_syscall_1,
    input is_break_0,
    input is_break_1,
    input is_priviledged_0,
    input is_priviledged_1,
    input invalid_instruction1,
    input invalid_instruction2,
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

    output  [31:0] iq_pc0,
    output  [31:0] iq_pc1,
    output  [31:0] iq_pc_next,
    output         CMT,
    output          iq_pc_taken,
    output  [31:0] iq_inst0,
    output  [31:0] iq_inst1,
    output  [31:0] iq_badv,
    output         iq_excp_flag,
    output  [6 :0] iq_exception,
    output         iq_branch_flag,
    output  iq_is_ALU_0 ,
    output  iq_is_ALU_1 ,
    output  iq_is_syscall_0 ,
    output  iq_is_syscall_1 ,
    output  iq_is_break_0 ,
    output  iq_is_break_1 ,
    output  iq_is_priviledged_0 ,
    output  iq_is_priviledged_1 ,
    output  [`WIDTH_UOP-1:0] iq_uop0 ,
    output  [`WIDTH_UOP-1:0] iq_uop1 ,
    output  [31:0] iq_imm0 ,
    output  [31:0] iq_imm1 ,
    output  [4:0]  iq_rd0 ,
    output  [4:0]  iq_rd1 ,
    output  [4:0]  iq_rj0 ,
    output  [4:0]  iq_rj1 ,
    output  [4:0]  iq_rk0 ,
    output  [4:0]  iq_rk1 
);
    reg [31:0] id_reg_pc0;
    reg [31:0] id_reg_pc1;
    reg [31:0] id_reg_pc_next;
    reg id_reg_pc_taken;
    reg [31:0] id_reg_inst0;
    reg [31:0] id_reg_inst1;
    reg [31:0] id_reg_badv;
    reg [1 :0] id_reg_excp_flag;
    reg [1 :0] id_reg_branch_flag;
    reg [1 :0] id_reg_priv_flag;
    reg [6:0] id_reg_exception;
    reg id_reg_is_ALU_0 ;
    reg id_reg_is_ALU_1 ;
    reg id_reg_is_syscall_0 ;
    reg id_reg_is_syscall_1 ;
    reg id_reg_is_break_0 ;
    reg id_reg_is_break_1 ;
    reg id_reg_is_priviledged_0 = 0 ;
    reg id_reg_is_priviledged_1 = 0 ;
    reg [`WIDTH_UOP-1:0] id_reg_uop0 ;
    reg [`WIDTH_UOP-1:0] id_reg_uop1 ;
    reg [31:0] id_reg_imm0 ;
    reg [31:0] id_reg_imm1 ;
    reg [4:0] id_reg_rd0 ;
    reg [4:0] id_reg_rd1 ;
    reg [4:0] id_reg_rj0 ;
    reg [4:0] id_reg_rj1 ;
    reg [4:0] id_reg_rk0 ;
    reg [4:0] id_reg_rk1 ;
//没考虑flush stall，之后再说
always@(posedge aclk) begin
    if(~aresetn | (~id_readygo && reg_allowin && reg_readygo&&id_allowin)|flush) begin
        id_reg_pc0  <= 0;
        id_reg_pc1  <= 0;
        id_reg_pc_next<=0;
        id_reg_pc_taken<=0;
        id_reg_inst0  <= `INST_NOP;
        id_reg_inst1  <= `INST_NOP;
        id_reg_badv  <= 0;
        id_reg_excp_flag  <= 2'b00;
        id_reg_branch_flag<=2'b00;
        id_reg_priv_flag  <=2'b00;
        id_reg_exception  <= 0;
        id_reg_is_ALU_0  <= 1;
        id_reg_is_ALU_1  <= 1;
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
    end else if(id_readygo && reg_allowin&&id_allowin)begin
        id_reg_pc0  <= fifo_id_pc0;
        id_reg_pc1  <= fifo_id_pc1;
        id_reg_pc_next<=fifo_id_pc_next;
        id_reg_pc_taken<=fifo_id_pc_taken;
        id_reg_inst0  <= fifo_id_inst0;
        id_reg_inst1  <= fifo_id_inst1;
        id_reg_badv  <= fifo_id_badv;
        id_reg_excp_flag  <= fifo_id_excp_flag | { invalid_instruction2 ,invalid_instruction1};
        id_reg_branch_flag<= fifo_id_branch_flag;
        id_reg_priv_flag  <=fifo_id_priv_flag;
        id_reg_exception  <= fifo_id_exception != 0 ? fifo_id_exception : invalid_instruction1 | invalid_instruction2 ? `EXP_INE : 7'b0;
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
    else if(~reg_allowin||~id_allowin) begin
        id_reg_pc0  <= id_reg_pc0;
        id_reg_pc1  <= id_reg_pc1;
        id_reg_pc_next<=id_reg_pc_next;
        id_reg_pc_taken<=id_reg_pc_taken;
        id_reg_inst0  <= id_reg_inst0;
        id_reg_inst1  <= id_reg_inst1;
        id_reg_badv  <= id_reg_badv;
        id_reg_excp_flag  <= id_reg_excp_flag;
        id_reg_priv_flag  <=id_reg_excp_flag;
        id_reg_branch_flag<=id_reg_branch_flag;
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
    else begin
        id_reg_is_priviledged_0  <= 0;
        id_reg_is_priviledged_1  <= 0;
    end

end
    IQ u_IQ(
        .clk                      ( aclk                     ),
        .rstn                     ( aresetn                  ),
        .flush                    ( flush                    ),
        .id_allowin               ( id_allowin               ),
        .reg_readygo              ( reg_readygo              ),
        .id_readygo               ( id_readygo               ),
        .reg_allowin              ( reg_allowin              ),
        .id_reg_pc0               ( id_reg_pc0               ),
        .id_reg_pc1               ( id_reg_pc1               ),
        .id_reg_pc_next           ( id_reg_pc_next           ),
        .id_reg_pc_taken          ( id_reg_pc_taken          ),
        .id_reg_inst0             ( id_reg_inst0             ),
        .id_reg_inst1             ( id_reg_inst1             ),
        .id_reg_badv              ( id_reg_badv              ),
        .id_reg_priv_flag         ( id_reg_priv_flag         ), //!
        .id_reg_excp_flag         ( id_reg_excp_flag         ),
        .id_reg_branch_flag       ( id_reg_branch_flag       ), //!
        .id_reg_exception         ( id_reg_exception         ),
        .id_reg_is_ALU_0          ( id_reg_is_ALU_0          ),
        .id_reg_is_ALU_1          ( id_reg_is_ALU_1          ),
        .id_reg_is_syscall_0      ( id_reg_is_syscall_0      ),
        .id_reg_is_syscall_1      ( id_reg_is_syscall_1      ),
        .id_reg_is_break_0        ( id_reg_is_break_0        ),
        .id_reg_is_break_1        ( id_reg_is_break_1        ),
        .id_reg_is_priviledged_0  ( id_reg_is_priviledged_0  ),
        .id_reg_is_priviledged_1  ( id_reg_is_priviledged_1  ),
        .id_reg_uop0              ( id_reg_uop0              ),
        .id_reg_uop1              ( id_reg_uop1              ),
        .id_reg_imm0              ( id_reg_imm0              ),
        .id_reg_imm1              ( id_reg_imm1              ),
        .id_reg_rd0               ( id_reg_rd0               ),
        .id_reg_rd1               ( id_reg_rd1               ),
        .id_reg_rj0               ( id_reg_rj0               ),
        .id_reg_rj1               ( id_reg_rj1               ),
        .id_reg_rk0               ( id_reg_rk0               ),
        .id_reg_rk1               ( id_reg_rk1               ),
        .iq_pc0                   ( iq_pc0                   ),
        .iq_pc1                   ( iq_pc1                   ),
        .iq_pc_next               ( iq_pc_next               ),
        .CMT                      ( CMT                      ),
        .iq_pc_taken              ( iq_pc_taken              ),
        .iq_inst0                 ( iq_inst0                 ),
        .iq_inst1                 ( iq_inst1                 ),
        .iq_badv                  ( iq_badv                  ),
        .iq_excp_flag             ( iq_excp_flag             ),
        .iq_branch_flag           ( iq_branch_flag           ),
        .iq_exception             ( iq_exception             ),
        .iq_is_ALU_0              ( iq_is_ALU_0              ),
        .iq_is_ALU_1              ( iq_is_ALU_1              ),
        .iq_is_syscall_0          ( iq_is_syscall_0          ),
        .iq_is_syscall_1          ( iq_is_syscall_1          ),
        .iq_is_break_0            ( iq_is_break_0            ),
        .iq_is_break_1            ( iq_is_break_1            ),
        .iq_is_priviledged_0      ( iq_is_priviledged_0      ),
        .iq_is_priviledged_1      ( iq_is_priviledged_1      ),
        .iq_uop0                  ( iq_uop0                  ),
        .iq_uop1                  ( iq_uop1                  ),
        .iq_imm0                  ( iq_imm0                  ),
        .iq_imm1                  ( iq_imm1                  ),
        .iq_rd0                   ( iq_rd0                   ),
        .iq_rd1                   ( iq_rd1                   ),
        .iq_rj0                   ( iq_rj0                   ),
        .iq_rj1                   ( iq_rj1                   ),
        .iq_rk0                   ( iq_rk0                   ),
        .iq_rk1                   ( iq_rk1                   )
    );


endmodule