`include "define.vh"
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
    output debug0_valid,

    output [31:0] debug1_wb_pc,
    output [ 3:0] debug1_wb_rf_wen,
    output [ 4:0] debug1_wb_rf_wnum,
    output [31:0] debug1_wb_rf_wdata,
    output [31:0] debug1_wb_inst,
    output debug1_valid
);


    IF0 u_IF0(
        .clk                 ( clk                 ),
        .rstn                ( rstn                ),
        .if0_readygo         ( if0_readygo         ),
        .if0_allowin         ( if0_allowin         ),
        .pc_stall            ( pc_stall            ),
        .set_pc_from_ID      ( set_pc_from_ID      ),
        .pc_from_ID          ( pc_from_ID          ),
        .set_pc_from_EX      ( set_pc_from_EX      ),
        .pc_from_EX          ( pc_from_EX          ),
        .set_pc_from_WB      ( set_pc_from_WB      ),
        .pc_from_WB          ( pc_from_WB          ),
        .set_pc_from_PRIV    ( set_pc_from_PRIV    ),
        .pc_from_PRIV        ( pc_from_PRIV        ),
        .pred_pc             ( pred_pc             ),
        .pred_taken          ( pred_taken          ),
        .fetch_pc            ( fetch_pc            ),
        .rvalid              ( rvalid              ),
        .raddr               ( raddr               ),
        .regcookie_in=114514 ( regcookie_in=114514 ),
        .pc_next             ( pc_next             )
    );

    IF0_IF1 u_IF0_IF1(
        .clk         ( clk         ),
        .rstn        ( rstn        ),
        .if0_readygo ( if0_readygo ),
        .if0_allowin ( if0_allowin ),
        .if1_readygo ( if1_readygo ),
        .if1_allowin ( if1_allowin ),
        .flush       ( flush       ),
        .flush_cause ( flush_cause ),
        .rready      ( rready      ),
        .p_addr      ( p_addr      ),
        .raddr       ( raddr       ),
        .fetch_pc    ( fetch_pc    ),
        .pc_next     ( pc_next     ),
        .if0_if1_pc  ( if0_if1_pc  ),
        .if0_if1_pc_next  ( if0_if1_pc_next  )
    );

    

    IF1 u_IF1(
        .clk                ( clk                ),
        .rstn               ( rstn               ),
        .if1_valid          ( if1_valid          ),
        .if1_ready          ( if1_ready          ),
        .if0_if1_pc         ( if0_if1_pc         ),
        .if1_fifo_pc        ( if1_fifo_pc        ),
        .rready             ( rready             ),
        .rdata              ( rdata              ),
        .fetch_pc           ( fetch_pc           ),
        .pc_next            ( pc_next            ),
        .badv               ( badv               ),
        .exception          ( exception          ),
        .excp_flag          ( excp_flag          ),
        .cookie_out         ( cookie_out         ),
        .cacop_ready        ( cacop_ready        ),
        .cacop_complete     ( cacop_complete     ),
        .if1_rready         ( if1_rready         ),
        .if1_pc             ( if1_pc             ),
        .if1_pc_next        ( if1_pc_next        ),
        .if1_badv           ( if1_badv           ),
        .if1_exception      ( if1_exception      ),
        .if1_excp_flag      ( if1_excp_flag      ),
        .if1_cookie_out     ( if1_cookie_out     ),
        .if1_cacop_ready    ( if1_cacop_ready    ),
        .if1_cacop_complete ( if1_cacop_complete ),
        .if1_inst0          ( if1_inst0          ),
        .if1_inst1          ( if1_inst1          )
    );


    IF1_FIFO u_IF1_FIFO(
        .clk                        ( clk                        ),
        .rstn                       ( rstn                       ),
        .flush                      ( flush                      ),
        .flush_cause                ( flush_cause                ),
        .fetch_buf_full             ( fetch_buf_full             ),
        .if1_readygo                ( if1_readygo                ),
        .if1_allowin                ( if1_allowin                ),
        .fifo_allowin               ( fifo_allowin               ),
        .fifo_readygo               ( fifo_readygo               ),
        .if1_rready                 ( if1_rready                 ),
        .if1_pc                     ( if1_pc                     ),
        .if1_pc_next                ( if1_pc_next                ),
        .if1_badv                   ( if1_badv                   ),
        .if1_exception              ( if1_exception              ),
        .if1_excp_flag              ( if1_excp_flag              ),
        .if1_cookie_out             ( if1_cookie_out             ),
        .if1_inst0                  ( if1_inst0                  ),
        .if1_inst1                  ( if1_inst1                  ),
        .ibar_flag                  ( ibar_flag                  ),
        .ibar_flag_from_ex          ( ibar_flag_from_ex          ),
        .csr_flag                   ( csr_flag                   ),
        .csr_flag_from_ex           ( csr_flag_from_ex           ),
        .tlb_flag                   ( tlb_flag                   ),
        .tlb_flag_from_tlb          ( tlb_flag_from_tlb          ),
        .priv_flag                  ( priv_flag                  ),
        .pc_from_PRIV               ( pc_from_PRIV               ),
        .set_pc_from_PRIV           ( set_pc_from_PRIV           ),
        .flush_from_if1_fifo        ( flush_from_if1_fifo        ),
        .icache_idle                ( icache_idle                ),
        .dcache_idle                ( dcache_idle                ),
        .csr_done                   ( csr_done                   ),
        .tlb_done                   ( tlb_done                   ),
        .if1_fifo_pc                ( if1_fifo_pc                ),
        .if1_fifo_pc_next           ( if1_fifo_pc_next           ),
        .if1_fifo_inst0             ( if1_fifo_inst0             ),
        .if1_fifo_inst1             ( if1_fifo_inst1             ),
        .if1_fifo_icache_badv       ( if1_fifo_icache_badv       ),
        .if1_fifo_icache_exception  ( if1_fifo_icache_exception  ),
        .if1_fifo_icache_excp_flag  ( if1_fifo_icache_excp_flag  ),
        .if1_fifo_icache_cookie_out ( if1_fifo_icache_cookie_out ),
        .if1_fifo_cacop_ready       ( if1_fifo_cacop_ready       ),
        .if1_fifo_cacop_complete    ( if1_fifo_cacop_complete    )
    );



    pre_decoder u_pre_decoder(
        .if1_fifo_inst0 ( if1_fifo_inst0 ),
        .if1_fifo_inst1 ( if1_fifo_inst1 ),
        .if1_fifo_pc    ( if1_fifo_pc    ),
        .priv_flag      ( priv_flag      ),
        .ibar_flag      ( ibar_flag      ),
        .csr_flag       ( csr_flag       ),
        .tlb_flag       ( tlb_flag       ),
        .inst_btype     ( inst_btype     )
    );







    FIFO u_FIFO(
        .clk                        ( clk                        ),
        .rstn                       ( rstn                       ),
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
        .fetch_buf_empty            ( fetch_buf_empty            ),
        .fetch_buf_full             ( fetch_buf_full             )
    );




    FIFO_ID u_FIFO_ID(
        .clk                 ( clk                 ),
        .rstn                ( rstn                ),
        .fifo_id_flush       ( fifo_id_flush       ),
        .fifo_id_flush_cause ( fifo_id_flush_cause ),
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
        .fifo_id_priv_flag   ( fifo_id_priv_flag   )
    );




    id_stage u_id_stage(
        .aclk             ( aclk             ),
        .aresetn          ( aresetn          ),
        .inst0            ( inst0            ),
        .inst1            ( inst1            ),
        .pc0              ( pc0              ),
        .pc1              ( pc1              ),
        .is_ALU_0         ( is_ALU_0         ),
        .is_ALU_1         ( is_ALU_1         ),
        .is_syscall_0     ( is_syscall_0     ),
        .is_syscall_1     ( is_syscall_1     ),
        .is_break_0       ( is_break_0       ),
        .is_break_1       ( is_break_1       ),
        .is_priviledged_0 ( is_priviledged_0 ),
        .is_priviledged_1 ( is_priviledged_1 ),
        .uop0             ( uop0             ),
        .uop1             ( uop1             ),
        .imm0             ( imm0             ),
        .imm1             ( imm1             ),
        .rd0              ( rd0              ),
        .rd1              ( rd1              ),
        .rj0              ( rj0              ),
        .rj1              ( rj1              ),
        .rk0              ( rk0              ),
        .rk1              ( rk1              )
    );





    wire clk;
    assign clk=aclk; //idle的时钟没写，暂时用clk代替

    wire id_readygo;
    wire id_allowin;
    wire reg_readygo;
    wire reg_allowin;
    wire [31:0] fifo_id_inst0;
    wire [31:0] fifo_id_inst1;
    wire [31:0] fifo_id_pc0;
    wire [31:0] fifo_id_pc1;
    wire [31:0] fifo_id_badv;
    wire [1:0] fifo_id_excp_flag;
    wire [6:0] fifo_id_exception;
    wire [1:0] fifo_id_priv_flag;
    wire ID_is_ALU_0;
    wire ID_is_ALU_1;
    wire ID_is_syscall_0;
    wire ID_is_syscall_1;
    wire ID_is_break_0;
    wire ID_is_break_1;
    wire ID_is_priviledged_0;
    wire ID_is_priviledged_1;
    wire [`WIDTH_UOP-1:0] ID_uop0;
    wire [`WIDTH_UOP-1:0] ID_uop1;
    wire [31:0] ID_imm0;
    wire [31:0] ID_imm1;
    wire [4:0] ID_rd0;
    wire [4:0] ID_rd1;
    wire [4:0] ID_rj0;
    wire [4:0] ID_rj1;
    wire [4:0] ID_rk0;
    wire [4:0] ID_rk1;
    wire [31:0] iq_pc0;
    wire [31:0] iq_pc1;
    wire [31:0] iq_inst0;
    wire [31:0] iq_inst1;
    wire [31:0] iq_badv;
    wire [1 :0] iq_excp_flag;
    wire [6:0] iq_exception;
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
    ID_REG top_ID_REG(
        .aclk(clk),
        .aresetn(aresetn),
        .id_readygo(id_readygo),
        .id_allowin(id_allowin),
        .reg_readygo(reg_readygo),
        .reg_allowin(reg_allowin),
        .fifo_id_inst0(fifo_id_inst0),
        .fifo_id_inst1(fifo_id_inst1),
        .fifo_id_pc0(fifo_id_pc0),
        .fifo_id_pc1(fifo_id_pc1),
        .fifo_id_badv(fifo_id_badv),
        .fifo_id_excp_flag(fifo_id_excp_flag),
        .fifo_id_exception(fifo_id_exception),
        .fifo_id_priv_flag(fifo_id_priv_flag),
        .is_ALU_0(ID_is_ALU_0),
        .is_ALU_1(ID_is_ALU_1),
        .is_syscall_0(ID_is_syscall_0),
        .is_syscall_1(ID_is_syscall_1),
        .is_break_0(ID_is_break_0),
        .is_break_1(ID_is_break_1),
        .is_priviledged_0(ID_is_priviledged_0),
        .is_priviledged_1(ID_is_priviledged_1),
        .uop0(ID_uop0),
        .uop1(ID_uop1),
        .imm0(ID_imm0),
        .imm1(ID_imm1),
        .rd0(ID_rd0),
        .rd1(ID_rd1),
        .rj0(ID_rj0),
        .rj1(ID_rj1),
        .rk0(ID_rk0),
        .rk1(ID_rk1),
        .iq_pc0(iq_pc0),
        .iq_pc1(iq_pc1),
        .iq_inst0(iq_inst0),
        .iq_inst1(iq_inst1),
        .iq_badv(iq_badv),
        .iq_excp_flag(iq_excp_flag),
        .iq_exception(iq_exception),
        .iq_is_ALU_0(iq_is_ALU_0),
        .iq_is_ALU_1(iq_is_ALU_1),
        .iq_is_syscall_0(iq_is_syscall_0),
        .iq_is_syscall_1(iq_is_syscall_1),
        .iq_is_break_0(iq_is_break_0),
        .iq_is_break_1(iq_is_break_1),
        .iq_is_priviledged_0(iq_is_priviledged_0),
        .iq_is_priviledged_1(iq_is_priviledged_1),
        .iq_uop0(iq_uop0),
        .iq_uop1(iq_uop1),
        .iq_imm0(iq_imm0),
        .iq_imm1(iq_imm1),
        .iq_rd0(iq_rd0),
        .iq_rd1(iq_rd1),
        .iq_rj0(iq_rj0),
        .iq_rj1(iq_rj1),
        .iq_rk0(iq_rk0),
        .iq_rk1(iq_rk1)
    );
    wire forward_stall;
    wire ex_allowin;
    wire ex_readygo;
    REG_EX1 top_REG_EX1(
        .clk(clk),
        .aresetn(aresetn),
        .flush(1'b0),//flush部分to do
        .forward_stall(forward_stall),
        .reg_readygo(reg_readygo),
        .reg_allowin(reg_allowin),
        .ex_allowin(ex_allowin),
        .ex_readygo(ex_readygo),
        .id_reg_pc0(iq_pc0),
        .id_reg_pc1(iq_pc1),
        .id_reg_inst0(iq_inst0),
        .id_reg_inst1(iq_inst1),
        .id_reg_exception(iq_exception),
        .id_reg_excp_flag(iq_excp_flag),
    );





    EX1 u_EX1(
        .clk                  ( clk                  ),
        .aclk                 ( aclk                 ),
        .aresetn              ( aresetn              ),
        .flush                ( flush                ),
        .pc0                  ( pc0                  ),
        .pc1                  ( pc1                  ),
        .inst0                ( inst0                ),
        .inst1                ( inst1                ),
        .is_ALU_0             ( is_ALU_0             ),
        .is_ALU_1             ( is_ALU_1             ),
        .is_syscall_0         ( is_syscall_0         ),
        .is_syscall_1         ( is_syscall_1         ),
        .is_break_0           ( is_break_0           ),
        .is_break_1           ( is_break_1           ),
        .is_priviledged_0     ( is_priviledged_0     ),
        .is_priviledged_1     ( is_priviledged_1     ),
        .uop0                 ( uop0                 ),
        .uop1                 ( uop1                 ),
        .imm0                 ( imm0                 ),
        .imm1                 ( imm1                 ),
        .rj0_data             ( rj0_data             ),
        .rj1_data             ( rj1_data             ),
        .rk0_data             ( rk0_data             ),
        .rk1_data             ( rk1_data             ),
        .ex_rj0               ( ex_rj0               ),
        .ex_rj1               ( ex_rj1               ),
        .ex_rk0               ( ex_rk0               ),
        .ex_rk1               ( ex_rk1               ),
        .alu_result0          ( alu_result0          ),
        .alu_result1          ( alu_result1          ),
        .alu_result0_valid    ( alu_result0_valid    ),
        .alu_result1_valid    ( alu_result1_valid    ),
        .ibar                 ( ibar                 ),
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
        .predict_to_branch    ( predict_to_branch    ),
        .pc0_predict          ( pc0_predict          ),
        .predict_dir_fail     ( predict_dir_fail     ),
        .predict_addr_fail    ( predict_addr_fail    ),
        .fact_taken           ( fact_taken           ),
        .fact_pc              ( fact_pc              ),
        .fact_tpc             ( fact_tpc             ),
        .rvalid_dcache        ( rvalid_dcache        ),
        .wvalid_dcache        ( wvalid_dcache        ),
        .op_dcache            ( op_dcache            ),
        .write_type_dcache    ( write_type_dcache    ),
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
        .plv                  ( plv                  ),
        .excp_flag_in         ( excp_flag_in         ),
        .exception_in         ( exception_in         ),
        .badv_in              ( badv_in              ),
        .badv_out             ( badv_out             ),
        .excp_flag_out        ( excp_flag_out        ),
        .exception_out        ( exception_out        )
    );



    EX1_EX2 u_EX1_EX2(
        .clk                       ( clk                       ),
        .aresetn                   ( aresetn                   ),
        .flush_in                  ( flush_in                  ),
        .ex1_readygo               ( ex1_readygo               ),
        .ex1_allowin               ( ex1_allowin               ),
        .ex2_allowin               ( ex2_allowin               ),
        .ex2_readygo               ( ex2_readygo               ),
        .reg_ex1_pc0               ( reg_ex1_pc0               ),
        .reg_ex1_pc1               ( reg_ex1_pc1               ),
        .reg_ex1_inst0             ( reg_ex1_inst0             ),
        .reg_ex1_inst1             ( reg_ex1_inst1             ),
        .reg_ex1_uop0              ( reg_ex1_uop0              ),
        .reg_ex1_uop1              ( reg_ex1_uop1              ),
        .reg_ex1_imm0              ( reg_ex1_imm0              ),
        .reg_ex1_imm1              ( reg_ex1_imm1              ),
        .reg_ex1_rj0               ( reg_ex1_rj0               ),
        .reg_ex1_rj1               ( reg_ex1_rj1               ),
        .reg_ex1_rk0               ( reg_ex1_rk0               ),
        .reg_ex1_rk1               ( reg_ex1_rk1               ),
        .reg_ex1_rd0               ( reg_ex1_rd0               ),
        .reg_ex1_rd1               ( reg_ex1_rd1               ),
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
        .badv_in                   ( badv_in                   ),
        .excp_flag_in              ( excp_flag_in              ),
        .exception_in              ( exception_in              ),
        .ex1_ex2_badv              ( ex1_ex2_badv              ),
        .ex1_ex2_excp_flag         ( ex1_ex2_excp_flag         ),
        .ex1_ex2_exception         ( ex1_ex2_exception         )
    );




    EX2 u_EX2(
        .uop0                 ( uop0                 ),
        .uop1                 ( uop1                 ),
        .ex1_ex2_data_0       ( ex1_ex2_data_0       ),
        .ex1_ex2_data_1       ( ex1_ex2_data_1       ),
        .ex1_ex2_data_0_valid ( ex1_ex2_data_0_valid ),
        .ex1_ex2_data_1_valid ( ex1_ex2_data_1_valid ),
        .mul_stage1_res_hh    ( mul_stage1_res_hh    ),
        .mul_stage1_res_hl    ( mul_stage1_res_hl    ),
        .mul_stage1_res_lh    ( mul_stage1_res_lh    ),
        .mul_stage1_res_ll    ( mul_stage1_res_ll    ),
        .mul_compensate       ( mul_compensate       ),
        .rd0_data             ( rd0_data             ),
        .rd1_data             ( rd1_data             )
    );




    EX2_WB u_EX2_WB(
        .clk                 ( clk                 ),
        .aresetn             ( aresetn             ),
        .flush_in            ( flush_in            ),
        .flush_out_all       ( flush_out_all       ),
        .ex2_allowin         ( ex2_allowin         ),
        .pc0                 ( pc0                 ),
        .pc1                 ( pc1                 ),
        .ex1_ex2_inst0       ( ex1_ex2_inst0       ),
        .ex1_ex2_inst1       ( ex1_ex2_inst1       ),
        .uop0                ( uop0                ),
        .uop1                ( uop1                ),
        .ex2_result0         ( ex2_result0         ),
        .ex2_result1         ( ex2_result1         ),
        .ex_rd0              ( ex_rd0              ),
        .ex_rd1              ( ex_rd1              ),
        .ex2_result0_valid   ( ex2_result0_valid   ),
        .ex2_result1_valid   ( ex2_result1_valid   ),
        .ex2_wb_data_0       ( ex2_wb_data_0       ),
        .ex2_wb_data_1       ( ex2_wb_data_1       ),
        .ex2_wb_data_0_valid ( ex2_wb_data_0_valid ),
        .ex2_wb_data_1_valid ( ex2_wb_data_1_valid ),
        .ex2_wb_rd0          ( ex2_wb_rd0          ),
        .ex2_wb_rd1          ( ex2_wb_rd1          ),
        .ex2_wb_we0          ( ex2_wb_we0          ),
        .ex2_wb_we1          ( ex2_wb_we1          ),
        .quotient            ( quotient            ),
        .remainder           ( remainder           ),
        .stall_divider       ( stall_divider       ),
        .div_ready           ( div_ready           ),
        .dcache_data         ( dcache_data         ),
        .dcache_ready        ( dcache_ready        ),
        .csr_data_in         ( csr_data_in         ),
        .csr_ready           ( csr_ready           ),
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
        .csr_estat           ( csr_estat           ),
        .csr_crmd            ( csr_crmd            ),
        .ecode_in            ( ecode_in            ),
        .exception_flag_in   ( exception_flag_in   ),
        .badv_in             ( badv_in             ),
        .ecode_out           ( ecode_out           ),
        .exception_flag_out  ( exception_flag_out  ),
        .badv_out            ( badv_out            ),
        .wen_badv            ( wen_badv            ),
        .tlb_exception       ( tlb_exception       ),
        .era_in              ( era_in              ),
        .era_out             ( era_out             ),
        .wen_era             ( wen_era             ),
        .vppn_out            ( vppn_out            ),
        .wen_vppn            ( wen_vppn            )
    );


    csr u_csr(
        .clk             ( clk             ),
        .aclk            ( aclk            ),
        .aresetn         ( aresetn         ),
        .software_en     ( software_en     ),
        .addr            ( addr            ),
        .rdata           ( rdata           ),
        .wen             ( wen             ),
        .wdata           ( wdata           ),
        .crmd            ( crmd            ),
        .estat           ( estat           ),
        .era_out         ( era_out         ),
        .eentry          ( eentry          ),
        .tlbrentry       ( tlbrentry       ),
        .pgdl            ( pgdl            ),
        .pgdh            ( pgdh            ),
        .cpu_interupt    ( cpu_interupt    ),
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
        .tlb_cpr_out     ( tlb_cpr_out     ),
        .tlb_trans_1_out ( tlb_trans_1_out ),
        .tlb_trans_2_out ( tlb_trans_2_out ),
        .exception       ( exception       ),
        .ertn            ( ertn            ),
        .tlb_exception   ( tlb_exception   ),
        .expcode_in      ( expcode_in      ),
        .wen_expcode     ( wen_expcode     ),
        .era_in          ( era_in          ),
        .wen_era         ( wen_era         ),
        .badv_in         ( badv_in         ),
        .wen_badv        ( wen_badv        ),
        .llbit_set       ( llbit_set       ),
        .tlbsrch_ready   ( tlbsrch_ready   ),
        .tlbsrch_hit     ( tlbsrch_hit     ),
        .tlb_index_in    ( tlb_index_in    ),
        .tlbrd_ready     ( tlbrd_ready     ),
        .tlbrd_hit       ( tlbrd_hit       ),
        .tlbrd_cpr       ( tlbrd_cpr       ),
        .tlbrd_trans_1   ( tlbrd_trans_1   ),
        .tlbrd_trans_2   ( tlbrd_trans_2   ),
        .hardware_interrupt  ( hardware_interrupt  )
    );

    BTB#(
        .DEPTH=16         ( undefined )
    )u_BTB(
        .rstn             ( rstn             ),
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
        .predict_add_fail  ( predict_add_fail  )
    );

    icache#(
        .INDEX_WIDTH       ( 6 ),
        .WORD_OFFSET_WIDTH ( 4 ),
        .COOKIE_WIDTH      ( 32 )
    )u_icache(
        .clk               ( clk               ),
        .rstn              ( rstn              ),
        .rvalid            ( rvalid            ),
        .rready            ( rready            ),
        .raddr             ( raddr             ),
        .p_addr            ( p_addr            ),
        .rdata             ( rdata             ),
        .pc_out            ( pc_out            ),
        .idle              ( idle              ),
        .i_rvalid          ( i_rvalid          ),
        .i_rready          ( i_rready          ),
        .i_raddr           ( i_raddr           ),
        .i_rdata           ( i_rdata           ),
        .i_rlen            ( i_rlen            ),
        .tlb_exception     ( tlb_exception     ),
        .badv              ( badv              ),
        .exception         ( exception         ),
        .flush             ( flush             ),
        .uncache           ( uncache           ),
        .cookie_in         ( cookie_in         ),
        .cookie_out        ( cookie_out        ),
        .cacop_en          ( cacop_en          ),
        .cacop_code        ( cacop_code        ),
        .cacop_ready       ( cacop_ready       ),
        .cacop_complete    ( cacop_complete    ),
        .ibar              ( ibar              )
    );



    dcache#(
        .INDEX_WIDTH                       ( 6 ),
        .WORD_OFFSET_WIDTH                 ( 4 )
    )u_dcache(
        .clk                               ( clk                               ),
        .rstn                              ( rstn                              ),
        ./* from pipeline */   addr        ( /* from pipeline */   addr        ),
        .p_addr                            ( p_addr                            ),
        .rvalid                            ( rvalid                            ),
        .rready                            ( rready                            ),
        .rdata                             ( rdata                             ),
        .wvalid                            ( wvalid                            ),
        .wready                            ( wready                            ),
        .wdata                             ( wdata                             ),
        .wstrb                             ( wstrb                             ),
        .op                                ( op                                ),
        .uncache                           ( uncache                           ),
        .signed_ext                        ( signed_ext                        ),
        .idle                              ( idle                              ),
        ./* from AXI arbiter */   d_rvalid ( /* from AXI arbiter */   d_rvalid ),
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
        .exception                         ( exception                         ),
        .exception_flag                    ( exception_flag                    ),
        .forward_exception                 ( forward_exception                 ),
        .tlb_exception                     ( tlb_exception                     ),
        .badv                              ( badv                              ),
        .cacop_code                        ( cacop_code                        ),
        .cacop_en                          ( cacop_en                          ),
        .cacop_complete                    ( cacop_complete                    ),
        .cacop_ready                       ( cacop_ready                       ),
        .is_atom                           ( is_atom                           ),
        .llbit_set                         ( llbit_set                         ),
        .llbit                             ( llbit                             ),
        .llbit_clear                       ( llbit_clear                       )
    );







    TLB u_TLB(
        .clk            ( clk            ),
        .rstn           ( rstn           ),
        .CSR_ASID       ( CSR_ASID       ),
        .CSR_VPPN       ( CSR_VPPN       ),
        .CSR_PG         ( CSR_PG         ),
        .CSR_CRMD       ( CSR_CRMD       ),
        .CSR_DMW0       ( CSR_DMW0       ),
        .CSR_DMW1       ( CSR_DMW1       ),
        .CSR_TLBEHI     ( CSR_TLBEHI     ),
        .CSR_TLBIDX     ( CSR_TLBIDX     ),
        .stall_i        ( stall_i        ),
        .stall_d        ( stall_d        ),
        .VA_I           ( VA_I           ),
        .VA_D           ( VA_D           ),
        .PA_I           ( PA_I           ),
        .PA_D           ( PA_D           ),
        .is_cached_I    ( is_cached_I    ),
        .is_cached_D    ( is_cached_D    ),
        .TLBSRCH_valid  ( TLBSRCH_valid  ),
        .TLBSRCH_ready  ( TLBSRCH_ready  ),
        .TLBSRCH_hit    ( TLBSRCH_hit    ),
        .TLBSRCH_INDEX  ( TLBSRCH_INDEX  ),
        .TLBRD_INDEX    ( TLBRD_INDEX    ),
        .TLBRD_valid    ( TLBRD_valid    ),
        .TLBRD_ready    ( TLBRD_ready    ),
        .TLBRD_hit      ( TLBRD_hit      ),
        .TLB_CPR        ( TLB_CPR        ),
        .TLB_TRANS_1    ( TLB_TRANS_1    ),
        .TLB_TRANS_2    ( TLB_TRANS_2    ),
        .TLBWR_valid    ( TLBWR_valid    ),
        .TLBWR_ready    ( TLBWR_ready    ),
        .TLB_CPR_w      ( TLB_CPR_w      ),
        .TLB_TRANS_1_w  ( TLB_TRANS_1_w  ),
        .TLB_TRANS_2_w  ( TLB_TRANS_2_w  ),
        .TLBINVLD_valid ( TLBINVLD_valid ),
        .TLBINVLD_ready ( TLBINVLD_ready ),
        .TLBINVLD_OP    ( TLBINVLD_OP    ),
        .TLBINVLD_ASID  ( TLBINVLD_ASID  ),
        .TLBINVLD_VA    ( TLBINVLD_VA    )
    );


    axi2dpram u_axi2dpram(
        .aclk     ( aclk     ),
        .aresetn  ( aresetn  ),
        .aw_id    ( aw_id    ),
        .aw_addr  ( aw_addr  ),
        .aw_len   ( aw_len   ),
        .aw_size  ( aw_size  ),
        .aw_valid ( aw_valid ),
        .aw_ready ( aw_ready ),
        .w_data   ( w_data   ),
        .w_strb   ( w_strb   ),
        .w_last   ( w_last   ),
        .w_valid  ( w_valid  ),
        .w_ready  ( w_ready  ),
        .b_id     ( b_id     ),
        .b_valid  ( b_valid  ),
        .b_ready  ( b_ready  ),
        .ar_id    ( ar_id    ),
        .ar_addr  ( ar_addr  ),
        .ar_len   ( ar_len   ),
        .arsize   ( arsize   ),
        .ar_valid ( ar_valid ),
        .ar_ready ( ar_ready ),
        .r_id     ( r_id     ),
        .r_data   ( r_data   ),
        .r_last   ( r_last   ),
        .r_valid  ( r_valid  ),
        .r_ready  ( r_ready  )
    );

endmodule
