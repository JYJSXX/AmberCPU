`include "../config.vh"
`include "../csr.vh"
module csr
(
    input clk,
    input aclk,
    input aresetn,

    input software_en,
    input [13:0] addr,
    output [31:0] rdata,
    input wen,
    input [31:0] wdata,

    output [31:0] crmd, //当前模式信息，包含privilege
    output [31:0] estat,    //例外状态 idle_interupt, 
    output [31:0] era_out,
    output [31:0] eentry,
    output [31:0] tlbrentry,
    output [31:0] pgdl,pgdh,
    output cpu_interupt,
    output [31:0] dmw0,
    output [31:0] dmw1,
    output llbit,
    output idle_over,
    //TLB输出
    //待定
    output PG,
    output [2:0] DMW0_PSEG,
    output [2:0] DMW1_PSEG,
    output [2:0] DMW0_VSEG,
    output [2:0] DMW1_VSEG,

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
    input [18:0] tlbehi_vppn_in,
    input wen_tlbehi_vppn,
    input llbit_set,
    //input llbit_clear, //by other没有用，直接看ertn就行
    input tlbsrch_ready, //已经判断完是否命中
    input tlbsrch_hit, //TLBSRCH是否命中
    input [4:0] tlb_index_in, //TLB命中的索引   
    input [`TLBIDX_WIDTH-1 :0] tlbidx_index_in,

    input tlbrd_ready,
    input tlbrd_hit,
    
    input [7:0] hardware_interrupt

    // input tlb_index_we,
    // input tlb_ps_we,
    // input tlb_ne_we
);

    wire [31:0] csr_crmd ;
    wire [31:0] csr_prmd ;
    wire [31:0] csr_euen ;
    wire [31:0] csr_ecfg ;
    wire [31:0] csr_estat ;
    reg [31:0] csr_era ;//////////////////
    reg [31:0] csr_badv ;//////////////////
    wire [31:0] csr_eentry ;
    wire [31:0] csr_cpuid ;
    reg [31:0] csr_save0 ;  ////////
    reg [31:0] csr_save1 ; ////////
    reg [31:0] csr_save2 ; ////////
    reg [31:0] csr_save3 ; ////////
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
    reg [31:0] csr_tid ;
    wire [31:0] csr_tcfg ;
    reg [31:0] csr_tval ;
    wire [31:0] csr_tlclr ;
    reg [31:0] csr_ctag ;


//CRMD
    reg [`CRMD_PLV]     crmd_plv;
    reg [`CRMD_IE]      crmd_ie;
    reg [`CRMD_DA]      crmd_da;
    reg [`CRMD_PG]      crmd_pg;
    reg [`CRMD_DATF]    crmd_datf;
    reg [`CRMD_DATM]    crmd_datm;
    assign csr_crmd[`CRMD_PLV]  = crmd_plv;
    assign csr_crmd[`CRMD_IE]   = crmd_ie;
    assign csr_crmd[`CRMD_DA]   = crmd_da;
    assign csr_crmd[`CRMD_PG]   = crmd_pg;
    assign csr_crmd[`CRMD_DATF] = crmd_datf;
    assign csr_crmd[`CRMD_DATM] = crmd_datm;
    assign csr_crmd[`CRMD_ZERO] = 0;

    //PRMD
    reg [`PRMD_PPLV]    prmd_pplv;
    reg [`PRMD_PIE]     prmd_pie;
    assign csr_prmd[`PRMD_PPLV] = prmd_pplv;
    assign csr_prmd[`PRMD_PIE]  = prmd_pie;
    assign csr_prmd[`PRMD_ZERO] = 0;

      //EUEN
    reg [`EUEN_FPE]     euen_fpe;
    assign csr_euen[`EUEN_FPE]  = euen_fpe;
    assign csr_euen[`EUEN_ZERO] = 0;

        //ECFG
    reg [`ECFG_LIE]     ecfg_lie;
    assign csr_ecfg[`ECFG_LIE]  = ecfg_lie;
    assign csr_ecfg[`ECFG_ZERO] = 0;

        //ESTAT
    reg [`ESTAT_IS_SOFT] estat_is_soft;
    reg [`ESTAT_IS_HARD] estat_is_hard;
    reg [`ESTAT_IS_TI] estat_is_ti;
    reg [`ESTAT_IS_IPI] estat_is_ipi;
    reg [`ESTAT_ECODE] estat_ecode;
    reg [`ESTAT_ESUBCODE] estat_subecode;
    assign csr_estat[`ESTAT_IS_SOFT] = estat_is_soft; //软件中断位
    assign csr_estat[`ESTAT_IS_HARD] = estat_is_hard; //硬件中断位
    assign csr_estat[`ESTAT_ZERO_0] = 0;
    assign csr_estat[`ESTAT_IS_TI] = estat_is_ti; //计时器中断位
    assign csr_estat[`ESTAT_IS_IPI] = estat_is_ipi; //核间中断位
    assign csr_estat[`ESTAT_ECODE]  = estat_ecode;
    assign csr_estat[`ESTAT_ESUBCODE] = estat_subecode;
    assign csr_estat[`ESTAT_ZERO_1] = 0;

    //EENTRY
    reg [`EENTRY_VA] eentry_va;
    assign csr_eentry[`EENTRY_ZERO] = 0;
    assign csr_eentry[`EENTRY_VA] = eentry_va;

    //CPUID
    reg [`CPUID_COREID] cpuid_coreid;
    assign csr_cpuid[`CPUID_ZERO] = 0;
    assign csr_cpuid[`CPUID_COREID] = cpuid_coreid;

    //LLBCTL
    reg [`LLBCTL_ROLLB] llbctl_rollb;
    reg [`LLBCTL_WCLLB] llbctl_wcllb;
    reg [`LLBCTL_KLO] llbctl_klo;
    assign csr_llbctl[`LLBCTL_ROLLB] = llbctl_rollb;
    assign csr_llbctl[`LLBCTL_WCLLB] = llbctl_wcllb;
    assign csr_llbctl[`LLBCTL_KLO] = llbctl_klo;
    assign csr_llbctl[`LLBCTL_ZERO] = 0;

    //TLBIDX
    reg [`TLBIDX_INDEX] tlbidx_index;
    reg [`TLBIDX_PS] tlbidx_ps;
    reg [`TLBIDX_NE] tlbidx_ne;
    assign csr_tlbidx[`TLBIDX_INDEX] = tlbidx_index;
    assign csr_tlbidx[`TLBIDX_ZERO_0] = 0;
    assign csr_tlbidx[`TLBIDX_PS] = tlbidx_ps;
    assign csr_tlbidx[`TLBIDX_ZERO_1] = 0;
    assign csr_tlbidx[`TLBIDX_NE] = tlbidx_ne;

    //TLBEHI
    reg [`TLBEHI_VPPN] tlbehi_vppn;
    assign csr_tlbehi[`TLBEHI_ZERO] = 0;
    assign csr_tlbehi[`TLBEHI_VPPN] = tlbehi_vppn;

    //TLBELO0
    reg [`TLBELO_V] tlbelo0_v;
    reg [`TLBELO_D] tlbelo0_d;
    reg [`TLBELO_PLV] tlbelo0_plv;
    reg [`TLBELO_MAT] tlbelo0_mat;
    reg [`TLBELO_G] tlbelo0_g;
    reg [`TLBELO_PPN] tlbelo0_ppn;
    assign csr_tlbelo0[`TLBELO_V] = tlbelo0_v;
    assign csr_tlbelo0[`TLBELO_D] = tlbelo0_d;
    assign csr_tlbelo0[`TLBELO_PLV] = tlbelo0_plv;
    assign csr_tlbelo0[`TLBELO_MAT] = tlbelo0_mat;
    assign csr_tlbelo0[`TLBELO_G] = tlbelo0_g;
    assign csr_tlbelo0[`TLBELO_ZERO_0] = 0;
    assign csr_tlbelo0[`TLBELO_PPN] = tlbelo0_ppn;
    assign csr_tlbelo0[`TLBELO_ZERO_1] = 0;

    //TLBELO1
    reg [`TLBELO_V] tlbelo1_v;
    reg [`TLBELO_D] tlbelo1_d;
    reg [`TLBELO_PLV] tlbelo1_plv;
    reg [`TLBELO_MAT] tlbelo1_mat;
    reg [`TLBELO_G] tlbelo1_g;
    reg [`TLBELO_PPN] tlbelo1_ppn;
    assign csr_tlbelo1[`TLBELO_V] = tlbelo1_v;
    assign csr_tlbelo1[`TLBELO_D] = tlbelo1_d;
    assign csr_tlbelo1[`TLBELO_PLV] = tlbelo1_plv;
    assign csr_tlbelo1[`TLBELO_MAT] = tlbelo1_mat;
    assign csr_tlbelo1[`TLBELO_G] = tlbelo1_g;
    assign csr_tlbelo1[`TLBELO_ZERO_0] = 0;
    assign csr_tlbelo1[`TLBELO_PPN] = tlbelo1_ppn;
    assign csr_tlbelo1[`TLBELO_ZERO_1] = 0;

    //ASID
    reg [`ASID_ASID] asid_asid;
    reg [`ASID_ASIDBITS]   asid_asidbits;
    assign csr_asid[`ASID_ASID] = asid_asid;
    assign csr_asid[`ASID_ZERO_0] = 0;
    assign csr_asid[`ASID_ZERO_1] = 0;
    assign csr_asid[`ASID_ASIDBITS] = 'h10;

    //PGDL
    reg [`PGDL_BASE] pgdl_base;
    assign csr_pgdl[`PGDL_BASE] = pgdl_base;
    assign csr_pgdl[`PGDL_ZERO] = 0;
    //PGDH
    reg [`PGDH_BASE] pgdh_base;
    assign csr_pgdh[`PGDH_BASE] = pgdh_base;
    assign csr_pgdh[`PGDH_ZERO] = 0;
    //PGD
    reg [`PGD_BASE] pgd_base;
    assign csr_pgd[`PGD_BASE] = pgd_base;
    assign csr_pgd[`PGD_ZERO] = 0;

    //TLBRENTRY
    reg [`TLBRENTRY_PA] tlbrentry_pa;
    assign csr_tlbrentry[`TLBRENTRY_ZERO] = 0;
    assign csr_tlbrentry[`TLBRENTRY_PA] = tlbrentry_pa;

    //DMW0
    reg [`DMW0_PLV0] dmw0_plv0;
    reg [`DMW0_PLV3] dmw0_plv3;
    reg [`DMW0_MAT] dmw0_mat;
    reg [`DMW0_PSEG] dmw0_pseg;
    reg [`DMW0_VSEG] dmw0_vseg;
    assign csr_dmw0[`DMW0_PLV0] = dmw0_plv0;
    assign csr_dmw0[`DMW0_PLV3] = dmw0_plv3;
    assign csr_dmw0[`DMW0_MAT] = dmw0_mat;
    assign csr_dmw0[`DMW0_PSEG] = dmw0_pseg;
    assign csr_dmw0[`DMW0_VSEG] = dmw0_vseg;
    assign csr_dmw0[`DMW0_ZERO_0] = 0;
    assign csr_dmw0[`DMW0_ZERO_1] = 0;
    assign csr_dmw0[`DMW0_ZERO_2] = 0;

    //DMW1
    reg [`DMW1_PLV0] dmw1_plv0;
    reg [`DMW1_PLV3] dmw1_plv3;
    reg [`DMW1_MAT] dmw1_mat;
    reg [`DMW1_PSEG] dmw1_pseg;
    reg [`DMW1_VSEG] dmw1_vseg;
    assign csr_dmw1[`DMW1_PLV0] = dmw1_plv0;
    assign csr_dmw1[`DMW1_PLV3] = dmw1_plv3;
    assign csr_dmw1[`DMW1_MAT] = dmw1_mat;
    assign csr_dmw1[`DMW1_PSEG] = dmw1_pseg;
    assign csr_dmw1[`DMW1_VSEG] = dmw1_vseg;
    assign csr_dmw1[`DMW1_ZERO_0] = 0;
    assign csr_dmw1[`DMW1_ZERO_1] = 0;
    assign csr_dmw1[`DMW1_ZERO_2] = 0;

    //TCFG
    reg [`TCFG_EN] tcfg_en;
    reg [`TCFG_PERIODIC] tcfg_periodic;
    reg [`TCFG_INITVAL] tcfg_initval;
    assign csr_tcfg[`TCFG_EN] = tcfg_en;
    assign csr_tcfg[`TCFG_PERIODIC] = tcfg_periodic;
    assign csr_tcfg[`TCFG_INITVAL] = tcfg_initval;
    
    //TICLR
    reg [`TICLR_CLR] tlclr_clr;
    assign csr_tlclr[`TICLR_CLR] = tlclr_clr;
    assign csr_tlclr[`TICLR_ZERO] = 0;
assign cpu_interupt=crmd_ie&&(ecfg_lie&csr_estat)!=0; //全局中断允许且（局部中断使能位与例外状态位）不为0
assign idle_over= csr_estat[12:0]; //各种中断，无论软件硬件，无论是否使能，只有有例外就结束idle(马哥这样实现的)
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
            crmd_datf <= 0;
            crmd_datm <= 0;
        end else if(ertn) begin
            crmd_plv <= prmd_pplv;
            crmd_ie <= prmd_pie;
            if(estat_ecode==6'h3F) begin //之前进入过TLB重新装填例外
                crmd_da <= 0;
                crmd_pg <= 1;
            end
        end else if(exception) begin
            if(tlb_exception) begin //现在要进入TLB例外
                crmd_da <= 1;
                crmd_pg <= 0;
            end
            crmd_plv <= 0;
            crmd_ie <= 0;
        end else if(software_en&&addr==`CSR_CRMD) begin
            if(wen) crmd_plv[`CRMD_PLV]  <= wdata[`CRMD_PLV];
            if(wen) crmd_ie[`CRMD_IE]   <= wdata[`CRMD_IE];
            if(wen) crmd_datf[`CRMD_DATF] <= wdata[`CRMD_DATF];
            if(wen) crmd_datm[`CRMD_DATF] <= wdata[`CRMD_DATM];
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
        end else if(exception) begin
            prmd_pplv <= crmd_plv;
            prmd_pie  <= crmd_ie;
        end else if(software_en&&addr==`CSR_PRMD) begin
            if(wen) prmd_pplv[`PRMD_PPLV]<=wdata[`PRMD_PPLV];
            if(wen) prmd_pie[`PRMD_PIE] <=wdata[`PRMD_PIE];
        end
        //EUEN
    always @(posedge clk)
        if(~aresetn) begin
            euen_fpe <= 0;
        end else if(software_en&&addr==`CSR_EUEN) begin
            if(wen) euen_fpe[0]<=wdata[0];
        end

         //ECFG
    always @(posedge clk)
        if(~aresetn) begin
            ecfg_lie <= 0;
        end else if(software_en&&addr==`CSR_ECFG) begin
           if(wen) ecfg_lie[`ECFG_LIE]<=wdata[`ECFG_LIE];

        end
    
   
    //ESTAT
    always @(posedge clk)
        if(~aresetn) begin
            estat_is_soft <= 0;
            estat_ecode <= 0;
            estat_subecode <= 0;
        end else if(wen_expcode) begin
            estat_ecode <= expcode_in[5:0];
            estat_subecode <= expcode_in[5:0]==0 ? 0:{8'b0,expcode_in[6]};
        end else if(software_en&&addr==`CSR_ESTAT) begin
            if(wen) estat_is_soft[`ESTAT_IS_SOFT]<=wdata[`ESTAT_IS_SOFT];
        end
    always@(*) estat_is_hard[`ESTAT_IS_HARD] = hardware_interrupt;
    //ERA
    always @(posedge clk)
        if(~aresetn) begin
            csr_era <= 0;
        end else if(wen_era) begin
            csr_era <= era_in;
        end else if(software_en&&addr==`CSR_ERA) begin
            if(wen) csr_era[ 31:0]<=wdata[ 31:0];
            
        end

    //BADV
    always @(posedge clk)
        if(~aresetn) begin
            csr_badv <= 0;
        end else if(wen_badv) begin
            csr_badv <= badv_in;
        end else if(software_en&&addr==`CSR_BADV) begin
            if(wen) csr_badv[31:0]<=wdata[31:0];
        end

    //EENTRY
    always @(posedge clk)
        if(~aresetn) begin
            eentry_va <= 0;
        end else if(software_en&&addr==`CSR_EENTRY) begin
            if(wen) eentry_va[`EENTRY_VA]<=wdata[`EENTRY_VA];
        end

    //CPUID
    always @(*)
        cpuid_coreid = 0;

    //SAVE0~3
    always @(posedge clk)
        if(~aresetn) begin
            csr_save0 <= 0;
        end else if(software_en&&addr==`CSR_SAVE0) begin
            if(wen) csr_save0[31:0]<=wdata[31:0];
        end

    always @(posedge clk)
        if(~aresetn) begin
            csr_save1 <= 0;
        end else if(software_en&&addr==`CSR_SAVE1) begin
            if(wen) csr_save1[31:0]<=wdata[31:0];
        end

    always @(posedge clk)
        if(~aresetn) begin
            csr_save2 <= 0;
        end else if(software_en&&addr==`CSR_SAVE2) begin
            if(wen) csr_save2[31:0]<=wdata[31:0];
        end

    always @(posedge clk)
        if(~aresetn) begin
            csr_save3 <= 0;
        end else if(software_en&&addr==`CSR_SAVE3) begin
            if(wen) csr_save3[31:0]<=wdata[31:0];
        end

//LLBCTL
    always @(posedge clk)
        if(~aresetn) begin
            llbctl_klo <= 0;
            llbctl_rollb <= 0;
        end 
        else if(llbit_set) llbctl_rollb<=1;
        else if(ertn) begin 
            llbctl_rollb<=llbctl_klo;
            llbctl_klo<=0;
        end else if(software_en&&addr==`CSR_LLBCTL) begin
            if(wen&&wdata[1]) llbctl_rollb<=0;
            if(wen) llbctl_klo<=wdata[2];
        end
    
    //TLBRENTRY
    always @(posedge clk)
        if(~aresetn) begin
            tlbrentry_pa <= 0;
        end else if(software_en&&addr==`CSR_TLBRENTRY) begin
            if(wen) tlbrentry_pa[`TLBRENTRY_PA]<=wdata[`TLBRENTRY_PA];
        end

    //TIBIDX
    always @(posedge clk)
        if(~aresetn) begin
            tlbidx_index<=0;
            tlbidx_ps<=0;
            tlbidx_ne<=0;
        end
        else if(software_en&&addr==`CSR_TLBIDX) begin
            if(wen) tlbidx_index[4:0]<=wdata[4:0];
            if(wen) tlbidx_ps[31:24]<=wdata[31:24];
        end 
        else begin
            if(tlbsrch_ready) begin
                if(tlbsrch_hit) begin
                    tlbidx_index[4:0]<=tlb_index_in;
                end
                else begin
                    tlbidx_ne<=1;
                end
            end 
        end

    //

    //TLB再说


    //ASID
    always @(posedge clk)
        if(~aresetn)
            asid_asid <= 0;
        else if(software_en&&addr==`CSR_ASID) begin
            if(wen) asid_asid[`ASID_ASID]<=wdata[`ASID_ASID];
        end else if(wen_asid_asid)
            asid_asid <= asid_asid_in;

        //PGDL
    always @(posedge clk)
        if(~aresetn) begin
            pgdl_base <= 0;
        end else if(software_en&&addr==`CSR_PGDL) begin
            if(wen) pgdl_base[`PGDL_BASE] <= wdata[`PGDL_BASE];
        end

    //PGDH
    always @(posedge clk)
        if(~aresetn) begin
            pgdh_base <= 0;
        end else if(software_en&&addr==`CSR_PGDH) begin
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
        end else if(software_en&&addr==`CSR_DMW0) begin
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
        end else if(software_en&&addr==`CSR_DMW1) begin
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
        end else if(software_en&&addr==`CSR_TID) begin
            if(wen) csr_tid[31:0]<=wdata[31:0];
        end
    //TCFG
    always @(posedge clk)
        if(~aresetn) begin
            tcfg_en <= 0;
            tcfg_initval <= 0;
            tcfg_periodic<=0;
        end else if(software_en&&addr==`CSR_TCFG) begin
            if(wen) tcfg_en[`TCFG_EN]<=wdata[`TCFG_EN];
            if(wen) tcfg_periodic[`TCFG_PERIODIC]<=wdata[`TCFG_PERIODIC];
            if(wen) tcfg_initval[`TCFG_INITVAL]<=wdata[`TCFG_INITVAL];
        end

    reg  set_timer;
    always @(posedge clk)
        if(~aresetn)  set_timer<=0;
        else if(software_en&&addr==`CSR_TCFG&&wen!=0)
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
            if(tcfg_periodic|| set_timer) csr_tval<={tcfg_initval[`TCFG_INITVAL],2'd1};
        end else if(tcfg_en) begin
            csr_tval<=csr_tval-1;
            time_out<=csr_tval==1;
        end

    //TICLR
    always @(posedge aclk)
        if(~aresetn||software_en&&addr==`CSR_TICLR&&wen)
            estat_is_ti <= 0;
        else if(time_out)
            estat_is_ti <= 1;

            //CTAG
    always @(posedge clk)
        if(~aresetn) begin
            csr_ctag <= 0;
        end else if(software_en&&addr==`CSR_CTAG) begin
            if(wen) csr_ctag[31:0]<=wdata[31:0];
        end

assign rdata[31:0] = {32{addr==`CSR_CRMD}} & csr_crmd |
                    {32{addr==`CSR_PRMD}} & csr_prmd |
                    {32{addr==`CSR_EUEN}} & csr_euen |
                    {32{addr==`CSR_ECFG}} & csr_ecfg | 
                    {32{addr==`CSR_ESTAT}} & csr_estat |
                    {32{addr==`CSR_ERA}} & csr_era |
                    {32{addr==`CSR_BADV}} & csr_badv |
                    {32{addr==`CSR_EENTRY}} & csr_eentry |
                    {32{addr==`CSR_CPUID}} & csr_cpuid |
                    {32{addr==`CSR_SAVE0}} & csr_save0 |
                    {32{addr==`CSR_SAVE1}} & csr_save1 |
                    {32{addr==`CSR_SAVE2}} & csr_save2 |
                    {32{addr==`CSR_SAVE3}} & csr_save3 |
                    {32{addr==`CSR_LLBCTL}} & csr_llbctl |
                    {32{addr==`CSR_TLBIDX}} & csr_tlbidx |
                    {32{addr==`CSR_TLBEHI}} & csr_tlbehi |
                    {32{addr==`CSR_TLBELO0}} & csr_tlbelo0 |
                    {32{addr==`CSR_TLBELO1}} & csr_tlbelo1 |
                    {32{addr==`CSR_ASID}} & csr_asid |
                    {32{addr==`CSR_PGDL}} & csr_pgdl |
                    {32{addr==`CSR_PGDH}} & csr_pgdh |
                    {32{addr==`CSR_PGD && csr_badv[31]}} & csr_pgdh |
                    {32{addr==`CSR_PGD && ~csr_badv[31]}} & csr_pgdl |
                    {32{addr==`CSR_TLBRENTRY}} & csr_tlbrentry |
                    {32{addr==`CSR_DMW0}} & csr_dmw0 |
                    {32{addr==`CSR_DMW1}} & csr_dmw1 |
                    {32{addr==`CSR_TID}} & csr_tid |
                    {32{addr==`CSR_TCFG}} & csr_tcfg |
                    {32{addr==`CSR_TVAL}} & csr_tval |
                    {32{addr==`CSR_TICLR}} & csr_tlclr |
                    {32{addr==`CSR_CTAG}} & csr_ctag;
        assign crmd=csr_crmd;
        assign estat=csr_estat;
        assign era_out = csr_era;
        assign eentry=csr_eentry;
        assign tlbrentry=csr_tlbrentry;
        assign pgdl=csr_pgdl;
        assign pgdh=csr_pgdh;
        assign dmw0=csr_dmw0;
        assign dmw1=csr_dmw1;
        //cpu_interupt已经在前面赋值了
        assign llbit=csr_llbctl[0];
        assign DMW0_PSEG=csr_dmw0[`DMW0_PSEG];
        assign DMW0_VSEG=csr_dmw0[`DMW0_VSEG];
        assign DMW1_PSEG=csr_dmw1[`DMW1_PSEG];
        assign DMW1_VSEG=csr_dmw1[`DMW1_VSEG];
        assign PG=csr_crmd[4];
        
endmodule