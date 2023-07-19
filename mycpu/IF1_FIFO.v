`include "define.vh"
module IF1_FIFO(

    input clk,
    input rstn,
    input flush,
    input stall,
    input flush_cause,
    

    //hand shake signal
    input               fetch_buf_full,
    input               if1_readygo,
    output              if1_allowin,
    input               fifo_allowin,
    output              fifo_readygo,

    input               if1_rready,//icache rready makes reg update anytime
    input [31:0]        if1_pc,
    input [31:0]        if1_pc_next,
    input [31:0]        if1_badv,
    input [6:0]         if1_exception,
    input               if1_excp_flag,
    input [31:0]        if1_cookie_out,
    input               if1_cacop_ready,
    input               if1_cacop_complete,
    input [31:0]        if1_inst0,
    input [31:0]        if1_inst1,


    input               ibar_signal,//from pre-decoder
    input               ibar_pos,//from pre-decoder
    input               ibar_signal_from_ex,
    input               icache_idle,
    input               dcache_idle,

    output reg[31:0]    if1_fifo_pc,
    output reg[31:0]    if1_fifo_pc_next,
    output reg[31:0]    if1_fifo_inst0,
    output reg[31:0]    if1_fifo_inst1,
    output reg[31:0]    if1_fifo_icache_badv,
    output reg[6:0]     if1_fifo_icache_exception,
    output reg          if1_fifo_icache_excp_flag,
    output reg[31:0]    if1_fifo_icache_cookie_out,
    output reg          if1_fifo_cacop_ready,
    output reg          if1_fifo_cacop_complete
    );
    
    localparam      IDLE            =   2'b00,
                    WAIT_EX_IBAR    =   2'b01,
                    WAIT_CACHE_IDLE =   2'b11,
                    WAIT_FETCH      =   2'b10;

    wire cache_idle;
    wire pc_fetch_ok;

    reg[1:0]        stat=0;
    reg[1:0]        next_stat;
    reg [31:0]      pc_after_ibar;

    assign fifo_readygo = if1_readygo&if1_rready;
    assign if1_allowin  = fifo_allowin;
    assign cache_idle = icache_idle&dcache_idle;
    assign pc_fetch_ok= if1_pc==pc_after_ibar;


    //TODO add FSM for 1.detect ibar 2.detect ex's ibar signal 3.detect icache&dcache idle
    //IDLE->WAIT_EX_IBAR->WAIT_CACHE_IDLE->WAIT_FETCH->IDLE

    always @(posedge clk or negedge rstn) begin
        if (!rstn||flush) begin//TODO:FSM logic & valid_ready logic
            stat<=IDLE;
            pc_after_ibar<=`PC_RESET;
        end else begin
            if (ibar_signal) begin
                pc_after_ibar<=ibar_pos?if1_pc+8:if1_pc+4;
            end
            stat<=next_stat;
        end
    end

    always @(*) begin//FSM
        case (stat)
            IDLE:next_stat=ibar_signal?WAIT_EX_IBAR:IDLE;
            WAIT_EX_IBAR:next_stat=ibar_signal_from_ex?WAIT_CACHE_IDLE:WAIT_EX_IBAR;
            WAIT_CACHE_IDLE:next_stat=cache_idle?WAIT_FETCH:WAIT_CACHE_IDLE;
            WAIT_FETCH:next_stat=pc_fetch_ok?IDLE:WAIT_FETCH;
            default: next_stat=IDLE;
        endcase
    end

    always @ (posedge clk or negedge rstn) begin
        if (~rstn || flush||(!if1_readygo&&fifo_allowin)) begin
            //clear stage-stage reg
            if1_fifo_pc     <=  `PC_RESET;
            if1_fifo_pc_next<=  `PC_RESET+4;
            if1_fifo_inst0  <=  `INST_NOP;
            if1_fifo_inst1  <=  `INST_NOP; 

            if1_fifo_icache_badv<=`zero;
            if1_fifo_icache_exception<=7'b000_0000;
            if1_fifo_icache_excp_flag<=0;
            if1_fifo_icache_cookie_out<=`zero;
            if1_fifo_cacop_ready    <=0;
            if1_fifo_cacop_complete <=0;
        end
        else if (if1_rready||if1_readygo&&fifo_allowin) begin
            //update stage-stage reg
            if1_fifo_pc     <=  if1_pc;
            if1_fifo_pc_next<=  if1_pc_next;
            if1_fifo_inst0  <=  if1_inst0;
            if1_fifo_inst1  <=  if1_inst1;

            if1_fifo_icache_badv<=if1_badv;
            if1_fifo_icache_cookie_out<=if1_cookie_out;
            if1_fifo_icache_exception<=if1_exception;
            if1_fifo_icache_excp_flag<=if1_excp_flag;
            if1_fifo_cacop_ready<=if1_cacop_ready;
            if1_fifo_cacop_complete<=if1_cacop_complete;

        end 
        else if(~fifo_allowin)begin//TODO
            //hold stage-stage reg
        end
    end

    
    
endmodule
