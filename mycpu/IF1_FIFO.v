`include "define.vh"
module IF1_FIFO(

    input clk,
    input rstn,
    input flush,
    // input flush_cause, TODO：flush_cause for identify input source
    

    //hand shake signal
    input               if1_readygo,
    output  wire        if1_allowin,
    input               fifo_allowin,
    output  wire        fifo_readygo,
    input               nearly_full,
    input               space_ok,
    input               write_en,
    input               pop_en,
    // input   [31:0]      icache_raddr,

    input               icache_rready,//icache rready makes reg update anytime
    input               icache_rvalid,
    input [31:0]        fetch_pc,
    input               pc_taken_out,   //?
    output  reg         if1_fifo_pc_taken,    //?
    // input [31:0]        if0_if1_pc,
    // input [31:0]        if0_if1_pc_next,
    input [31:0]        icache_badv,
    input [6:0]         icache_exception,
    input [1:0]         icache_excp_flag,
    input [31:0]        pc_out,
    input [31:0]        icache_pc_next, //?
    input [31:0]        icache_inst0,
    input [31:0]        icache_inst1,


    input  [1:0]        ibar_flag,//from pre-decoder
    input               ibar_flag_from_ex,
    input  [1:0]        csr_flag,
    input               csr_flag_from_ex,
    input  [1:0]        tlb_flag,
    input               tlb_flag_from_ex,
    input  [1:0]        priv_flag,
    output [31:0]       pc_from_PRIV,
    output              set_pc_from_PRIV,
    output              flush_from_if1_fifo,
    input               icache_idle,
    input               dcache_idle,
    input               csr_done,
    input               tlb_done,

    output reg[31:0]    if1_fifo_pc,
    output reg[31:0]    if1_fifo_pc_next,   //?
    output reg[31:0]    if1_fifo_inst0,
    output reg[31:0]    if1_fifo_inst1,
    // output wire[31:0]    p_if1_fifo_inst0,
    // output wire[31:0]    p_if1_fifo_inst1,
    output reg[31:0]    if1_fifo_icache_badv,
    output reg[6:0]     if1_fifo_icache_exception,
    output reg[1:0]     if1_fifo_icache_excp_flag,
    output reg[31+3:0]    if1_fifo_icache_cookie_out
    );
    
    localparam      IDLE            =   3'b000,
                    WAIT_EX_IBAR    =   3'b001,
                    WAIT_EX_CSR     =   3'b010,
                    WAIT_TLB_TLB    =   3'b111,
                    WAIT_CACHE_IDLE =   3'b011,
                    WAIT_CSR_OK     =   3'b100,
                    WAIT_TLB_OK     =   3'b101;
                    // WAIT_FETCH      =   3'b110;

    localparam      WIDTH = 2,
                    BUF_W = 2;


    wire cache_idle;
    wire pc_fetch_ok;
    wire idle;
    wire pushable;
    wire miss_inst=!fifo_allowin&&icache_rready;
    // reg [31:0]     if1_fifo_inst0;
    // reg [31:0]     if1_fifo_inst1;

    reg [2:0]       stat;
    reg [1:0]       tmp;//for last rready but fifo full
    reg [2:0]       next_stat;
    reg [31:0]      pc_after_priv;




    reg             if1_fifo_valid;
    // reg             tmp;
    reg [31:0]      tmp_pc;
    reg [31:0]      tmp_pc_next;
    reg             tmp_pc_taken;
    reg [31:0]      tmp_inst0;
    reg [31:0]      tmp_inst1;
    reg [31:0]      tmp_icache_badv;
    reg [6:0]       tmp_icache_exception;


    reg [WIDTH*32-1:0] if1_fifo_pc_buf;
    reg [BUF_W:0]    icache_rvalid_buf;
    
    reg [1:0]       tmp_icache_excp_flag;
    reg [31:0]      tmp_icache_cookie_out;
    reg             tmp_cacop_ready;
    reg             tmp_cacop_complete;
    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            tmp<=0;//就绪
        end else if(flush)begin
            tmp<=0;
        end
        else if(write_en&&critical_wire&&tmp==2'b00)begin
            tmp<=1;//暂存未写入
        end else if(tmp==1&&if1_fifo_valid&&!(!space_ok&&!nearly_full))begin
            tmp<=2;//暂存已写入
        end else if(tmp==2&&space_ok)begin
            tmp<=0;
        end
        // if(!rstn)begin
        //     tmp_pc<=0;
        //     tmp_pc_next<=0;
        //     tmp_inst0<=`INST_NOP;
        //     tmp_inst1<=`INST_NOP;
        //     tmp_pc_taken<=0;

        //     tmp_icache_badv<=0;
        //     tmp_icache_exception<=0;
        //     tmp_icache_excp_flag<=0;
        // end else begin
        //     tmp_pc<=pc_out;
        //     tmp_pc_next<=icache_pc_next;
        //     tmp_pc_taken<=pc_taken_out;
        //     tmp_inst0<=icache_inst0;
        //     tmp_inst1<=icache_inst1;

        //     tmp_icache_badv<=icache_badv;
        //     tmp_icache_exception<=icache_exception;
        //     tmp_icache_excp_flag<=icache_excp_flag;
        // end
    end
    // assign p_if1_fifo_inst0  =  if0_if1_pc[2]? `INST_NOP:if1_fifo_inst0[31:0];
    // assign p_if1_fifo_inst1  =  priv_flag[0]?`INST_NOP:if1_fifo_inst1;
    // assign fifo_readygo =       if1_fifo_valid&&!(!space_ok&&!nearly_full)&&tmp!=2;
    assign fifo_readygo =       if1_fifo_valid&&(if1_fifo_pc!=pc_out);
    wire critical_allowin;
    assign  critical_allowin=!icache_rvalid_buf[BUF_W-1]
                                    ||icache_rready;

    wire critical_wire;
    assign  critical_wire=(!icache_rvalid_buf[BUF_W-1]||(icache_rready))&&!space_ok&&tmp==0;
    assign  if1_allowin  =       (space_ok)&&
                                (//2spaceleft->correct_pc->rready,consider plus 5 stage cache
                                    !icache_rvalid_buf[BUF_W-1]
                                    ||(icache_rready)
                                )&&
                                (//icache_rready->tlb_rvalid
                                    tmp==0
                                );
                                
    assign idle         = stat==IDLE;
    assign cache_idle = icache_idle&dcache_idle;
    assign set_pc_from_PRIV = 0;
    // assign set_pc_from_PRIV = (stat!=IDLE)&&(csr_done||tlb_done||cache_idle);
    assign pc_from_PRIV = pc_after_priv;


    always @(posedge clk) begin
        if(!rstn)begin
            icache_rvalid_buf<=0;
        end 
        else if(flush)begin
            icache_rvalid_buf<=0;
        end
        else if(if1_allowin)begin
            icache_rvalid_buf<={icache_rvalid_buf[BUF_W-1:0],if1_allowin};            
        end
    end

    //add FSM for 1.detect ibar 2.detect ex's ibar signal 3.detect icache&dcache idle
    always @(posedge clk) begin
        if (!rstn||flush) begin
            stat<=IDLE;
            
        end else begin
            stat<=next_stat;
            
        end
    end
    reg old_tmp;
    always @(posedge clk ) begin
        old_tmp<=tmp==2;
    end
    wire negedge_tmp = (tmp==0)&&(old_tmp==1);
    
    always @(*) begin
        if (priv_flag[0]) begin
            pc_after_priv=pc_out+4;
        end 
        else if(priv_flag[1])begin
            pc_after_priv=pc_out+8;
        end else begin
            pc_after_priv=0;
        end
    end

    // always @(*) begin//FSM
    //     flush_from_if1_fifo=0;
    //     case (stat)
    //         IDLE:begin
    //             next_stat=  ibar_flag!=2'b00 ?  WAIT_EX_IBAR:
    //                         csr_flag!=2'b00 ?  WAIT_EX_CSR:
    //                         tlb_flag!=2'b00  ?  WAIT_TLB_TLB:
    //                         IDLE;
    //         end
    //         WAIT_EX_IBAR:begin
    //             next_stat=  ibar_flag_from_ex?WAIT_CACHE_IDLE:WAIT_EX_IBAR;  
    //             flush_from_if1_fifo=1;
    //         end
    //         WAIT_EX_CSR:begin
    //             next_stat=  csr_flag_from_ex ?WAIT_CSR_OK    :WAIT_EX_CSR;
    //             flush_from_if1_fifo=1;
    //         end
    //         WAIT_TLB_TLB:begin
    //             next_stat=  tlb_flag_from_ex?WAIT_TLB_OK    :WAIT_TLB_TLB;
    //             flush_from_if1_fifo=1;
    //         end
    //         WAIT_CACHE_IDLE:begin
    //             next_stat=  cache_idle?IDLE            :WAIT_CACHE_IDLE;
    //         end
    //         WAIT_CSR_OK:begin
    //             next_stat=  csr_done?IDLE:WAIT_CSR_OK;
    //         end
    //         WAIT_TLB_OK:begin
    //             next_stat=  tlb_done?IDLE:WAIT_TLB_OK;
    //         end
    //         default:begin
    //             next_stat=IDLE;
    //         end
    //     endcase
    // end

    always @ (posedge clk) begin
        if (~rstn || flush||(!icache_rready&&fifo_allowin&&fifo_readygo)||(!idle)||(tmp==1&&write_en)) begin
            //clear stage-stage reg
            if1_fifo_valid<=0;
            if1_fifo_pc     <=  `PC_RESET;

            if1_fifo_pc_next<=  `PC_RESET+4;
            if1_fifo_pc_taken<=0;
            if1_fifo_inst0  <=  `INST_NOP;
            if1_fifo_inst1  <=  `INST_NOP; 

            if1_fifo_icache_badv<=`zero;
            if1_fifo_icache_exception<=7'b000_0000;
            if1_fifo_icache_excp_flag<=0;
            if1_fifo_icache_cookie_out<=0;
        end
        else if ((fifo_allowin&&critical_wire&&tmp==0)||(icache_rready&&if1_allowin&&fifo_allowin)) begin
            //update stage-stage reg
            if1_fifo_valid<=1;
            if1_fifo_pc     <=  pc_out;
            if1_fifo_pc_next<=  icache_pc_next;
            if1_fifo_pc_taken<=  pc_taken_out;
            if1_fifo_inst0  <=  pc_out[2]? icache_inst1[31:0]:icache_inst0[31:0];
            if1_fifo_inst1  <=  pc_out[2]? `INST_NOP:icache_inst1[31:0];
            if1_fifo_icache_badv      <=icache_badv;
            // if1_fifo_icache_cookie_out<=icache_pc_next;
            if1_fifo_icache_exception <=icache_exception;//did not replace,cope need to test excp_flag first!!
            if1_fifo_icache_excp_flag<=icache_excp_flag;
        end 
        // else if (tmp) begin
        //     tmp<=0;
        //     if1_fifo_pc     <=  tmp_pc;
        //     if1_fifo_pc_next<=  tmp_pc_next;
        //     if1_fifo_inst0  <=  tmp_inst0;
        //     if1_fifo_inst1  <=  tmp_inst1;

        //     if1_fifo_icache_badv<=tmp_icache_badv;
        //     if1_fifo_icache_cookie_out<=tmp_icache_cookie_out;
        //     if1_fifo_icache_exception<=tmp_icache_exception;
        //     if1_fifo_icache_excp_flag<=tmp_icache_excp_flag;

        // end
        else if(~fifo_allowin||~if1_allowin)begin
            //hold stage-stage reg
            // if(if1_readygo&&~tmp)begin
            //     tmp<=1;
            //     tmp_pc<=pc_out;
            //     tmp_pc_next<=icache_pc_next;
            //     tmp_inst0<=icache_inst0;
            //     tmp_inst1<=priv_flag[0]?`INST_NOP:icache_inst1;

            //     tmp_icache_badv      <=icache_badv;
            //     tmp_icache_cookie_out<=icache_pc_next;
            //     tmp_icache_exception <=icache_exception;
            //     tmp_icache_excp_flag<=priv_flag[0]?2'b00:icache_excp_flag;
            // end
        end
    end

    
    
endmodule
