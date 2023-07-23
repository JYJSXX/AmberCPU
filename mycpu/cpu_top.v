`include "define.vh"
`include "../TLB/TLB.vh"
`include "../config.vh"
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
    output [31:0] debug0_wb_inst,
    output debug0_valid,    // TODO:

    output [31:0] debug1_wb_pc,
    output [ 3:0] debug1_wb_rf_wen,
    output [ 4:0] debug1_wb_rf_wnum,
    output [31:0] debug1_wb_rf_wdata,
    output [31:0] debug1_wb_inst,
    output debug1_valid         // TODO:
);

    assign {arlock, arcache, arprot, awlock, awcache, awprot} = 0;
    assign {awid, wid} = 8'hff;
    wire clk;
    assign clk=aclk; //TODO:idle的时钟没写，暂时用clk代替

    wire i_idle;
    wire d_idle;

    /*
    TODO:
    Flush signal 相关全都没做
    */
    wire flush_from_wb;         
    wire flush_from_ex2;
    wire flush_from_ex1;
    wire flush_from_reg;
    wire flush_from_id;
    wire flush_from_fifo;
    wire flush_from_if1;

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
    wire [31:0]pc_from_WB;
    wire set_pc_from_PRIV;//from if1_fifo
    wire [31:0]pc_from_PRIV;

    //for BTB
    wire [31:0]  pred_pc;
    wire         pred_taken;
    wire [31:0]  fetch_pc;
    //for tlb
    wire         tlb_rvalid;
    wire [31:0]  tlb_raddr;
    wire [31:0]  cookie_in;

    
    wire [31:0]  pc_next;//rready control logic : use a tmp to store inst temporarily
    wire         pc_in_stall;
    IF0 u_IF0(
        .clk                 ( clk                 ),
        .rstn                ( aresetn             ),
        .if0_readygo         ( if0_readygo         ),
        .if0_allowin         ( if0_allowin         ),
        .flush               ( flush_to_if0        ),
        .set_pc_from_ID      ( set_pc_from_ID      ),
        .pc_from_ID          ( pc_from_ID          ),
        .set_pc_from_EX      ( fact_taken          ),
        .pc_from_EX          ( fact_tpc            ),
        .set_pc_from_WB      ( set_pc_from_WB      ),
        .pc_from_WB          ( pc_from_WB          ),
        .set_pc_from_PRIV    ( set_pc_from_PRIV    ),
        .pc_from_PRIV        ( pc_from_PRIV        ),
        .pred_pc             ( pred_pc             ),
        .pred_taken          ( pred_taken          ),
        .fetch_pc            ( fetch_pc            ),
        .rvalid              ( tlb_rvalid          ),
        .raddr               ( tlb_raddr           ),
        .cookie_in           ( cookie_in           ),
        .pc_next             ( pc_next             ),
        .pc_in_stall         ( pc_in_stall         )
    );

    //hand shake

    wire               if1_readygo;
    wire               if1_allowin;
    wire               flush_cause;
    wire               icache_rready;

    wire [31:0]        if0_if1_pc;
    wire [31:0]        if0_if1_pc_next;
    wire               if0_if1_tlb_rvalid;

    IF0_IF1 u_IF0_IF1(
        .clk                    ( clk              ),
        .rstn                   ( aresetn          ),
        .if0_readygo            ( if0_readygo      ),
        .if0_allowin            ( if0_allowin      ),
        .if1_readygo            ( if1_readygo      ),
        .if1_allowin            ( if1_allowin      ),
        .flush                  ( flush_to_if0_if1 ),
        .flush_cause            ( flush_cause      ),   // TODO: To be completed
        .rready                 ( icache_rready    ),
        .tlb_rvalid             ( tlb_rvalid       ),
        .if0_if1_tlb_rvalid     ( if0_if1_tlb_rvalid),
        .fetch_pc               ( fetch_pc         ),
        .pc_next                ( pc_next          ),
        .if0_if1_pc             ( if0_if1_pc       ),
        .if0_if1_pc_next        ( if0_if1_pc_next  )
    );

    
    //hand shake
    wire if1_valid;
    wire if1_ready ;     
    wire [31:0] icache_badv;
    wire [31:0] dcache_badv;
    wire [6:0] icache_exception;
    wire [6:0] dcache_exception;
    wire [1:0] icache_excp_flag;
    wire [31:0] cookie_out;
    // wire cacop_ready;
    // wire cacop_complete;

    wire [63:0]       icache_rdata;   //指令cache读数据


    wire if1_rready;
    wire [31:0]if1_pc;
    wire [31:0]if1_pc_next;
    wire [31:0]if1_badv;
    wire [6:0] if1_exception;
    wire [1:0] if1_excp_flag;//TODO :alert icache to pass this signal
    wire [31:0]if1_cookie_out;
    // wire     if1_cacop_ready;
    // wire     if1_cacop_complete;
    wire [31:0] if1_inst0;
    wire [31:0] if1_inst1;
    IF1 u_IF1(
        .clk                ( clk                ),
        .rstn               ( aresetn               ),
        .if1_readygo        ( if1_readygo          ),
        .if1_allowin        ( if1_allowin         ),
        .if0_if1_pc         ( if0_if1_pc         ),
        .rready             ( icache_rready             ),
        .rdata              ( icache_rdata              ),
        .pc_next            ( if0_if1_pc_next            ),
        .badv               ( icache_badv               ),
        .exception          ( icache_exception          ),
        .excp_flag          ( icache_excp_flag          ),
        .cookie_out         ( cookie_out         ),
        // .cacop_ready        ( cacop_ready        ),
        // .cacop_complete     ( cacop_complete     ),
        .if1_rready         ( if1_rready         ),
        // .if1_pc             ( if1_pc             ),
        .if1_pc_next        ( if1_pc_next        ),
        .if1_badv           ( if1_badv           ),
        .if1_exception      ( if1_exception      ),
        .if1_excp_flag      ( if1_excp_flag      ),
        .if1_cookie_out     ( if1_cookie_out     ),
        // .if1_cacop_ready    ( if1_cacop_ready    ),
        // .if1_cacop_complete ( if1_cacop_complete ),
        .if1_inst0          ( if1_inst0          ),
        .if1_inst1          ( if1_inst1          )
    );

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
    wire               flush_from_if1_fifo;
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
    wire  [31:0]    if1_fifo_icache_cookie_out;
    // wire            if1_fifo_cacop_ready;
    // wire            if1_fifo_cacop_complete;
    IF1_FIFO u_IF1_FIFO(
        .clk                        ( clk                        ),
        .rstn                       ( aresetn                    ),
        .flush                      ( flush_to_if1_fifo          ),
        .flush_cause                ( flush_cause                ),
        .fetch_buf_full             ( fetch_buf_full             ),
        .if1_readygo                ( if1_readygo                ),
        .if1_allowin                ( if1_allowin                ),
        .fifo_allowin               ( fifo_allowin               ),
        .fifo_readygo               ( fifo_readygo               ),
        .if1_rready                 ( if1_rready                 ),
        .if0_if1_tlb_rvalid         ( if0_if1_tlb_rvalid         ),
        .if1_pc                     ( if1_pc                     ),
        .if1_pc_next                ( if1_pc_next                ),
        .if1_badv                   ( if1_badv                   ),
        .if1_exception              ( if1_exception              ),
        .if1_excp_flag              ( if1_excp_flag              ),
        .if1_cookie_out             ( if1_cookie_out             ),
        .if1_inst0                  ( if1_inst0                  ),
        .if1_inst1                  ( if1_inst1                  ),
        .ibar_flag                  ( ibar                  ),
        .ibar_flag_from_ex          ( ibar_flag_from_ex          ),
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
        .if1_fifo_pc_next           ( if1_fifo_pc_next           ),
        .if1_fifo_inst0             ( if1_fifo_inst0             ),
        .if1_fifo_inst1             ( if1_fifo_inst1             ),
        .if1_fifo_icache_badv       ( if1_fifo_icache_badv       ),
        .if1_fifo_icache_exception  ( if1_fifo_icache_exception  ),
        .if1_fifo_icache_excp_flag  ( if1_fifo_icache_excp_flag  ),
        .if1_fifo_icache_cookie_out ( if1_fifo_icache_cookie_out )
        // .if1_fifo_cacop_ready       ( if1_fifo_cacop_ready       ),
        // .if1_fifo_cacop_complete    ( if1_fifo_cacop_complete    )
    );


    
    wire    [1 :0]      inst_btype;
    wire    [1 :0]      branch_flag;
    wire                inst_bpos;



    pre_decoder u_pre_decoder(
        .if1_fifo_inst0 ( if1_fifo_inst0 ),
        .if1_fifo_inst1 ( if1_fifo_inst1 ),
        .if1_fifo_pc    ( if1_fifo_pc    ),
        .priv_flag      ( priv_flag      ),
        .ibar_flag      ( ibar_flag      ),
        .csr_flag       ( csr_flag       ),
        .tlb_flag       ( tlb_flag       ),
        .branch_flag    ( branch_flag    ),
        .inst_btype     ( inst_btype     ),
        .inst_bpos      ( inst_bpos      )
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
    

    wire  fetch_buf_empty;


    FIFO u_FIFO(
        .clk                        ( clk                        ),
        .rstn                       ( aresetn                    ),
        .branch_flag                ( branch_flag                ),
        .flush                      ( flush_to_fifo              ),
        .fifo_readygo               ( fifo_readygo               ),
        .fifo_allowin               ( fifo_allowin               ),
        .priv_flag                  ( priv_flag                  ),
        .if1_fifo_inst0             ( if1_fifo_inst0             ),
        .if1_fifo_inst1             ( if1_fifo_inst1             ),
        .if1_fifo_pc                ( if1_fifo_pc                ),
        .if1_fifo_pc_next           ( if1_fifo_pc_next           ),
        .if1_fifo_icache_badv       ( if1_fifo_icache_badv       ),
        .if1_fifo_icache_cookie_out ( if1_fifo_icache_cookie_out ),
        .if1_fifo_icache_exception  ( if1_fifo_icache_exception  ),
        .if1_fifo_icache_excp_flag  ( if1_fifo_icache_excp_flag  ),
        .fifo_inst0                 ( fifo_inst0                 ),
        .fifo_inst1                 ( fifo_inst1                 ),
        .fifo_pc                    ( fifo_pc                    ),
        .fifo_pcAdd                 ( fifo_pcAdd                 ),
        .fifo_pc_next               ( fifo_pc_next               ),
        .fifo_badv                  ( fifo_badv                  ),
        .fifo_cookie_out            ( fifo_cookie_out            ),
        .fifo_exception             ( fifo_exception             ),
        .fifo_excp_flag             ( fifo_excp_flag             ),
        .fifo_priv_flag             ( fifo_priv_flag             ),
        .fifo_branch_flag           ( fifo_branch_flag           ),
        .fetch_buf_empty            ( fetch_buf_empty            ),
        .fetch_buf_full             ( fetch_buf_full             )
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

    wire  id_readygo;//to decoder stage,tell id I'm valid
    FIFO_ID u_FIFO_ID(
        .clk                 ( clk                 ),
        .rstn                ( aresetn             ),
        .fifo_id_flush       ( flush_to_fifo_id    ),
        .fifo_id_flush_cause ( fifo_id_flush_cause ),  // TODO: To be completed
        .id_allowin          ( id_allowin          ),
        .id_readygo          ( id_readygo          ),
        .fifo_allowin        ( fifo_allowin        ),
        .fifo_readygo        ( fifo_readygo        ),
        .fifo_inst0          ( fifo_inst0          ),
        .fifo_inst1          ( fifo_inst1          ),
        .fifo_pc             ( fifo_pc             ),
        .fifo_pc_next        ( fifo_pc_next        ),
        .fifo_pcAdd          ( fifo_pcAdd          ),
        .fifo_badv           ( fifo_badv           ),
        .fifo_cookie_out     ( fifo_cookie_out     ),
        .fifo_exception      ( fifo_exception      ),
        .fifo_excp_flag      ( fifo_excp_flag      ),
        .fifo_priv_flag      ( fifo_priv_flag      ),
        .fifo_branch_flag    ( fifo_branch_flag    ),
        .fetch_buf_empty     ( fetch_buf_empty     ),
        .fetch_buf_full      ( fetch_buf_full      ),
        .fifo_id_inst0       ( fifo_id_inst0       ),
        .fifo_id_inst1       ( fifo_id_inst1       ),
        .fifo_id_pc          ( fifo_id_pc          ),
        .fifo_id_pcAdd       ( fifo_id_pcAdd       ),
        .fifo_id_pc_next     ( fifo_id_pc_next     ),
        .fifo_id_badv        ( fifo_id_badv        ),
        .fifo_id_cookie_out  ( fifo_id_cookie_out  ),
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
        .aclk             ( aclk             ),
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
        .rk1              ( id_rk1              )
    );





   

    wire reg_readygo;
    wire reg_allowin;
    wire [31:0] iq_pc0;
    wire [31:0] iq_pc1;
    wire [31:0] iq_pc_next;
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
    
    ID_REG u_ID_REG(
        .aclk                 ( aclk                 ),
        .aresetn              ( aresetn              ),
        .id_readygo           ( id_readygo           ),
        .id_allowin           ( id_allowin           ),
        .reg_allowin          ( reg_allowin          ),
        .reg_readygo          ( reg_readygo          ),
        .fifo_id_inst0        ( fifo_id_inst0        ),
        .fifo_id_inst1        ( fifo_id_inst1        ),
        .fifo_id_pc0          ( fifo_id_pc          ),
        .fifo_id_pc1          ( fifo_id_pcAdd          ),
        .fifo_id_pc_next      ( fifo_id_pc_next      ),
        .fifo_id_badv         ( fifo_id_badv         ),
        .fifo_id_excp_flag    ( fifo_id_excp_flag    ),
        .fifo_id_exception    ( fifo_id_exception    ),
        .fifo_id_priv_flag    ( fifo_id_priv_flag    ),
        .fifo_id_branch_flag  ( fifo_id_branch_flag  ),
        .is_ALU_0             ( id_is_ALU_0             ),
        .is_ALU_1             ( id_is_ALU_1             ),
        .is_syscall_0         ( id_is_syscall_0         ),
        .is_syscall_1         ( id_is_syscall_1         ),
        .is_break_0           ( id_is_break_0           ),
        .is_break_1           ( id_is_break_1           ),
        .is_priviledged_0     ( id_is_priviledged_0     ),
        .is_priviledged_1     ( id_is_priviledged_1     ),
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
        .iq_pc0               ( iq_pc0               ),
        .iq_pc1               ( iq_pc1               ),
        .iq_pc_next           ( iq_pc_next           ),
        .iq_inst0             ( iq_inst0             ),
        .iq_inst1             ( iq_inst1             ),
        .iq_badv              ( iq_badv              ),
        .iq_excp_flag         ( iq_excp_flag         ),
        .iq_exception         ( iq_exception         ),
        .iq_branch_flag       ( iq_branch_flag       ),
        .iq_is_ALU_0          ( iq_is_ALU_0          ),
        .iq_is_ALU_1          ( iq_is_ALU_1          ),
        .iq_is_syscall_0      ( iq_is_syscall_0      ),
        .iq_is_syscall_1      ( iq_is_syscall_1      ),
        .iq_is_break_0        ( iq_is_break_0        ),
        .iq_is_break_1        ( iq_is_break_1        ),
        .iq_is_priviledged_0  ( iq_is_priviledged_0  ),
        .iq_is_priviledged_1  ( iq_is_priviledged_1  ),
        .iq_uop0              ( iq_uop0              ),
        .iq_uop1              ( iq_uop1              ),
        .iq_imm0              ( iq_imm0              ),
        .iq_imm1              ( iq_imm1              ),
        .iq_rd0               ( iq_rd0               ),
        .iq_rd1               ( iq_rd1               ),
        .iq_rj0               ( iq_rj0               ),
        .iq_rj1               ( iq_rj1               ),
        .iq_rk0               ( iq_rk0               ),
        .iq_rk1               ( iq_rk1               )
    );



    wire  ex_allowin;
    wire  ex_readygo;
    wire  [4:0] wb_rd0;
    wire  [4:0] wb_rd1;
    wire  we_0;
    wire  we_1;
    wire [31:0] wb_rd0_data;
    wire [31:0] wb_rd1_data;

    wire [31:0] reg_ex_pc0;
    wire [31:0] reg_ex_pc1;
    wire [31:0] reg_ex_pc_next;
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

    wire        forward_stall ;

    REG_EX1 u_REG_EX1(
        .clk                     ( clk                     ),
        .aresetn                 ( aresetn                 ),
        .flush                   ( flush_to_reg_ex1        ),
        .forward_stall           ( forward_stall           ),
        .reg_readygo             ( reg_readygo             ),
        .reg_allowin             ( reg_allowin             ),
        .ex_allowin              ( ex_allowin              ),
        .ex_readygo              ( ex_readygo              ),
        .id_reg_pc0              ( iq_pc0              ),
        .id_reg_pc1              ( iq_pc1              ),
        .id_reg_pc_next          ( iq_pc_next          ),
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
        .wb_rd0                  ( wb_rd0                  ),
        .wb_rd1                  ( wb_rd1                  ),
        .we_0                    ( we_0                    ),
        .we_1                    ( we_1                    ),
        .rd0_data                ( wb_rd0_data                ),
        .rd1_data                ( wb_rd1_data                ),
        .id_reg_rj0              ( iq_rj0              ),
        .id_reg_rj1              ( iq_rj1              ),
        .id_reg_rk0              ( iq_rk0              ),
        .id_reg_rk1              ( iq_rk1              ),
        .id_reg_rd0              ( iq_rd0              ),
        .id_reg_rd1              ( iq_rd1              ),
        .reg_ex_pc0              ( reg_ex_pc0              ),
        .reg_ex_pc1              ( reg_ex_pc1              ),
        .reg_ex_pc_next          ( reg_ex_pc_next          ),
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
    );



    wire [31:0] ex1_alu_result0;
    wire [31:0] ex1_alu_result1;
    wire        ex1_alu_result0_valid;
    wire        ex1_alu_result1_valid;

    //前递用到的信号
    //从ex1_ex2段间输入
    wire [4:0] ex1_ex2_rd0;
    wire [4:0] ex1_ex2_rd1;
    wire [31:0] ex1_ex2_data_0;
    wire [31:0] ex1_ex2_data_1;
    wire ex1_ex2_data_0_valid; //可不可以前递，没算好不能前递
    wire ex1_ex2_data_1_valid;
    //从ex2_wb段间输入
    wire [4:0] ex2_wb_rd0;
    wire [4:0] ex2_wb_rd1;
    wire [31:0] ex2_wb_data_0;
    wire [31:0] ex2_wb_data_1;
    wire ex2_wb_data_0_valid;
    wire ex2_wb_data_1_valid;
    //csrfact_pc; //分支指令的pc
    //wire [31:0] fact;
    wire [31:0] tid; //读时钟id的指令RDCNTID用到

    //读时钟的指令RDCNTV(L/H)要用到，开始从cpu_top接进来;现在放在模块内了
    //wire [63:0] stable_counter;


    //给cache
    wire cpu_d_rvalid;
    wire cpu_d_wvalid;
    wire op_dcache; //0读1写
    wire [3:0] write_type; //写入类型;0b0001为byte;0b0011为half;0b1111为word
    wire [31:0] addr_dcache;
    wire [31:0] w_data_dcache;
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
    //给csr
    wire [31:0] csr_addr;
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
    wire block_clock;
    //TLB
    wire tlbsrch_ready;
    wire tlbsrch_valid;
    wire tlbrd_ready;
    wire tlbrd_valid;
    wire tlbwr_ready;
    wire tlbwr_valid;
    wire tlbfill_ready;
    wire tlbfill_valid;
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

    EX1 u_EX1(
        .clk                  ( clk                  ),
        .aclk                 ( aclk                 ),
        .aresetn              ( aresetn              ),
        .flush                ( flush_from_ex1              ),
        .pc0                  ( reg_ex_pc0                  ),
        .pc1                  ( reg_ex_pc1                  ),
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
        .alu_result0          ( alu_result0          ),
        .alu_result1          ( alu_result1          ),
        .alu_result0_valid    ( alu_result0_valid    ),
        .alu_result1_valid    ( alu_result1_valid    ),
        .ibar                 ( ibar                 ),
        .csr_flag_from_ex     ( csr_flag_from_ex     ),
        .tlb_flag_from_ex     ( tlb_flag_from_ex     ),
        .ex1_ex2_rd0          ( ex1_ex2_rd0          ),
        .ex1_ex2_rd1          ( ex1_ex2_rd1          ),
        .ex1_ex2_data_0       ( ex1_ex2_data_0       ),
        .ex1_ex2_data_1       ( ex1_ex2_data_1       ),
        .ex1_ex2_data_0_valid ( ex1_ex2_data_0_valid ),
        .ex1_ex2_data_1_valid ( ex1_ex2_data_1_valid ),
        .ex2_wb_rd0           ( ex2_wb_rd0           ),
        .ex2_wb_rd1           ( ex2_wb_rd1           ),
        .ex2_wb_data_0        ( ex2_wb_data_0        ),
        .ex2_wb_data_1        ( ex2_wb_data_1        ),
        .ex2_wb_data_0_valid  ( ex2_wb_data_0_valid  ),
        .ex2_wb_data_1_valid  ( ex2_wb_data_1_valid  ),
        .forward_stall        ( forward_stall        ),
        .tid                  ( tid                  ),
        .predict_to_branch    ( reg_ex_branch_flag       ),
        .pc0_predict          ( reg_ex_pc_next          ),
        .predict_dir_fail     ( predict_dir_fail     ),
        .predict_addr_fail    ( predict_add_fail     ),
        .fact_taken           ( fact_taken           ),
        .fact_pc              ( fact_pc              ),
        .fact_tpc             ( fact_tpc             ),
        .rvalid_dcache        ( cpu_d_rvalid             ),
        .wvalid_dcache        ( cpu_d_wvalid       ),
        .op_dcache            ( op_dcache            ),
        .write_type_dcache    ( write_type              ),
        .addr_dcache          ( addr_dcache          ),
        .w_data_dcache        ( w_data_dcache        ),
        .is_atom_dcache       ( is_atom_dcache       ),
        .mul_stage1_res_hh    ( mul_stage1_res_hh    ),
        .mul_stage1_res_hl    ( mul_stage1_res_hl    ),
        .mul_stage1_res_lh    ( mul_stage1_res_lh    ),
        .mul_stage1_res_ll    ( mul_stage1_res_ll    ),
        .mul_compensate       ( mul_compensate       ),
        .quotient             ( quotient             ),
        .remainder            ( remainder            ),
        .stall_divider        ( stall_divider        ),
        .div_ready            ( div_ready            ),
        .privilege_ready      ( privilege_ready      ),
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
        .badv_out             ( ex1_badv             ),
        .excp_flag_out        ( ex1_excp_flag        ),
        .exception_out        ( ex1_exception        )
    );

    
    //wire  flush_out;
    wire   ex2_allowin;
    wire   ex2_readygo;


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

    EX1_EX2 u_EX1_EX2(
        .clk                       ( clk                       ),
        .aresetn                   ( aresetn                   ),
        .flush_in                  ( flush_to_ex1_ex2                  ),
        .ex1_readygo               ( ex_readygo               ),
        .ex1_allowin               ( ex_allowin               ),
        .ex2_allowin               ( ex2_allowin               ),
        .ex2_readygo               ( ex2_readygo               ),
        .reg_ex1_pc0               ( reg_ex_pc0               ),
        .reg_ex1_pc1               ( reg_ex_pc1               ),
        .reg_ex1_inst0             ( reg_ex_inst0             ),
        .reg_ex1_inst1             ( reg_ex_inst1             ),
        .reg_ex1_uop0              ( reg_ex_uop0              ),
        .reg_ex1_uop1              ( reg_ex_uop1              ),
        .reg_ex1_imm0              ( reg_ex_imm0              ),
        .reg_ex1_imm1              ( reg_ex_imm1              ),
        .reg_ex1_rj0               ( reg_ex_rj0               ),
        .reg_ex1_rj1               ( reg_ex_rj1               ),
        .reg_ex1_rk0               ( reg_ex_rk0               ),
        .reg_ex1_rk1               ( reg_ex_rk1               ),
        .reg_ex1_rd0               ( reg_ex_rd0               ),
        .reg_ex1_rd1               ( reg_ex_rd1               ),
        .mul_stage1_res_hh         ( mul_stage1_res_hh         ),
        .mul_stage1_res_hl         ( mul_stage1_res_hl         ),
        .mul_stage1_res_lh         ( mul_stage1_res_lh         ),
        .mul_stage1_res_ll         ( mul_stage1_res_ll         ),
        .mul_compensate            ( mul_compensate            ),
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
        .ex1_ex2_mul_stage1_res_hh ( ex1_ex2_mul_stage1_res_hh ),
        .ex1_ex2_mul_stage1_res_hl ( ex1_ex2_mul_stage1_res_hl ),
        .ex1_ex2_mul_stage1_res_lh ( ex1_ex2_mul_stage1_res_lh ),
        .ex1_ex2_mul_stage1_res_ll ( ex1_ex2_mul_stage1_res_ll ),
        .ex1_ex2_mul_compensate    ( ex1_ex2_mul_compensate    ),
        .alu_result0               ( alu_result0               ),
        .alu_result1               ( alu_result1               ),
        .alu_result0_valid         ( alu_result0_valid         ),
        .alu_result1_valid         ( alu_result1_valid         ),
        .ex1_ex2_data_0            ( ex1_ex2_data_0            ),
        .ex1_ex2_data_1            ( ex1_ex2_data_1            ),
        .ex1_ex2_data_0_valid      ( ex1_ex2_data_0_valid      ),
        .ex1_ex2_data_1_valid      ( ex1_ex2_data_1_valid      ),
        .badv_in                   ( ex1_badv                   ),
        .excp_flag_in              ( ex1_excp_flag              ),
        .exception_in              ( ex1_exception              ),
        .d_exception               ( dcache_exception           ),
        .d_badv                    ( dcache_badv               ),
        .ex1_ex2_badv              ( ex1_ex2_badv              ),
        .ex1_ex2_excp_flag         ( ex1_ex2_excp_flag         ),
        .ex1_ex2_exception         ( ex1_ex2_exception         )
    );



    wire [31:0] ex2_rd0_data;
    wire [31:0] ex2_rd1_data;
    wire       ex2_data0_valid;
    wire       ex2_data1_valid;

    EX2 u_EX2(
        .uop0                 ( ex1_ex2_uop0                 ),
        .uop1                 ( ex1_ex2_uop1                 ),
        .ex1_ex2_data_0       ( ex1_ex2_data_0       ),
        .ex1_ex2_data_1       ( ex1_ex2_data_1       ),
        .ex1_ex2_data_0_valid ( ex1_ex2_data_0_valid ),
        .ex1_ex2_data_1_valid ( ex1_ex2_data_1_valid ),
        .mul_stage1_res_hh    ( mul_stage1_res_hh    ),
        .mul_stage1_res_hl    ( mul_stage1_res_hl    ),
        .mul_stage1_res_lh    ( mul_stage1_res_lh    ),
        .mul_stage1_res_ll    ( mul_stage1_res_ll    ),
        .mul_compensate       ( mul_compensate       ),
        .rd0_data             ( ex2_rd0_data         ),
        .rd1_data             ( ex2_rd1_data         ),
        .ex2_data0_valid      ( ex2_data0_valid      ),
        .ex2_data1_valid      ( ex2_data1_valid      )
    );

    //dcache
    wire [31:0] r_data_dcache;
    wire rready_dcache;
    wire wready_dcache;

    //csr 三条读写csr的指令都要写
    //wire [31:0] csr_data_in;
    wire csr_ready;


    //exception
    //wire [31:0] csr_estat; //从csr
    //wire [31:0] csr_crmd;
    
    wire [6:0] ex2_wb_exception; 
    wire ex2_wb_excp_flag; 
    wire [31:0] ex2_wb_badv;      
    wire  wen_badv;
    wire tlb_exception; //决定是否回到直接地址翻译
    wire [31:0] era_out;
    wire wen_era;
    wire [18:0] vppn_out;
    wire wen_vppn;
    wire cpu_interrupt;
    wire dcache_valid;
    EX2_WB u_EX2_WB(
        .clk                 ( clk                 ),
        .aresetn             ( aresetn             ),
        .flush_in            ( flush_to_ex2_wb            ),
        .flush_out_all       ( flush_from_wb       ),
        .ex2_allowin         ( ex2_allowin         ),
        .pc0                 ( ex1_ex2_pc0                 ),
        .pc1                 ( ex1_ex2_pc1                 ),
        .ex1_ex2_inst0       ( ex1_ex2_inst0       ),
        .ex1_ex2_inst1       ( ex1_ex2_inst1       ),
        .uop0                ( ex1_ex2_uop0                ),
        .uop1                ( ex1_ex2_uop1                ),
        .ex2_result0         ( ex2_rd0_data         ),
        .ex2_result1         ( ex2_rd1_data         ),
        .ex_rd0              ( ex1_ex2_rd0              ),
        .ex_rd1              ( ex1_ex2_rd1              ),
        .ex2_result0_valid   ( ex2_result0_valid   ),
        .ex2_result1_valid   ( ex2_result1_valid   ),
        .en_VA_D_OUT         ( dcache_valid        ), 
        .ex2_wb_data_0       ( ex2_wb_data_0       ),
        .ex2_wb_data_1       ( ex2_wb_data_1       ),
        .ex2_wb_data_0_valid ( ex2_wb_data_0_valid ),
        .ex2_wb_data_1_valid ( ex2_wb_data_1_valid ),
        .ex2_wb_rd0          ( ex2_wb_rd0          ),
        .ex2_wb_rd1          ( ex2_wb_rd1          ),
        .ex2_wb_we0          ( we_0          ),
        .ex2_wb_we1          ( we_1          ),
        .quotient            ( quotient            ),
        .remainder           ( remainder           ),
        .stall_divider       ( stall_divider       ),
        .div_ready           ( div_ready           ),
        .dcache_data         ( r_data_dcache         ),
        .dcache_ready        ( rready_dcache        ),
        .csr_data_in         ( csr_rd_data          ),
        .csr_ready           ( privilege_ready           ),
        .debug0_wb_pc        ( debug0_wb_pc        ),
        .debug0_wb_rf_wen    ( debug0_wb_rf_wen    ),
        .debug0_wb_rf_wnum   ( debug0_wb_rf_wnum   ),
        .debug0_wb_rf_wdata  ( debug0_wb_rf_wdata  ),
        .debug0_wb_inst      ( debug0_wb_inst      ),
        .debug1_wb_pc        ( debug1_wb_pc        ),
        .debug1_wb_rf_wen    ( debug1_wb_rf_wen    ),
        .debug1_wb_rf_wnum   ( debug1_wb_rf_wnum   ),
        .debug1_wb_rf_wdata  ( debug1_wb_rf_wdata  ),
        .debug1_wb_inst      ( debug1_wb_inst      ),
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
        .era_in              ( ex1_ex2_pc0         ),
        .cpu_interrupt        ( cpu_interrupt        ),
        .era_out             ( era_out             ),
        .wen_era             ( wen_era             ),
        .vppn_out            ( vppn_out            ),
        .wen_vppn            ( wen_vppn            )
    );


    

    wire [31:0] crmd; //当前模式信息，包含privilege
    wire [31:0] estat;    //例外状态 idle_interrupt; 
    wire [31:0] csr_era;
    wire [31:0] eentry;
    wire [31:0] tlbrentry;
    wire [31:0] pgdl,pgdh;
    
    wire [31:0] dmw0;
    wire [31:0] dmw1;
    wire llbit;
    wire idle_over;
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
        .software_en     ( csr_wen        ),
        .addr            ( csr_addr[13:0]   ),
        .rdata           ( csr_rdata           ),
        .wen             ( csr_wen             ),
        .wdata           ( csr_wdata           ),
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
        .hardware_interrupt  ( intrpt  ),
        .tid             ( tid             )
    );

    BTB u_BTB(
        .rstn             ( aresetn             ),
        .clk              ( clk              ),
        .inst_btype       ( inst_btype       ),
        .inst_bpos        ( inst_bpos        ),
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
    wire icache_rvalid;
    wire [31:0] icache_raddr, dcache_addr;
    wire SOL_D_OUT;
    
    icache#(
        .INDEX_WIDTH       ( 6 ),
        .WORD_OFFSET_WIDTH ( 4 ),
        .COOKIE_WIDTH      ( 32 )
    )u_icache(
        .clk               ( clk               ),
        .rstn              ( aresetn           ),
        .rvalid            ( icache_rvalid     ),
        .rready            ( icache_rready     ),
        .raddr             ( icache_raddr      ),
        .p_addr            ( PA_I              ),
        .rdata             ( icache_rdata      ),
        .pc_out            ( if1_pc            ),
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
        .cookie_in         ( cookie_in         ),
        .cookie_out        ( cookie_out        ),
        .cacop_en          ( cacop_i_en        ),
        .cacop_code        ( cacop_ins_type    ),
        .cacop_ready       ( cacop_i_ready     ),
        .cacop_complete    ( cacop_i_done      ),
        .ibar              ( ibar              )
    );



    dcache#(
        .INDEX_WIDTH                       ( 6 ),
        .WORD_OFFSET_WIDTH                 ( 4 )
    )u_dcache(
        .clk                               ( clk                               ),
        .rstn                              ( aresetn                           ),
        .addr                              ( cacop_d_en ? cacop_vaddr : dcache_addr ),
        .p_addr                            ( PA_D                              ),   
        .rvalid                            ( dcache_valid & ~SOL_D_OUT         ),
        .rready                            ( rready_dcache                     ),
        .rdata                             ( r_data_dcache                     ),
        .wvalid                            ( dcache_valid & SOL_D_OUT          ),
        .wready                            ( wready_dcache                     ),
        .wdata                             ( w_data_dcache                     ),
        .wstrb                             ( write_type                        ),   
        .op                                ( op_dcache                         ),
        .uncache                           ( !is_cached_D                      ),  
        .signed_ext                        ( reg_ex_uop0[`UOP_SIGN]            ),
        .idle                              ( d_idle                            ),
        .flush                             ( flush_to_dcache                   ),
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
        .d_exception_flag                  ( d_exception_flag                  ),  
        .forward_exception                 ( reg_ex_exception                  ),  
        .tlb_exception                     ( tlb_exception_code_d              ),  
        .badv                              ( dcache_badv                       ),  
        .cacop_en                          ( cacop_d_en                        ),
        .cacop_code                        ( cacop_ins_type                    ),
        .cacop_ready                       ( cacop_d_ready                     ),
        .cacop_complete                    ( cacop_d_done                      ),
        .is_atom                           ( is_atom_dcache                    ),
        .llbit_set                         ( llbit_set                         ),
        .llbit                             ( llbit                             ),
        .llbit_clear                       ( llbit_clear                       ),
        .ibar                              ( ibar                              )
    );







