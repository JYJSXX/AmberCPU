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
    // input [31:0]        fetch_pc,
    // input [31:0]        if0_if1_pc,
    // input [31:0]        if0_if1_pc_next,
    input [31:0]        icache_badv,
    input [6:0]         icache_exception,
    input [1:0]         icache_excp_flag,
    input [31:0]        icache_inst0,
    input [31:0]        icache_inst1,

    input [31:0]        fetch_pc,
    input [31:0]        pc_out,
    input [31:0]        icache_pc_next, //?
    input [1 :0]        pc_taken_out,   //?
    


    // input  [1:0]        ibar_flag,//from pre-decoder
    // input               ibar_flag_from_ex,
    // input  [1:0]        csr_flag,
    // input               csr_flag_from_ex,
    // input  [1:0]        tlb_flag,
    // input               tlb_flag_from_ex,
    // input  [1:0]        priv_flag,
    // output [31:0]       pc_from_PRIV,
    // output              set_pc_from_PRIV,
    // output              flush_from_if1_fifo,
    input               icache_idle,
    input               dcache_idle,
    input               csr_done,
    input               tlb_done,

    output reg[31:0]    if1_fifo_pc=0,
    output reg[1 :0]    if1_fifo_pc_taken=0,    //?
    output reg[31:0]    if1_fifo_pc_next=0,  

    output reg[31:0]    if1_fifo_inst0=0,
    output reg[31:0]    if1_fifo_inst1=0,
    output reg[31:0]    if1_fifo_icache_badv=0,
    output reg[6:0]     if1_fifo_icache_exception=0,
    output reg[1:0]     if1_fifo_icache_excp_flag=0
    // output reg[31+3:0]    if1_fifo_icache_cookie_out
    );
    
    localparam      IDLE            =   3'b000,
                    WAIT_EX_IBAR    =   3'b001,
                    WAIT_EX_CSR     =   3'b010,
                    WAIT_TLB_TLB    =   3'b111,
                    WAIT_CACHE_IDLE =   3'b011,
                    WAIT_CSR_OK     =   3'b100,
                    WAIT_TLB_OK     =   3'b101;
                    // WAIT_FETCH      =   3'b110;

    localparam      WIDTH = 3,
                    BUF_W = 2;


    // wire cache_idle;
    // wire pc_fetch_ok;
    // wire idle;
    // wire pushable;
    wire miss_inst=!fifo_allowin&&icache_rready;
    // reg [31:0]     if1_fifo_inst0;
    // reg [31:0]     if1_fifo_inst1;

    wire critical_wire;
    // reg [2:0]       stat;
    reg [1:0]       tmp=0;
    // reg [2:0]       next_stat;
    // reg [31:0]      pc_after_priv;




    reg             if1_fifo_valid=0;


    // reg [(WIDTH+1)*32-1:0] if1_fifo_pc_buf=0;
    reg [BUF_W:0]    icache_rvalid_buf=0;
    
    always @(posedge clk) begin
        if(!rstn)begin
            tmp<=0;//就绪
        end else if(flush)begin
            tmp<=0;
        end else if(write_en&&critical_wire&&tmp==2'b00)begin
            tmp<=1;//暂存未写入
        end else if(tmp==1&&if1_fifo_valid&&!(!space_ok&&!nearly_full))begin
            tmp<=2;//暂存已写入
        end else if(tmp==2&&space_ok)begin
            tmp<=0;
        end else begin
            tmp<=tmp;
        end
    end
    wire [31:0]                    cmp_pc;
    wire                            pc_ins_full;
    wire                            pc_ins_empty;
    wire                            pc_inst_nearly_full;
    wire                            pc_inst_nearly_empty;
    FIFO_generator#(
        .DATA_WIDTH   ( 32),
        .DEPTH        ( 4 ),
        .LOG_DEPTH    ( 2 )
    )pc_ins(
        .clk          ( clk          ),
        .rstn         ( rstn         ),
        .flush        ( flush        ),
        .pop_en       ( cmp_pc==if1_fifo_pc&&write_en),
        .din          (fetch_pc),
        .write_en     (    if1_allowin ),
        .dout         (    cmp_pc ),
        .full         (pc_ins_full),
        .empty        (pc_ins_empty),
        .nearly_full    (pc_inst_nearly_full),
        .nearly_empty (pc_inst_nearly_empty)
    );

    assign fifo_readygo =       if1_fifo_valid&&(cmp_pc==if1_fifo_pc);
    assign  critical_wire=(!icache_rvalid_buf[BUF_W-1]||(icache_rready))&&!space_ok&&tmp==0;
    assign  if1_allowin  =       (space_ok)&&
                                (//2spaceleft->correct_pc->rready,consider plus 5 stage cache
                                    !icache_rvalid_buf[BUF_W-1]
                                    ||(icache_rready)
                                )&&
                                (//icache_rready->tlb_rvalid
                                    tmp==0
                                );
                                


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
    

    always @ (posedge clk) begin
        if ((~rstn) || flush||(!icache_rready&&fifo_allowin&&fifo_readygo)||(tmp==1&&write_en)) begin
            //clear stage-stage reg
            if1_fifo_valid<=0;
            if1_fifo_pc     <=  0;
            if1_fifo_pc_next<=  0+4;
            if1_fifo_pc_taken<=  0;
            if1_fifo_inst0  <=  `INST_NOP;
            if1_fifo_inst1  <=  `INST_NOP; 

            if1_fifo_icache_badv<=`zero;
            if1_fifo_icache_exception<=7'b000_0000;
            if1_fifo_icache_excp_flag<=0;
        end
        else if ((critical_wire&&!if1_fifo_valid&&tmp==0)||(fifo_allowin&&critical_wire&&tmp==0)||(icache_rready&&if1_allowin&&fifo_allowin)) begin
            //update stage-stage reg
            if1_fifo_valid<=1;
            if1_fifo_pc     <=  pc_out;
            if1_fifo_pc_next<=  icache_pc_next;
            if1_fifo_pc_taken<=  pc_taken_out;

            if1_fifo_inst0  <=  pc_out[2]? icache_inst1[31:0]:icache_inst0[31:0];
            if1_fifo_inst1  <=  pc_out[2]? `INST_NOP:icache_inst1[31:0];
            if1_fifo_icache_badv      <=icache_badv;
            if1_fifo_icache_exception <=icache_exception;//did not replace,cope need to test excp_flag first!!
            if1_fifo_icache_excp_flag<=pc_out[2]?{1'b0,icache_excp_flag[1]}:icache_excp_flag;
        end 
        else begin
            if1_fifo_valid<=if1_fifo_valid;
            if1_fifo_pc     <=  if1_fifo_pc;
            if1_fifo_pc_next<=  if1_fifo_pc_next;
            if1_fifo_pc_taken<=  if1_fifo_pc_taken;

            if1_fifo_inst0  <=  if1_fifo_inst0;
            if1_fifo_inst1  <=  if1_fifo_inst1;
            if1_fifo_icache_badv      <=if1_fifo_icache_badv;
            if1_fifo_icache_exception <=if1_fifo_icache_exception;//did not replace,cope need to test excp_flag first!!
            if1_fifo_icache_excp_flag<=if1_fifo_icache_excp_flag;
        end
    end

    
    
endmodule
