`include "define.vh"
`include "TLB.vh"
`include "config.vh"
`timescale 1ns/1ps
module core_top(
    input           aclk,
    input           aresetn,
    input    [ 7:0] intrpt,
    //AXI interface
    //read request
    output   [ 3:0] arid,
    output   [31:0] araddr,
    output   [ 7:0] arlen,
    output   [ 2:0] arsize,
    output   [ 1:0] arburst,
    output   [ 1:0] arlock,
    output   [ 3:0] arcache,
    output   [ 2:0] arprot,
    output          arvalid,
    input           arready,
    //read back
    input    [ 3:0] rid,
    input    [31:0] rdata,
    input    [ 1:0] rresp,
    input           rlast,
    input           rvalid,
    output          rready,
    //write request
    output   [ 3:0] awid,
    output   [31:0] awaddr,
    output   [ 7:0] awlen,
    output   [ 2:0] awsize,
    output   [ 1:0] awburst,
    output   [ 1:0] awlock,
    output   [ 3:0] awcache,
    output   [ 2:0] awprot,
    output          awvalid,
    input           awready,
    //write data
    output   [ 3:0] wid,
    output   [31:0] wdata,
    output   [ 3:0] wstrb,
    output          wlast,
    output          wvalid,
    input           wready,
    //write back
    input    [ 3:0] bid,
    input    [ 1:0] bresp,
    input           bvalid,
    output          bready,
    //debug
    output [31:0] debug0_wb_pc,
    output [ 3:0] debug0_wb_rf_wen,
    output [ 4:0] debug0_wb_rf_wnum,
    output [31:0] debug0_wb_rf_wdata,


    output [31:0] debug1_wb_pc,
    output [ 3:0] debug1_wb_rf_wen,
    output [ 4:0] debug1_wb_rf_wnum,
    output [31:0] debug1_wb_rf_wdata,

    input  break_point,
    input  infor_flag, 
    input  reg_num,    
    output ws_valid,   
    output rf_rdata

);

    `ifdef DIFFTEST
    wire [31:0] csr_crmd_diff     ;
    wire [31:0] csr_prmd_diff     ;
    wire [31:0] csr_ectl_diff     ;
    wire [31:0] csr_estat_diff    ;
    wire [31:0] csr_era_diff      ;
    wire [31:0] csr_badv_diff     ;
    wire [31:0] csr_eentry_diff   ;
    wire [31:0] csr_tlbidx_diff   ;
    wire [31:0] csr_tlbehi_diff   ;
    wire [31:0] csr_tlbelo0_diff  ;
    wire [31:0] csr_tlbelo1_diff  ;
    wire [31:0] csr_asid_diff     ;
    wire [31:0] csr_pgdl_diff     ;
    wire [31:0] csr_pgdh_diff     ;
    wire [31:0] csr_save0_diff    ;
    wire [31:0] csr_save1_diff    ;
    wire [31:0] csr_save2_diff    ;
    wire [31:0] csr_save3_diff    ;
    wire [31:0] csr_tid_diff      ;
    wire [31:0] csr_tcfg_diff     ;
    wire [31:0] csr_tval_diff     ;
    wire [31:0] csr_ticlr_diff    ;
    wire [31:0] csr_llbctl_diff   ;
    wire [31:0] csr_tlbrentry_diff;
    wire [31:0] csr_dmw0_diff     ;
    wire [31:0] csr_dmw1_diff     ;
    wire [63:0] rf_stable_counter ;
    wire [63:0] ex_stable_counter ;
`endif
    wire [63:0] stable_counter;
    assign {arlock, arcache, arprot, awlock, awcache, awprot} = 0;
    assign {awid, wid} = 8'hff;
    wire clk;
    //assign clk=aclk; //TODO:idle的时钟没写，暂时用clk代替

    wire [31:0] debug0_wb_inst;
    wire debug0_valid;
    wire [31:0] debug1_wb_inst;
    wire debug1_valid;

    wire i_idle;
    wire d_idle;
    wire block_clock;
    wire idle_over;
