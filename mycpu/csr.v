`include "config.vh"
`include "csr.vh"
`include "TLB.vh"
module csr
(
    input clk,
    input aclk,
    input aresetn,

    output [31:0] rdata,

    
    input wen_in,
    input [13:0] addr_in,
    input [31:0] wdata_in,
    input d_idle,

    output [31:0] crmd, //当前模式信息，包含privilege
    output [31:0] estat,    //例外状态 idle_interrupt, 
    output [31:0] era_out,
    output [31:0] eentry,
    output [31:0] tlbrentry,
    output [31:0] pgdl,pgdh,
    output cpu_interrupt,
    output [31:0] dmw0,
    output [31:0] dmw1,
    output llbit,
    output idle_over,
    output wen_csr,
    //TLB输出
    //待定
    output PG,
    output [2:0] DMW0_PSEG,
    output [2:0] DMW1_PSEG,
    output [2:0] DMW0_VSEG,
    output [2:0] DMW1_VSEG,
    output [31:0] ASID,
    output [31:0] TLBEHI,
    output [31:0]  TLBIDX,
    
    output     [`TLB_CPRLEN - 1:0]     tlb_cpr_out,    
    output     [`TLB_TRANSLEN - 1:0]   tlb_trans_1_out,
    output     [`TLB_TRANSLEN - 1:0]   tlb_trans_2_out,

    input exception, //进入例外
    input ertn, //例外返回
    input tlb_exception, //TLB例外,要回到直接地址映射模式
    input [6:0] expcode_in, //例外代码 最高位是subexpcode
    input wen_expcode, //写入例外代码
    input [31:0] era_in, //例外返回地址
    input wen_era, //写入例外返回地址
    input [31:0] badv_in, //例外地址
    input wen_badv, //写入例外地址
    // input [`PGD_BASE] pgd_base_in, //页表基址
    // input wen_pgd_base, //写入页表基址
    //input [18:0] tlbehi_vppn_in,
    //input wen_tlbehi_vppn,
    input llbit_set,
    input llbit_clear, //by other没有用，直接看ertn就行
    input tlbsrch_ready, //已经判断完是否命中
    input tlbsrch_hit, //TLBSRCH是否命中
    input [4:0] tlb_index_in, //TLB命中的索引   最高位是hit，后面不要了

    input tlbrd_ready,
    input tlbrd_hit,
    input     [`TLB_CPRLEN - 1:0]     tlbrd_cpr,    
    input     [`TLB_TRANSLEN - 1:0]   tlbrd_trans_1,
    input     [`TLB_TRANSLEN - 1:0]   tlbrd_trans_2,
    input [7:0] hardware_interrupt,
    input flush_to_priv_wr_csr,
    output  [31:0] tid

    // input tlb_index_we,
    // input tlb_ps_we,
    // input tlb_ne_we
    `ifdef DIFFTEST
    ,
    output [31:0] crmd_diff,
    output [31:0] prmd_diff,
    output [31:0] ectl_diff,
    output [31:0] estat_diff,
    output [31:0] era_diff,
    output [31:0] badv_diff,
    output [31:0] eentry_diff,
    output [31:0] tlbidx_diff,
    output [31:0] tlbehi_diff,
    output [31:0] tlbelo0_diff,
    output [31:0] tlbelo1_diff,
    output [31:0] asid_diff,
    output [31:0] pgdl_diff,
    output [31:0] pgdh_diff,
    output [31:0] save0_diff,
    output [31:0] save1_diff,
    output [31:0] save2_diff,
    output [31:0] save3_diff,
    output [31:0] tid_diff,
    output [31:0] tcfg_diff,
    output [31:0] tval_diff,
    output [31:0] ticlr_diff,
    output [31:0] llbctl_diff,
    output [31:0] tlbrentry_diff,
    output [31:0] dmw0_diff,
    output [31:0] dmw1_diff
`endif
);
reg exception_delay;        // delay信号

always @ ( posedge clk  )
  if( !aresetn )
     exception_delay <= 0;
  else
     exception_delay <= exception;   // orig是原信号
wire pos_signal_excp = exception&& ( ~exception_delay );       // 原信号上升沿位置处产生的pulse信号
    wire [31:0] csr_crmd ;
    wire [31:0] csr_prmd ;
    wire [31:0] csr_euen ;
    wire [31:0] csr_ecfg ;
    wire [31:0] csr_estat ;
    reg [31:0] csr_era =0;//////////////////
    reg [31:0] csr_badv=0 ;//////////////////
    wire [31:0] csr_eentry ;
    wire [31:0] csr_cpuid ;
    reg [31:0] csr_save0 =0;  ////////
    reg [31:0] csr_save1 =0; ////////
    reg [31:0] csr_save2 =0; ////////
    reg [31:0] csr_save3 =0; ////////
    wire [31:0] csr_llbctl ;
    wire [31:0] csr_tlbidx ;
    wire [31:0] csr_tlbehi ;
    wire [31:0] csr_tlbelo0 ;
    wire [31:0] csr_tlbelo1 ;
    wire [31:0] csr_asid ;
    wire [31:0] csr_pgdl ;
    wire [31:0] csr_pgdh ;
    wire [31:0] csr_pgd ;
    wire [31:0] csr_tlbrentry ;
    wire [31:0] csr_dmw0 ;
    wire [31:0] csr_dmw1 ;
    reg [31:0] csr_tid =0;
    wire [31:0] csr_tcfg ;
    reg [31:0] csr_tval =0;
    wire [31:0] csr_ticlr ;
    reg [31:0] csr_ctag =0;

reg wen_reg = 0;
reg [31:0] wdata_reg = 0;
reg [13:0] waddr_reg = 0;
reg [1:0]  count = 0;
always @(posedge clk)begin
    if(~aresetn) count <= 0;
    else if (flush_to_priv_wr_csr) count <= 0;
    else if (d_idle && wen_reg) 
        if (count < 2) count <= count + 1;
        else count <= 0;
end
assign wen_csr = d_idle && wen_reg && ~|count;
always @(posedge clk)begin
    if (~aresetn)begin
        wen_reg <= 0;
        wdata_reg <= 0;
        waddr_reg <= 0;
    end
    else if (flush_to_priv_wr_csr)begin
        wen_reg <= 0;
        wdata_reg <= 0;
        waddr_reg <= 0;
    end
    else if (wen_in)begin
        wen_reg <= 1;
        wdata_reg <= wdata_in;
        waddr_reg <= addr_in;
    end
    else if (count == 2)begin
        wen_reg <= 0;
        wdata_reg <= 0;
        waddr_reg <= 0;
    end
end
wire  wen = (count == 2);
wire [31:0] wdata = wdata_reg;
wire [13:0] addr = waddr_reg;

//CRMD
    reg [`CRMD_PLV]     crmd_plv=0;
    reg [`CRMD_IE]      crmd_ie=0;
    reg [`CRMD_DA]      crmd_da=1;
    reg [`CRMD_PG]      crmd_pg=0;
    reg [`CRMD_DATF]    crmd_datf=0;
    reg [`CRMD_DATM]    crmd_datm=0;
    assign csr_crmd[`CRMD_PLV]  = crmd_plv;
    assign csr_crmd[`CRMD_IE]   = crmd_ie;
    assign csr_crmd[`CRMD_DA]   = crmd_da;
    assign csr_crmd[`CRMD_PG]   = crmd_pg;
    assign csr_crmd[`CRMD_DATF] = crmd_datf;
    assign csr_crmd[`CRMD_DATM] = crmd_datm;
    assign csr_crmd[`CRMD_ZERO] = 0;

    //PRMD
    reg [`PRMD_PPLV]    prmd_pplv=0;
    reg [`PRMD_PIE]     prmd_pie=0;
    assign csr_prmd[`PRMD_PPLV] = prmd_pplv;
    assign csr_prmd[`PRMD_PIE]  = prmd_pie;
    assign csr_prmd[`PRMD_ZERO] = 0;

      //EUEN
    reg [`EUEN_FPE]     euen_fpe=0;
    assign csr_euen[`EUEN_FPE]  = euen_fpe;
    assign csr_euen[`EUEN_ZERO] = 0;

        //ECFG
    reg [`ECFG_LIE]     ecfg_lie=0;
    assign csr_ecfg[`ECFG_LIE]  = ecfg_lie;
    assign csr_ecfg[`ECFG_ZERO] = 0;

        //ESTAT
        reg reg_soft_interrupt;
always@(posedge clk)
    reg_soft_interrupt<=|estat_is_soft;

    reg [`ESTAT_IS_SOFT] estat_is_soft=0;
    reg [`ESTAT_IS_HARD] estat_is_hard=0;
    reg [`ESTAT_IS_TI] estat_is_ti=0;
    //reg [`ESTAT_IS_IPI] estat_is_ipi;  
    reg [`ESTAT_ECODE] estat_ecode=0;
    reg [`ESTAT_ESUBCODE] estat_subecode=0;
    assign csr_estat[`ESTAT_IS_SOFT] = estat_is_soft; //软件中断位
    assign csr_estat[`ESTAT_IS_HARD] = estat_is_hard; //硬件中断位
    assign csr_estat[`ESTAT_ZERO_0] = 0;
    assign csr_estat[`ESTAT_IS_TI] = estat_is_ti; //计时器中断位
    //assign csr_estat[`ESTAT_IS_IPI] = estat_is_ipi; //核间中断位
    assign csr_estat[`ESTAT_IS_IPI] = 0; //核间中断位
    assign csr_estat[`ESTAT_ECODE]  = estat_ecode;
    assign csr_estat[`ESTAT_ESUBCODE] = estat_subecode;
    assign csr_estat[`ESTAT_ZERO_1] = 0;

    //EENTRY
    reg [`EENTRY_VA] eentry_va=0;
    assign csr_eentry[`EENTRY_ZERO] = 0;
    assign csr_eentry[`EENTRY_VA] = eentry_va;

    //CPUID
    reg [`CPUID_COREID] cpuid_coreid=0;
    assign csr_cpuid[`CPUID_ZERO] = 0;
    assign csr_cpuid[`CPUID_COREID] = cpuid_coreid;

    //LLBCTL
    reg [`LLBCTL_ROLLB] llbctl_rollb=0;
    //reg [`LLBCTL_WCLLB] llbctl_wcllb;
    reg [`LLBCTL_KLO] llbctl_klo=0;
    assign csr_llbctl[`LLBCTL_ROLLB] = llbctl_rollb;
    assign csr_llbctl[`LLBCTL_WCLLB] = 0;
    assign csr_llbctl[`LLBCTL_KLO] = llbctl_klo;
    assign csr_llbctl[`LLBCTL_ZERO] = 0;

    //TLBIDX
    reg [`TLBIDX_INDEX] tlbidx_index=0;
    reg [`TLBIDX_PS] tlbidx_ps=0;
    reg [`TLBIDX_NE] tlbidx_ne=0;
    assign csr_tlbidx[`TLBIDX_INDEX] = tlbidx_index;
    assign csr_tlbidx[`TLBIDX_ZERO_0] = 0;
    assign csr_tlbidx[`TLBIDX_PS] = tlbidx_ps;
    assign csr_tlbidx[`TLBIDX_ZERO_1] = 0;
    assign csr_tlbidx[`TLBIDX_NE] = tlbidx_ne;

    //TLBEHI
    reg [`TLBEHI_VPPN] tlbehi_vppn=0;
    assign csr_tlbehi[`TLBEHI_ZERO] = 0;
    assign csr_tlbehi[`TLBEHI_VPPN] = tlbehi_vppn;

    //TLBELO0
    reg [`TLBELO_V] tlbelo0_v=0;
    reg [`TLBELO_D] tlbelo0_d=0;
    reg [`TLBELO_PLV] tlbelo0_plv=0;
    reg [`TLBELO_MAT] tlbelo0_mat=0;
    reg [`TLBELO_G] tlbelo0_g=0;
    reg [`TLBELO_PPN] tlbelo0_ppn=0;
    assign csr_tlbelo0[`TLBELO_V] = tlbelo0_v;
    assign csr_tlbelo0[`TLBELO_D] = tlbelo0_d;
    assign csr_tlbelo0[`TLBELO_PLV] = tlbelo0_plv;
    assign csr_tlbelo0[`TLBELO_MAT] = tlbelo0_mat;
    assign csr_tlbelo0[`TLBELO_G] = tlbelo0_g;
    assign csr_tlbelo0[`TLBELO_ZERO_0] = 0;
    assign csr_tlbelo0[`TLBELO_PPN] = tlbelo0_ppn;
    assign csr_tlbelo0[`TLBELO_ZERO_1] = 0;

    //TLBELO1
    reg [`TLBELO_V] tlbelo1_v=0;
    reg [`TLBELO_D] tlbelo1_d=0;
    reg [`TLBELO_PLV] tlbelo1_plv=0;
    reg [`TLBELO_MAT] tlbelo1_mat=0;
    reg [`TLBELO_G] tlbelo1_g=0;
    reg [`TLBELO_PPN] tlbelo1_ppn=0;
    assign csr_tlbelo1[`TLBELO_V] = tlbelo1_v;
    assign csr_tlbelo1[`TLBELO_D] = tlbelo1_d;
    assign csr_tlbelo1[`TLBELO_PLV] = tlbelo1_plv;
    assign csr_tlbelo1[`TLBELO_MAT] = tlbelo1_mat;
    assign csr_tlbelo1[`TLBELO_G] = tlbelo1_g;
    assign csr_tlbelo1[`TLBELO_ZERO_0] = 0;
    assign csr_tlbelo1[`TLBELO_PPN] = tlbelo1_ppn;
    assign csr_tlbelo1[`TLBELO_ZERO_1] = 0;

    //ASID
    reg [`ASID_ASID] asid_asid=0;
    reg [`ASID_ASIDBITS]   asid_asidbits=0;
    assign csr_asid[`ASID_ASID] = asid_asid;
    assign csr_asid[`ASID_ZERO_0] = 0;
    assign csr_asid[`ASID_ZERO_1] = 0;
    assign csr_asid[`ASID_ASIDBITS] = 'ha;

    //PGDL
    reg [`PGDL_BASE] pgdl_base=0;
    assign csr_pgdl[`PGDL_BASE] = pgdl_base;
    assign csr_pgdl[`PGDL_ZERO] = 0;
    //PGDH
    reg [`PGDH_BASE] pgdh_base=0;
    assign csr_pgdh[`PGDH_BASE] = pgdh_base;
    assign csr_pgdh[`PGDH_ZERO] = 0;
    //PGD
    reg [`PGD_BASE] pgd_base=0;
    assign csr_pgd[`PGD_BASE] = pgd_base;
    assign csr_pgd[`PGD_ZERO] = 0;

    //TLBRENTRY
    reg [`TLBRENTRY_PA] tlbrentry_pa=0;
    assign csr_tlbrentry[`TLBRENTRY_ZERO] = 0;
    assign csr_tlbrentry[`TLBRENTRY_PA] = tlbrentry_pa;

    //DMW0
    reg [`DMW0_PLV0] dmw0_plv0=0;
    reg [`DMW0_PLV3] dmw0_plv3=0;
    reg [`DMW0_MAT] dmw0_mat=0;
    reg [`DMW0_PSEG] dmw0_pseg=0;
    reg [`DMW0_VSEG] dmw0_vseg=0;
    assign csr_dmw0[`DMW0_PLV0] = dmw0_plv0;
    assign csr_dmw0[`DMW0_PLV3] = dmw0_plv3;
    assign csr_dmw0[`DMW0_MAT] = dmw0_mat;
    assign csr_dmw0[`DMW0_PSEG] = dmw0_pseg;
    assign csr_dmw0[`DMW0_VSEG] = dmw0_vseg;
    assign csr_dmw0[`DMW0_ZERO_0] = 0;
    assign csr_dmw0[`DMW0_ZERO_1] = 0;
    assign csr_dmw0[`DMW0_ZERO_2] = 0;

    //DMW1
    reg [`DMW1_PLV0] dmw1_plv0=0;
    reg [`DMW1_PLV3] dmw1_plv3=0;
    reg [`DMW1_MAT] dmw1_mat=0;
    reg [`DMW1_PSEG] dmw1_pseg=0;
    reg [`DMW1_VSEG] dmw1_vseg=0;
    assign csr_dmw1[`DMW1_PLV0] = dmw1_plv0;
    assign csr_dmw1[`DMW1_PLV3] = dmw1_plv3;
    assign csr_dmw1[`DMW1_MAT] = dmw1_mat;
    assign csr_dmw1[`DMW1_PSEG] = dmw1_pseg;
    assign csr_dmw1[`DMW1_VSEG] = dmw1_vseg;
    assign csr_dmw1[`DMW1_ZERO_0] = 0;
    assign csr_dmw1[`DMW1_ZERO_1] = 0;
    assign csr_dmw1[`DMW1_ZERO_2] = 0;

    //TCFG
    reg [`TCFG_EN] tcfg_en=0;
    reg [`TCFG_PERIODIC] tcfg_periodic=0;
    reg [`TCFG_INITVAL] tcfg_initval=0;
    assign csr_tcfg[`TCFG_EN] = tcfg_en;
    assign csr_tcfg[`TCFG_PERIODIC] = tcfg_periodic;
    assign csr_tcfg[`TCFG_INITVAL] = tcfg_initval;
    
    //TICLR
    reg [`TICLR_CLR] tlclr_clr=0; 
    assign csr_ticlr[`TICLR_CLR] = 0;
    assign csr_ticlr[`TICLR_ZERO] = 0;
assign cpu_interrupt=crmd_ie&&(ecfg_lie&csr_estat[12:0])!=0; //全局中断允许且（局部中断使能位与例外状态位）不为0
assign idle_over= |csr_estat[12:0]; //各种中断，无论软件硬件，无论是否使能，只有有例外就结束idle(马哥这样实现的)
wire pg_next;
wire da_next;
assign pg_next = wen?wdata[4]:crmd_pg;
assign da_next = wen?wdata[3]:crmd_da;
always @(posedge clk)
        if(~aresetn) begin
            crmd_plv <= 0;
            crmd_ie <= 0;
            crmd_da <= 1;
            crmd_pg <= 0;
            crmd_datf <=0; //TODO 
            crmd_datm <= 0;
        end else if(ertn) begin
            crmd_plv <= prmd_pplv;
            crmd_ie <= prmd_pie;
            if(estat_ecode==6'h3F) begin //之前进入过TLB重新装填例外
                crmd_da <= 0;
                crmd_pg <= 1;
            end
        end else if(pos_signal_excp) begin
            if(tlb_exception) begin //现在要进入TLB例外
                crmd_da <= 1;
                crmd_pg <= 0;
            end
            crmd_plv <= 0;
            crmd_ie <= 0;
        end else if(wen&&addr==`CSR_CRMD) begin
            if(wen) crmd_plv[`CRMD_PLV]  <= wdata[`CRMD_PLV];
            if(wen) crmd_ie[`CRMD_IE]   <= wdata[`CRMD_IE];
            if(wen) crmd_datf[`CRMD_DATF] <= wdata[`CRMD_DATF];
            if(wen) crmd_datm[`CRMD_DATM] <= wdata[`CRMD_DATM];
            //只在{pg,da}处在合法状态时更新
            if(wen) begin
                if(pg_next ^ da_next) begin
                    {crmd_pg,crmd_da} <= {pg_next,da_next};
                end
            end
        end
