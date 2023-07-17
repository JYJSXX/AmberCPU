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

    input fetch_buf_empty,
    input fetch_buf_full,
    input [31:0] inst0_i,
    input [31:0] inst1_i,
    output reg[31:0] fifo_id_inst0,
    output reg[31:0] fifo_id_inst1
    `ifdef FIFO_ID_DIFFTEST

    `endif 
);

    assign id_valid=fifo_valid&!fifo_id_stall;
    assign fifo_ready=id_ready&!fetch_buf_full;
    always @(posedge clk or negedge rstn) begin
        if (~rstn) begin
            fifo_id_inst0<=`INST_NOP;
            fifo_id_inst1<=`INST_NOP;
        end
    end
endmodule