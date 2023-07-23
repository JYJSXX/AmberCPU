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
    input               tlb_rvalid,//存一级用于判断MISS和STALL
    output  reg         if0_if1_tlb_rvalid,

    input [31:0]        fetch_pc,
    input [31:0]        pc_next,

    output reg[31:0]    if0_if1_pc,
    output reg[31:0]    if0_if1_pc_next

);
    assign if0_allowin= if1_allowin;
    assign if1_readygo= rready;

    always @(posedge clk) begin
        if((~rstn)||flush||(!if0_readygo&&if1_allowin&&rready))begin
            //clear stage-stage reg
            if0_if1_pc<=32'b0;
            if0_if1_pc_next<=32'b0;
            if0_if1_tlb_rvalid<=0;
        end else begin
            if (if0_readygo&&if1_allowin) begin
                //update stage-stage reg
                if0_if1_pc<=fetch_pc;
                if0_if1_pc_next<=pc_next;
            end 
            if0_if1_tlb_rvalid<=tlb_rvalid;
            // else if (!if1_allowin) begin
            //     //hold stage-stage reg
            //     if0_if1_pc<=if0_if1_pc;
            //     if0_if1_pc_next<=if0_if1_pc_next;
            //     if0_if1_tlb_rvalid<=if0_if1_tlb_rvalid;
            // end
        end
    end
endmodule