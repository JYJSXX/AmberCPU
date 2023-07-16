`include "define.vh"
module FIFO_ID (
    input clk,
    input rstn,

    input fifo_id_flush,
    input [1:0]fifo_id_flush_cause, //flush cause reserved for judge

    //hand shake signal
    input id_ready,//from decoder stage.told id is ready
    output reg id_valid,//to decoder stage,tell id I'm valid
    output reg fifo_ready,//to fifo stage,tell fifo I'm ready
    input fifo_valid,//from fifo stage,told fifo is valid

    input fetch_buf_empty,
    input [31:0] inst0_i,
    input [31:0] inst1_i,
    output [31:0] inst0_o,
    output [31:0] inst1_o
    `ifdef FIFO_ID_DIFFTEST

    `endif 
);
    always @(*) begin //combinational logic for hand-shake
        if (fetch_buf_empty) begin
            id_valid=0;
        end else begin
            id_valid=0;
            fifo_ready=1;
        end

    end
endmodule