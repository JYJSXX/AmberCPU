`include "define.vh"
module IF1_FIFO(

    input clk,
    input rstn,
    input flush,
    input stall,
    input flush_cause,
    

    //hand shake signal
    input               fetch_buf_full,
    input               if1_valid,
    output              if1_ready,
    input               fifo_ready,
    output              fifo_valid,

    input               if1_rready,
    input [31:0]        if1_pc_out,
    input [31:0]        if1_badv,
    input [6:0]         if1_exception,
    input [31:0]        if1_cookie_out,
    input               if1_cacop_ready,
    input               if1_cacop_complete,
    input [31:0]        if1_inst0,
    input [31:0]        if1_inst1,

    output reg[31:0]    if1_fifo_pc,
    output reg[31:0]    if1_fifo_inst0,
    output reg[31:0]    if1_fifo_inst1,
    output reg[31:0]    if1_fifo_icache_badv,
    output reg[6:0]     if1_fifo_icache_exception,
    output reg[31:0]    if1_fifo_icache_cookie_out,
    output reg          if1_fifo_cacop_ready,
    output reg          if1_fifo_cacop_complete
    );
    
    assign fifo_valid = if1_valid&if1_rready;
    assign if1_ready  = fifo_ready;

    always @ (posedge clk or negedge rstn) begin
        if (~rstn || flush||(!if1_valid&&fifo_ready)) begin
            //clear stage-stage reg
            if1_fifo_pc     <=  `PC_RESET;
            if1_fifo_inst0  <=  `INST_NOP;
            if1_fifo_inst1  <=  `INST_NOP; 

            if1_fifo_icache_badv<=`zero;
            if1_fifo_icache_exception<=7'b000_0000;
            if1_fifo_icache_cookie_out<=`zero;
            if1_fifo_cacop_ready    <=0;
            if1_fifo_cacop_complete <=0;
        end
        else if (if1_valid&&fifo_ready) begin
            //update stage-stage reg
            if1_fifo_pc     <=  if1_pc_out;
            if1_fifo_inst0  <=  if1_inst0;
            if1_fifo_inst1  <=  if1_inst1;

            if1_fifo_icache_badv<=if1_badv;
            if1_fifo_icache_cookie_out<=if1_exception;
            if1_fifo_icache_exception<=if1_exception;
            if1_fifo_cacop_ready<=if1_cacop_ready;
            if1_fifo_cacop_complete<=if1_cacop_complete;

        end 
        else if(~fifo_ready)begin
            //hold stage-stage reg
        end
    end

    
    
endmodule
