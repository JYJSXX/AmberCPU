`include "define.vh"
module FIFO_ID (
    input clk,
    input rstn,

    input fifo_id_flush,
    input [1:0]fifo_id_flush_cause, //flush cause reserved for judge
    input fifo_id_stall,

    //hand shake signal
    input id_allowin,//from decoder stage.told id is ready
    output  id_readygo,//to decoder stage,tell id I'm valid
    output  fifo_allowin,//to fifo stage,tell fifo I'm ready
    input fifo_readygo,//from fifo stage,told fifo is valid

    input [31:0] fifo_inst0,
    input [31:0] fifo_inst1,
    input [31:0] fifo_pc,
    input [31:0] fifo_pc_next,
    input [31:0] fifo_pcAdd,
    input [31:0] fifo_badv,
    input [31:0] fifo_cookie_out,
    input [6:0]  fifo_exception,
    input        fifo_excp_flag,
    input        fifo_ibar_signal,
    input        fifo_cacop_ready,
    input        fifo_cacop_complete,

    input fetch_buf_empty,
    input fetch_buf_full,
    output reg[31:0] fifo_id_inst0,
    output reg[31:0] fifo_id_inst1,
    output reg[31:0] fifo_id_pc,
    output reg[31:0] fifo_id_pcAdd,
    output reg[31:0] fifo_id_pc_next,
    output reg[31:0] fifo_id_badv,
    output reg[31:0] fifo_id_cookie_out,
    output reg[6:0]  fifo_id_exception,
    output reg       fifo_id_excp_flag,
    output reg       fifo_id_ibar_signal,
    output reg       fifo_id_cacop_ready,
    output reg       fifo_id_cacop_complete
    `ifdef FIFO_ID_DIFFTEST

    `endif 
);
    

    assign id_readygo=fifo_readygo;//valid anytime because fifo provide INST_NOP if invalid
    assign fifo_allowin=id_allowin;

    always @(posedge clk or negedge rstn) begin
        if (!rstn||fifo_id_flush||(~fifo_readygo&&id_allowin)) begin
            fifo_id_inst0   <=`INST_NOP;
            fifo_id_inst1   <=`INST_NOP;
            fifo_id_pc      <=`PC_RESET;
            fifo_id_pcAdd   <=`PC_RESET+4;
            fifo_id_badv    <=`PC_RESET;
            fifo_id_cookie_out<=1958;
            fifo_id_exception<=7'h00;
            fifo_id_excp_flag<=0;
            fifo_id_ibar_signal<=0;
            fifo_id_cacop_ready<=0;
            fifo_id_cacop_complete<=0;
        end else if(!fifo_id_stall&(fifo_readygo&&id_allowin))begin
            fifo_id_inst0   <=fifo_inst0;
            fifo_id_inst1   <=fifo_inst1;
            fifo_id_pc      <=fifo_pc;
            fifo_id_pcAdd   <=fifo_pcAdd;
            fifo_id_badv    <=fifo_id_badv;
            fifo_id_cookie_out<=fifo_cookie_out;
            fifo_id_exception<=fifo_exception;
            fifo_id_excp_flag<=fifo_excp_flag;
            fifo_id_ibar_signal<=fifo_ibar_signal;
            fifo_id_cacop_ready<=fifo_cacop_ready;
            fifo_id_cacop_complete<=fifo_cacop_complete;
        end
    end
endmodule