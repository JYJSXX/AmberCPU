`include "define.vh"
module IF1 (
    input clk,
    input rstn,
    //hand shake
    input if1_valid,
    input if1_ready,
    
    input   [31:0] if0_if1_pc,
    output  [31:0] if1_fifo_pc,


    input rready,
    input [63:0] rdata,
    input [31:0] pc_out,
    input [31:0] badv,
    input [6:0] exception,
    input [31:0] cookie_out,
    input cacop_ready,
    input cacop_complete,

    output icache_rready,
    output [31:0]icache_pc_out,
    output [31:0]icache_badv,
    output [6:0] icache_exception,
    output [31:0]icache_cookie_out,
    output if1_cacop_ready,
    output if1_cacop_complete,
    output [31:0] if1_inst0,
    output [31:0] if1_inst1

);
    assign if1_fifo_pc = if0_if1_pc;
    assign inst0 = rdata[31:0];
    assign inst1 = rdata[63:32];
    assign icache_ready = rready;
    assign icache_pc_out = pc_out;
    assign icache_badv  = badv;
    assign icache_exception = exception;
    assign icache_cookie_out = cookie_out;
    assign if1_cacop_ready = cacop_ready;
    assign if1_cacop_complete = cacop_complete;
endmodule