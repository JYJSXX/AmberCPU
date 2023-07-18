`include "define.vh"
module FIFO_ID (
    input clk,
    input rstn,

    input fifo_id_flush,
    input [1:0]fifo_id_flush_cause, //flush cause reserved for judge
    input fifo_id_stall,

    //hand shake signal
    input id_ready,//from decoder stage.told id is ready
    output  id_valid,//to decoder stage,tell id I'm valid
    output  fifo_ready,//to fifo stage,tell fifo I'm ready
    input fifo_valid,//from fifo stage,told fifo is valid

    input [31:0] fifo_inst0,
    input [31:0] fifo_inst1,
    input [31:0] fifo_pc,
    input [31:0] fetch_pc,
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
    localparam      IDLE            =   2'b00,
                    WAIT_EX_IBAR    =   2'b01,
                    WAIT_CACHE_IDLE =   2'b11,
                    WAIT_FETCH      =   2'b10;
    reg[1:0]        stat=0;
    wire[1:0]       next_stat;

    assign id_valid=fifo_valid;//valid anytime because fifo provide INST_NOP if invalid
    assign fifo_ready=id_ready;

    //TODO add FSM for 1.detect ibar 2.detect ex's ibar signal 3.detect icache&dcache idle
    //IDLE->WAIT_EX_IBAR->WAIT_CACHE_IDLE->WAIT_FETCH->IDLE
    always @(posedge clk or negedge rstn) begin
        if (!rstn||fifo_id_flush||(~fifo_valid&&id_ready)||(stat!=IDLE)) begin
            fifo_id_inst0   <=`INST_NOP;
            fifo_id_inst1   <=`INST_NOP;
            fifo_id_pc      <=`PC_RESET;
        end else if(!fifo_id_stall&(fifo_valid&&id_ready))begin
            fifo_id_inst0   <=fifo_inst0;
            fifo_id_inst1   <=fifo_inst1;
            fifo_id_pc      <=fifo_pc;
        end
    end
endmodule