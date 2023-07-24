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

    input [31:0]        fetch_pc,
    input [31:0]        pc_next,

    output [31:0]     if0_if1_pc,
    output [31:0]     if0_if1_pc_next

);
    localparam WIDTH = 3;

    reg [WIDTH*32-1:0] pc_buf;
    reg [WIDTH*32-1:0] pc_next_buf;

    assign  if0_allowin= if1_allowin;
    assign  if1_readygo= 1;
    assign  if0_if1_pc=pc_buf[WIDTH*32-1:(WIDTH-1)*32];
    assign  if0_if1_pc_next=pc_next_buf[WIDTH*32-1:(WIDTH-1)*32];

    always @(posedge clk or negedge rstn) begin
        if((~rstn))begin
            //clear stage-stage reg
            // if0_if1_pc<=`PC_RESET;
            // if0_if1_pc_next<=`PC_RESET+8;

            pc_buf<=0;
            pc_next_buf<=0;
            // if0_if1_tlb_rvalid<=0;
        end else if(flush||(!if0_readygo&&if1_allowin&&if1_readygo))begin
            //clear stage-stage reg
            // if0_if1_pc<=`PC_RESET;
            // if0_if1_pc_next<=`PC_RESET+8;

            pc_buf<=0;
            pc_next_buf<=0;
        end else if (if0_readygo&&if1_allowin) begin
            //update stage-stage reg
            // if0_if1_pc<=fetch_pc;
            // if0_if1_pc_next<=pc_next;

            pc_buf<={pc_buf[(WIDTH-1)*32-1:0],fetch_pc[31:0]};
            pc_next_buf<={pc_next_buf[(WIDTH-1)*32-1:0],pc_next[31:0]};
        end
    end
endmodule