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
    input fetch_buf_empty,
    input fetch_buf_full,
    output reg[31:0] fifo_id_inst0,
    output reg[31:0] fifo_id_inst1,
    output reg[31:0] fifo_id_pc
    `ifdef FIFO_ID_DIFFTEST

    `endif 
);

    assign id_valid=fifo_valid;//valid anytime because fifo provide INST_NOP if invalid
    assign fifo_ready=id_ready;


    always @(posedge clk or negedge rstn) begin
        if (!rstn|fifo_id_flush|(~fifo_valid&&id_ready)) begin
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