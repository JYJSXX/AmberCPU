`timescale 1ns / 1ps
`include "define.vh"
module IF0_IF1 (
    input               clk,
    input               rstn,

    //hand shake
    input               if0_readygo,
    output              if0_allowin,
    output              if1_readygo,
    input               if1_allowin,
    input               flush,
    input               flush_cause,
    input               rready,

    input [31:0]        fetch_pc,
    input [31:0]        pc_next,

    output reg[31:0]    if0_if1_pc,
    output reg[31:0]    if0_if1_pc_next

);
    assign if0_allowin= if1_allowin&rready;
    assign if1_readygo= rready;

    always @(posedge clk) begin
        if((~rstn)||flush||(!if0_readygo&&if1_allowin&&if1_readygo))begin
            //clear stage-stage reg
            if0_if1_pc<=`PC_RESET;
            if0_if1_pc_next<=`PC_RESET+8;
        end else begin
            if (if0_readygo&&if1_allowin) begin
                //update stage-stage reg
                if0_if1_pc<=fetch_pc;
                if0_if1_pc_next<=pc_next;
            end else if (!if1_allowin) begin
                //hold stage-stage reg
            end
        end
    end
endmodule