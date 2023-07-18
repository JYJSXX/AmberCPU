`include "../config.vh"
`include "../csr.vh"
module csr(
    input clk,
    input aresetn,

    input software_en,
    input [13:0] addr,
    output reg [31:0] rdata,
    input [31:0] wen,
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

    input exception, //进入例外
    input ertn, //例外返回
    input tlb_exception, //TLB例外,要回到直接地址映射模式
    input [6:0] expcode, //例外代码 最高位是subexpcode
    input wen_expcode, //写入例外代码
    input [31:0] era_in, //例外返回地址
    input wen_era, //写入例外返回地址
    input [31:0] badv_in, //例外地址
    input wen_badv, //写入例外地址
    input [`PGD_BASE] pgd_base_in, //页表基址
    input wen_pgd_base, //写入页表基址
    input [18:0] tlbehi_vppn_in,
    input wen_tlbehi_vppn,
    input llbit_set,
    input llbit_clear, //by other没有用，直接看ertn就行
    input [31:0] tlbidx_in,
    input [31:0] wen_tlbidx, //每一位都有使能
    input [31:0] tlbehi_in,
    input [31:0] wen_tlbehi,
    input [31:0] tlbelo0_in,
    input [31:0] wen_tlbelo0,
    input [31:0] tlbelo1_in,
    input [31:0] wen_tlbelo1,
    input [9:0] asid_asid_in,
    input wen_asid_asid
);
    wire [31:0] csr_crmd ;
    wire [31:0] csr_prmd ;
    wire [31:0] csr_euen ;
    wire [31:0] csr_ecfg ;
    wire [31:0] csr_estat ;
    wire [31:0] csr_era ;
    wire [31:0] csr_badv ;
    wire [31:0] csr_eentry ;
    wire [31:0] csr_tlbidx ;
    wire [31:0] csr_tlbehi ;
    wire [31:0] csr_tlbelo0 ;
    wire [31:0] csr_tlbelo1 ;
    wire [31:0] csr_asid ;
    wire [31:0] csr_pgdl ;
    wire [31:0] csr_pgdh ;
    wire [31:0] csr_pgd ;
    wire [31:0] csr_cpuid ;
    wire [31:0] csr_save0 ;
    wire [31:0] csr_save1 ;
    wire [31:0] csr_save2 ;
    wire [31:0] csr_save3 ;
    wire [31:0] csr_tid ;
    wire [31:0] csr_tcfg ;
    wire [31:0] csr_tval ;
    wire [31:0] csr_tlclr ;
    wire [31:0] csr_llbctl ;
    wire [31:0] csr_tlbrentry ;
    wire [31:0] csr_ctag ;
    wire [31:0] csr_dmw0 ;
    wire [31:0] csr_dmw1 ;


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
    reg [`ESTAT_IS_SOFT] estat_is_SOFT;
    reg [`ESTAT_IS_HARD] estat_is_HARD;
    reg [`ESTAT_IS_TI] estat_is_ti;
    reg [`ESTAT_IS_IPI] estat_is_ipi;
    reg [`ESTAT_ECODE] estat_ecode;
    reg [`ESTAT_ESUBCODE] estat_subecode;
    assign csr_estat[`ESTAT_IS_SOFT] = estat_is_SOFT; //软件中断位
    assign csr_estat[`ESTAT_IS_HARD] = estat_is_HARD; //硬件中断位
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
    assign csr_tlbelo0[`TLBELO_ZERO] = 0;
    assign csr_tlbelo0[`TLBELO_PPN] = tlbelo0_ppn;

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
    assign csr_tlbelo1[`TLBELO_ZERO] = 0;
    assign csr_tlbelo1[`TLBELO_PPN] = tlbelo1_ppn;

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
    reg [`DMW0_PSEG] dmw0_g;
    reg [`DMW0_VSEG] dmw0_vseg;
    assign csr_dmw0[`DMW0_PLV0] = dmw0_plv0;
    assign csr_dmw0[`DMW0_PLV3] = dmw0_plv3;
    assign csr_dmw0[`DMW0_MAT] = dmw0_mat;
    assign csr_dmw0[`DMW0_PSEG] = dmw0_g;
    assign csr_dmw0[`DMW0_VSEG] = dmw0_vseg;
    assign csr_dmw0[`DMW0_ZERO_0] = 0;
    assign csr_dmw0[`DMW0_ZERO_1] = 0;
    assign csr_dmw0[`DMW0_ZERO_2] = 0;

    //DMW1
    reg [`DMW1_PLV0] dmw1_plv0;
    reg [`DMW1_PLV3] dmw1_plv3;
    reg [`DMW1_MAT] dmw1_mat;
    reg [`DMW1_PSEG] dmw1_g;
    reg [`DMW1_VSEG] dmw1_vseg;
    assign csr_dmw1[`DMW1_PLV0] = dmw1_plv0;
    assign csr_dmw1[`DMW1_PLV3] = dmw1_plv3;
    assign csr_dmw1[`DMW1_MAT] = dmw1_mat;
    assign csr_dmw1[`DMW1_PSEG] = dmw1_g;
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



endmodule