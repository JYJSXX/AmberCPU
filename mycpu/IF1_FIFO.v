`include "define.vh"
module IF1_FIFO(

    input clk,
    input rstn,
    input flush,
    input stall,
    input flush_cause,
    

    //hand shake signal
    input           fetch_buf_full,
    input           if1_valid,
    output          if1_ready,
    input           fifo_ready,
    output          fifo_valid,

    input icache_rready,
    input [31:0]icache_pc_out,
    input [31:0]icache_badv,
    input [6:0] icache_exception,
    input [31:0]icache_cookie_out,
    input if1_cacop_ready,
    input if1_cacop_complete,
    input [31:0]    if1_inst0,
    input [31:0]    if1_inst1,

    output reg[31:0]    if1_fifo_pc,
    output reg[31:0]    if1_fifo_inst0,
    output reg[31:0]    if1_fifo_inst1
    
    );
    
    assign if1_ready  = fifo_ready&!stall;
    assign fifo_valid = if1_valid&icache_rready;

    always @ (posedge clk or negedge rstn) begin
        if (~rstn || flush) begin
            if1_fifo_pc     <=  `PC_RESET;
            if1_fifo_inst0  <=  `INST_NOP;
            if1_fifo_inst1  <=  `INST_NOP; 
        end
        else if (if1_valid) begin
            if1_fifo_pc     <=  icache_pc_out;
            if1_fifo_inst0  <=  if1_inst0;
            if1_fifo_inst1  <=  if1_inst1;
        end 
    end

    
    
endmodule