//PRMD
    always @(posedge clk)
        if(~aresetn) begin
            prmd_pplv <= 0;
            prmd_pie <= 0;
        end else if(pos_signal_excp) begin
            prmd_pplv <= crmd_plv;
            prmd_pie  <= crmd_ie;
        end else if(wen&&addr==`CSR_PRMD) begin
            if(wen) prmd_pplv[`PRMD_PPLV]<=wdata[`PRMD_PPLV];
            if(wen) prmd_pie[`PRMD_PIE] <=wdata[`PRMD_PIE];
        end
        //EUEN
    always @(posedge clk)
        if(~aresetn) begin
            euen_fpe <= 0;
        end else if(wen&&addr==`CSR_EUEN) begin
            if(wen) euen_fpe[0]<=wdata[0];
        end

         //ECFG
    always @(posedge clk)
        if(~aresetn) begin
            ecfg_lie <= 0;
        end else if(wen&&addr==`CSR_ECFG) begin
           if(wen) ecfg_lie[`ECFG_LIE]<=wdata[`ECFG_LIE] & 13'b1_1011_1111_1111;

        end
    
   
    //ESTAT
    always @(posedge clk)
        if(~aresetn) begin
            estat_is_soft <= 0;
            estat_ecode <= 0;
            estat_subecode <= 0;
        end
        else if(wen_expcode | pos_signal_excp) begin
            estat_ecode <= expcode_in[5:0];
            estat_subecode <= expcode_in[5:0]==0 ? 0:{8'b0,expcode_in[6]};
        end
        // else if(~(|hardware_interrupt))begin
        //     estat_ecode <= 0;
        //     estat_subecode <= 0;
        // end
        else if(wen&&addr==`CSR_ESTAT) begin
            if(wen) estat_is_soft[`ESTAT_IS_SOFT]<=wdata[`ESTAT_IS_SOFT];
        end
    always@(*) estat_is_hard[`ESTAT_IS_HARD] = hardware_interrupt;
    //ERA
    always @(posedge clk)
        if(~aresetn) begin
            csr_era <= 0;
        end else if(wen_era) begin
            if(reg_soft_interrupt)
                csr_era <= era_in+4;
            else csr_era <= era_in;
        end else if(wen&&addr==`CSR_ERA) begin
            if(wen) csr_era[ 31:0]<=wdata[ 31:0];
            
        end

    //BADV
    always @(posedge clk)
        if(~aresetn) begin
            csr_badv <= 0;
        end else if(wen_badv) begin
            csr_badv <= badv_in;
        end else if(wen&&addr==`CSR_BADV) begin
            if(wen) csr_badv[31:0]<=wdata[31:0];
        end

    //EENTRY
    always @(posedge clk)
        if(~aresetn) begin
            eentry_va <= 0;
        end else if(wen&&addr==`CSR_EENTRY) begin
            if(wen) eentry_va[`EENTRY_VA]<=wdata[`EENTRY_VA];
        end

    //CPUID
    always @(*)
        cpuid_coreid = 0;

    //SAVE0~3
    always @(posedge clk)
        if(~aresetn) begin
            csr_save0 <= 0;
        end else if(wen&&addr==`CSR_SAVE0) begin
            if(wen) csr_save0[31:0]<=wdata[31:0];
        end

    always @(posedge clk)
        if(~aresetn) begin
            csr_save1 <= 0;
        end else if(wen&&addr==`CSR_SAVE1) begin
            if(wen) csr_save1[31:0]<=wdata[31:0];
        end

    always @(posedge clk)
        if(~aresetn) begin
            csr_save2 <= 0;
        end else if(wen&&addr==`CSR_SAVE2) begin
            if(wen) csr_save2[31:0]<=wdata[31:0];
        end

    always @(posedge clk)
        if(~aresetn) begin
            csr_save3 <= 0;
        end else if(wen&&addr==`CSR_SAVE3) begin
            if(wen) csr_save3[31:0]<=wdata[31:0];
        end

