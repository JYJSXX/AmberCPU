`include "define.vh"
module FIFO_ID (
    input clk,
    input rstn,

    input fifo_id_flush,
    input [1:0]fifo_id_flush_cause, //flush cause reserved for judge

    //hand shake signal
    input   id_allowin,         //from decoder stage.told id is ready
    output  id_readygo,     //to decoder stage,tell id I'm valid
    // output  fifo_allowin,       //to fifo stage,tell fifo I'm ready
    // input   fifo_readygo,       //from fifo stage,told fifo is valid
    input   fifo_valid,
    output  fifo_ready,

    input [31:0] fifo_inst0,
    input [31:0] fifo_inst1,
    input [31:0] fifo_pc,
    input [31:0] fifo_pc_next,
    input [1 :0] fifo_pc_taken,
    input [31:0] fifo_pcAdd,
    input [31:0] fifo_badv,
    // input [31:0] fifo_cookie_out,
    input [6:0]  fifo_exception,
    input [1:0]  fifo_excp_flag,
    input [1:0]  fifo_priv_flag,
    input [1:0]  fifo_branch_flag,

    output reg[31:0] fifo_id_inst0=`INST_NOP,
    output reg[31:0] fifo_id_inst1=`INST_NOP,
    output reg[31:0] fifo_id_pc=0,
    output reg[31:0] fifo_id_pcAdd=0,
    output reg[31:0] fifo_id_pc_next=0,
    output reg[1 :0] fifo_id_pc_taken=0,
    output reg[31:0] fifo_id_badv=0,
    // output reg[31:0] fifo_id_cookie_out,
    output reg[6:0]  fifo_id_exception=0,
    output reg[1:0]  fifo_id_excp_flag=0,
    output reg[1:0]  fifo_id_priv_flag=0,
    output reg[1:0]  fifo_id_branch_flag=0
);
    reg fifo_id_valid=0;

    assign id_readygo=fifo_id_valid;//valid anytime because fifo provide INST_NOP if invalid
    assign fifo_ready=id_allowin;

    always @(posedge clk) begin
        if (!rstn||fifo_id_flush||(~fifo_valid&&id_allowin&&id_readygo)) begin
            fifo_id_valid<=0;

            fifo_id_inst0   <=`INST_NOP;
            fifo_id_inst1   <=`INST_NOP;
            fifo_id_pc      <=`PC_RESET;
            fifo_id_pcAdd   <=`PC_RESET+4;
            fifo_id_pc_next <=`PC_RESET+8;
            fifo_id_pc_taken<=0;
            fifo_id_badv    <=`PC_RESET;
            // fifo_id_cookie_out<=1958;
            fifo_id_exception<=7'h00;
            fifo_id_excp_flag<=2'b00;
            fifo_id_priv_flag<=2'b00;
            fifo_id_branch_flag<=2'b00;
        end else if(fifo_valid&&id_allowin&&fifo_ready)begin
            fifo_id_valid   <=fifo_valid;

            fifo_id_inst0   <=fifo_inst0;
            fifo_id_inst1   <=fifo_inst1;
            fifo_id_pc      <=fifo_pc;
            fifo_id_pcAdd   <=fifo_pcAdd;
            fifo_id_pc_next <=fifo_pc_next;
            fifo_id_pc_taken<=fifo_pc_taken;
            fifo_id_badv    <=fifo_badv;
            // fifo_id_cookie_out<=fifo_cookie_out;
            fifo_id_exception<=fifo_exception;
            fifo_id_excp_flag<=fifo_excp_flag;
            fifo_id_priv_flag<=fifo_priv_flag;
            fifo_id_branch_flag<=fifo_branch_flag;
        end
    end
endmodule