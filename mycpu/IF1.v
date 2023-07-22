`include "define.vh"
module IF1 (
    input clk,
    input rstn,
    //hand shake
    input if1_allowin,
    input if1_readygo,
    


    input rready,
    input [63:0] rdata,
    input [31:0] if0_if1_pc,
    input [31:0] pc_next,
    input [31:0] badv,
    input [6:0] exception,
    input [1:0] excp_flag,
    input [31:0] cookie_out,
    input cacop_ready,
    input cacop_complete,

    output if1_rready,
    output [31:0]if1_pc,
    output [31:0]if1_pc_next,
    output [31:0]if1_badv,
    output [6:0] if1_exception,
    output [1:0] if1_excp_flag,//TODO :alert icache to pass this signal
    output [31:0]if1_cookie_out,
    output       if1_cacop_ready,
    output       if1_cacop_complete,
    output [31:0] if1_inst0,
    output [31:0] if1_inst1

);
    assign if1_inst0 = if0_if1_pc[2]? `INST_NOP:rdata[31:0];//针对branch到奇数PC
    assign if1_inst1 = rdata[63:32];
    assign if1_rready = rready;
    assign if1_pc = if0_if1_pc;
    assign if1_pc_next=pc_next;
    assign if1_badv  = badv;
    assign if1_exception = exception;
    assign if1_cookie_out = cookie_out;
    assign if1_cacop_ready = cacop_ready;
    assign if1_cacop_complete = cacop_complete;
endmodule