idle_clk idle_clk1
(
    .aclk(aclk),
    .aresetn(aresetn),
    . clk(clk),
    .block_clock(block_clock),
    .idle_over(idle_over)
);

    /*
    TODO:
    Flush signal 相关全都没做
    */
    wire flush_from_wb;         
    wire flush_from_ex2;
    wire flush_from_ex1;
    wire flush_from_reg;
    wire flush_from_id;
    wire flush_from_if1;
    wire flush_from_if1_fifo;

    wire flush_to_ex2_wb;  
    wire flush_to_ex1_ex2; 
    wire flush_to_reg_ex1; 
    wire flush_to_id_reg;  
    wire flush_to_fifo_id; 
    wire flush_to_fifo;    
    wire flush_to_if1_fifo;
    wire flush_to_if0;
    wire flush_to_if0_if1;     
    wire flush_to_tlb;     
    wire flush_to_icache ; 
    wire flush_to_dcache ; 
    wire flush_to_btb ;       

     //分支预测
    wire predict_dir_fail; //分支预测跳不跳失败的信号
    wire predict_add_fail; //分支预测往哪跳失败的信号
    wire fact_taken; //实际跳不跳
    wire [31:0] fact_pc; //分支指令的pc
    wire [31:0] fact_tpc; //目标地址pc

    wire ibar;


    //for hand shake with pipeline
    wire if0_readygo;
    wire if0_allowin; 

    //for pc update     
    wire set_pc_from_ID;
    wire [31:0]pc_from_ID;
    // wire set_pc_from_EX; replaced by fact_pc/fact taken
    // wire [31:0]pc_from_EX;
    wire set_pc_from_WB;
    assign set_pc_from_WB =ex2_wb_excp_flag ;
    wire [31:0]pc_from_WB;
    wire set_pc_from_PRIV;//from if1_fifo
    wire [31:0]pc_from_PRIV;
    wire flush_by_priv;

    //for BTB
    wire [31:0]  pred_pc;
    wire         pred_taken;
    wire [31:0]  fetch_pc;
    //for tlb
    // wire         tlb_rvalid;
    wire [31:0]  tlb_raddr;
    wire [31:0]  cookie_in;

    
    wire [31:0]  pc_next;//rready control logic : use a tmp to store inst temporarily
    wire    pc_taken_out;
    wire    pc_taken;
    wire         pc_in_stall;
    wire ex2_wb_excp_flag; 
    wire set_by_priv;
    wire [31:0] pc_set_by_priv;
    wire    [1:0]flush_cause;
    wire    [31:0]tlb_pc_next;
    wire          tlb_pc_taken;
    IF0 u_IF0(
        .clk                 ( clk                 ),
        .rstn                ( aresetn             ),
        .if0_readygo         ( if0_readygo         ),
        .if0_allowin         ( if0_allowin         ),
        .flush               ( flush_to_if0        ),
        // .flush_cause         ( flush_cause         ),
        .set_pc_from_ID      ( set_pc_from_ID      ),
        .pc_from_ID          ( pc_from_ID          ),
        .set_pc_from_EX      ( predict_dir_fail|predict_add_fail    ),
        .pc_from_EX          ( fact_tpc            ),
        .set_pc_from_WB      ( ex2_wb_excp_flag |  set_by_priv  ),
        .pc_from_WB          ( ex2_wb_excp_flag?pc_from_WB : pc_set_by_priv          ),
        .set_pc_from_PRIV    ( set_pc_from_PRIV    ),
        .pc_from_PRIV        ( pc_from_PRIV        ),
        .pred_pc             ( pred_pc             ),
        .pred_taken          ( pred_taken          ),
        .fetch_pc            ( fetch_pc            ),
        .raddr               ( tlb_raddr           ),
        .pc_next             ( pc_next             ),
        .pc_taken            ( pc_taken            ),
        .pc_in_stall         ( pc_in_stall         )
    );

    //hand shake

    wire               if1_readygo;
    wire               if1_allowin;
    // wire               flush_cause; TODO:flush cause 
    wire               icache_rready;
    wire [31:0]        icache_pc_next;

    wire [31:0]        if0_if1_pc;
    wire [31:0]        if0_if1_pc_next;
    wire [31:0]        pc_out;
    // wire               if0_if1_tlb_rvalid;

    IF0_IF1 u_IF0_IF1(
        .clk                    ( clk              ),
        .rstn                   ( aresetn          ),
        .if0_readygo            ( if0_readygo      ),
        .if0_allowin            ( if0_allowin      ),
        .if1_readygo            ( if1_readygo      ),
        .if1_allowin            ( if1_allowin      ),
        .flush                  ( flush_to_if0_if1 ),
        .flush_cause            ( 0                )   // TODO: To be completed
        // .fetch_pc               ( fetch_pc         ),
        // .pc_next                ( pc_next          ),
        // .if0_if1_pc             ( if0_if1_pc       ),
        // .if0_if1_pc_next        ( if0_if1_pc_next  )
    );

    
    //hand shake  
    wire [31:0] icache_badv;
    wire [31:0] dcache_badv;
    wire [6:0] icache_exception;
    wire [6:0] dcache_exception;
    wire [1:0] icache_excp_flag;
    // wire [31:0] cookie_out;
    // wire cacop_ready;
    // wire cacop_complete;

    wire [63:0]       icache_rdata;   //指令cache读数据



    //hand shake signal
    wire               fetch_buf_full;
    wire               fifo_allowin;
    wire               fifo_readygo;



    wire  [1:0]        ibar_flag;//from pre-decoder
    // wire               ibar_flag_from_ex; replaced by ibar
    wire  [1:0]        csr_flag;
    wire               csr_flag_from_ex;
    wire  [1:0]        tlb_flag;
    wire               tlb_flag_from_ex;
    wire  [1:0]        priv_flag;
    // wire               icache_idle;
    // wire               dcache_idle;
    wire               csr_done;
    wire               tlb_done;

    wire  [31:0]    if1_fifo_pc;
    wire  [31:0]    if1_fifo_pc_next;
    wire  [31:0]    if1_fifo_inst0;
    wire  [31:0]    if1_fifo_inst1;
    wire  [31:0]    if1_fifo_icache_badv;
    wire  [6:0]     if1_fifo_icache_exception;
    wire  [1:0]     if1_fifo_icache_excp_flag;
    // wire  [31+3:0]    if1_fifo_icache_cookie_out;
    wire            if1_fifo_pc_taken;
    wire icache_rvalid;
    wire            space_ok;
    wire nearly_full;
    wire            write_en;
    wire            pop_en;
    wire [31:0] icache_raddr, dcache_addr;
    wire            icache_ravlid_valid;
    // wire            if1_fifo_cacop_ready;
    // wire            if1_fifo_cacop_complete;
    IF1_FIFO u_IF1_FIFO(
        .clk                        ( clk                        ),
        .rstn                       ( aresetn                    ),
        .flush                      ( flush_to_if1_fifo          ),
        .if1_readygo                ( if1_readygo                ),
        .if1_allowin                ( if1_allowin                ),
        .fifo_allowin               ( fifo_allowin               ),
        .fifo_readygo               ( fifo_readygo               ),
        .icache_rready              ( icache_rready              ),
        .icache_rvalid              ( icache_rvalid              ),
        .nearly_full                ( nearly_full                ),
        .space_ok                   ( space_ok                   ),
        .write_en                   ( write_en                   ),
        .pop_en                     ( pop_en                     ),
        // .fetch_pc                   ( fetch_pc                   ),
        .pc_taken_out               ( pc_taken_out             ),  // ?
        .if1_fifo_pc_taken          ( if1_fifo_pc_taken         ), // OUT
        // .if0_if1_pc                 ( if0_if1_pc                 ),
        // .if0_if1_pc_next            ( if0_if1_pc_next            ),
        .icache_badv                ( icache_badv                ),
        .icache_exception           ( icache_exception           ),
        .icache_excp_flag           ( icache_excp_flag           ),
        .pc_out                     ( pc_out                     ),
        .fetch_pc                   ( fetch_pc                   ),
        .icache_pc_next             ( icache_pc_next             ), // ?
        .icache_inst0               ( icache_rdata[31:0]         ),
        .icache_inst1               ( icache_rdata[63:32]        ),
        .ibar_flag                  ( ibar_flag                  ),
        .ibar_flag_from_ex          ( ibar                       ),
        .csr_flag                   ( csr_flag                   ),
        .csr_flag_from_ex           ( csr_flag_from_ex           ),
        .tlb_flag                   ( tlb_flag                   ),
        .tlb_flag_from_ex           ( tlb_flag_from_ex           ),
        .priv_flag                  ( priv_flag                  ),
        .pc_from_PRIV               ( pc_from_PRIV               ),
        .set_pc_from_PRIV           ( set_pc_from_PRIV           ),
        .flush_from_if1_fifo        ( flush_from_if1_fifo        ),
        .icache_idle                ( i_idle                     ),
        .dcache_idle                ( d_idle                     ),
        .csr_done                   ( csr_done                   ),
        .tlb_done                   ( tlb_done                   ),
        .if1_fifo_pc                ( if1_fifo_pc                ),
        .if1_fifo_pc_next           ( if1_fifo_pc_next           ), // OUTPUT
        .if1_fifo_inst0             ( if1_fifo_inst0             ),
        .if1_fifo_inst1             ( if1_fifo_inst1             ),
        // .p_if1_fifo_inst0             ( if1_fifo_inst0             ),
        // .p_if1_fifo_inst1             ( if1_fifo_inst1             ),
        .if1_fifo_icache_badv       ( if1_fifo_icache_badv       ),
        .if1_fifo_icache_exception  ( if1_fifo_icache_exception  ),
        .if1_fifo_icache_excp_flag  ( if1_fifo_icache_excp_flag  )
        // .if1_fifo_icache_cookie_out ( if1_fifo_icache_cookie_out )
    );

    
    wire    [1 :0]      inst_btype;
    wire    [1 :0]      branch_flag;
    // wire                inst_bpos;
    // wire    [1 :0]      inst_btype;
    wire    [7 :0]      inst_index;



    FIFO_predecoder u_pre_decoder(
        .if1_fifo_inst0 ( if1_fifo_inst0 ),
        .if1_fifo_inst1 ( if1_fifo_inst1 ),
        .if1_fifo_pc    ( if1_fifo_pc    ),
        .priv_flag      ( priv_flag      ),
        .ibar_flag      ( ibar_flag      ),
        .csr_flag       ( csr_flag       ),
        .tlb_flag       ( tlb_flag       ),
        .inst_index     ( inst_index     ),
        .inst_btype     ( inst_btype     )
        //.inst_bpos      ( inst_bpos      )
    );




    //hand shake signal,stage DO NOT GEN SIGNAL!!!
    //stage read signal,write info to stage-stage regs

    // wire input        if1_fifo_cacop_ready;
    // wire input        if1_fifo_cacop_complete;


    wire   [31:0] fifo_inst0;
    wire   [31:0] fifo_inst1;

    wire   [31:0] fifo_pc;//co pc with fifo_inst0 
    wire   [31:0] fifo_pcAdd;
    wire   [31:0] fifo_pc_next;
    wire   [31:0] fifo_badv;

    wire   [31:0] fifo_cookie_out;
    wire   [6 :0] fifo_exception; 
    wire   [1 :0] fifo_excp_flag;
    wire   [1 :0] fifo_priv_flag;
    wire   [1 :0] fifo_branch_flag;
    

    wire  fifo_valid,fifo_ready;
    wire fifo_pc_taken;


    FIFO u_FIFO(
        .clk                        ( clk                        ),
        .rstn                       ( aresetn                    ),
        .branch_flag                ( branch_flag                ),
        .flush                      ( flush_to_fifo              ),
        .fifo_readygo               ( fifo_readygo               ),
        .fifo_allowin               ( fifo_allowin               ),
        .fifo_valid                 ( fifo_valid                 ),
        .fifo_ready                 ( fifo_ready                 ),
        .nearly_full                ( nearly_full                ),
        .icache_raddr               ( icache_raddr               ),
        .pc_out                     ( pc_out                     ),
        .space_ok                   ( space_ok                   ),
        .write_en                   (write_en                    ),
        .pop_en                     ( pop_en                     ),
        .priv_flag                  ( priv_flag                  ),
        .if1_fifo_inst0             ( if1_fifo_inst0             ),
        .if1_fifo_inst1             ( if1_fifo_inst1             ),
        .if1_fifo_pc                ( if1_fifo_pc                ),
        .if1_fifo_pc_next           ( if1_fifo_pc_next           ), //input
        .if1_fifo_pc_taken          ( if1_fifo_pc_taken ),  // input
        .if1_fifo_icache_badv       ( if1_fifo_icache_badv       ),
        // .if1_fifo_icache_cookie_out ( if1_fifo_icache_cookie_out ),
        .if1_fifo_icache_exception  ( if1_fifo_icache_exception  ),
        .if1_fifo_icache_excp_flag  ( if1_fifo_icache_excp_flag  ),
        .fifo_inst0                 ( fifo_inst0                 ),
        .fifo_inst1                 ( fifo_inst1                 ),
        .fifo_pc                    ( fifo_pc                    ),
        .fifo_pcAdd                 ( fifo_pcAdd                 ),
        .fifo_pc_next               ( fifo_pc_next               ),
        .fifo_pc_taken              ( fifo_pc_taken              ),
        .fifo_badv                  ( fifo_badv                  ),
        // .fifo_cookie_out            ( fifo_cookie_out            ),
        .fifo_exception             ( fifo_exception             ),
        .fifo_excp_flag             ( fifo_excp_flag             ),
        .fifo_priv_flag             ( fifo_priv_flag             ),
        .fifo_branch_flag           ( fifo_branch_flag           )
    );


    //wire done
    wire [31:0] fifo_id_inst0;
    wire [31:0] fifo_id_inst1;
    wire [31:0] fifo_id_pc;
    wire [31:0] fifo_id_pcAdd;
    wire [31:0] fifo_id_pc_next;
    wire [31:0] fifo_id_badv;
    wire [31:0] fifo_id_cookie_out;
    wire [6:0]  fifo_id_exception;
    wire [1:0]  fifo_id_excp_flag;
    wire [1:0]  fifo_id_priv_flag;
    wire [1:0]  fifo_id_branch_flag;
    wire        id_allowin;
    wire invalid_instruction;

    wire  id_readygo;//to decoder stage,tell id I'm valid
    wire fifo_id_pc_taken;
    FIFO_ID u_FIFO_ID(
        .clk                 ( clk                 ),
        .rstn                ( aresetn             ),
        .fifo_id_flush       ( flush_to_fifo_id    ),
        .fifo_id_flush_cause ( 0                   ),  // TODO: To be completed
        .id_allowin          ( id_allowin          ),
        .id_readygo          ( id_readygo          ),
        // .fifo_allowin        ( fifo_allowin        ),
        // .fifo_readygo        ( fifo_readygo        ),
        .fifo_valid          ( fifo_valid          ),
        .fifo_ready          ( fifo_ready          ),
        .fifo_inst0          ( fifo_inst0          ),
        .fifo_inst1          ( fifo_inst1          ),
        .fifo_pc             ( fifo_pc             ),
        .fifo_pc_next        ( fifo_pc_next        ),
        .fifo_pcAdd          ( fifo_pcAdd          ),
        .fifo_pc_taken       ( fifo_pc_taken       ),
        .fifo_badv           ( fifo_badv           ),
        // .fifo_cookie_out     ( fifo_cookie_out     ),
        .fifo_exception      ( fifo_exception      ),
        .fifo_excp_flag      ( fifo_excp_flag      ),
        .fifo_priv_flag      ( fifo_priv_flag      ),
        .fifo_branch_flag    ( fifo_branch_flag    ),
        .fifo_id_inst0       ( fifo_id_inst0       ),
        .fifo_id_inst1       ( fifo_id_inst1       ),
        .fifo_id_pc          ( fifo_id_pc          ),
        .fifo_id_pcAdd       ( fifo_id_pcAdd       ),
        .fifo_id_pc_next     ( fifo_id_pc_next     ),
        .fifo_id_pc_taken    ( fifo_id_pc_taken    ),
        .fifo_id_badv        ( fifo_id_badv        ),
        // .fifo_id_cookie_out  ( fifo_id_cookie_out  ),
        .fifo_id_exception   ( fifo_id_exception   ),
        .fifo_id_excp_flag   ( fifo_id_excp_flag   ),
        .fifo_id_priv_flag   ( fifo_id_priv_flag   ),
        .fifo_id_branch_flag ( fifo_id_branch_flag )
    );


   
    wire  id_is_ALU_0;
    wire  id_is_ALU_1;
    wire  id_is_syscall_0;
    wire  id_is_syscall_1;
    wire  id_is_break_0;
    wire  id_is_break_1;
    wire  id_is_priviledged_0;
    wire  id_is_priviledged_1;
    wire  [`WIDTH_UOP-1:0] id_uop0;
    wire  [`WIDTH_UOP-1:0] id_uop1;
    wire  [31:0] id_imm0;
    wire  [31:0] id_imm1;
    wire  [4:0] id_rd0;
    wire  [4:0] id_rd1;
    wire  [4:0] id_rj0;
    wire  [4:0] id_rj1;
    wire  [4:0] id_rk0;
    wire  [4:0] id_rk1;

    id_stage u_id_stage(
        .aclk             ( clk             ),
        .aresetn          ( aresetn          ),
        .inst0            ( fifo_id_inst0            ),
        .inst1            ( fifo_id_inst1            ),
        // .pc0              ( fifo_id_pc              ),
        // .pc1              ( fifo_id_pcAdd              ),
        .is_ALU_0         ( id_is_ALU_0         ),
        .is_ALU_1         ( id_is_ALU_1         ),
        .is_syscall_0     ( id_is_syscall_0     ),
        .is_syscall_1     ( id_is_syscall_1     ),
        .is_break_0       ( id_is_break_0       ),
        .is_break_1       ( id_is_break_1       ),
        .is_priviledged_0 ( id_is_priviledged_0 ),
        .is_priviledged_1 ( id_is_priviledged_1 ),
        .uop0             ( id_uop0             ),
        .uop1             ( id_uop1             ),
        .imm0             ( id_imm0             ),
        .imm1             ( id_imm1             ),
        .rd0              ( id_rd0              ),
        .rd1              ( id_rd1              ),
        .rj0              ( id_rj0              ),
        .rj1              ( id_rj1              ),
        .rk0              ( id_rk0              ),
        .rk1              ( id_rk1              ),
        .invalid_instruction   (invalid_instruction)
    );





   

    wire reg_readygo;
    wire reg_allowin;
    wire [31:0] iq_pc0;
    wire [31:0] iq_pc1;
    wire [31:0] iq_pc_next;
    wire iq_pc_taken;
    wire [31:0] iq_inst0;
    wire [31:0] iq_inst1;
    wire [31:0] iq_badv;
    wire        iq_excp_flag;
    wire [6:0]  iq_exception;
    wire        iq_branch_flag;
    wire iq_is_ALU_0 ;
    wire iq_is_ALU_1 ;
    wire iq_is_syscall_0 ;
    wire iq_is_syscall_1 ;
    wire iq_is_break_0 ;
    wire iq_is_break_1 ;
    wire iq_is_priviledged_0 ;
    wire iq_is_priviledged_1 ;
    wire [`WIDTH_UOP-1:0] iq_uop0 ;
    wire [`WIDTH_UOP-1:0] iq_uop1 ;
    wire [31:0] iq_imm0 ;
    wire [31:0] iq_imm1 ;
    wire [4:0]  iq_rd0 ;
    wire [4:0]  iq_rd1 ;
    wire [4:0]  iq_rj0 ;
    wire [4:0]  iq_rj1 ;
    wire [4:0]  iq_rk0 ;
    wire [4:0]  iq_rk1 ;
    wire        CMT;
    
    ID_REG u_ID_REG(
        .aclk                 ( clk                    ),
        .aresetn              ( aresetn                 ),
        .flush                ( flush_to_id_reg         ),
        .id_readygo           ( id_readygo              ),
        .id_allowin           ( id_allowin              ),
        .reg_allowin          ( reg_allowin             ),
        .reg_readygo          ( reg_readygo             ),
        .fifo_id_inst0        ( fifo_id_inst0           ),
        .fifo_id_inst1        ( fifo_id_inst1           ),
        .fifo_id_pc0          ( fifo_id_pc              ),
        .fifo_id_pc1          ( fifo_id_pcAdd           ),
        .fifo_id_pc_next      ( fifo_id_pc_next         ),
        .fifo_id_pc_taken     ( fifo_id_pc_taken        ),
        .fifo_id_badv         ( fifo_id_badv            ),
        .fifo_id_excp_flag    ( fifo_id_excp_flag       ),
        .fifo_id_exception    ( fifo_id_exception       ),
        .fifo_id_priv_flag    ( fifo_id_priv_flag       ),
        .fifo_id_branch_flag  ( fifo_id_branch_flag     ),
        .is_ALU_0             ( id_is_ALU_0             ),
        .is_ALU_1             ( id_is_ALU_1             ),
        .is_syscall_0         ( id_is_syscall_0         ),
        .is_syscall_1         ( id_is_syscall_1         ),
        .is_break_0           ( id_is_break_0           ),
        .is_break_1           ( id_is_break_1           ),
        .is_priviledged_0     ( id_is_priviledged_0     ),
        .is_priviledged_1     ( id_is_priviledged_1     ),
        .invalid_instruction  (invalid_instruction      ),
        .uop0                 ( id_uop0                 ),
        .uop1                 ( id_uop1                 ),
        .imm0                 ( id_imm0                 ),
        .imm1                 ( id_imm1                 ),
        .rd0                  ( id_rd0                  ),
        .rd1                  ( id_rd1                  ),
        .rj0                  ( id_rj0                  ),
        .rj1                  ( id_rj1                  ),
        .rk0                  ( id_rk0                  ),
        .rk1                  ( id_rk1                  ),
        .iq_pc0               ( iq_pc0                  ),
        .iq_pc1               ( iq_pc1                  ),
        .CMT                  ( CMT                     ),
        .iq_pc_next           ( iq_pc_next              ),
        .iq_pc_taken          ( iq_pc_taken             ),
        .iq_inst0             ( iq_inst0                ),
        .iq_inst1             ( iq_inst1                ),
        .iq_badv              ( iq_badv                 ),
        .iq_excp_flag         ( iq_excp_flag            ),
        .iq_exception         ( iq_exception            ),
        .iq_branch_flag       ( iq_branch_flag          ),
        .iq_is_ALU_0          ( iq_is_ALU_0             ),
        .iq_is_ALU_1          ( iq_is_ALU_1             ),
        .iq_is_syscall_0      ( iq_is_syscall_0         ),
        .iq_is_syscall_1      ( iq_is_syscall_1         ),
        .iq_is_break_0        ( iq_is_break_0           ),
        .iq_is_break_1        ( iq_is_break_1           ),
        .iq_is_priviledged_0  ( iq_is_priviledged_0     ),
        .iq_is_priviledged_1  ( iq_is_priviledged_1     ),
        .iq_uop0              ( iq_uop0                 ),
        .iq_uop1              ( iq_uop1                 ),
        .iq_imm0              ( iq_imm0                 ),
        .iq_imm1              ( iq_imm1                 ),
        .iq_rd0               ( iq_rd0                  ),
        .iq_rd1               ( iq_rd1                  ),
        .iq_rj0               ( iq_rj0                  ),
        .iq_rj1               ( iq_rj1                  ),
        .iq_rk0               ( iq_rk0                  ),
        .iq_rk1               ( iq_rk1                  )
    );



    wire  ex_readygo;
    wire  we_0;
    wire  we_1;
    wire  we_2;

    wire [31:0] reg_ex_pc0;
    wire [31:0] reg_ex_pc1;
    wire        reg_ex_CMT;
    wire [31:0] reg_ex_pc_next;
    wire         reg_ex_pc_taken;
    wire [31:0] reg_ex_inst0;
    wire [31:0] reg_ex_inst1;
    wire reg_ex_branch_flag;
    wire reg_ex_excp_flag;
    wire [6:0] reg_ex_exception;
    wire [31:0] reg_ex_badv;
    wire reg_ex_is_ALU_0;
    wire reg_ex_is_ALU_1;
    wire reg_ex_is_syscall_0;
    wire reg_ex_is_syscall_1;
    wire reg_ex_is_break_0;
    wire reg_ex_is_break_1;
    wire reg_ex_is_priviledged_0;
    wire reg_ex_is_priviledged_1;
    wire [`WIDTH_UOP-1:0] reg_ex_uop0;
    wire [`WIDTH_UOP-1:0] reg_ex_uop1;
    wire [31:0] reg_ex_imm0;
    wire [31:0] reg_ex_imm1;
    wire [31:0] reg_ex_rj0_data;
    wire [31:0] reg_ex_rj1_data;
    wire [31:0] reg_ex_rk0_data;
    wire [31:0] reg_ex_rk1_data;
    wire [4:0]  reg_ex_rj0;
    wire [4:0]  reg_ex_rj1;
    wire [4:0]  reg_ex_rk0;
    wire [4:0]  reg_ex_rk1;
    wire [4:0]  reg_ex_rd0;
    wire [4:0]  reg_ex_rd1;
    wire [4:0] ex2_wb_rd0;
    wire [4:0] ex2_wb_rd1;
    wire [4:0] ex2_wb_rd2;
    wire [31:0] ex2_wb_data_0;
    wire [31:0] ex2_wb_data_1;
    wire [31:0] ex2_wb_data_2;

    wire        forward_stall ;
    wire        tlb_forward_stall ;
    
    `ifdef DIFFTEST
    wire [31:0] reg_diff[31:0];
    `endif
    wire forward_flag_j0;
    wire forward_flag_j1;
    wire forward_flag_k0;
    wire forward_flag_k1;
    wire [31:0] forward_data_j0;
    wire [31:0] forward_data_j1;
    wire [31:0] forward_data_k0;
    wire [31:0] forward_data_k1;

    wire tlb_forward_flag_j0;
    wire tlb_forward_flag_j1;
    wire tlb_forward_flag_k0;
    wire tlb_forward_flag_k1;
    wire [31:0] tlb_forward_data_j0;
    wire [31:0] tlb_forward_data_j1;
    wire [31:0] tlb_forward_data_k0;
    wire [31:0] tlb_forward_data_k1;

    wire [31:0]           tlb_ex_pc0;
    wire [31:0]           tlb_ex_pc1;
    wire [31:0]           tlb_ex_pc_next;
    wire                  tlb_ex_pc_taken;
    wire [31:0]           tlb_ex_inst0;
    wire [31:0]           tlb_ex_inst1;
    wire                  tlb_ex_branch_flag;
    wire                  tlb_ex_excp_flag;
    wire [6:0]            tlb_ex_exception;
    wire [31:0]           tlb_ex_badv;
    wire                  tlb_ex_is_ALU_0;
    wire                  tlb_ex_is_ALU_1;
    wire                  tlb_ex_is_syscall_0;
    wire                  tlb_ex_is_syscall_1;
    wire                  tlb_ex_is_break_0;
    wire                  tlb_ex_is_break_1;
    wire                  tlb_ex_is_priviledged_0;
    wire                  tlb_ex_is_priviledged_1;
    wire [`WIDTH_UOP-1:0] tlb_ex_uop0;
    wire [`WIDTH_UOP-1:0] tlb_ex_uop1;
    wire [31:0]           tlb_ex_imm0;
    wire [31:0]           tlb_ex_imm1;
    wire [31:0]           tlb_ex_rj0_data;
    wire [31:0]           tlb_ex_rj1_data;
    wire [31:0]           tlb_ex_rk0_data;
    wire [31:0]           tlb_ex_rk1_data;
    wire [4:0]            tlb_ex_rj0;
    wire [4:0]            tlb_ex_rj1;
    wire [4:0]            tlb_ex_rk0;
    wire [4:0]            tlb_ex_rk1;
    wire [4:0]            tlb_ex_rd0;
    wire [4:0]            tlb_ex_rd1;
    wire                  tlb_allowin;
    wire                  tlb_readygo;
    wire                  ex1_readygo;
    wire                  ex1_allowin;

    REG_EX1 u_REG_EX1(
        .clk                     ( clk                     ),
        .aresetn                 ( aresetn                 ),
        .flush                   ( flush_to_reg_ex1        ),
        // .flush_by_exception      ( flush_by_exception      ),
        .forward_stall           ( forward_stall | tlb_forward_stall         ),
        .reg_readygo             ( reg_readygo             ),
        .reg_allowin             ( reg_allowin             ),
        .ex_allowin              ( tlb_allowin              ),
        .ex_readygo              ( tlb_readygo              ),
        .flush_by_priv           ( flush_by_priv   | flush_by_exception        ),
        .id_reg_pc0              ( iq_pc0              ),
        .id_reg_pc1              ( iq_pc1              ),
        .id_reg_pc_next          ( iq_pc_next          ),
        .CMT                     ( CMT                 ),
        .id_reg_pc_taken         ( iq_pc_taken         ),
        .id_reg_inst0            ( iq_inst0            ),
        .id_reg_inst1            ( iq_inst1            ),
        .id_reg_exception        ( iq_exception        ),
        .id_reg_excp_flag        ( iq_excp_flag        ),
        .id_reg_branch_flag      ( iq_branch_flag      ),
        .id_reg_badv             ( iq_badv             ),
        .id_reg_is_ALU_0         ( iq_is_ALU_0         ),
        .id_reg_is_ALU_1         ( iq_is_ALU_1         ),
        .id_reg_is_syscall_0     ( iq_is_syscall_0     ),
        .id_reg_is_syscall_1     ( iq_is_syscall_1     ),
        .id_reg_is_break_0       ( iq_is_break_0       ),
        .id_reg_is_break_1       ( iq_is_break_1       ),
        .id_reg_is_priviledged_0 ( iq_is_priviledged_0 ),
        .id_reg_is_priviledged_1 ( iq_is_priviledged_1 ),
        .id_reg_uop0             ( iq_uop0             ),
        .id_reg_uop1             ( iq_uop1             ),
        .id_reg_imm0             ( iq_imm0             ),
        .id_reg_imm1             ( iq_imm1             ),
        .wb_rd0                  ( ex2_wb_rd0          ),
        .wb_rd1                  ( ex2_wb_rd1          ),
        .wb_rd2                  ( ex2_wb_rd2          ),
        .dcache_rready           ( rready_dcache           ),
        .we_0                    ( we_0                    ),
        
        .we_1                    ( we_1                    ),
        .we_2                    ( we_2                    ),
        .rd0_data                ( ex2_wb_data_0               ),
        .rd1_data                ( ex2_wb_data_1               ),
        .rd2_data                ( ex2_wb_data_2               ),
        .id_reg_rj0              ( iq_rj0              ),
        .id_reg_rj1              ( iq_rj1              ),
        .id_reg_rk0              ( iq_rk0              ),
        .id_reg_rk1              ( iq_rk1              ),
        .id_reg_rd0              ( iq_rd0              ),
        .id_reg_rd1              ( iq_rd1              ),
        .stall_D                 ( ~ex2_allowin                 ),
        .forward_flag_j0         ( forward_flag_j0     ),
        .forward_flag_j1         ( forward_flag_j1     ),
        .forward_flag_k0         ( forward_flag_k0     ),
        .forward_flag_k1         ( forward_flag_k1     ),
        .forward_data_j0        ( forward_data_j0     ),
        .forward_data_j1        ( forward_data_j1     ),
        .forward_data_k0        ( forward_data_k0     ),
        .forward_data_k1        ( forward_data_k1     ),
        .tlb_forward_flag_j0         ( tlb_forward_flag_j0         ),
        .tlb_forward_flag_k0         ( tlb_forward_flag_k0         ),
        .tlb_forward_flag_j1         ( tlb_forward_flag_j1         ),
        .tlb_forward_flag_k1         ( tlb_forward_flag_k1         ),
        .tlb_forward_data_j0         ( tlb_forward_data_j0         ),
        .tlb_forward_data_k0         ( tlb_forward_data_k0         ),
        .tlb_forward_data_j1         ( tlb_forward_data_j1         ),
        .tlb_forward_data_k1         ( tlb_forward_data_k1         ),
        .reg_ex_pc0              ( reg_ex_pc0              ),
        .reg_ex_pc1              ( reg_ex_pc1              ),
        .reg_ex_CMT              ( reg_ex_CMT              ),
        .reg_ex_pc_next          ( reg_ex_pc_next          ),
        .reg_ex_pc_taken         ( reg_ex_pc_taken         ),
        .reg_ex_inst0            ( reg_ex_inst0            ),
        .reg_ex_inst1            ( reg_ex_inst1            ),
        .reg_ex_branch_flag      ( reg_ex_branch_flag      ),
        .reg_ex_excp_flag        ( reg_ex_excp_flag        ),
        .reg_ex_exception        ( reg_ex_exception        ),
        .reg_ex_badv             ( reg_ex_badv             ),
        .reg_ex_is_ALU_0         ( reg_ex_is_ALU_0         ),
        .reg_ex_is_ALU_1         ( reg_ex_is_ALU_1         ),
        .reg_ex_is_syscall_0     ( reg_ex_is_syscall_0     ),
        .reg_ex_is_syscall_1     ( reg_ex_is_syscall_1     ),
        .reg_ex_is_break_0       ( reg_ex_is_break_0       ),
        .reg_ex_is_break_1       ( reg_ex_is_break_1       ),
        .reg_ex_is_priviledged_0 ( reg_ex_is_priviledged_0 ),
        .reg_ex_is_priviledged_1 ( reg_ex_is_priviledged_1 ),
        .reg_ex_uop0             ( reg_ex_uop0             ),
        .reg_ex_uop1             ( reg_ex_uop1             ),
        .reg_ex_imm0             ( reg_ex_imm0             ),
        .reg_ex_imm1             ( reg_ex_imm1             ),
        .reg_ex_rj0_data         ( reg_ex_rj0_data         ),
        .reg_ex_rj1_data         ( reg_ex_rj1_data         ),
        .reg_ex_rk0_data         ( reg_ex_rk0_data         ),
        .reg_ex_rk1_data         ( reg_ex_rk1_data         ),
        .reg_ex_rj0              ( reg_ex_rj0              ),
        .reg_ex_rj1              ( reg_ex_rj1              ),
        .reg_ex_rk0              ( reg_ex_rk0              ),
        .reg_ex_rk1              ( reg_ex_rk1              ),
        .reg_ex_rd0              ( reg_ex_rd0              ),
        .reg_ex_rd1              ( reg_ex_rd1              )
        `ifdef DIFFTEST
        ,.reg_diff0(reg_diff[0]),
    .reg_diff1(reg_diff[1]),
    .reg_diff2(reg_diff[2]),
    .reg_diff3(reg_diff[3]),
    .reg_diff4(reg_diff[4]),
    .reg_diff5(reg_diff[5]),
    .reg_diff6(reg_diff[6]),
    .reg_diff7(reg_diff[7]),
    .reg_diff8(reg_diff[8]),
    .reg_diff9(reg_diff[9]),
    .reg_diff10(reg_diff[10]),
    .reg_diff11(reg_diff[11]),
    .reg_diff12(reg_diff[12]),
    .reg_diff13(reg_diff[13]),
    .reg_diff14(reg_diff[14]),
    .reg_diff15(reg_diff[15]),
    .reg_diff16(reg_diff[16]),
    .reg_diff17(reg_diff[17]),
    .reg_diff18(reg_diff[18]),
    .reg_diff19(reg_diff[19]),
    .reg_diff20(reg_diff[20]),
    .reg_diff21(reg_diff[21]),
    .reg_diff22(reg_diff[22]),
    .reg_diff23(reg_diff[23]),
    .reg_diff24(reg_diff[24]),
    .reg_diff25(reg_diff[25]),
    .reg_diff26(reg_diff[26]),
    .reg_diff27(reg_diff[27]),
    .reg_diff28(reg_diff[28]),
    .reg_diff29(reg_diff[29]),
    .reg_diff30(reg_diff[30]),
    .reg_diff31(reg_diff[31]),
    .debug0_wb_inst          ( debug0_wb_inst          ),
        .stable_counter(stable_counter),
        . stable_counter_diff(rf_stable_counter)
        `endif
    );



    wire wen_csr;
    //前递用到的信号
    //从ex1_ex2段间输入
    wire [4:0] ex1_ex2_rd0;
    wire [4:0] ex1_ex2_rd1;
    wire [31:0] ex1_ex2_data_0;
    wire [31:0] ex1_ex2_data_1;
    wire ex1_ex2_data_0_valid; //可不可以前递，没算好不能前递
    wire ex1_ex2_data_1_valid;
    //从ex2_wb段间输入

    wire ex2_wb_data_0_valid;
    wire ex2_wb_data_1_valid;
    wire ex2_wb_data_2_valid;
    //csrfact_pc; //分支指令的pc
    //wire [31:0] fact;
    wire [31:0] tid; //读时钟id的指令RDCNTID用到

    //读时钟的指令RDCNTV(L/H)要用到，开始从cpu_top接进来;现在放在模块内了
    //wire [63:0] stable_counter;


    //给cache
    // wire cpu_d_rvalid;
    // wire cpu_d_wvalid;
    wire op_dcache; //0读1写
    wire [3:0] write_type_tlb, write_type_dcache; //写入类型;0b0001为byte;0b0011为half;0b1111为word
    wire [31:0] addr_dcache;
    wire [31:0] w_data_dcache, w_data_tlb;
    wire  is_atom_dcache;
   // output uncache, 由csr负责
    

    //给mul
    wire [31:0] mul_stage1_res_hh;
    wire [31:0] mul_stage1_res_hl;
    wire [31:0] mul_stage1_res_lh;
    wire [31:0] mul_stage1_res_ll;
    wire [31:0] mul_compensate;

    //给divider
    wire [31:0] quotient;
    wire [31:0] remainder;
    wire stall_divider;
    wire div_ready;

    //下面都是特权指令的
    wire privilege_ready;
    assign csr_done = privilege_ready & tlb_ex_uop0[`INS_CSR];
    assign tlb_done = privilege_ready & tlb_ex_uop0[`INS_TLB] & (tlb_ex_inst0[11:10] == 2'b00 || tlb_ex_inst0[11:10] ==2'b01 || tlb_ex_inst0[15]);
    //给csr
    wire [13:0] csr_addr;
    wire [31:0] csr_wdata;
    wire csr_wen;
    wire csr_ren;
    wire [31:0] csr_rdata;
    //给wb段
    wire [31:0] csr_rd_data;
    //CACOP
    wire [1:0] cacop_ins_type;
    wire [31:0] cacop_vaddr;
    wire cacop_i_en;
    wire cacop_d_en;
    wire cacop_i_ready;
    wire cacop_d_ready;
    wire cacop_i_done;
    wire cacop_d_done;
    //ERTN
    wire ertn_en;
    //idle
    wire block_cache;
    //TLB
    wire tlbsrch_ready;
    wire tlbsrch_valid;
    wire tlbrd_ready;
    wire tlbrd_valid;
    wire tlbwr_ready;
    wire tlbwr_valid;
    wire tlbfill_valid;
    wire tlbfill_ready;
    wire invtlb_ready;
    wire invtlb_valid;
    wire [4:0] invtlb_op;
    wire [31:0] invtlb_asid;
    wire [18:0] invtlb_va;

    //exception
    //wire  plv; //从csr_crmd[0]
    wire [31:0] ex1_badv;
    wire ex1_excp_flag ;
    wire [6:0] ex1_exception;

    wire [31:0] alu_result0, alu_result1;
    wire        alu_result0_valid, alu_result1_valid;
    //wire csr_flag_from_ex;