//LLBCTL
    always @(posedge clk)
        if(~aresetn) begin
            llbctl_klo <= 0;
            llbctl_rollb <= 1;
        end 
        else if(llbit_set) llbctl_rollb<=1;
        else if(ertn) begin 
            llbctl_rollb<=llbctl_klo;
            llbctl_klo<=0;
        end 
        else if(llbit_clear) llbctl_rollb<=0;
        else if(wen&&addr==`CSR_LLBCTL) begin
            if(wen&&wdata[1]) llbctl_rollb<=0;
            if(wen) llbctl_klo<=wdata[2];
        end
    
    //TLBRENTRY
    always @(posedge clk)
        if(~aresetn) begin
            tlbrentry_pa <= 0;
        end else if(wen&&addr==`CSR_TLBRENTRY) begin
            if(wen) tlbrentry_pa[`TLBRENTRY_PA]<=wdata[`TLBRENTRY_PA];
        end
    wire [18:0] vppn_in;
    wire [5:0] ps_in;
    wire g_in;
    wire [9:0] asid_in;
    wire e_in;
    wire [19:0] ppn0_in;
    wire [1:0] plv0_in;
    wire [1:0] mat0_in;
    wire d0_in;
    wire v0_in;
    wire [19:0] ppn1_in;
    wire [1:0] plv1_in;
    wire [1:0] mat1_in;
    wire d1_in;
    wire v1_in;

    assign vppn_in=tlbrd_cpr[`TLB_VPPN];
    assign ps_in=tlbrd_cpr[`TLB_PS];
    assign g_in=tlbrd_cpr[`TLB_G];
    assign asid_in=tlbrd_cpr[`TLB_ASID];
    assign e_in=tlbrd_cpr[`TLB_E];

    assign ppn0_in=tlbrd_trans_1[`TLB_PPN];
    assign plv0_in=tlbrd_trans_1[`TLB_PLV];
    assign mat0_in=tlbrd_trans_1[`TLB_MAT];
    assign d0_in=tlbrd_trans_1[`TLB_D];
    assign v0_in=tlbrd_trans_1[`TLB_V];

    assign ppn1_in=tlbrd_trans_2[`TLB_PPN];
    assign plv1_in=tlbrd_trans_2[`TLB_PLV];
    assign mat1_in=tlbrd_trans_2[`TLB_MAT];
    assign d1_in=tlbrd_trans_2[`TLB_D];
    assign v1_in=tlbrd_trans_2[`TLB_V];

    assign tlb_cpr_out[`TLB_VPPN] = tlbehi_vppn;
    assign tlb_cpr_out[`TLB_PS] = tlbidx_ps;
    assign tlb_cpr_out[`TLB_G] = tlbelo0_g;
    assign tlb_cpr_out[`TLB_ASID] = asid_asid;
    assign tlb_cpr_out[`TLB_E] = (estat_ecode==6'h3F)?1:~tlbidx_ne;

    assign tlb_trans_1_out[`TLB_PPN] = tlbelo0_ppn;
    assign tlb_trans_1_out[`TLB_PLV] = tlbelo0_plv;
    assign tlb_trans_1_out[`TLB_MAT] = tlbelo0_mat;
    assign tlb_trans_1_out[`TLB_D] = tlbelo0_d;
    assign tlb_trans_1_out[`TLB_V] = tlbelo0_v;

    assign tlb_trans_2_out[`TLB_PPN] = tlbelo1_ppn;
    assign tlb_trans_2_out[`TLB_PLV] = tlbelo1_plv;
    assign tlb_trans_2_out[`TLB_MAT] = tlbelo1_mat;
    assign tlb_trans_2_out[`TLB_D] = tlbelo1_d;
    assign tlb_trans_2_out[`TLB_V] = tlbelo1_v;
    //TIBIDX
    always @(posedge clk)
        if(~aresetn) begin
            tlbidx_index<=0;
            tlbidx_ps<=0;
            tlbidx_ne<=0;
        end
        else if(wen&&addr==`CSR_TLBIDX) begin
            if(wen) tlbidx_index[4:0]<=wdata[4:0];
            if(wen) tlbidx_ps[`TLBIDX_PS]<=wdata[`TLBIDX_PS];
            if(wen) tlbidx_ne[`TLBIDX_NE]<=wdata[`TLBIDX_NE];
        end 
        else begin
            if(tlbsrch_ready) begin
                if(tlbsrch_hit) begin
                    tlbidx_index[4:0]<=tlb_index_in[4:0];
                    tlbidx_ne<=0;
                end
                else begin
                    tlbidx_ne<=1;
                end
            end 
            else if(tlbrd_ready)
                if(tlbrd_hit) begin
                    tlbidx_ps[`TLBIDX_PS]<=ps_in;
                    tlbidx_ne<=0;
                end
                else begin
                    tlbidx_ps[`TLBIDX_PS]<=0;
                    tlbidx_ne[`TLBIDX_NE]<=1;
                end
        end


    //TLBEHI
    always@(posedge clk)begin
        if(~aresetn)
            tlbehi_vppn<=0;
        else if(wen&&addr==`CSR_TLBEHI) begin
            if(wen) tlbehi_vppn[`TLBEHI_VPPN]<=wdata[`TLBEHI_VPPN];
        end else if(tlbrd_ready) begin
            if(tlbrd_hit) begin
                tlbehi_vppn<=vppn_in;
            end
            else begin
                tlbehi_vppn<=0;
            end
        end
    end

    //TLBELO0
    always@(posedge clk) begin
        if(~aresetn)begin
            tlbelo0_d<=0;
            tlbelo0_g<=0;
            tlbelo0_mat<=0;
            tlbelo0_plv<=0;
            tlbelo0_ppn<=0;
            tlbelo0_v<=0;

        end
        else if(wen&& addr==`CSR_TLBELO0) begin
            if(wen) begin
                tlbelo0_d[`TLBELO_D]<=wdata[`TLBELO_D];
                tlbelo0_g[`TLBELO_G]<=wdata[`TLBELO_G];
                tlbelo0_mat[`TLBELO_MAT]<=wdata[`TLBELO_MAT];
                tlbelo0_plv[`TLBELO_PLV]<=wdata[`TLBELO_PLV];
                tlbelo0_ppn[`TLBELO_PPN]<=wdata[`TLBELO_PPN];
                tlbelo0_v[`TLBELO_V]<=wdata[`TLBELO_V];
            
            end

        end
        else if(tlbrd_ready)begin
            if(tlbrd_hit) begin
                tlbelo0_d<=d0_in;
                tlbelo0_g<=g_in;
                tlbelo0_mat<=mat0_in;
                tlbelo0_plv<=plv0_in;
                tlbelo0_ppn<=ppn0_in;
                tlbelo0_v<=v0_in;
            end
            else begin
                tlbelo0_d<=0;
                tlbelo0_g<=0;
                tlbelo0_mat<=0;
                tlbelo0_plv<=0;
                tlbelo0_ppn<=0;
                tlbelo0_v<=0;
            
            end
        end
    end

    //TLBELO1
    always@(posedge clk) begin
        if(~aresetn) begin
            tlbelo1_d<=0;
            tlbelo1_g<=0;
            tlbelo1_mat<=0;
            tlbelo1_plv<=0;
            tlbelo1_ppn<=0;
            tlbelo1_v<=0;
        end
        else if(wen&&addr==`CSR_TLBELO1) begin
            if(wen) begin
                tlbelo1_d[`TLBELO_D]<=wdata[`TLBELO_D];
                tlbelo1_g[`TLBELO_G]<=wdata[`TLBELO_G];
                tlbelo1_mat[`TLBELO_MAT]<=wdata[`TLBELO_MAT];
                tlbelo1_plv[`TLBELO_PLV]<=wdata[`TLBELO_PLV];
                tlbelo1_ppn[`TLBELO_PPN]<=wdata[`TLBELO_PPN];
                tlbelo1_v[`TLBELO_V]<=wdata[`TLBELO_V];
            end
        end
        else if(tlbrd_ready)begin
            if(tlbrd_hit) begin
                tlbelo1_d<=d1_in;
                tlbelo1_g<=g_in;
                tlbelo1_mat<=mat1_in;
                tlbelo1_plv<=plv1_in;
                tlbelo1_ppn<=ppn1_in;
                tlbelo1_v<=v1_in;
            end
            else begin
                tlbelo1_d<=0;
                tlbelo1_g<=0;
                tlbelo1_mat<=0;
                tlbelo1_plv<=0;
                tlbelo1_ppn<=0;
                tlbelo1_v<=0;
            end
        end
    end


    //ASID
    always @(posedge clk)
        if(~aresetn)
            asid_asid <= 0;
        else if(wen&&addr==`CSR_ASID) begin
            if(wen) asid_asid[`ASID_ASID]<=wdata[`ASID_ASID];
        end
         else if(tlbrd_ready) begin
            if(tlbrd_hit) begin
                asid_asid<=asid_in;
            end
            else begin
                asid_asid<=0;
            end
         end

        //PGDL
    always @(posedge clk)
        if(~aresetn) begin
            pgdl_base <= 0;
        end else if(wen&&addr==`CSR_PGDL) begin
            if(wen) pgdl_base[`PGDL_BASE] <= wdata[`PGDL_BASE];
        end

    //PGDH
    always @(posedge clk)
        if(~aresetn) begin
            pgdh_base <= 0;
        end else if(wen&&addr==`CSR_PGDH) begin
            if(wen) pgdh_base[`PGDH_BASE] <= wdata[`PGDH_BASE];
        end

    //PGD只读
        

    //DMW0~1
    always @(posedge clk)
        if(~aresetn) begin
            dmw0_plv0<=0;
            dmw0_plv3<=0;
            dmw0_mat<=0;
            dmw0_pseg<=0;
            dmw0_vseg<=0;
        end else if(wen&&addr==`CSR_DMW0) begin
            if(wen) dmw0_plv0[`DMW0_PLV0]<=wdata[`DMW0_PLV0];
            if(wen) dmw0_plv3[`DMW0_PLV3]<=wdata[`DMW0_PLV3];
            if(wen) dmw0_mat[`DMW0_MAT]<=wdata[`DMW0_MAT];
            if(wen) dmw0_pseg[`DMW0_PSEG]<=wdata[`DMW0_PSEG];
            if(wen) dmw0_vseg[`DMW0_VSEG]<=wdata[`DMW0_VSEG];
        end
    
    always@(posedge clk) 
        if(~aresetn) begin
            dmw1_plv0<=0;
            dmw1_plv3<=0;
            dmw1_mat<=0;
            dmw1_pseg<=0;
            dmw1_vseg<=0;
        end else if(wen&&addr==`CSR_DMW1) begin
            if(wen) dmw1_plv0[`DMW1_PLV0]<=wdata[`DMW1_PLV0];
            if(wen) dmw1_plv3[`DMW1_PLV3]<=wdata[`DMW1_PLV3];
            if(wen) dmw1_mat[`DMW1_MAT]<=wdata[`DMW1_MAT];
            if(wen) dmw1_pseg[`DMW1_PSEG]<=wdata[`DMW1_PSEG];
            if(wen) dmw1_vseg[`DMW1_VSEG]<=wdata[`DMW1_VSEG];
        end

    //tid
        always @(posedge clk)
        if(~aresetn) begin
            csr_tid <= 0;
        end else if(wen&&addr==`CSR_TID) begin
            if(wen) csr_tid[31:0]<=wdata[31:0];
        end
    //TCFG
    always @(posedge clk)
        if(~aresetn) begin
            tcfg_en <= 0;
            tcfg_initval <= 0;
            tcfg_periodic<=0;
        end else if(wen&&addr==`CSR_TCFG) begin
            if(wen) tcfg_en[`TCFG_EN]<=wdata[`TCFG_EN];
            if(wen) tcfg_periodic[`TCFG_PERIODIC]<=wdata[`TCFG_PERIODIC];
            if(wen) tcfg_initval[`TCFG_INITVAL]<=wdata[`TCFG_INITVAL];
        end

    reg  set_timer;
    always @(posedge clk)
        if(~aresetn)  set_timer<=0;
        else if(wen&&addr==`CSR_TCFG&&wen!=0)
             set_timer<=1;
        else  set_timer<=0;

    //TVAL
    reg time_out;
    always @(posedge aclk)
        if(~aresetn) begin
            csr_tval <= 0;
            time_out <= 0;
        end
        //FIXME: 设置TCFG.InitVal后自动重置定时器，这在手册中未提及
        else if(csr_tval==0|| set_timer) begin
            time_out <= 0;
            //计时器的初始值比标准大1，否则给定时器设置0无法触发中断
            //if(tcfg_periodic|| set_timer) csr_tval<={tcfg_initval[`TCFG_INITVAL],2'd1};
            if(tcfg_periodic|| set_timer) csr_tval<= {2'b00,tcfg_initval[`TCFG_INITVAL]} + 100;
        end else if(tcfg_en) begin
            csr_tval<=csr_tval-1;
            time_out<=csr_tval==1;
        end

    //TICLR
    always @(posedge aclk)
        if(~aresetn||wen&&addr==`CSR_TICLR&&wen)
            estat_is_ti <= 0;
        else if(time_out)
            estat_is_ti <= 1;

            //CTAG
    always @(posedge clk)
        if(~aresetn) begin
            csr_ctag <= 0;
        end else if(wen&&addr==`CSR_CTAG) begin
            if(wen) csr_ctag[31:0]<=wdata[31:0];
        end

assign rdata[31:0] = {32{addr_in==`CSR_CRMD}} & csr_crmd |
                    {32{addr_in==`CSR_PRMD}} & csr_prmd |
                    {32{addr_in==`CSR_EUEN}} & csr_euen |
                    {32{addr_in==`CSR_ECFG}} & csr_ecfg & 32'b1_1011_1111_1111 | 
                    {32{addr_in==`CSR_ESTAT}} & csr_estat |
                    {32{addr_in==`CSR_ERA}} & csr_era |
                    {32{addr_in==`CSR_BADV}} & csr_badv |
                    {32{addr_in==`CSR_EENTRY}} & csr_eentry |
                    {32{addr_in==`CSR_CPUID}} & csr_cpuid |
                    {32{addr_in==`CSR_SAVE0}} & csr_save0 |
                    {32{addr_in==`CSR_SAVE1}} & csr_save1 |
                    {32{addr_in==`CSR_SAVE2}} & csr_save2 |
                    {32{addr_in==`CSR_SAVE3}} & csr_save3 |
                    {32{addr_in==`CSR_LLBCTL}} & csr_llbctl |
                    {32{addr_in==`CSR_TLBIDX}} & csr_tlbidx |
                    {32{addr_in==`CSR_TLBEHI}} & csr_tlbehi |
                    {32{addr_in==`CSR_TLBELO0}} & csr_tlbelo0 |
                    {32{addr_in==`CSR_TLBELO1}} & csr_tlbelo1 |
                    {32{addr_in==`CSR_ASID}} & csr_asid |
                    {32{addr_in==`CSR_PGDL}} & csr_pgdl |
                    {32{addr_in==`CSR_PGDH}} & csr_pgdh |
                    {32{addr_in==`CSR_PGD && csr_badv[31]}} & csr_pgdh |
                    {32{addr_in==`CSR_PGD && ~csr_badv[31]}} & csr_pgdl |
                    {32{addr_in==`CSR_TLBRENTRY}} & csr_tlbrentry |
                    {32{addr_in==`CSR_DMW0}} & csr_dmw0 |
                    {32{addr_in==`CSR_DMW1}} & csr_dmw1 |
                    {32{addr_in==`CSR_TID}} & csr_tid |
                    {32{addr_in==`CSR_TCFG}} & csr_tcfg |
                    {32{addr_in==`CSR_TVAL}} & csr_tval |
                    {32{addr_in==`CSR_TICLR}} & csr_ticlr |
                    {32{addr_in==`CSR_CTAG}} & csr_ctag;
        assign crmd=csr_crmd;
        assign estat=csr_estat;
        assign era_out = csr_era;
        assign eentry=csr_eentry;
        assign tlbrentry=csr_tlbrentry;
        assign pgdl=csr_pgdl;
        assign pgdh=csr_pgdh;
        assign dmw0=csr_dmw0;
        assign dmw1=csr_dmw1;
        //cpu_interrupt已经在前面赋值了
        assign llbit=csr_llbctl[0] | llbit_set; //llbit写优先
        assign DMW0_PSEG=csr_dmw0[`DMW0_PSEG];
        assign DMW0_VSEG=csr_dmw0[`DMW0_VSEG];
        assign DMW1_PSEG=csr_dmw1[`DMW1_PSEG];
        assign DMW1_VSEG=csr_dmw1[`DMW1_VSEG];
        assign PG=csr_crmd[4];
        assign ASID=csr_asid;
        assign TLBEHI=csr_tlbehi;
        assign TLBIDX=csr_tlbidx;
        assign tid = csr_tid;

            `ifdef DIFFTEST
    wire [32*26-1:0] csr_diff =  
    {
    wen&&addr==`CSR_CRMD ?  wdata  : pos_signal_excp ? {csr_crmd[31:3], 3'b000} :
                     ertn ? {csr_crmd[31:3],csr_prmd[2:0]}: csr_crmd,
    wen&&addr==`CSR_PRMD ? wdata  : pos_signal_excp ? {csr_prmd[31:3],csr_crmd[2:0]}:csr_prmd,
    wen&&addr==`CSR_ECFG ? wdata & 32'b1_1011_1111_1111 :csr_ecfg & 32'b1_1011_1111_1111 ,
    wen&&addr==`CSR_ESTAT ? (wdata & 32'b11 | csr_estat & ~32'b11) : pos_signal_excp ? {csr_estat[31:23], expcode_in[6:0], csr_estat[15:0]} :csr_estat,
    wen&&addr==`CSR_ERA ? wdata : pos_signal_excp ? era_in : csr_era,
    wen&&addr==`CSR_BADV ? wdata : wen_badv ? badv_in : csr_badv,
    wen&&(addr==`CSR_EENTRY) ? wdata :csr_eentry,
    wen&&addr==`CSR_TLBIDX ? wdata :csr_tlbidx,
    wen&&addr==`CSR_TLBEHI ? wdata :csr_tlbehi,
    wen&&addr==`CSR_TLBELO0 ? wdata :csr_tlbelo0,
    wen&&addr==`CSR_TLBELO1 ? wdata :csr_tlbelo1,
    wen&&addr==`CSR_ASID ? wdata :csr_asid,
    wen&&addr==`CSR_PGDL ? wdata :csr_pgdl,
    wen&&addr==`CSR_PGDH ? wdata :csr_pgdh,
    wen&&addr==`CSR_SAVE0 ? wdata :csr_save0,
    wen&&addr==`CSR_SAVE1 ? wdata :csr_save1,
    wen&&addr==`CSR_SAVE2 ? wdata :csr_save2,
    wen&&addr==`CSR_SAVE3 ? wdata :csr_save3,
    wen&&addr==`CSR_TID ? wdata :csr_tid,
    wen&&addr==`CSR_TCFG ? wdata :csr_tcfg,
    wen&&addr==`CSR_TVAL ? wdata :csr_tval,
    wen&&addr==`CSR_TICLR ? wdata :csr_ticlr,
    wen&&addr==`CSR_LLBCTL ? wdata : ertn ? {csr_llbctl[31:1], csr_llbctl[2]} :csr_llbctl,
    wen&&addr==`CSR_TLBRENTRY ? wdata :csr_tlbrentry,
    wen&&addr==`CSR_DMW0 ? wdata :csr_dmw0,
    wen&&addr==`CSR_DMW1 ? wdata :csr_dmw1};

    reg [32*26-1:0] csr_diff_delay0;

    always @(posedge clk) begin
        csr_diff_delay0 <= csr_diff;
    end

    assign {crmd_diff,prmd_diff,ectl_diff,estat_diff,era_diff,badv_diff,eentry_diff,tlbidx_diff,tlbehi_diff,tlbelo0_diff,tlbelo1_diff,asid_diff,pgdl_diff,pgdh_diff,save0_diff,save1_diff,save2_diff,save3_diff,tid_diff,tcfg_diff,tval_diff,ticlr_diff,llbctl_diff,tlbrentry_diff,dmw0_diff,dmw1_diff}=csr_diff_delay0;
    `endif
endmodule