wire [3:0]reg_ex_cond0;
assign reg_ex_cond0=reg_ex_uop0[`UOP_COND];
    TLB u_TLB(
        .clk            ( clk            ),
        .rstn           ( aresetn           ),
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
        .en_d           ( reg_ex_uop0[`INS_MEM]        ),
        .VA_I           ( fetch_pc[31:12]   ),
        .VA_D           ( addr_dcache[31:12]           ),
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
        .VA_TAG_OFFSET_D_OUT(dcache_addr[11:0]),
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
        .tlb_exception_code_d(tlb_exception_code_d)
    );


    sram_axi u_sram_axi(
        .aclk     ( aclk     ),
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
        .flush_from_wb     ( flush_from_wb     ),
        .flush_from_ex2    ( flush_from_ex2    ),
        .flush_from_ex1    ( flush_from_ex1    ),
        .flush_from_reg    ( flush_from_reg    ),
        .flush_from_id     ( flush_from_id     ),
        .flush_from_fifo   ( flush_from_fifo   ),
        .flush_from_if1    ( flush_from_if1    ),
        .flush_to_ex2_wb   ( flush_to_ex2_wb   ),
        .flush_to_ex1_ex2  ( flush_to_ex1_ex2  ),
        .flush_to_reg_ex1  ( flush_to_reg_ex1  ),
        .flush_to_id_reg   ( flush_to_id_reg   ),
        .flush_to_fifo_id  ( flush_to_fifo_id  ),
        .flush_to_fifo     ( flush_to_fifo     ),
        .flush_to_if1_fifo ( flush_to_if1_fifo ),
        .flush_to_if0_if1  ( flush_to_if0_if1  ),
        .flush_to_tlb      ( flush_to_tlb      ),
        .flush_to_icache   ( flush_to_icache   ),
        .flush_to_dcache   ( flush_to_dcache   ),
        .flush_to_btb      ( flush_to_btb      )
    );

`ifdef DIFFTEST
    

`endif
endmodule