`ifdef DIFFTEST
    wire [31:0] vaddr_diff;
    wire [31:0] paddr_diff;
    wire [31:0] data_diff;
    wire [31:0] ex_vaddr_diff;
    wire [31:0] ex_paddr_diff;
    wire [31:0] ex_data_diff;
`endif
    wire rready_dcache;
    wire wready_dcache;

wire [31:0]    mb_alu_result0;
wire [31:0]    mb_alu_result1;
wire [0:0]     mb_alu_result0_valid;
wire [0:0]     mb_alu_result1_valid;
wire [31:0]    mb_mul_stage1_res_hh;
wire [31:0]    mb_mul_stage1_res_hl;
wire [31:0]    mb_mul_stage1_res_lh;
wire [31:0]    mb_mul_stage1_res_ll;
wire [31:0]    mb_mul_compensate;
// wire [31:0]    mb_quotient;
// wire [31:0]    mb_remainder;
// wire [0:0]     mb_stall_divider;
// wire [0:0]     mb_div_ready;
wire [31:0]    mb_badv_out;
wire [0:0]     mb_excp_flag;
wire [6:0]     mb_exception;
wire [31:0]    ex0_ex1_csr_data;

    MEMBUF u_MEMBUF(
        .clk                     ( clk                     ),
        .aresetn                 ( aresetn                 ),
        .flush                   ( flush_to_ex1_ex2        ),
        .forward_stall           ( forward_stall           ),
        .flush_by_exception           ( flush_by_exception           ),
        .tlb_readygo             ( tlb_readygo             ),
        .tlb_allowin             ( tlb_allowin             ),
        .ex_allowin              ( ex1_allowin              ),
        .ex_readygo              ( ex1_readygo              ),
        .reg_ex_pc0              ( reg_ex_pc0              ),
        .reg_ex_pc1              ( reg_ex_pc1              ),
        .reg_ex_pc_next          ( reg_ex_pc_next          ),
        .reg_ex_pc_taken         ( reg_ex_pc_taken         ),
        .reg_ex_inst0            ( reg_ex_inst0            ),
        .reg_ex_inst1            ( reg_ex_inst1            ),
        .reg_ex_branch_flag      ( reg_ex_branch_flag      ),
        .reg_ex_excp_flag        ( reg_ex_excp_flag        ),
        .reg_ex_exception        ( reg_ex_exception        ),
        .reg_ex_badv             ( reg_ex_badv             ),
        .reg_ex_is_ALU_0         ( reg_ex_is_ALU_0         ),
        .reg_ex_is_ALU_1         ( reg_ex_is_ALU_1         ),
        .reg_ex_is_syscall_0     ( reg_ex_is_syscall_0     ),
        .reg_ex_is_syscall_1     ( reg_ex_is_syscall_1     ),
        .reg_ex_is_break_0       ( reg_ex_is_break_0       ),
        .reg_ex_is_break_1       ( reg_ex_is_break_1       ),
        .reg_ex_is_priviledged_0 ( reg_ex_is_priviledged_0 ),
        .reg_ex_is_priviledged_1 ( reg_ex_is_priviledged_1 ),
        .privilege_ready      ( privilege_ready      ),
        .reg_ex_uop0             ( reg_ex_uop0             ),
        .reg_ex_uop1             ( reg_ex_uop1             ),
        .reg_ex_imm0             ( reg_ex_imm0             ),
        .reg_ex_imm1             ( reg_ex_imm1             ),
        .reg_ex_rj0_data         ( reg_ex_rj0_data         ),
        .reg_ex_rj1_data         ( reg_ex_rj1_data         ),
        .reg_ex_rk0_data         ( reg_ex_rk0_data         ),
        .reg_ex_rk1_data         ( reg_ex_rk1_data         ),
        .reg_ex_rj0              ( reg_ex_rj0              ),
        .reg_ex_rj1              ( reg_ex_rj1              ),
        .reg_ex_rk0              ( reg_ex_rk0              ),
        .reg_ex_rk1              ( reg_ex_rk1              ),
        .reg_ex_rd0              ( reg_ex_rd0              ),
        .reg_ex_rd1              ( reg_ex_rd1              ),
        .csr_rd_data             ( csr_rd_data             ),
        .ex0_ex1_csr_data       ( ex0_ex1_csr_data       ),

        .tlb_alu_result0          ( alu_result0          ),
        .tlb_alu_result1          ( alu_result1          ),
        .tlb_alu_result0_valid    ( alu_result0_valid    ),
        .tlb_alu_result1_valid    ( alu_result1_valid    ),
        .tlb_mul_stage1_res_hh    ( mul_stage1_res_hh    ),
        .tlb_mul_stage1_res_hl    ( mul_stage1_res_hl    ),
        .tlb_mul_stage1_res_lh    ( mul_stage1_res_lh    ),
        .tlb_mul_stage1_res_ll    ( mul_stage1_res_ll    ),
        .tlb_mul_compensate       ( mul_compensate       ),
        // .tlb_quotient             ( quotient             ),
        // .tlb_remainder            ( remainder            ),
        // .tlb_stall_divider        ( stall_divider        ),
        // .tlb_div_ready            ( div_ready            ),
        .tlb_badv_out             ( ex1_badv             ),
        .tlb_excp_flag        ( ex1_excp_flag        ),
        .tlb_exception        ( ex1_exception        ),
//OUT
        .ex1_alu_result0          ( mb_alu_result0          ),
        .ex1_alu_result1          ( mb_alu_result1          ),
        .ex1_alu_result0_valid    ( mb_alu_result0_valid    ),
        .ex1_alu_result1_valid    ( mb_alu_result1_valid    ),
        .ex1_mul_stage1_res_hh    ( mb_mul_stage1_res_hh    ),
        .ex1_mul_stage1_res_hl    ( mb_mul_stage1_res_hl    ),
        .ex1_mul_stage1_res_lh    ( mb_mul_stage1_res_lh    ),
        .ex1_mul_stage1_res_ll    ( mb_mul_stage1_res_ll    ),
        .ex1_mul_compensate       ( mb_mul_compensate       ),
        // .ex1_quotient             ( mb_quotient             ),
        // .ex1_remainder            ( mb_remainder            ),
        // .ex1_stall_divider        ( mb_stall_divider        ),
        // .ex1_div_ready            ( mb_div_ready            ),
        .ex1_badv_out             ( mb_badv_out             ),
        .ex1_excp_flag        ( mb_excp_flag        ),
        .ex1_exception        ( mb_exception        ),

        .ex1_ex2_rd0             ( ex1_ex2_rd0             ),
        .ex1_ex2_rd1             ( ex1_ex2_rd1             ),
        .ex1_ex2_data_0          ( ex1_ex2_data_0          ),
        .ex1_ex2_data_1          ( ex1_ex2_data_1          ),
        .ex1_ex2_data_0_valid    ( ex1_ex2_data_0_valid    ),
        .ex1_ex2_data_1_valid    ( ex1_ex2_data_1_valid    ),
        .ex2_wb_rd0              ( ex2_wb_rd0              ),
        .ex2_wb_rd1              ( ex2_wb_rd1              ),
        .ex2_wb_rd2              ( ex2_wb_rd2              ),
        .ex2_wb_data_0           ( ex2_wb_data_0           ),
        .ex2_wb_data_1           ( ex2_wb_data_1           ),
        .ex2_wb_data_2           ( ex2_wb_data_2           ),
        .ex2_wb_data_0_valid     ( ex2_wb_data_0_valid     ),
        .ex2_wb_data_1_valid     ( ex2_wb_data_1_valid     ),
        .ex2_wb_data_2_valid     ( ex2_wb_data_2_valid     ),
        .tlb_forward_stall       ( tlb_forward_stall       ),
        .forward_flag_j0         ( tlb_forward_flag_j0         ),
        .forward_flag_k0         ( tlb_forward_flag_k0         ),
        .forward_flag_j1         ( tlb_forward_flag_j1         ),
        .forward_flag_k1         ( tlb_forward_flag_k1         ),
        .forward_data_j0         ( tlb_forward_data_j0         ),
        .forward_data_k0         ( tlb_forward_data_k0         ),
        .forward_data_j1         ( tlb_forward_data_j1         ),
        .forward_data_k1         ( tlb_forward_data_k1         ),
        .op_dcache               ( op_dcache            ),
        .write_type_dcache       ( write_type_tlb    ),
        // .w_data_dcache           ( w_data_tlb           ),
        .is_atom_dcache          ( is_atom_dcache       ),

        .tlb_ex_pc0              ( tlb_ex_pc0              ),
        .tlb_ex_pc1              ( tlb_ex_pc1              ),
        .tlb_ex_pc_next          ( tlb_ex_pc_next          ),
        .tlb_ex_pc_taken         ( tlb_ex_pc_taken         ),
        .tlb_ex_inst0            ( tlb_ex_inst0            ),
        .tlb_ex_inst1            ( tlb_ex_inst1            ),
        .tlb_ex_branch_flag      ( tlb_ex_branch_flag      ),
        .tlb_ex_excp_flag        ( tlb_ex_excp_flag        ),
        .tlb_ex_exception        ( tlb_ex_exception        ),
        .tlb_ex_badv             ( tlb_ex_badv             ),
        .tlb_ex_is_ALU_0         ( tlb_ex_is_ALU_0         ),
        .tlb_ex_is_ALU_1         ( tlb_ex_is_ALU_1         ),
        .tlb_ex_is_syscall_0     ( tlb_ex_is_syscall_0     ),
        .tlb_ex_is_syscall_1     ( tlb_ex_is_syscall_1     ),
        .tlb_ex_is_break_0       ( tlb_ex_is_break_0       ),
        .tlb_ex_is_break_1       ( tlb_ex_is_break_1       ),
        .tlb_ex_is_priviledged_0 ( tlb_ex_is_priviledged_0 ),
        .tlb_ex_is_priviledged_1 ( tlb_ex_is_priviledged_1 ),
        .tlb_ex_uop0             ( tlb_ex_uop0             ),
        .tlb_ex_uop1             ( tlb_ex_uop1             ),
        .tlb_ex_imm0             ( tlb_ex_imm0             ),
        .tlb_ex_imm1             ( tlb_ex_imm1             ),
        .tlb_ex_rj0_data         ( tlb_ex_rj0_data         ),
        .tlb_ex_rj1_data         ( tlb_ex_rj1_data         ),
        .tlb_ex_rk0_data         ( tlb_ex_rk0_data         ),
        .tlb_ex_rk1_data         ( tlb_ex_rk1_data         ),
        .tlb_ex_rj0              ( tlb_ex_rj0              ),
        .tlb_ex_rj1              ( tlb_ex_rj1              ),
        .tlb_ex_rk0              ( tlb_ex_rk0              ),
        .tlb_ex_rk1              ( tlb_ex_rk1              ),
        .tlb_ex_rd0              ( tlb_ex_rd0              ),
        .tlb_ex_rd1              ( tlb_ex_rd1              )
    );
    wire flush_by_exception;
    EX0 u_EX0(
        .clk                  ( clk                  ),
        .aclk                 ( aclk                 ),
        .aresetn              ( aresetn              ),
        .flush                ( flush_from_ex1              ),
        .set_by_priv         ( set_by_priv          ),
        .flush_by_exception        ( flush_by_exception       ),
        .pc_set_by_priv         ( pc_set_by_priv        ),
        .csr_era                ( csr_era                ),
        .forward_flag_j0         ( forward_flag_j0     ),
        .forward_flag_j1         ( forward_flag_j1     ),
        .forward_flag_k0         ( forward_flag_k0     ),
        .forward_flag_k1         ( forward_flag_k1     ),
        .forward_data_j0        ( forward_data_j0     ),
        .forward_data_j1        ( forward_data_j1     ),
        .forward_data_k0        ( forward_data_k0     ),
        .forward_data_k1        ( forward_data_k1     ),
        .dcache_addr           ( addr_dcache         ),
        .dcache_wdata          ( w_data_tlb       ),
        .dcache_ready       (wready_dcache | rready_dcache),
        .pc0                  ( reg_ex_pc0                  ),
        .pc1                  ( reg_ex_pc1                  ),
        .CMT                   ( reg_ex_CMT                 ),
        .inst0                ( reg_ex_inst0                ),
        .inst1                ( reg_ex_inst1                ),
        .is_ALU_0             ( reg_ex_is_ALU_0             ),
        .is_ALU_1             ( reg_ex_is_ALU_1             ),
        .is_syscall_0         ( reg_ex_is_syscall_0         ),
        .is_syscall_1         ( reg_ex_is_syscall_1         ),
        .is_break_0           ( reg_ex_is_break_0           ),
        .is_break_1           ( reg_ex_is_break_1           ),
        .is_priviledged_0     ( reg_ex_is_priviledged_0     ),
        .is_priviledged_1     ( reg_ex_is_priviledged_1     ),
        .uop0                 ( reg_ex_uop0                 ),
        .uop1                 ( reg_ex_uop1                 ),
        .imm0                 ( reg_ex_imm0                 ),
        .imm1                 ( reg_ex_imm1                 ),
        .rj0_data             ( reg_ex_rj0_data             ),
        .rj1_data             ( reg_ex_rj1_data             ),
        .rk0_data             ( reg_ex_rk0_data             ),
        .rk1_data             ( reg_ex_rk1_data             ),
        .ex_rj0               ( reg_ex_rj0               ),
        .ex_rj1               ( reg_ex_rj1               ),
        .ex_rk0               ( reg_ex_rk0               ),
        .ex_rk1               ( reg_ex_rk1               ),

        .ibar                 ( ibar                 ),
        .csr_flag_from_ex     ( csr_flag_from_ex     ),
        .tlb_flag_from_ex     ( tlb_flag_from_ex     ),
        .predict_to_branch    ( reg_ex_pc_taken       ),
        .pc0_predict          ( reg_ex_pc_next          ),
        .predict_dir_fail     ( predict_dir_fail     ),
        .predict_addr_fail    ( predict_add_fail     ),
        .fact_taken           ( fact_taken           ),
        .fact_pc              ( fact_pc              ),
        .fact_tpc             ( fact_tpc             ),
        .tid                  ( tid                  ),
        .privilege_ready      ( privilege_ready      ),
        .flush_by_priv        ( flush_by_priv        ),

        .alu_result0_valid    ( alu_result0_valid    ),
        .alu_result1_valid    ( alu_result1_valid    ),
        .mb_ex_rd0          ( tlb_ex_rd0          ),
        .mb_ex_rd1          ( tlb_ex_rd1          ),
        .mb_ex_data_0       ( mb_alu_result0       ),
        .mb_ex_data_1       ( mb_alu_result1       ),
        .mb_ex_data_0_valid ( mb_alu_result0_valid ),
        .mb_ex_data_1_valid ( mb_alu_result1_valid ),
        .ex1_ex2_rd0          ( ex1_ex2_rd0          ),
        .ex1_ex2_rd1          ( ex1_ex2_rd1          ),
        .ex1_ex2_data_0       ( ex1_ex2_data_0       ),
        .ex1_ex2_data_1       ( ex1_ex2_data_1       ),
        .ex1_ex2_data_0_valid ( ex1_ex2_data_0_valid ),
        .ex1_ex2_data_1_valid ( ex1_ex2_data_1_valid ),
        .ex2_wb_rd0           ( ex2_wb_rd0           ),
        .ex2_wb_rd1           ( ex2_wb_rd1           ),
        .ex2_wb_rd2           ( ex2_wb_rd2           ),
        .ex2_wb_data_0        ( ex2_wb_data_0        ),
        .ex2_wb_data_1        ( ex2_wb_data_1        ),
        .ex2_wb_data_2        ( ex2_wb_data_2        ),
        .ex2_wb_data_0_valid  ( ex2_wb_data_0_valid  ),
        .ex2_wb_data_1_valid  ( ex2_wb_data_1_valid  ),
        .ex2_wb_data_2_valid  ( ex2_wb_data_2_valid         ),
        .forward_stall        ( forward_stall        ),

        .alu_result0          ( alu_result0          ),
        .alu_result1          ( alu_result1          ),
        .mul_stage1_res_hh    ( mul_stage1_res_hh    ),
        .mul_stage1_res_hl    ( mul_stage1_res_hl    ),
        .mul_stage1_res_lh    ( mul_stage1_res_lh    ),
        .mul_stage1_res_ll    ( mul_stage1_res_ll    ),
        .mul_compensate       ( mul_compensate       ),
        .quotient             ( quotient             ),
        .remainder            ( remainder            ),
        .stall_divider        ( stall_divider        ),
        .div_ready            ( div_ready            ),
        .badv_out             ( ex1_badv             ),
        .excp_flag_out        ( ex1_excp_flag        ),
        .exception_out        ( ex1_exception        ),

        .csr_addr             ( csr_addr             ),
        .csr_wdata            ( csr_wdata            ),
        .csr_wen              ( csr_wen              ),
        .csr_ren              ( csr_ren              ),
        .csr_rdata            ( csr_rdata            ),
        .csr_rd_data          ( csr_rd_data          ),
        .cacop_ins_type       ( cacop_ins_type       ),
        .cacop_vaddr          ( cacop_vaddr          ),
        .cacop_i_en           ( cacop_i_en           ),
        .cacop_d_en           ( cacop_d_en           ),
        .cacop_i_ready        ( cacop_i_ready        ),
        .cacop_d_ready        ( cacop_d_ready        ),
        .cacop_i_done         ( cacop_i_done         ),
        .cacop_d_done         ( cacop_d_done         ),
        .ertn_en              ( ertn_en              ),
        .i_idle               ( i_idle               ),
        .d_idle               ( d_idle               ),
        .block_cache          ( block_cache          ),
        .block_clock          ( block_clock          ),
        .tlbsrch_ready        ( tlbsrch_ready        ),
        .tlbsrch_valid        ( tlbsrch_valid        ),
        .tlbrd_ready          ( tlbrd_ready          ),
        .tlbrd_valid          ( tlbrd_valid          ),
        .tlbwr_ready          ( tlbwr_ready          ),
        .tlbwr_valid          ( tlbwr_valid          ),
        .tlbfill_ready        ( tlbfill_ready        ),
        .tlbfill_valid        ( tlbfill_valid        ),
        .invtlb_ready         ( invtlb_ready         ),
        .invtlb_valid         ( invtlb_valid         ),
        .invtlb_op            ( invtlb_op            ),
        .invtlb_asid          ( invtlb_asid          ),
        .invtlb_va            ( invtlb_va            ),
        .plv                  ( crmd[0]                  ),
        .excp_flag_in         ( reg_ex_excp_flag         ),
        .exception_in         ( reg_ex_exception         ),
        .badv_in              ( reg_ex_badv              ),
        .stable_counter       ( stable_counter       )
        `ifdef DIFFTEST
        ,.vaddr_diff_in(vaddr_diff),
        .paddr_diff_in(paddr_diff),
        .data_diff_in(data_diff),
        .vaddr_diff_out(ex_vaddr_diff),
        .paddr_diff_out(ex_paddr_diff),
        .data_diff_out(ex_data_diff),
        .ex_stable_counter(ex_stable_counter),
        .ex1_allowin(tlb_allowin)
`endif
    );

    
    //wire  flush_out;
    wire   ex2_allowin;
    wire   ex2_readygo;
    wire [31:0] ex2_data_0, ex2_data_1;
    wire   ex2_data_0_valid, ex2_data_1_valid;


    wire  [31:0] ex1_ex2_pc0;
    wire  [31:0] ex1_ex2_pc1;
    wire  [31:0] ex1_ex2_inst0;
    wire  [31:0] ex1_ex2_inst1;

    wire  [`WIDTH_UOP-1:0] ex1_ex2_uop0;
    wire  [`WIDTH_UOP-1:0] ex1_ex2_uop1;
    wire  [31:0] ex1_ex2_imm0;
    wire  [31:0] ex1_ex2_imm1;
    wire  [4:0] ex1_ex2_rj0;
    wire  [4:0] ex1_ex2_rj1;
    wire  [4:0] ex1_ex2_rk0;
    wire  [4:0] ex1_ex2_rk1;
    wire  [31:0] ex1_ex2_mul_stage1_res_hh;
    wire  [31:0] ex1_ex2_mul_stage1_res_hl;
    wire  [31:0] ex1_ex2_mul_stage1_res_lh;
    wire  [31:0] ex1_ex2_mul_stage1_res_ll;
    wire  [31:0] ex1_ex2_mul_compensate;



    //从ex1接入 exception相关
    wire   [31:0] ex1_ex2_badv;      
    wire   ex1_ex2_excp_flag; 
    wire   [6:0] ex1_ex2_exception; 
    wire ex1_ex2_is_priviledged_0 ;
    wire csr_ren_ex2;
    wire [31:0] ex1_data_out_0, ex1_data_out_1;
    wire ex1_data_out_0_valid, ex1_data_out_1_valid;

    EX1_EX2 u_EX1_EX2(
        .clk                       ( clk                       ),
        .aresetn                   ( aresetn                   ),
        .flush_in                  ( flush_to_ex1_ex2                  ),
        .ex1_readygo               ( ex1_readygo               ),
        .ex1_allowin               ( ex1_allowin               ),
        .ex2_allowin               ( ex2_allowin               ),
        .ex2_readygo               ( ex2_readygo               ),
        .reg_ex1_pc0               ( tlb_ex_pc0               ),
        .reg_ex1_pc1               ( tlb_ex_pc1               ),
        .reg_ex1_inst0             ( tlb_ex_inst0             ),
        .reg_ex1_inst1             ( tlb_ex_inst1             ),
        .ex0_ex1_csr_data          ( ex0_ex1_csr_data          ),
        .csr_ren_ex1               ( csr_ren                   ),
        .csr_ren_ex2               ( csr_ren_ex2               ),
        .reg_ex1_uop0              ( tlb_ex_uop0              ),
        .reg_ex1_uop1              ( tlb_ex_uop1              ),
        .reg_ex1_imm0              ( tlb_ex_imm0              ),
        .reg_ex1_imm1              ( tlb_ex_imm1              ),
        .reg_ex1_is_priviledged_0  ( tlb_ex_is_priviledged_0  ),
        .reg_ex1_is_priviledged_1  ( tlb_ex_is_priviledged_1  ),
        .ex2_wb_excp_flag        (ex2_wb_excp_flag),
        .reg_ex1_rj0               ( tlb_ex_rj0               ),
        .reg_ex1_rj1               ( tlb_ex_rj1               ),
        .reg_ex1_rk0               ( tlb_ex_rk0               ),
        .reg_ex1_rk1               ( tlb_ex_rk1               ),
        .reg_ex1_rd0               ( tlb_ex_rd0               ),
        .reg_ex1_rd1               ( tlb_ex_rd1               ),
        // .mul_stage1_res_hh         ( ex1_ex2_mul_stage1_res_hh         ),
        // .mul_stage1_res_hl         ( ex1_ex2_mul_stage1_res_hl         ),
        // .mul_stage1_res_lh         ( ex1_ex2_mul_stage1_res_lh         ),
        // .mul_stage1_res_ll         ( ex1_ex2_mul_stage1_res_ll         ),
        // .mul_compensate            ( ex1_ex2_mul_compensate            ),
        .ex1_ex2_pc0               ( ex1_ex2_pc0               ),
        .ex1_ex2_pc1               ( ex1_ex2_pc1               ),
        .ex1_ex2_inst0             ( ex1_ex2_inst0             ),
        .ex1_ex2_inst1             ( ex1_ex2_inst1             ),
        .ex1_ex2_uop0              ( ex1_ex2_uop0              ),
        .ex1_ex2_uop1              ( ex1_ex2_uop1              ),
        .ex1_ex2_imm0              ( ex1_ex2_imm0              ),
        .ex1_ex2_imm1              ( ex1_ex2_imm1              ),
        .ex1_ex2_rj0               ( ex1_ex2_rj0               ),
        .ex1_ex2_rj1               ( ex1_ex2_rj1               ),
        .ex1_ex2_rk0               ( ex1_ex2_rk0               ),
        .ex1_ex2_rk1               ( ex1_ex2_rk1               ),
        .ex1_ex2_rd0               ( ex1_ex2_rd0               ),
        .ex1_ex2_rd1               ( ex1_ex2_rd1               ),
        .ex1_ex2_is_priviledged_0  ( ex1_ex2_is_priviledged_0  ),
        // .ex1_ex2_mul_stage1_res_hh ( ex1_ex2_mul_stage1_res_hh ),
        // .ex1_ex2_mul_stage1_res_hl ( ex1_ex2_mul_stage1_res_hl ),
        // .ex1_ex2_mul_stage1_res_lh ( ex1_ex2_mul_stage1_res_lh ),
        // .ex1_ex2_mul_stage1_res_ll ( ex1_ex2_mul_stage1_res_ll ),
        // .ex1_ex2_mul_compensate    ( ex1_ex2_mul_compensate    ),
        .alu_result0               ( ex1_data_out_0               ),
        .alu_result1               ( ex1_data_out_1               ),
        .alu_result0_valid         ( ex1_data_out_0_valid         ),
        .alu_result1_valid         ( ex1_data_out_1_valid         ),
        .ex1_ex2_data_0            ( ex1_ex2_data_0            ),
        .ex1_ex2_data_1            ( ex1_ex2_data_1            ),
        .ex1_ex2_data_0_valid      ( ex1_ex2_data_0_valid      ),
        .ex1_ex2_data_1_valid      ( ex1_ex2_data_1_valid      ),
        .badv_in                   ( mb_badv_out                   ),
        .excp_flag_in              ( mb_excp_flag              ),
        .exception_in              ( mb_exception              ),
        .d_exception               ( dcache_exception           ),
        .d_badv                    ( dcache_badv               ),
        .ex1_ex2_badv              ( ex1_ex2_badv              ),
        .ex1_ex2_excp_flag         ( ex1_ex2_excp_flag         ),
        .ex1_ex2_exception         ( ex1_ex2_exception         ),
        .quotient            ( quotient            ),
        .remainder           ( remainder           ),
        .stall_divider       ( stall_divider       ),
        .div_ready           ( div_ready           )
    );



    wire [31:0] ex2_rd0_data;
    wire [31:0] ex2_rd1_data;
    wire       ex2_data0_valid;
    wire       ex2_data1_valid;

    EX1 u_EX1(
        .uop0                 ( tlb_ex_uop0                 ),
        .uop1                 ( tlb_ex_uop1                 ),
        .ex1_ex2_data_0       ( mb_alu_result0       ),
        .ex1_ex2_data_1       ( mb_alu_result1       ),
        .ex1_ex2_data_0_valid ( mb_alu_result0_valid ),
        .ex1_ex2_data_1_valid ( mb_alu_result1_valid ),
        .mul_stage1_res_hh    ( mb_mul_stage1_res_hh    ),
        .mul_stage1_res_hl    ( mb_mul_stage1_res_hl    ),
        .mul_stage1_res_lh    ( mb_mul_stage1_res_lh    ),
        .mul_stage1_res_ll    ( mb_mul_stage1_res_ll    ),
        .mul_compensate       ( mb_mul_compensate       ),
        .rd0_data             ( ex1_data_out_0         ),
        .rd1_data             ( ex1_data_out_1         ),
        .ex2_data0_valid      ( ex1_data_out_0_valid      ),
        .ex2_data1_valid      ( ex1_data_out_1_valid      )
    );

    //dcache
    wire [31:0] r_data_dcache;

    //csr 三条读写csr的指令都要写
    //wire [31:0] csr_data_in;
    wire csr_ready;


    //exception
    //wire [31:0] csr_estat; //从csr
    //wire [31:0] csr_crmd;
    
    wire [6:0] ex2_wb_exception; 
    wire [31:0] ex2_wb_badv;      
    wire  wen_badv;
    wire tlb_exception; //决定是否回到直接地址翻译
    wire [31:0] era_out;
    wire wen_era;
    wire [18:0] vppn_out;
    wire wen_vppn;
    wire cpu_interrupt;
    wire dcache_valid;
    
    wire [31:0] eentry;
    wire [31:0] tlbrentry;
    wire [4:0]  rd_dcache_in;
    wire [4:0]  rd_dcache_out;
    wire [31:0] pc_dcache_in;
    wire [31:0] pc_dcache_out; // TODO 没做
    wire [31:0] inst_dcache_in;
    wire [31:0] inst_dcache_out;
    wire flush_to_priv_wr_csr;
    wire exception_cpu_interrupt;
    EX2_WB u_EX2_WB(
        .clk                 ( clk                 ),
        .aresetn             ( aresetn             ),
        // .flush_in            ( flush_to_ex2_wb            ),
        .flush_to_tlb        ( flush_to_tlb        ),
        .flush_out_all       ( flush_from_wb       ),
        .ex2_allowin         ( ex2_allowin         ),
        .csr_ren_ex2         ( csr_ren_ex2         ),
        .pc0                 ( ex1_ex2_pc0                 ),
        .pc1                 ( ex1_ex2_pc1                 ),
        .ex1_ex2_inst0       ( ex1_ex2_inst0       ),
        .ex1_ex2_inst1       ( ex1_ex2_inst1       ),
        .uop0                ( ex1_ex2_uop0                ),
        .uop1                ( ex1_ex2_uop1                ),
        .ex2_result0         ( ex1_ex2_data_0         ),
        .ex2_result1         ( ex1_ex2_data_1         ),
        .flush_by_exception        ( flush_by_exception        ),
        .flush_to_priv_wr_csr ( flush_to_priv_wr_csr ),
        .reg_ex1_is_priviledeged_0 ( reg_ex_is_priviledged_0 ),
        // .reg_ex1_is_priviledged_1 ( reg_ex_is_priviledged_1 ),
        .reg_ex1_pc0         ( tlb_ex_pc0         ),
        .wen_csr             (  wen_csr          ),
        // .pc_dcache_out       ( pc_dcache_out       ), 
        // .inst_dcache_out     ( inst_dcache_out     ),
        // .inst_dcache_in      ( inst_dcache_in      ),
        .exception_cpu_interrupt ( exception_cpu_interrupt ),
        .ex_rd0              ( ex1_ex2_rd0              ),
        .ex_rd1              ( ex1_ex2_rd1              ),
        .ex2_result0_valid   ( ex1_ex2_data_0_valid   ),
        .ex2_result1_valid   ( ex1_ex2_data_1_valid   ),
        // .EN_VA_D         (  tlb_ex_uop0[`INS_MEM]         ), 
        .ex2_wb_data_0       ( ex2_wb_data_0       ),
        .ex2_wb_data_1       ( ex2_wb_data_1       ),
        .ex2_wb_data_2       ( ex2_wb_data_2       ),
        .ex2_wb_data_0_valid ( ex2_wb_data_0_valid ),
        .ex2_wb_data_1_valid ( ex2_wb_data_1_valid ),
        .ex2_wb_data_2_valid ( ex2_wb_data_2_valid ),
        .ex2_wb_rd0          ( ex2_wb_rd0          ),
        .rd_dcache_out       ( rd_dcache_out       ),
        .ex2_wb_rd1          ( ex2_wb_rd1          ),
        .ex2_wb_rd2          ( ex2_wb_rd2          ),
        .ex2_wb_we0          ( we_0          ),
        .ex2_wb_we1          ( we_1          ),
        .ex2_wb_we2          ( we_2          ),
        .dcache_data         ( r_data_dcache         ),
        .dcache_ready        ( wready_dcache | rready_dcache        ),
        .dcache_w_ready      ( rready_dcache        ),
        .csr_data_in         ( csr_rd_data          ),
        .csr_ready           ( privilege_ready           ),
        .debug0_wb_pc        ( debug0_wb_pc        ),
        .debug0_wb_rf_wen    ( debug0_wb_rf_wen    ),
        .debug0_wb_rf_wnum   ( debug0_wb_rf_wnum   ),
        .debug0_wb_rf_wdata  ( debug0_wb_rf_wdata  ),
        .debug0_wb_inst      ( debug0_wb_inst      ),
        .debug0_valid         ( debug0_valid         ),
        .debug1_wb_pc        ( debug1_wb_pc        ),
        .debug1_wb_rf_wen    ( debug1_wb_rf_wen    ),
        .debug1_wb_rf_wnum   ( debug1_wb_rf_wnum   ),
        .debug1_wb_rf_wdata  ( debug1_wb_rf_wdata  ),
        .debug1_wb_inst      ( debug1_wb_inst      ),
        .debug1_valid         ( debug1_valid         ),
        //.csr_estat           ( csr_estat           ),
        //.csr_crmd            ( csr_crmd            ),
        .ecode_in            ( ex1_ex2_exception            ),
        .exception_flag_in   ( ex1_ex2_excp_flag   ),
        .badv_in             ( ex1_ex2_badv             ),
        .ecode_out           ( ex2_wb_exception           ),
        .exception_flag_out  ( ex2_wb_excp_flag  ),
        .badv_out            ( ex2_wb_badv           ),
        .wen_badv            ( wen_badv            ),
        .tlb_exception       ( tlb_exception       ),
        .csr_era                  (csr_era),
        .era_in              ( ex1_ex2_pc0         ),
        .cpu_interrupt        ( cpu_interrupt        ),
        .era_out             ( era_out             ),
        .wen_era             ( wen_era             ),
        .vppn_out            ( vppn_out            ),
        .wen_vppn            ( wen_vppn            ),
        .pc_from_WB          ( pc_from_WB          ),
        .eentry              ( eentry              ),
        .tlbrentry           ( tlbrentry           )
    );


    

    wire [31:0] crmd; //当前模式信息，包含privilege
    wire [31:0] estat;    //例外状态 idle_interrupt; 
    wire [31:0] csr_era;
    wire [31:0] pgdl,pgdh;
    
    wire [31:0] dmw0;
    wire [31:0] dmw1;
    wire llbit;
    //TLB输出
    //待定
    wire PG;
    wire [2:0] DMW0_PSEG;
    wire [2:0] DMW1_PSEG;
    wire [2:0] DMW0_VSEG;
    wire [2:0] DMW1_VSEG;
    wire [31:0] ASID;
    wire [31:0] TLBEHI;
    
    wire     [`TLB_CPRLEN - 1:0]     tlb_cpr_out;    
    wire     [`TLB_TRANSLEN - 1:0]   tlb_trans_1_out;
    wire     [`TLB_TRANSLEN - 1:0]   tlb_trans_2_out;

   
    // wire [`PGD_BASE] pgd_base_in; //页表基址
    // wire wen_pgd_base; //写入页表基址
    //wire [18:0] tlbehi_vppn_in;
    //wire wen_tlbehi_vppn;
    wire llbit_set;
    wire llbit_clear;
    wire tlbsrch_hit; //TLBSRCH是否命中
    wire [4:0] tlb_index_in; //TLB命中的索引   最高位是hit，后面不要了

    wire tlbrd_hit;
    wire     [`TLB_CPRLEN - 1:0]     tlbrd_cpr;    
    wire     [`TLB_TRANSLEN - 1:0]   tlbrd_trans_1;
    wire     [`TLB_TRANSLEN - 1:0]   tlbrd_trans_2;
    wire  [31:0] TLBIDX;



    csr u_csr(
        .clk             ( clk             ),
        .aclk            ( aclk            ),
        .aresetn         ( aresetn         ),
        .d_idle          ( d_idle          ),
        .addr_in            ( csr_addr       ),
        .rdata           ( csr_rdata           ),
        .wen_in             ( csr_wen             ),
        .wdata_in           ( csr_wdata           ),
        .wen_csr                 ( wen_csr                 ),
        .crmd            ( crmd            ),
        .estat           ( estat           ),
        .era_out         ( csr_era        ),
        .eentry          ( eentry          ),
        .tlbrentry       ( tlbrentry       ),
        .pgdl            ( pgdl            ),
        .pgdh            ( pgdh            ),
        .cpu_interrupt   ( cpu_interrupt    ),
        .dmw0            ( dmw0            ),
        .dmw1            ( dmw1            ),
        .llbit           ( llbit           ),
        .idle_over       ( idle_over       ),
        .PG              ( PG              ),
        .flush_to_priv_wr_csr ( flush_to_priv_wr_csr ),
        .DMW0_PSEG       ( DMW0_PSEG       ),
        .DMW1_PSEG       ( DMW1_PSEG       ),
        .DMW0_VSEG       ( DMW0_VSEG       ),
        .DMW1_VSEG       ( DMW1_VSEG       ),
        .ASID            ( ASID            ),
        .TLBEHI          ( TLBEHI          ),
        .TLBIDX          ( TLBIDX          ),
        .tlb_cpr_out     ( tlb_cpr_out     ),
        .tlb_trans_1_out ( tlb_trans_1_out ),
        .tlb_trans_2_out ( tlb_trans_2_out ),
        .exception       ( ex2_wb_excp_flag       ),
        .ertn            ( ertn_en            ),
        .tlb_exception   ( tlb_exception   ),
        .expcode_in      ( ex2_wb_exception      ),
        .wen_expcode     ( ex2_wb_excp_flag     ),
        .era_in          ( era_out          ),
        .wen_era         ( wen_era         ),
        .badv_in         ( ex2_wb_badv         ),
        .wen_badv        ( wen_badv        ),
        .llbit_set       ( llbit_set       ),
        .llbit_clear     ( llbit_clear     ),
        .tlbsrch_ready   ( tlbsrch_ready   ),
        .tlbsrch_hit     ( tlbsrch_hit     ),
        .tlb_index_in    ( tlb_index_in    ),
        .tlbrd_ready     ( tlbrd_ready     ),
        .tlbrd_hit       ( tlbrd_hit       ),
        .tlbrd_cpr       ( tlbrd_cpr       ),
        .tlbrd_trans_1   ( tlbrd_trans_1   ),
        .tlbrd_trans_2   ( tlbrd_trans_2   ),
        .hardware_interrupt  ( intrpt      ),
        .tid             ( tid             )

         `ifdef DIFFTEST
        ,
        .crmd_diff      (csr_crmd_diff     ),
        .prmd_diff      (csr_prmd_diff     ),
        .ectl_diff      (csr_ectl_diff     ),
        .estat_diff     (csr_estat_diff    ),
        .era_diff       (csr_era_diff      ),
        .badv_diff      (csr_badv_diff     ),
        .eentry_diff    (csr_eentry_diff   ),
        .tlbidx_diff    (csr_tlbidx_diff   ),
        .tlbehi_diff    (csr_tlbehi_diff   ),
        .tlbelo0_diff   (csr_tlbelo0_diff  ),
        .tlbelo1_diff   (csr_tlbelo1_diff  ),
        .asid_diff      (csr_asid_diff     ),
        .pgdl_diff      (csr_pgdl_diff     ),
        .pgdh_diff      (csr_pgdh_diff     ),
        .save0_diff     (csr_save0_diff    ),
        .save1_diff     (csr_save1_diff    ),
        .save2_diff     (csr_save2_diff    ),
        .save3_diff     (csr_save3_diff    ),
        .tid_diff       (csr_tid_diff      ),
        .tcfg_diff      (csr_tcfg_diff     ),
        .tval_diff      (csr_tval_diff     ),
        .ticlr_diff     (csr_ticlr_diff    ),
        .llbctl_diff    (csr_llbctl_diff   ),
        .tlbrentry_diff (csr_tlbrentry_diff),
        .dmw0_diff      (csr_dmw0_diff     ),
        .dmw1_diff      (csr_dmw1_diff     )
        `endif
    );

    BTB u_BTB(
        .rstn             ( aresetn             ),
        .if0_allowin      ( if0_allowin      ),
        .clk              ( clk              ),
        .inst_btype       ( inst_btype       ),
        .inst_index       ( inst_index       ),
        .fetch_pc         ( fetch_pc         ),
        .pred_pc          ( pred_pc          ),
        .pred_taken       ( pred_taken       ),
        .fact_pc          ( fact_pc          ),
        .fact_tpc         ( fact_tpc         ),
        .fact_taken       ( fact_taken       ),
        .predict_dir_fail ( predict_dir_fail ),
        .predict_add_fail ( predict_add_fail )
    );

    
    //sram
    wire     [31:0]      i_raddr;        //指令cache读地址
    wire     [511:0]     i_rdata;        //指令cache读数据
    wire                 i_rvalid;       //指令cache读有效
    wire                 i_rready;       //指令cache读准备好
    wire     [7:0]       i_rlen;         //指令cache读长度
    wire     [31:0]      d_raddr;        //数据cache读地址
    wire     [511:0]     d_rdata;        //数据cache读数据
    wire                 d_rvalid;       //数据cache读有效
    wire                 d_rready;       //数据cache读准备好
    wire     [7:0]       d_rlen;         //数据cache读长度
    wire     [31:0]      d_waddr;        //数据cache写地址
    wire     [511:0]     d_wdata;        //数据cache写数据
    wire                 d_wvalid;       //数据cache写有效
    wire                 d_wready;       //数据cache写准备好
    wire     [7:0]       d_wlen;         //数据cache写长度
    wire     [3:0]       d_wstrb;        //数据cache写使能


    // cache和tlb相关信号
    wire [31:0] PA_I, PA_D; //物理地址
    wire is_cached_I, is_cached_D; //是否经过cache
    wire [6:0] tlb_exception_code_i, tlb_exception_code_d; //tlb例外码

    // wire [31:0] icache_raddr, dcache_addr;
    wire signed_ext, is_atom_TLB, SOL_D_OUT;
    // reg icache_ravlid_valid;
    // always@(posedge clk)begin
    //     if(!aresetn)
    //         icache_ravlid_valid <= 0;
    //     else
    //         icache_ravlid_valid <= if1_allowin;
    // end
    
    icache#(
        .INDEX_WIDTH       ( 6 ),
        .WORD_OFFSET_WIDTH ( 4 ),
        .COOKIE_WIDTH      ( 32+1 )
    )u_icache(
        .clk               ( clk               ),
        .rstn              ( aresetn           ),
        .rvalid            ( icache_rvalid     ),
        .rready            ( icache_rready     ),
        .raddr             ( icache_raddr      ),
        .p_addr            ( PA_I              ),
        .rdata             ( icache_rdata      ),
        .pc_out            ( pc_out            ),
        .idle              ( i_idle            ),
        .i_rvalid          ( i_rvalid          ),
        .i_rready          ( i_rready          ), 
        .i_raddr           ( i_raddr           ), 
        .i_rdata           ( i_rdata           ), 
        .i_rlen            ( i_rlen            ),    
        .tlb_exception     ( tlb_exception_code_i ),  
        .badv              ( icache_badv       ),
        .exception         ( icache_exception  ),
        .i_exception_flag  ( icache_excp_flag  ),   
        .flush             ( flush_to_icache   ),
        .uncache           ( !is_cached_I      ),   
        .cookie_in         ( {tlb_pc_next,tlb_pc_taken}         ),
        .cookie_out        ( {icache_pc_next, pc_taken_out}        ),
        .cacop_en          ( cacop_i_en        ),
        .cacop_code        ( cacop_ins_type    ),
        .cacop_ready       ( cacop_i_ready     ),
        .cacop_complete    ( cacop_i_done      ),
        .ibar              ( ibar              )
    );



    dcache#(
        .INDEX_WIDTH                       ( 6 ),
        .WORD_OFFSET_WIDTH                 ( 4 ),
        .COOKIE_WIDTH                      ( 5+64 )
    )u_dcache(
        .clk                               ( clk                               ),
        .rstn                              ( aresetn                           ),
        .addr                              ( cacop_d_en ? cacop_vaddr : dcache_addr ),
        .p_addr                            ( PA_D                              ),   
        .rvalid                            ( dcache_valid & ~SOL_D_OUT & ~flush_by_exception  ),
        .rready                            ( rready_dcache                     ),
        .rdata                             ( r_data_dcache                     ),
        .wvalid                            ( dcache_valid & SOL_D_OUT & ~flush_by_exception   ),
        .wready                            ( wready_dcache                     ),
        .wdata                             ( w_data_dcache                     ),
        .wstrb                             ( write_type_dcache                    ),   
        .op                                ( SOL_D_OUT                         ),
        .uncache                           ( !is_cached_D                      ),  
        .signed_ext                        ( signed_ext                        ),
        .idle                              ( d_idle                            ),
        //.flush                             ( flush_to_dcache                   ),//TODO 逻辑有问题
        .flush                             ( 0                  ),
        .cookie_in                        ( {rd_dcache_in,pc_dcache_in,inst_dcache_in}                          ),
        .cookie_out                      ( {rd_dcache_out,pc_dcache_out,inst_dcache_out}                  ),
        .d_rvalid                          ( d_rvalid                          ),
        .d_rready                          ( d_rready                          ),
        .d_raddr                           ( d_raddr                           ),
        .d_rdata                           ( d_rdata                           ),
        .d_rlen                            ( d_rlen                            ),
        .d_wvalid                          ( d_wvalid                          ),
        .d_wready                          ( d_wready                          ),
        .d_waddr                           ( d_waddr                           ),
        .d_wdata                           ( d_wdata                           ),
        .d_wstrb                           ( d_wstrb                           ),
        .d_wlen                            ( d_wlen                            ),
        .exception                         ( dcache_exception                  ),  
        .exception_flag                    ( reg_ex_excp_flag                  ),   
        //.d_exception_flag                  ( /*d_exception_flag*/0             ),  
        .forward_exception                 ( reg_ex_exception                  ),  
        .tlb_exception                     ( tlb_exception_code_d              ),  
        .badv                              ( dcache_badv                       ),  
        .cacop_en                          ( cacop_d_en                        ),
        .cacop_code                        ( cacop_ins_type                    ),
        .cacop_ready                       ( cacop_d_ready                     ),
        .cacop_complete                    ( cacop_d_done                      ),
        .is_atom                           ( is_atom_TLB                       ),
        .llbit_set                         ( llbit_set                         ),
        .llbit                             ( llbit                             ),
        .llbit_clear                       ( llbit_clear                       ),
        .ibar                              ( ibar                              )
        `ifdef DIFFTEST
        ,.vaddr_diff     (vaddr_diff),
        .paddr_diff     (paddr_diff),
        .data_diff      (data_diff)
`endif
    );

wire [3:0]reg_ex_cond0;

assign reg_ex_cond0=reg_ex_uop0[`UOP_COND];
    TLB#(
        .TLB_COOKIE_WIDTH (33)
        ) u_TLB(
        .clk            ( clk            ),
        .rstn           ( aresetn           ),
        .flush          ( flush_to_tlb      ),
        .flush_to_reg_ex1 ( flush_to_reg_ex1 ),
        .CSR_ASID       ( ASID[9:0]   ),
        .CSR_VPPN       ( TLBEHI       ),
        .CSR_PG         ( PG         ),
        .CSR_CRMD       ( crmd       ),
        .CSR_DMW0       ( dmw0       ),
        .CSR_DMW1       ( dmw1       ),
        .CSR_TLBEHI     ( TLBEHI     ),
        .CSR_TLBIDX     ( TLBIDX     ),
        .stall_i        ( pc_in_stall        ),
        .stall_d        ( ~ex2_allowin       ),
        .en_d           ( reg_ex_uop0[`INS_MEM] && tlb_readygo && tlb_allowin     ),//todo: flush
        .VA_I           ( fetch_pc[31:12]   ),
        .VA_D           ( addr_dcache[31:12]           ),
        .signed_ext     (reg_ex_uop0[`UOP_SIGN] ),
        .signed_ext_out ( signed_ext    ),
        .atom           ( is_atom_dcache),
        .atom_out       ( is_atom_TLB   ),
        // .tlb_cookie_in  ({reg_ex_pc0, reg_ex_inst0}),
        // .tlb_cookie_out ({pc_dcache_in, inst_dcache_in}),
        .tlb_cookie_in   ( {pc_taken,pc_next}),
        .tlb_cookie_out  ( {tlb_pc_taken,tlb_pc_next}),
        .rd                 (reg_ex_rd0),
        .rd_out             (rd_dcache_in),
        .WDATA_D           ( w_data_tlb),
        .WDATA_D_OUT       ( w_data_dcache),
        .WSTRB_D           ( write_type_tlb),
        .WSTRB_D_OUT       ( write_type_dcache),
        .TAG_OFFSET_I   ( fetch_pc[11:0] ),
        .TAG_OFFSET_D   (addr_dcache[11:0]),
        .PA_I           ( PA_I[31:12]           ),
        .PA_D           ( PA_D[31:12]          ),
        .is_cached_I    ( is_cached_I    ),
        .is_cached_D    ( is_cached_D    ),
        .en_VA_I_OUT    ( icache_rvalid  ),
        .en_VA_D_OUT    ( dcache_valid   ),
        .VA_I_OUT       ( icache_raddr[31:12]   ),
        .VA_D_OUT       ( dcache_addr[31:12]    ),
        .VA_TAG_OFFSET_I_OUT(icache_raddr[11:0]),
        .VA_TAG_OFFSET_D_OUT( dcache_addr[11:0]),
        .PA_TAG_OFFSET_I_OUT(PA_I[11:0]),
        .PA_TAG_OFFSET_D_OUT(PA_D[11:0]),
        .SOL_D_OUT      ( SOL_D_OUT        ),
        .TLBSRCH_valid  ( tlbsrch_valid    ),
        .TLBSRCH_ready  ( tlbsrch_ready    ),
        .TLBSRCH_hit    ( tlbsrch_hit      ),
        .TLBSRCH_INDEX  ( tlb_index_in     ),
        .TLBRD_INDEX    ( TLBIDX[4:0]      ),
        .TLBRD_valid    ( tlbrd_valid      ),
        .TLBRD_ready    ( tlbrd_ready      ),
        .TLBRD_hit      ( tlbrd_hit        ),
        .TLB_CPR        ( tlbrd_cpr        ),
        .TLB_TRANS_1    ( tlbrd_trans_1    ),
        .TLB_TRANS_2    ( tlbrd_trans_2    ),
        .TLBWR_valid    ( tlbwr_valid      ),
        .TLBWR_ready    ( tlbwr_ready      ),
        .TLBFILL_valid  ( tlbfill_valid    ),
        .TLBFILL_ready  ( tlbfill_ready    ),
        .TLB_CPR_w      ( tlb_cpr_out      ),
        .TLB_TRANS_1_w  ( tlb_trans_1_out  ),
        .TLB_TRANS_2_w  ( tlb_trans_2_out  ),
        .TLBINVLD_valid ( invtlb_valid     ),
        .TLBINVLD_ready ( invtlb_ready     ),
        .TLBINVLD_OP    ( invtlb_op        ),
        .TLBINVLD_ASID  ( invtlb_asid[9:0] ),
        .TLBINVLD_VA    ( invtlb_va        ),
        .store_or_load  ( reg_ex_cond0[2]  ),
        .plv_1bit         (crmd[0]         ),
        .tlb_exception_code_i(tlb_exception_code_i),
        .tlb_exception_code_d(tlb_exception_code_d),
        .stable_counter ( stable_counter[4:0])
    );


    sram_axi u_sram_axi(
        .aclk     ( clk     ),
        .aresetn  ( aresetn  ),
        .ar_id    ( arid     ),
        .ar_addr  ( araddr   ),
        .ar_len   ( arlen    ),
        .ar_size  ( arsize   ),
        .ar_burst ( arburst  ),
        .ar_valid ( arvalid  ),
        .ar_ready ( arready  ),
        .r_id     ( rid      ),
        .r_data   ( rdata    ),
        .r_last   ( rlast    ),
        .r_valid  ( rvalid   ),
        .r_ready  ( rready   ),
        .aw_addr  ( awaddr   ),
        .aw_size  ( awsize   ),
        .aw_len   ( awlen    ),
        .aw_burst ( awburst  ),
        .aw_valid ( awvalid  ),
        .aw_ready ( awready  ),
        .w_data   ( wdata    ),
        .w_valid  ( wvalid   ),
        .w_ready  ( wready   ),
        .w_last   ( wlast    ),
        .w_strb   ( wstrb    ),
        .b_valid  ( bvalid   ),
        .b_ready  ( bready   ),
        .i_raddr  ( i_raddr  ),
        .i_rdata  ( i_rdata  ),
        .i_rvalid ( i_rvalid ),
        .i_rready ( i_rready ),
        .i_rlen   ( i_rlen   ),
        .d_raddr  ( d_raddr  ),
        .d_rdata  ( d_rdata  ),
        .d_rvalid ( d_rvalid ),
        .d_rready ( d_rready ),
        .d_rlen   ( d_rlen   ),
        .d_waddr  ( d_waddr  ),
        .d_wdata  ( d_wdata  ),
        .d_wvalid ( d_wvalid ),
        .d_wready ( d_wready ),
        .d_wlen   ( d_wlen   ),
        .d_wstrb  ( d_wstrb  )
    );


    HazardUnit u_HazardUnit(
        .flush_from_wb          ( flush_from_wb         ),
        .flush_from_ex2         ( flush_from_ex2        ),
        .flush_from_ex1         ( flush_from_ex1        ),
        .flush_from_reg         ( flush_from_reg        ),
        .flush_from_id          ( flush_from_id         ),
        .flush_by_priv           ( flush_by_priv         ),
        .flush_from_if1_fifo    ( flush_from_if1_fifo   ),
        .flush_from_if1         ( flush_from_if1        ),
        .flush_to_ex2_wb        ( flush_to_ex2_wb       ),
        .flush_to_ex1_ex2       ( flush_to_ex1_ex2      ),
        .flush_to_reg_ex1       ( flush_to_reg_ex1      ),
        .flush_to_id_reg        ( flush_to_id_reg       ),
        .flush_to_fifo_id       ( flush_to_fifo_id      ),
        .flush_to_fifo          ( flush_to_fifo         ),
        .flush_to_if1_fifo      ( flush_to_if1_fifo     ),
        .flush_to_if0_if1       ( flush_to_if0_if1      ),
        .flush_to_if0           ( flush_to_if0          ),
        .flush_to_tlb           ( flush_to_tlb          ),
        .flush_to_icache        ( flush_to_icache       ),
        .flush_to_dcache        ( flush_to_dcache       ),
        .flush_to_btb           ( flush_to_btb          )
    );

