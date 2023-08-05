`timescale 1ns / 1ps
`include "define.vh"
module IF0_IF1 (

    //hand shake
    input               if0_readygo,
    output              if0_allowin,
    output              if1_readygo,
    input               if1_allowin

);
    assign  if0_allowin= if1_allowin;
    assign  if1_readygo= if0_readygo;
endmodule