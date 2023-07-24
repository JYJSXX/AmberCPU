`include "define.vh"
module IF1_FIFO(

    input clk,
    input rstn,
    input flush,
    // input flush_cause, TODO：flush_cause for identify input source
    

    //hand shake signal
    input               fetch_buf_full,
    input               if1_readygo,
    output  wire        if1_allowin,
    input               fifo_allowin,
    output  wire        fifo_readygo,

    input               if1_rready,//icache rready makes reg update anytime
    input [31:0]        fetch_pc,
    input [31:0]        if1_pc,
    input [31:0]        if1_pc_next,
    input [31:0]        if1_badv,
    input [6:0]         if1_exception,
    input [1:0]         if1_excp_flag,
    input [31:0]        if1_cookie_out,
    input [31:0]        if1_inst0,
    input [31:0]        if1_inst1,


    input  [1:0]        ibar_flag,//from pre-decoder
    input               ibar_flag_from_ex,
    input  [1:0]        csr_flag,
    input               csr_flag_from_ex,
    input  [1:0]        tlb_flag,
    input               tlb_flag_from_ex,
    input  [1:0]        priv_flag,
    output [31:0]       pc_from_PRIV,
    output              set_pc_from_PRIV,
    output reg          flush_from_if1_fifo,
    input               icache_idle,
    input               dcache_idle,
    input               csr_done,
    input               tlb_done,

    output reg[31:0]    if1_fifo_pc,
    output reg[31:0]    if1_fifo_pc_next,
    output reg[31:0]    if1_fifo_inst0,
    output reg[31:0]    if1_fifo_inst1,
    output reg[31:0]    if1_fifo_icache_badv,
    output reg[6:0]     if1_fifo_icache_exception,
    output reg[1:0]     if1_fifo_icache_excp_flag,
    output reg[31:0]    if1_fifo_icache_cookie_out
    // output reg          if1_fifo_cacop_ready,
    // output reg          if1_fifo_cacop_complete
    );
    
    localparam      IDLE            =   3'b000,
                    WAIT_EX_IBAR    =   3'b001,
                    WAIT_EX_CSR     =   3'b010,
                    WAIT_TLB_TLB    =   3'b111,
                    WAIT_CACHE_IDLE =   3'b011,
                    WAIT_CSR_OK     =   3'b100,
                    WAIT_TLB_OK     =   3'b101;
                    // WAIT_FETCH      =   3'b110;

    localparam WIDTH = 4;


    wire cache_idle;
    wire pc_fetch_ok;
    wire idle;

    reg [2:0]       stat;
    reg             tmp;//for last rready but fifo full
    reg [2:0]       next_stat;
    reg [31:0]      pc_after_priv;
    reg             if1_fifo_valid;
            
    reg [31:0]      tmp_pc;
    reg [31:0]      tmp_pc_next;
    reg [31:0]      tmp_inst0;
    reg [31:0]      tmp_inst1;
    reg [31:0]      tmp_icache_badv;
    reg [31:0]      tmp_icache_exception;
    reg [WIDTH*32-1:0] if1_fifo_pc_buf;
    
    reg [1:0]       tmp_icache_excp_flag;
    reg [31:0]      tmp_icache_cookie_out;
    reg             tmp_cacop_ready;
    reg             tmp_cacop_complete;
    
    assign fifo_readygo =       if1_fifo_valid;
    assign if1_allowin  =       fifo_allowin&&
                                (//correct_pc->rready,consider plus 5 stage cache
                                    // !if0_if1_tlb_rvalid||
                                    !(if1_fifo_pc_buf[WIDTH*32-1:(WIDTH-1)*32]==if1_pc)
                                    ||if1_rready
                                    ||!if1_pc
                                    // 1
                                )&&
                                (//if1_rready->tlb_rvalid
                                    (stat==IDLE)||(next_stat==IDLE)
                                )&&
                                tmp==0;
    assign idle         = stat==IDLE;
    assign cache_idle = icache_idle&dcache_idle;
    // assign pc_fetch_ok= if1_pc==pc_after_priv;
    assign set_pc_from_PRIV = stat!=IDLE;
    assign pc_from_PRIV = pc_after_priv;


    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            if1_fifo_pc_buf<=0;
        end
        else if(if1_allowin)begin
            if1_fifo_pc_buf<={if1_fifo_pc_buf[(WIDTH-1)*32-1:0],fetch_pc[31:0]};
        end
    end

    //add FSM for 1.detect ibar 2.detect ex's ibar signal 3.detect icache&dcache idle
    always @(posedge clk) begin
        if (!rstn||flush) begin
            stat<=IDLE;
            pc_after_priv<=`PC_RESET;
            if1_fifo_valid<=0;
        end else begin
            if (priv_flag[0]) begin
                pc_after_priv<=if1_pc+4;
            end 
            else if(priv_flag[1])begin
                pc_after_priv<=if1_pc+8;
            end
            stat<=next_stat;
            if1_fifo_valid<=if1_rready;
        end

    end

    always @(*) begin//FSM
        flush_from_if1_fifo=0;
        case (stat)
            IDLE:begin
                next_stat=  ibar_flag!=2'b00 ?  WAIT_EX_IBAR:
                            csr_flag!=2'b00 ?  WAIT_EX_CSR:
                            tlb_flag!=2'b00  ?  WAIT_TLB_TLB:
                            IDLE;
            end
            WAIT_EX_IBAR:begin
                next_stat=  ibar_flag_from_ex?WAIT_CACHE_IDLE:WAIT_EX_IBAR;  
                flush_from_if1_fifo=1;
            end
            WAIT_EX_CSR:begin
                next_stat=  csr_flag_from_ex ?WAIT_CSR_OK    :WAIT_EX_CSR;
                flush_from_if1_fifo=1;
            end
            WAIT_TLB_TLB:begin
                next_stat=  tlb_flag_from_ex?WAIT_TLB_OK    :WAIT_TLB_TLB;
                flush_from_if1_fifo=1;
            end
            WAIT_CACHE_IDLE:begin
                next_stat=  cache_idle?IDLE            :WAIT_CACHE_IDLE;
            end
            WAIT_CSR_OK:begin
                next_stat=  csr_done?IDLE:WAIT_CSR_OK;
            end
            WAIT_TLB_OK:begin
                next_stat=  tlb_done?IDLE:WAIT_TLB_OK;
            end
            default:begin
                next_stat=IDLE;
            end
            // WAIT_FETCH:begin
            //     next_stat=pc_fetch_ok?IDLE:WAIT_FETCH;
            // end
        endcase
    end

    always @ (posedge clk) begin
        if (~rstn || flush||(!if1_readygo&&fifo_allowin&&fifo_readygo)||(!idle)) begin
            //clear stage-stage reg
            if1_fifo_pc     <=  `PC_RESET;

            if1_fifo_pc_next<=  `PC_RESET+4;
            if1_fifo_inst0  <=  `INST_NOP;
            if1_fifo_inst1  <=  `INST_NOP; 

            if1_fifo_icache_badv<=`zero;
            if1_fifo_icache_exception<=7'b000_0000;
            if1_fifo_icache_excp_flag<=0;
            if1_fifo_icache_cookie_out<=`zero;
        end
        else if (if1_readygo&&if1_allowin) begin
            //update stage-stage reg
            if1_fifo_pc     <=  if1_pc;
            if1_fifo_pc_next<=  if1_pc_next;
            if1_fifo_inst0  <=  if1_inst0;
            if1_fifo_inst1  <=  priv_flag[0]?`INST_NOP:if1_inst1;

            if1_fifo_icache_badv<=if1_badv;
            if1_fifo_icache_cookie_out<=if1_cookie_out;
            if1_fifo_icache_exception<=if1_exception;//did not replace,cope need to test excp_flag first!!
            if1_fifo_icache_excp_flag<=priv_flag[0]?2'b00:if1_excp_flag;
        end 
        else if (tmp) begin
            tmp<=0;
            if1_fifo_pc     <=  tmp_pc;
            if1_fifo_pc_next<=  tmp_pc_next;
            if1_fifo_inst0  <=  tmp_inst0;
            if1_fifo_inst1  <=  tmp_inst1;

            if1_fifo_icache_badv<=tmp_icache_badv;
            if1_fifo_icache_cookie_out<=tmp_icache_cookie_out;
            if1_fifo_icache_exception<=tmp_icache_exception;
            if1_fifo_icache_excp_flag<=tmp_icache_excp_flag;

        end
        else if(~fifo_allowin)begin
            //hold stage-stage reg
            if(if1_readygo&&~tmp)begin
                tmp<=1;
                tmp_pc<=if1_pc;
                tmp_pc_next<=if1_pc_next;
                tmp_inst0<=if1_inst0;
                tmp_inst1<=priv_flag[0]?`INST_NOP:if1_inst1;

                tmp_icache_badv<=if1_badv;
                tmp_icache_cookie_out<=if1_cookie_out;
                tmp_icache_exception<=if1_exception;
                tmp_icache_excp_flag<=priv_flag[0]?2'b00:if1_excp_flag;
            end
        end
    end

    
    
endmodule