`ifdef DIFFTEST
    reg cmt_valid0,cmt_valid1;
    reg [31:0] cmt_pc0,cmt_pc1;
    reg [31:0] cmt_inst0,cmt_inst1;
    reg cmt_wen0,cmt_wen1;
    reg [4:0] cmt_wdest0,cmt_wdest1;
    reg [31:0] cmt_wdata0,cmt_wdata1;
    reg cmt_excp_valid;
    reg [5:0] cmt_ecode;
    reg [63:0] cmt_stable_counter;
    reg [`TLBIDX_WIDTH-1:0] fill_index_diff;
    reg [31:0]cmt_vaddr_diff;
    reg [31:0]cmt_paddr_diff;
    reg [31:0]cmt_data_diff;
    wire ex_eu0_en;
    wire ex_eu1_en;
    assign ex_eu0_en=debug0_valid;
    assign ex_eu1_en=debug1_valid;
    reg [31:0] debug0_pc_reg;
    reg [31:0] debug1_pc_reg;
    always @(posedge clk)
    begin
        if(debug0_valid&&!set_pc_from_WB && debug0_wb_inst[31:0]!=`INST_NOP 
                                && debug0_wb_pc != 0 )
            debug0_pc_reg<=debug0_wb_pc;
        if(debug1_valid&&!set_pc_from_WB && debug1_wb_inst[31:0]!=`INST_NOP 
                                && debug1_wb_pc != 0 )
            debug1_pc_reg<=debug1_wb_pc;
        else if(~debug1_valid)
            debug1_pc_reg<=0;
        if(tlbfill_valid)
            fill_index_diff<=stable_counter[`TLBIDX_WIDTH-1:0];
    end
    wire noequal;
    assign noequal = (debug0_pc_reg != debug0_wb_pc || debug0_wb_inst == 32'h5000_0000);

    always @(posedge clk)
        if(tlbfill_valid)
            fill_index_diff<=stable_counter[`TLBIDX_WIDTH-1:0];

    always @(posedge aclk)
        if(~aresetn) begin
            {cmt_valid0,cmt_valid1,cmt_pc0,cmt_pc1,cmt_inst0,cmt_inst1,cmt_wen0,cmt_wen1,cmt_wdest0,
            cmt_wdest1,cmt_wdata0,cmt_wdata1,cmt_excp_valid,cmt_ecode,cmt_vaddr_diff,cmt_paddr_diff,cmt_data_diff}<=0;
        end else begin
            //防止出现eu0不提交但eu1提交
            cmt_stable_counter <= ex_stable_counter;
            if(ex_eu0_en==0&&ex_eu1_en!=0) begin
                cmt_valid0  <= debug0_valid&&!set_pc_from_WB && debug0_wb_inst[31:0]!=`INST_NOP 
                                && debug0_wb_pc != 0 
                                && (debug0_pc_reg != debug0_wb_pc || debug0_wb_inst == 32'h5000_0000);
                cmt_pc0     <= debug1_wb_pc;
                cmt_inst0   <= debug1_wb_inst;
                cmt_wen0    <= debug1_wb_rf_wen!=0;
                cmt_wdest0  <= debug1_wb_rf_wnum;
                cmt_wdata0  <= debug1_wb_rf_wdata;
                cmt_excp_valid<=0;
                cmt_ecode   <= 0;
                cmt_valid1  <= 0;
            end else begin
                //有异常时不置valid
                cmt_valid0  <= debug0_valid&&!set_pc_from_WB && debug0_wb_inst[31:0]!=`INST_NOP 
                                && debug0_wb_pc != 0 
                                && (debug0_pc_reg != debug0_wb_pc || debug0_wb_inst == 32'h5000_0000);
                cmt_pc0     <= debug0_wb_pc;
                cmt_inst0   <= debug0_wb_inst;
                cmt_wen0    <= debug0_wb_rf_wen!=0;
                cmt_wdest0  <= debug0_wb_rf_wnum;
                cmt_wdata0  <= debug0_wb_rf_wdata;
                cmt_excp_valid<=set_pc_from_WB && debug0_wb_pc != 0 | exception_cpu_interrupt;
                cmt_ecode   <= ex2_wb_exception[5:0];

                cmt_valid1  <= debug1_valid&&!set_pc_from_WB && debug1_wb_inst[31:0]!=`INST_NOP
                && debug1_wb_pc != 0 && (debug1_pc_reg != debug1_wb_pc || debug1_wb_inst == 32'h5000_0000);
                cmt_pc1     <= debug1_wb_pc;
                cmt_inst1   <= debug1_wb_inst;
                cmt_wen1    <= debug1_wb_rf_wen!=0;
                cmt_wdest1  <= debug1_wb_rf_wnum;
                cmt_wdata1  <= debug1_wb_rf_wdata;
                cmt_vaddr_diff<=ex_vaddr_diff;
                cmt_paddr_diff<=ex_paddr_diff;
                cmt_data_diff<=ex_data_diff;
            end
        end

    DifftestInstrCommit DifftestInstrCommit0
    (
        .clock(aclk),
        .coreid(0),
        .index(0),
        .valid(cmt_valid0),
        //.pc({32'd0,cmt_pc0}),
        .pc(cmt_pc0),
        .instr(cmt_inst0),
        .skip(0),
        .is_TLBFILL(cmt_inst0[31:10]=='b0000011001001000001101),
        .TLBFILL_index(fill_index_diff),
        .is_CNTinst(cmt_inst0[31:11]=='b000000000000000001100),
        .timer_64_value(cmt_stable_counter),
        .wen(cmt_wen0),
        .wdest({3'd0,cmt_wdest0}),
        .wdata({32'd0,cmt_wdata0}),
        .csr_rstat(cmt_inst0[31:24]=='b00000100&&cmt_inst0[23:10]==5),
        .csr_data(reg_diff[cmt_inst0[4:0]])
    );

    DifftestInstrCommit DifftestInstrCommit1
    (
        .clock(aclk),
        .coreid(0),
        .index(1),
        .valid(cmt_valid1),
        //.pc({32'd0,cmt_pc1}),
        .pc(cmt_pc1),
        .instr(cmt_inst1),
        .skip(0),
        .is_TLBFILL(0),
        .TLBFILL_index(0),
        .is_CNTinst(cmt_inst1[31:11]=='b000000000000000001100),
        .timer_64_value(cmt_stable_counter),
        .wen(cmt_wen1),
        .wdest({3'd0,cmt_wdest1}),
        .wdata({32'd0,cmt_wdata1}),
        .csr_rstat(0),
        .csr_data(0)
    );

    DifftestExcpEvent DifftestExcpEvent
    (
        .clock(aclk),
        .coreid(0),
        .excp_valid(cmt_excp_valid),
        .eret(cmt_inst0=='b00000110010010000011100000000000),
        .intrNo(csr_estat_diff[12:2]),
        .cause(cmt_ecode),
        .exceptionPC({32'd0,cmt_pc0}),
        .exceptionInst(cmt_inst0)
    );
    
    DifftestTrapEvent DifftestTrapEvent
    (
        .clock(aclk),
        .coreid(0),
        .valid(0),
        .code(0),
        .pc(0),
        .cycleCnt(0),
        .instrCnt(0)
    );
    wire [31:0]cmt_data_diff_trimmed;
    assign cmt_data_diff_trimmed=cmt_inst0[31:22] == 10'b0010100100 ?
                                (cmt_paddr_diff[1:0]==0 ?
                                    ({24'b0,cmt_data_diff[7:0]}):
                                    (cmt_paddr_diff[1:0]==1 ?
                                        ({16'b0,cmt_data_diff[7:0],8'b0}):
                                        (cmt_paddr_diff[1:0]==2 ?
                                            ({8'b0,cmt_data_diff[7:0],16'b0}):
                                            ({cmt_data_diff[7:0],24'b0})))):
                                (cmt_inst0[31:22] == 10'b0010100101 ?
                                    (cmt_paddr_diff[1]==0 ?
                                        ({16'b0,cmt_data_diff[15:0]}):
                                        ({cmt_paddr_diff[15:0],16'b0})):
                                    (cmt_data_diff));

    wire [7:0] store_en_diff = {4'b0, csr_llbctl_diff[0] && (cmt_inst0[31:24] == 8'b00100001), cmt_inst0[31:22] == 10'b0010100110, 
                cmt_inst0[31:22] == 10'b0010100101, cmt_inst0[31:22] == 10'b0010100100};
    wire [7:0] load_en_diff = {2'b0, cmt_inst0[31:24] == 8'b00100000, cmt_inst0[31:22] == 10'b0010100010, 
                cmt_inst0[31:22] == 10'b0010101001, cmt_inst0[31:22] == 10'b0010100001,
                cmt_inst0[31:22] == 10'b0010101000, cmt_inst0[31:22] == 10'b0010100000};

    DifftestStoreEvent DifftestStoreEvent
    (
        .clock(aclk),
        .coreid(0),
        .index(0),
        //.valid(store_en_diff),
        // .storePAddr(cmt_paddr_diff),
        // .storeVAddr(cmt_vaddr_diff),
        // .storeData(  cmt_data_diff_trimmed)
        .valid(0),
        .storePAddr(0),
        .storeVAddr(0),
        .storeData(0)
    );

    DifftestLoadEvent DifftestLoadEvent
    (
        .clock(aclk),
        .coreid(0),
        .index(0),
        .valid(load_en_diff),
        .paddr(cmt_paddr_diff),
        .vaddr(cmt_vaddr_diff)
        // .valid(0),
        // .paddr(0),
        // .vaddr(0)
    );

    DifftestGRegState DifftestGRegState(
        .clock              (aclk       ),
        .coreid             (0          ),
        .gpr_0              (0          ),
        .gpr_1              (reg_diff[1]    ),
        .gpr_2              (reg_diff[2]    ),
        .gpr_3              (reg_diff[3]    ),
        .gpr_4              (reg_diff[4]    ),
        .gpr_5              (reg_diff[5]    ),
        .gpr_6              (reg_diff[6]    ),
        .gpr_7              (reg_diff[7]    ),
        .gpr_8              (reg_diff[8]    ),
        .gpr_9              (reg_diff[9]    ),
        .gpr_10             (reg_diff[10]   ),
        .gpr_11             (reg_diff[11]   ),
        .gpr_12             (reg_diff[12]   ),
        .gpr_13             (reg_diff[13]   ),
        .gpr_14             (reg_diff[14]   ),
        .gpr_15             (reg_diff[15]   ),
        .gpr_16             (reg_diff[16]   ),
        .gpr_17             (reg_diff[17]   ),
        .gpr_18             (reg_diff[18]   ),
        .gpr_19             (reg_diff[19]   ),
        .gpr_20             (reg_diff[20]   ),
        .gpr_21             (reg_diff[21]   ),
        .gpr_22             (reg_diff[22]   ),
        .gpr_23             (reg_diff[23]   ),
        .gpr_24             (reg_diff[24]   ),
        .gpr_25             (reg_diff[25]   ),
        .gpr_26             (reg_diff[26]   ),
        .gpr_27             (reg_diff[27]   ),
        .gpr_28             (reg_diff[28]   ),
        .gpr_29             (reg_diff[29]   ),
        .gpr_30             (reg_diff[30]   ),
        .gpr_31             (reg_diff[31]   )
    );

    DifftestCSRRegState DifftestCSRRegState(
        .clock              (aclk             ),
        .coreid             (0                ),
        .crmd               (csr_crmd_diff    ),
        .prmd               (csr_prmd_diff    ),
        .euen               (0                ),
        .ecfg               (csr_ectl_diff    ),
        .estat              (csr_estat_diff   ),
        .era                (csr_era_diff     ),
        .badv               (csr_badv_diff    ),
        .eentry             (csr_eentry_diff  ),
        .tlbidx             (csr_tlbidx_diff  ),
        .tlbehi             (csr_tlbehi_diff  ),
        .tlbelo0            (csr_tlbelo0_diff ),
        .tlbelo1            (csr_tlbelo1_diff ),
        .asid               (csr_asid_diff    ),
        .pgdl               (csr_pgdl_diff    ),
        .pgdh               (csr_pgdh_diff    ),
        .save0              (csr_save0_diff   ),
        .save1              (csr_save1_diff   ),
        .save2              (csr_save2_diff   ),
        .save3              (csr_save3_diff   ),
        .tid                (csr_tid_diff     ),
        .tcfg               (csr_tcfg_diff    ),
        .tval               (csr_tval_diff    ),
        .ticlr              (csr_ticlr_diff   ),
        .llbctl             (csr_llbctl_diff  ),
        .tlbrentry          (csr_tlbrentry_diff),
        .dmw0               (csr_dmw0_diff    ),
        .dmw1               (csr_dmw1_diff    )
    );
`endif
endmodule
