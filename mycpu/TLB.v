`include "TLB.vh"
`include "csr.vh"
module TLB(
    input                               clk,
    input                               rstn,
    input                               flush,

    input       [9:0]                   CSR_ASID,
    input       [31:0]                  CSR_VPPN,
    input                               CSR_PG,
    input       [31:0]                  CSR_CRMD,
    input       [31:0]                  CSR_DMW0,
    input       [31:0]                  CSR_DMW1,
    input       [31:0]                  CSR_TLBEHI,
    input       [31:0]                  CSR_TLBIDX,

    input                               stall_i,//读使能
    input                               stall_d,
    input                               en_d,
    input       [`TLB_VPPN_LEN : 0]     VA_I,
    input       [`TLB_VPPN_LEN : 0]     VA_D,
    input       [11:0]                  TAG_OFFSET_I,
    input       [11:0]                  TAG_OFFSET_D,
    //TO CACHE
    output reg  [`TLB_PPN_LEN - 1:0]    PA_I,
    output reg  [`TLB_PPN_LEN - 1:0]    PA_D,
    output reg                          is_cached_I,
    output reg                          is_cached_D,
    output                              en_VA_I_OUT,
    output                              en_VA_D_OUT,
    output      [`TLB_VPPN_LEN : 0]     VA_I_OUT,
    output      [`TLB_VPPN_LEN : 0]     VA_D_OUT,
    output      [11:0]                  VA_TAG_OFFSET_I_OUT,
    output      [11:0]                  VA_TAG_OFFSET_D_OUT,
    output      [11:0]                  PA_TAG_OFFSET_I_OUT,
    output      [11:0]                  PA_TAG_OFFSET_D_OUT,
    output                              SOL_D_OUT,

    //Priv      
    input                               TLBSRCH_valid,
    output reg                          TLBSRCH_ready,
    output reg                          TLBSRCH_hit,
    output reg  [4:0]                   TLBSRCH_INDEX,

    input       [4:0]                   TLBRD_INDEX,
    input                               TLBRD_valid,
    output reg                          TLBRD_ready,
    output reg                          TLBRD_hit,
    output reg  [`TLB_CPRLEN - 1:0]     TLB_CPR,
    output reg  [`TLB_TRANSLEN - 1:0]   TLB_TRANS_1,
    output reg  [`TLB_TRANSLEN - 1:0]   TLB_TRANS_2,

    input                               TLBWR_valid,
    output reg                          TLBWR_ready,
    input                               TLBFILL_valid,
    output reg                          TLBFILL_ready,
    input       [`TLB_CPRLEN - 1:0]     TLB_CPR_w,
    input       [`TLB_TRANSLEN - 1:0]   TLB_TRANS_1_w,
    input       [`TLB_TRANSLEN - 1:0]   TLB_TRANS_2_w,

    input                               TLBINVLD_valid,
    output reg                          TLBINVLD_ready,
    input       [4:0]                   TLBINVLD_OP,
    input       [9:0]                   TLBINVLD_ASID,
    input       [`TLB_VPPN_LEN - 1:0]   TLBINVLD_VA,

    input                               store_or_load, //1:store 0:load
    input                               plv_1bit,
    output     [6:0]                    tlb_exception_code_i,
    output     [6:0]                    tlb_exception_code_d,
    input      [4:0]                    stable_counter
);

reg     [`TLB_CPRLEN - 1:0]     tlb_cpr         [`TLB_NUM - 1:0];       //TLB比较部分
reg     [`TLB_TRANSLEN - 1:0]   tlb_trans_1     [`TLB_NUM - 1:0];       //TLB转换偶地址部分
reg     [`TLB_TRANSLEN - 1:0]   tlb_trans_2     [`TLB_NUM - 1:0];       //TLB转换奇地址部分

wire    [0:0]                   rd_TLB_E        [`TLB_NUM - 1:0];
wire    [9:0]                   rd_TLB_ASID     [`TLB_NUM - 1:0];
wire    [0:0]                   rd_TLB_G        [`TLB_NUM - 1:0];
wire    [5:0]                   rd_TLB_PS       [`TLB_NUM - 1:0];
wire    [`TLB_VPPN_LEN - 1:0]   rd_TLB_VPPN     [`TLB_NUM - 1:0];
wire    [0:0]                   rd_TLB_V_1      [`TLB_NUM - 1:0];
wire    [0:0]                   rd_TLB_D_1      [`TLB_NUM - 1:0];
wire    [1:0]                   rd_TLB_MAT_1    [`TLB_NUM - 1:0];
wire    [1:0]                   rd_TLB_PLV_1    [`TLB_NUM - 1:0];
wire    [`TLB_PPN_LEN - 1:0]    rd_TLB_PPN_1    [`TLB_NUM - 1:0];
wire    [0:0]                   rd_TLB_V_2      [`TLB_NUM - 1:0];
wire    [0:0]                   rd_TLB_D_2      [`TLB_NUM - 1:0];
wire    [1:0]                   rd_TLB_MAT_2    [`TLB_NUM - 1:0];
wire    [1:0]                   rd_TLB_PLV_2    [`TLB_NUM - 1:0];
wire    [`TLB_PPN_LEN - 1:0]    rd_TLB_PPN_2    [`TLB_NUM - 1:0];

genvar i;

generate
    for(i = 0; i < `TLB_NUM; i = i + 1)begin
        assign rd_TLB_E[i]      =   tlb_cpr[i][`TLB_E];
        assign rd_TLB_ASID[i]   =   tlb_cpr[i][`TLB_ASID];
        assign rd_TLB_G[i]      =   tlb_cpr[i][`TLB_G];
        assign rd_TLB_PS[i]     =   tlb_cpr[i][`TLB_PS];
        assign rd_TLB_VPPN[i]   =   tlb_cpr[i][`TLB_VPPN];
        assign rd_TLB_V_1[i]    =   tlb_trans_1[i][`TLB_V];
        assign rd_TLB_D_1[i]    =   tlb_trans_1[i][`TLB_D];
        assign rd_TLB_MAT_1[i]  =   tlb_trans_1[i][`TLB_MAT];
        assign rd_TLB_PLV_1[i]  =   tlb_trans_1[i][`TLB_PLV];
        assign rd_TLB_PPN_1[i]  =   tlb_trans_1[i][`TLB_PPN];
        assign rd_TLB_V_2[i]    =   tlb_trans_2[i][`TLB_V];
        assign rd_TLB_D_2[i]    =   tlb_trans_2[i][`TLB_D];
        assign rd_TLB_MAT_2[i]  =   tlb_trans_2[i][`TLB_MAT];
        assign rd_TLB_PLV_2[i]  =   tlb_trans_2[i][`TLB_PLV];
        assign rd_TLB_PPN_2[i]  =   tlb_trans_2[i][`TLB_PPN];
    end
endgenerate

integer j;

initial begin
    for(j = 0; j < `TLB_NUM; j = j + 1)begin
        tlb_cpr[j] = 0;
        tlb_trans_1[j] = 0;
        tlb_trans_2[j] = 0;
    end
end

wire [0:0] TLB_I_HIT_4K_IN [`TLB_NUM - 1:0];
wire [0:0] TLB_D_HIT_4K_IN [`TLB_NUM - 1:0];
wire [0:0] TLB_I_HIT_4M_IN [`TLB_NUM - 1:0];
wire [0:0] TLB_D_HIT_4M_IN [`TLB_NUM - 1:0];


generate
    for(i = 0; i < `TLB_NUM; i = i + 1)begin
        assign TLB_I_HIT_4K_IN[i] = rd_TLB_E[i] & (rd_TLB_G[i] | (rd_TLB_ASID[i] == CSR_ASID)) & (rd_TLB_VPPN[i] == VA_I[`TLB_VPPN_LEN:1]);
        assign TLB_D_HIT_4K_IN[i] = rd_TLB_E[i] & (rd_TLB_G[i] | (rd_TLB_ASID[i] == CSR_ASID)) & (rd_TLB_VPPN[i] == VA_D[`TLB_VPPN_LEN:1]);
        assign TLB_I_HIT_4M_IN[i] = rd_TLB_E[i] & (rd_TLB_G[i] | (rd_TLB_ASID[i] == CSR_ASID)) & (rd_TLB_VPPN[i][`TLB_VPPN_LEN - 1:10] == VA_I[`TLB_VPPN_LEN:11]);
        assign TLB_D_HIT_4M_IN[i] = rd_TLB_E[i] & (rd_TLB_G[i] | (rd_TLB_ASID[i] == CSR_ASID)) & (rd_TLB_VPPN[i][`TLB_VPPN_LEN - 1:10] == VA_D[`TLB_VPPN_LEN:11]);
    end
endgenerate

// reg:HIT UNHIT_EXCEPRION

reg     [0:0]                   TLB_I_HIT_4K_OUT    [`TLB_NUM - 1:0];
reg     [0:0]                   TLB_D_HIT_4K_OUT    [`TLB_NUM - 1:0];
reg     [0:0]                   TLB_I_HIT_4M_OUT    [`TLB_NUM - 1:0];
reg     [0:0]                   TLB_D_HIT_4M_OUT    [`TLB_NUM - 1:0];
reg     [0:0]                   TLB_PS_EQUAL_4K     [`TLB_NUM - 1:0];
reg     [0:0]                   TLB_D_VA_12_ODD     [`TLB_NUM - 1:0];
reg     [0:0]                   TLB_I_VA_12_ODD     [`TLB_NUM - 1:0];
reg     [0:0]                   TLB_D_VA_21_ODD     [`TLB_NUM - 1:0];
reg     [0:0]                   TLB_I_VA_21_ODD     [`TLB_NUM - 1:0];

reg     [0:0]                   rd_TLB_V_1_reg      [`TLB_NUM - 1:0];
reg     [0:0]                   rd_TLB_D_1_reg      [`TLB_NUM - 1:0];
reg     [1:0]                   rd_TLB_MAT_1_reg    [`TLB_NUM - 1:0];
reg     [1:0]                   rd_TLB_PLV_1_reg    [`TLB_NUM - 1:0];
reg     [`TLB_PPN_LEN - 1:0]    rd_TLB_PPN_1_reg    [`TLB_NUM - 1:0];
reg     [0:0]                   rd_TLB_V_2_reg      [`TLB_NUM - 1:0];
reg     [0:0]                   rd_TLB_D_2_reg      [`TLB_NUM - 1:0];
reg     [1:0]                   rd_TLB_MAT_2_reg    [`TLB_NUM - 1:0];
reg     [1:0]                   rd_TLB_PLV_2_reg    [`TLB_NUM - 1:0];
reg     [`TLB_PPN_LEN - 1:0]    rd_TLB_PPN_2_reg    [`TLB_NUM - 1:0];
reg                             en_i_reg                              ;
reg                             en_d_reg                              ;
// reg                             CSR_PG_reg                          ;
// reg                             CSR_CRMD_reg                        ;
// reg                             CSR_DMW0_reg                        ;
// reg                             CSR_DMW1_reg                        ;
reg     [`TLB_VPPN_LEN : 0]     VA_D_reg                            ;
reg     [`TLB_VPPN_LEN : 0]     VA_I_reg                            ;
reg     [11:0]                  TAG_OFFSET_I_reg                    ;
reg     [11:0]                  TAG_OFFSET_D_reg                    ;
reg                             SOL_reg                             ;

initial begin
    en_i_reg = 0;
    en_d_reg = 0;
    // CSR_PG_reg = 0;
    // CSR_CRMD_reg = 0;
    // CSR_DMW0_reg = 0;
    // CSR_DMW1_reg = 0;
    VA_I_reg = 0;
    VA_D_reg = 0;
    TAG_OFFSET_I_reg = 0;
    TAG_OFFSET_D_reg = 0;
    SOL_reg = 0;
    for (j = 0; j < `TLB_NUM; j = j + 1)begin
        TLB_I_HIT_4K_OUT[j] = 0;
        TLB_D_HIT_4K_OUT[j] = 0;
        TLB_I_HIT_4M_OUT[j] = 0;
        TLB_D_HIT_4M_OUT[j] = 0;
        TLB_PS_EQUAL_4K[j]  = 0;
        TLB_D_VA_12_ODD[j]  = 0;
        TLB_I_VA_12_ODD[j]  = 0;
        TLB_D_VA_21_ODD[j]  = 0;
        TLB_I_VA_21_ODD[j]  = 0;
        rd_TLB_V_1_reg[j]   = 0;
        rd_TLB_D_1_reg[j]   = 0;
        rd_TLB_MAT_1_reg[j] = 0;
        rd_TLB_PLV_1_reg[j] = 0;
        rd_TLB_PPN_1_reg[j] = 0;
        rd_TLB_V_2_reg[j]   = 0;
        rd_TLB_D_2_reg[j]   = 0;
        rd_TLB_MAT_2_reg[j] = 0;
        rd_TLB_PLV_2_reg[j] = 0;
        rd_TLB_PPN_2_reg[j] = 0;
    end
end

always @(posedge clk or negedge rstn) begin
    if (~rstn)begin
        en_i_reg <= 0;
        en_d_reg <= 0;
        // CSR_PG_reg <= 0;
        // CSR_CRMD_reg <= 0;
        // CSR_DMW0_reg <= 0;
        // CSR_DMW1_reg <= 0;
        VA_I_reg <= 0;
        VA_D_reg <= 0;
        TAG_OFFSET_I_reg <= 0;
        TAG_OFFSET_D_reg <= 0;
        SOL_reg <= 0;
        for(j = 0; j < `TLB_NUM; j = j + 1)begin
            TLB_PS_EQUAL_4K[j]  <= 0;
            TLB_I_HIT_4K_OUT[j] <= 0;
            TLB_I_HIT_4M_OUT[j] <= 0;
            TLB_I_VA_12_ODD[j]  <= 0;
            TLB_I_VA_21_ODD[j]  <= 0;
            TLB_D_HIT_4K_OUT[j] <= 0;
            TLB_D_HIT_4M_OUT[j] <= 0;
            TLB_D_VA_12_ODD[j]  <= 0;
            TLB_D_VA_21_ODD[j]  <= 0;
            rd_TLB_V_1_reg[j]   <= 0;
            rd_TLB_D_1_reg[j]   <= 0;
            rd_TLB_MAT_1_reg[j] <= 0;
            rd_TLB_PLV_1_reg[j] <= 0;
            rd_TLB_PPN_1_reg[j] <= 0;
            rd_TLB_V_2_reg[j]   <= 0;
            rd_TLB_D_2_reg[j]   <= 0;
            rd_TLB_MAT_2_reg[j] <= 0;
            rd_TLB_PLV_2_reg[j] <= 0;
            rd_TLB_PPN_2_reg[j] <= 0;
        end
    end
    else if (flush) begin
        en_i_reg <= 0;
        en_d_reg <= 0;
        // CSR_PG_reg <= 0;
        // CSR_CRMD_reg <= 0;
        // CSR_DMW0_reg <= 0;
        // CSR_DMW1_reg <= 0;
        VA_I_reg <= 0;
        VA_D_reg <= 0;
        TAG_OFFSET_I_reg <= 0;
        TAG_OFFSET_D_reg <= 0;
        SOL_reg <= 0;
        for(j = 0; j < `TLB_NUM; j = j + 1)begin
            TLB_PS_EQUAL_4K[j]  <= 0;
            TLB_I_HIT_4K_OUT[j] <= 0;
            TLB_I_HIT_4M_OUT[j] <= 0;
            TLB_I_VA_12_ODD[j]  <= 0;
            TLB_I_VA_21_ODD[j]  <= 0;
            TLB_D_HIT_4K_OUT[j] <= 0;
            TLB_D_HIT_4M_OUT[j] <= 0;
            TLB_D_VA_12_ODD[j]  <= 0;
            TLB_D_VA_21_ODD[j]  <= 0;
            rd_TLB_V_1_reg[j]   <= 0;
            rd_TLB_D_1_reg[j]   <= 0;
            rd_TLB_MAT_1_reg[j] <= 0;
            rd_TLB_PLV_1_reg[j] <= 0;
            rd_TLB_PPN_1_reg[j] <= 0;
            rd_TLB_V_2_reg[j]   <= 0;
            rd_TLB_D_2_reg[j]   <= 0;
            rd_TLB_MAT_2_reg[j] <= 0;
            rd_TLB_PLV_2_reg[j] <= 0;
            rd_TLB_PPN_2_reg[j] <= 0;
        end
    end
    else begin
        // CSR_PG_reg <= CSR_PG;
        // CSR_CRMD_reg <= CSR_CRMD;
        // CSR_DMW0_reg <= CSR_DMW0;
        // CSR_DMW1_reg <= CSR_DMW1;

        for(j = 0; j < `TLB_NUM; j = j + 1)begin
            if(~stall_i) begin
                TLB_I_HIT_4K_OUT[j] <= TLB_I_HIT_4K_IN[j];
                TLB_I_HIT_4M_OUT[j] <= TLB_I_HIT_4M_IN[j];
                TLB_I_VA_12_ODD[j]  <= VA_I[0];
                TLB_I_VA_21_ODD[j]  <= VA_I[9];
                VA_I_reg <= VA_I;
                en_i_reg <= 1;
                TAG_OFFSET_I_reg <= TAG_OFFSET_I;
            end
            else begin
                TLB_I_HIT_4K_OUT[j] <= TLB_I_HIT_4K_OUT[j];
                TLB_I_HIT_4M_OUT[j] <= TLB_I_HIT_4M_OUT[j];
                TLB_I_VA_12_ODD[j]  <= TLB_I_VA_12_ODD[j];
                TLB_I_VA_21_ODD[j]  <= TLB_I_VA_21_ODD[j];
                VA_I_reg <= VA_I_reg;
                en_i_reg <= en_i_reg;
                TAG_OFFSET_I_reg <= TAG_OFFSET_I_reg;
            end
            if(~stall_d) begin
                TLB_D_HIT_4K_OUT[j] <= TLB_D_HIT_4K_IN[j];
                TLB_D_HIT_4M_OUT[j] <= TLB_D_HIT_4M_IN[j];
                TLB_D_VA_12_ODD[j]  <= VA_D[0];
                TLB_D_VA_21_ODD[j]  <= VA_D[9];
                VA_D_reg <= VA_D;
                en_d_reg <= en_d;
                TAG_OFFSET_D_reg <= TAG_OFFSET_D;
                SOL_reg <= store_or_load;
            end
            else begin
                TLB_D_HIT_4K_OUT[j] <= TLB_D_HIT_4K_OUT[j];
                TLB_D_HIT_4M_OUT[j] <= TLB_D_HIT_4M_OUT[j];
                TLB_D_VA_12_ODD[j]  <= TLB_D_VA_12_ODD[j];
                TLB_D_VA_21_ODD[j]  <= TLB_D_VA_21_ODD[j];
                VA_D_reg <= VA_D_reg;
                en_d_reg <= en_d_reg;
                TAG_OFFSET_D_reg <= TAG_OFFSET_D_reg;
                SOL_reg <= SOL_reg;
            end
            TLB_PS_EQUAL_4K[j]  <= (rd_TLB_PS[j] == 12);
            rd_TLB_V_1_reg[j]   <= rd_TLB_V_1[j];
            rd_TLB_D_1_reg[j]   <= rd_TLB_D_1[j];
            rd_TLB_MAT_1_reg[j] <= rd_TLB_MAT_1[j];
            rd_TLB_PLV_1_reg[j] <= rd_TLB_PLV_1[j];
            rd_TLB_PPN_1_reg[j] <= rd_TLB_PPN_1[j];
            rd_TLB_V_2_reg[j]   <= rd_TLB_V_2[j];
            rd_TLB_D_2_reg[j]   <= rd_TLB_D_2[j];
            rd_TLB_MAT_2_reg[j] <= rd_TLB_MAT_2[j];
            rd_TLB_PLV_2_reg[j] <= rd_TLB_PLV_2[j];
            rd_TLB_PPN_2_reg[j] <= rd_TLB_PPN_2[j];
        end
    end
end

//下面这两个wire型变量可用于检测例外
wire [`TLB_NUM - 1:0] TLB_I_HIT;
wire [`TLB_NUM - 1:0] TLB_D_HIT;

generate
    for(i = 0; i < `TLB_NUM; i = i + 1)begin
        assign TLB_I_HIT[i] = TLB_PS_EQUAL_4K[i] ? TLB_I_HIT_4K_OUT[i] : TLB_I_HIT_4M_OUT[i];
        assign TLB_D_HIT[i] = TLB_PS_EQUAL_4K[i] ? TLB_D_HIT_4K_OUT[i] : TLB_D_HIT_4M_OUT[i];
    end
endgenerate

wire [`TLB_NUM - 1:0] TLB_I_ODD;
wire [`TLB_NUM - 1:0] TLB_D_ODD;


generate
    for(i = 0; i < `TLB_NUM; i = i + 1)begin
        assign TLB_I_ODD[i] = TLB_PS_EQUAL_4K[i] ? TLB_I_VA_12_ODD[i] : TLB_I_VA_21_ODD[i];
        assign TLB_D_ODD[i] = TLB_PS_EQUAL_4K[i] ? TLB_D_VA_12_ODD[i] : TLB_D_VA_21_ODD[i];
    end
endgenerate

wire    [0:0]                   TLB_I_V        [`TLB_NUM - 1:0];
wire    [0:0]                   TLB_I_D        [`TLB_NUM - 1:0];
wire    [0:0]                   TLB_I_MAT      [`TLB_NUM - 1:0];
wire    [0:0]                   TLB_I_PLV      [`TLB_NUM - 1:0];
wire    [`TLB_PPN_LEN - 1:0]    TLB_I_PPN      [`TLB_NUM - 1:0];
wire    [0:0]                   TLB_D_V        [`TLB_NUM - 1:0];
wire    [0:0]                   TLB_D_D        [`TLB_NUM - 1:0];
wire    [0:0]                   TLB_D_MAT      [`TLB_NUM - 1:0];
wire    [0:0]                   TLB_D_PLV      [`TLB_NUM - 1:0];
wire    [`TLB_PPN_LEN - 1:0]    TLB_D_PPN      [`TLB_NUM - 1:0];

generate
    for (i = 0; i < `TLB_NUM; i = i + 1)begin
        
        assign TLB_I_V[i]      =   {TLB_I_HIT[i]} & (TLB_I_ODD[i] ? rd_TLB_V_2_reg[i] : rd_TLB_V_1_reg[i]);
        assign TLB_I_D[i]      =   {TLB_I_HIT[i]} & (TLB_I_ODD[i] ? rd_TLB_D_2_reg[i] : rd_TLB_D_1_reg[i]);
        assign TLB_I_MAT[i]    =   {TLB_I_HIT[i]} & (TLB_I_ODD[i] ? rd_TLB_MAT_2_reg[i][0] : rd_TLB_MAT_1_reg[i][0]);
        assign TLB_I_PLV[i]    =   {TLB_I_HIT[i]} & (TLB_I_ODD[i] ? rd_TLB_PLV_2_reg[i][0] : rd_TLB_PLV_1_reg[i][0]);
        assign TLB_I_PPN[i]    =   {(`TLB_PPN_LEN - 1){TLB_I_HIT[i] & TLB_D_V[i]}} & (TLB_I_ODD[i] ? rd_TLB_PPN_2_reg[i] : rd_TLB_PPN_1_reg[i]);

        assign TLB_D_V[i]      =   {TLB_D_HIT[i]} & (TLB_D_ODD[i] ? rd_TLB_V_2_reg[i] : rd_TLB_V_1_reg[i]);
        assign TLB_D_D[i]      =   {TLB_D_HIT[i]} & (TLB_D_ODD[i] ? rd_TLB_D_2_reg[i] : rd_TLB_D_1_reg[i]);
        assign TLB_D_MAT[i]    =   {TLB_D_HIT[i]} & (TLB_D_ODD[i] ? rd_TLB_MAT_2_reg[i][0] : rd_TLB_MAT_1_reg[i][0]);
        assign TLB_D_PLV[i]    =   {TLB_D_HIT[i]} & (TLB_D_ODD[i] ? rd_TLB_PLV_2_reg[i][0] : rd_TLB_PLV_1_reg[i][0]);
        assign TLB_D_PPN[i]    =   {(`TLB_PPN_LEN - 1){TLB_D_HIT[i] & TLB_D_V[i]}} & (TLB_D_ODD[i] ? rd_TLB_PPN_2_reg[i] : rd_TLB_PPN_1_reg[i]);
    end
endgenerate

wire [`TLB_NUM - 1:0]   TLB_I_V_TRANS;
wire [`TLB_NUM - 1:0]   TLB_I_D_TRANS;
wire [`TLB_NUM - 1:0]   TLB_I_MAT_TRANS;
wire [`TLB_NUM - 1:0]   TLB_I_PLV_TRANS;
wire [`TLB_NUM - 1:0]   TLB_I_PPN_TRANS [`TLB_PPN_LEN - 1:0];
wire [`TLB_NUM - 1:0]   TLB_D_V_TRANS;
wire [`TLB_NUM - 1:0]   TLB_D_D_TRANS;
wire [`TLB_NUM - 1:0]   TLB_D_MAT_TRANS;
wire [`TLB_NUM - 1:0]   TLB_D_PLV_TRANS;
wire [`TLB_NUM - 1:0]   TLB_D_PPN_TRANS [`TLB_PPN_LEN - 1:0];

genvar k;

generate
    for (i = 0; i < `TLB_NUM; i = i + 1)begin
        assign TLB_I_V_TRANS[i] = TLB_I_V[i];
        assign TLB_I_D_TRANS[i] = TLB_I_D[i];
        assign TLB_I_MAT_TRANS[i] = TLB_I_MAT[i];
        assign TLB_I_PLV_TRANS[i] = TLB_I_PLV[i];
        assign TLB_D_V_TRANS[i] = TLB_D_V[i];
        assign TLB_D_D_TRANS[i] = TLB_D_D[i];
        assign TLB_D_MAT_TRANS[i] = TLB_D_MAT[i];
        assign TLB_D_PLV_TRANS[i] = TLB_D_PLV[i];
        for (k = 0; k < `TLB_PPN_LEN; k = k + 1)begin
            assign TLB_I_PPN_TRANS[k][i] = TLB_I_PPN[i][k];
            assign TLB_D_PPN_TRANS[k][i] = TLB_D_PPN[i][k];
        end
    end
endgenerate

//reg2
reg [`TLB_NUM - 1:0]    TLB_I_V_TRANS_reg = 0;
reg [`TLB_NUM - 1:0]    TLB_I_D_TRANS_reg = 0;
reg [`TLB_NUM - 1:0]    TLB_I_MAT_TRANS_reg = 0;
reg [`TLB_NUM - 1:0]    TLB_I_PLV_TRANS_reg = 0;
reg [`TLB_NUM - 1:0]    TLB_I_PPN_TRANS_reg [`TLB_PPN_LEN - 1:0];
reg [`TLB_NUM - 1:0]    TLB_D_V_TRANS_reg = 0;
reg [`TLB_NUM - 1:0]    TLB_D_D_TRANS_reg = 0;
reg [`TLB_NUM - 1:0]    TLB_D_MAT_TRANS_reg = 0;
reg [`TLB_NUM - 1:0]    TLB_D_PLV_TRANS_reg = 0;
reg [`TLB_NUM - 1:0]    TLB_D_PPN_TRANS_reg [`TLB_PPN_LEN - 1:0];
// reg                     CSR_PG_reg2 = 0;
// reg                     CSR_CRMD_reg2 = 0;
// reg                     CSR_DMW0_reg2 = 0;
// reg                     CSR_DMW1_reg2 = 0;
reg [`TLB_VPPN_LEN : 0] VA_I_reg2 = 0;
reg [`TLB_VPPN_LEN : 0] VA_D_reg2 = 0;
reg                     en_i_reg2 = 0;
reg                     en_d_reg2 = 0;
reg [11:0]              TAG_OFFSET_I_reg2 = 0;
reg [11:0]              TAG_OFFSET_D_reg2 = 0;
reg                     SOL_reg2 = 0;

assign en_VA_I_OUT = en_i_reg2;
assign en_VA_D_OUT = en_d_reg2;
assign VA_I_OUT = VA_I_reg2;
assign VA_D_OUT = VA_D_reg2;
assign VA_TAG_OFFSET_I_OUT = TAG_OFFSET_I_reg2;
assign VA_TAG_OFFSET_D_OUT = TAG_OFFSET_D_reg2;

initial begin
    for(j = 0; j < `TLB_PPN_LEN; j = j + 1)begin
        TLB_I_PPN_TRANS_reg[j] = 0;
        TLB_D_PPN_TRANS_reg[j] = 0;
    end
end

always @(posedge clk or negedge rstn)begin
    if (~rstn)begin
        TLB_I_V_TRANS_reg <= 0;
        TLB_I_D_TRANS_reg <= 0;
        TLB_I_MAT_TRANS_reg <= 0;
        TLB_I_PLV_TRANS_reg <= 0;
        TLB_D_V_TRANS_reg <= 0;
        TLB_D_D_TRANS_reg <= 0;
        TLB_D_MAT_TRANS_reg <= 0;
        TLB_D_PLV_TRANS_reg <= 0;
        // CSR_PG_reg2 <= 0;
        // CSR_CRMD_reg2 <= 0;
        // CSR_DMW0_reg2 <= 0;
        // CSR_DMW1_reg2 <= 0;
        VA_I_reg2 <= 0;
        VA_D_reg2 <= 0;
        en_i_reg2 <= 0;
        en_d_reg2 <= 0;
        TAG_OFFSET_I_reg2 <= 0;
        TAG_OFFSET_D_reg2 <= 0;
        SOL_reg2 <= 0;
        for(j = 0; j < `TLB_PPN_LEN; j = j + 1)begin
            TLB_I_PPN_TRANS_reg[j] <= 0;
            TLB_D_PPN_TRANS_reg[j] <= 0;
        end
    end
    else if (flush)begin
        TLB_I_V_TRANS_reg <= 0;
        TLB_I_D_TRANS_reg <= 0;
        TLB_I_MAT_TRANS_reg <= 0;
        TLB_I_PLV_TRANS_reg <= 0;
        TLB_D_V_TRANS_reg <= 0;
        TLB_D_D_TRANS_reg <= 0;
        TLB_D_MAT_TRANS_reg <= 0;
        TLB_D_PLV_TRANS_reg <= 0;
        // CSR_PG_reg2 <= 0;
        // CSR_CRMD_reg2 <= 0;
        // CSR_DMW0_reg2 <= 0;
        // CSR_DMW1_reg2 <= 0;
        VA_I_reg2 <= 0;
        VA_D_reg2 <= 0;
        en_i_reg2 <= 0;
        en_d_reg2 <= 0;
        TAG_OFFSET_I_reg2 <= 0;
        TAG_OFFSET_D_reg2 <= 0;
        SOL_reg2 <= 0;
        for(j = 0; j < `TLB_PPN_LEN; j = j + 1)begin
            TLB_I_PPN_TRANS_reg[j] <= 0;
            TLB_D_PPN_TRANS_reg[j] <= 0;
        end
    end
    else begin
        if(~stall_i) begin
            TLB_I_V_TRANS_reg <= TLB_I_V_TRANS;
            TLB_I_D_TRANS_reg <= TLB_I_D_TRANS;
            TLB_I_MAT_TRANS_reg <= TLB_I_MAT_TRANS;
            TLB_I_PLV_TRANS_reg <= TLB_I_PLV_TRANS;
            VA_I_reg2 <= VA_I_reg;
            en_i_reg2 <= en_i_reg;
            TAG_OFFSET_I_reg2 <= TAG_OFFSET_I_reg;
        end
        else begin
            TLB_I_V_TRANS_reg <= TLB_I_V_TRANS_reg;
            TLB_I_D_TRANS_reg <= TLB_I_D_TRANS_reg;
            TLB_I_MAT_TRANS_reg <= TLB_I_MAT_TRANS_reg;
            TLB_I_PLV_TRANS_reg <= TLB_I_PLV_TRANS_reg;
            VA_I_reg2 <= VA_I_reg2;
            en_i_reg2 <= en_i_reg2;
            TAG_OFFSET_I_reg2 <= TAG_OFFSET_I_reg2;
        end
        if (~stall_d)begin
            TLB_D_V_TRANS_reg <= TLB_D_V_TRANS;
            TLB_D_D_TRANS_reg <= TLB_D_D_TRANS;
            TLB_D_MAT_TRANS_reg <= TLB_D_MAT_TRANS;
            TLB_D_PLV_TRANS_reg <= TLB_D_PLV_TRANS;
            VA_D_reg2 <= VA_D_reg;
            en_d_reg2 <= en_d_reg;
            TAG_OFFSET_D_reg2 <= TAG_OFFSET_D_reg;
            SOL_reg2 <= SOL_reg;
        end
        else begin
            TLB_D_V_TRANS_reg <= TLB_D_V_TRANS_reg;
            TLB_D_D_TRANS_reg <= TLB_D_D_TRANS_reg;
            TLB_D_MAT_TRANS_reg <= TLB_D_MAT_TRANS_reg;
            TLB_D_PLV_TRANS_reg <= TLB_D_PLV_TRANS_reg;
            VA_D_reg2 <= VA_D_reg2;
            en_d_reg2 <= en_d_reg2;
            TAG_OFFSET_D_reg2 <= TAG_OFFSET_D_reg2;
            SOL_reg2 <= SOL_reg2;
        end
        // CSR_PG_reg2 <= CSR_PG_reg;
        // CSR_CRMD_reg2 <= CSR_CRMD_reg;
        // CSR_DMW0_reg2 <= CSR_DMW0_reg;
        // CSR_DMW1_reg2 <= CSR_DMW1_reg;
        for(j = 0; j < `TLB_PPN_LEN; j = j + 1)begin
            if(~stall_i) TLB_I_PPN_TRANS_reg[j] <= TLB_I_PPN_TRANS[j];
            else TLB_I_PPN_TRANS_reg[j] <= TLB_I_PPN_TRANS_reg[j];
            if(~stall_d) TLB_D_PPN_TRANS_reg[j] <= TLB_D_PPN_TRANS[j];
            TLB_D_PPN_TRANS_reg[j] <= TLB_D_PPN_TRANS_reg[j];
        end
    end
end

wire [0:0] TLB_I_PPN_TRANS_FINAL [`TLB_PPN_LEN - 1:0];
wire [0:0] TLB_D_PPN_TRANS_FINAL [`TLB_PPN_LEN - 1:0];

generate 
    for(i = 0; i < `TLB_PPN_LEN; i = i + 1)begin
        assign TLB_I_PPN_TRANS_FINAL[i] = |TLB_I_PPN_TRANS_reg[i];
        assign TLB_D_PPN_TRANS_FINAL[i] = |TLB_D_PPN_TRANS_reg[i];
    end
endgenerate

wire [`TLB_NUM - 1:0]       TLB_I_V_FINAL_0;
wire [`TLB_NUM - 1:0]       TLB_I_D_FINAL_0;
wire [`TLB_NUM - 1:0]       TLB_I_MAT_FINAL_0;
wire [`TLB_NUM - 1:0]       TLB_I_PLV_FINAL_0;
wire [`TLB_PPN_LEN - 1:0]   TLB_I_PPN_FINAL_0;
wire [`TLB_NUM - 1:0]       TLB_D_V_FINAL_0;
wire [`TLB_NUM - 1:0]       TLB_D_D_FINAL_0;
wire [`TLB_NUM - 1:0]       TLB_D_MAT_FINAL_0;
wire [`TLB_NUM - 1:0]       TLB_D_PLV_FINAL_0;
wire [`TLB_PPN_LEN - 1:0]   TLB_D_PPN_FINAL_0;

reg                         TLB_I_V_FINAL = 0;
reg                         TLB_I_D_FINAL = 0;
reg                         TLB_I_MAT_FINAL = 0;
reg                         TLB_I_PLV_FINAL = 0;
reg [`TLB_PPN_LEN - 1:0]    TLB_I_PPN_FINAL = 0;
reg                         TLB_D_V_FINAL = 0;
reg                         TLB_D_D_FINAL = 0;
reg                         TLB_D_MAT_FINAL = 0;
reg                         TLB_D_PLV_FINAL = 0;
reg [`TLB_PPN_LEN - 1:0]    TLB_D_PPN_FINAL = 0;
reg                         VA_I_reg3 = 0;
reg                         VA_D_reg3 = 0;
reg                         en_i_reg3 = 0;
reg                         en_d_reg3 = 0;
reg [11:0]                  TAG_OFFSET_I_reg3 = 0;
reg [11:0]                  TAG_OFFSET_D_reg3 = 0;
reg                         SOL_reg3 = 0;

assign  SOL_D_OUT = SOL_reg3;

always @(posedge clk or negedge rstn) begin
    if(~rstn)begin
        TLB_I_V_FINAL <= 0;
        TLB_I_D_FINAL <= 0;
        TLB_I_MAT_FINAL <= 0;
        TLB_I_PLV_FINAL <= 0;
        TLB_I_PPN_FINAL <= 0;
        TLB_D_V_FINAL <= 0;
        TLB_D_D_FINAL <= 0;
        TLB_D_MAT_FINAL <= 0;
        TLB_D_PLV_FINAL <= 0;
        TLB_D_PPN_FINAL <= 0;
        VA_I_reg3 <= 0;
        VA_D_reg3 <= 0;
        en_i_reg3 <= 0;
        en_d_reg3 <= 0;
        TAG_OFFSET_I_reg3 <= 0;
        TAG_OFFSET_D_reg3 <= 0;
        SOL_reg3 <= 0;
    end
    else if (flush)begin
        TLB_I_V_FINAL <= 0;
        TLB_I_D_FINAL <= 0;
        TLB_I_MAT_FINAL <= 0;
        TLB_I_PLV_FINAL <= 0;
        TLB_I_PPN_FINAL <= 0;
        TLB_D_V_FINAL <= 0;
        TLB_D_D_FINAL <= 0;
        TLB_D_MAT_FINAL <= 0;
        TLB_D_PLV_FINAL <= 0;
        TLB_D_PPN_FINAL <= 0;
        VA_I_reg3 <= 0;
        VA_D_reg3 <= 0;
        en_i_reg3 <= 0;
        en_d_reg3 <= 0;
        TAG_OFFSET_I_reg3 <= 0;
        TAG_OFFSET_D_reg3 <= 0;
        SOL_reg3 <= 0;
    end
    else begin
        //if (~stall_i) begin
            TLB_I_V_FINAL   <= |TLB_I_V_FINAL_0;
            TLB_I_D_FINAL   <= |TLB_I_D_FINAL_0;
            TLB_I_MAT_FINAL <= |TLB_I_MAT_FINAL_0;
            TLB_I_PLV_FINAL <= |TLB_I_PLV_FINAL_0;
            TLB_I_PPN_FINAL <= TLB_I_PPN_FINAL_0;
            VA_I_reg3 <= VA_I_reg2[`TLB_VPPN_LEN];
            en_i_reg3 <= en_i_reg2;
            TAG_OFFSET_I_reg3 <= TAG_OFFSET_I_reg2;
        /*end
        else begin
            TLB_I_V_FINAL   <= TLB_I_V_FINAL;
            TLB_I_D_FINAL   <= TLB_I_D_FINAL;
            TLB_I_MAT_FINAL <= TLB_I_MAT_FINAL;
            TLB_I_PLV_FINAL <= TLB_I_PLV_FINAL;
            TLB_I_PPN_FINAL <= TLB_I_PPN_FINAL;
            VA_I_reg3 <= VA_I_reg3;
            en_i_reg3 <= en_i_reg3;
            TAG_OFFSET_I_reg3 <= TAG_OFFSET_I_reg3;
        end
        if (~stall_d) begin*/
            TLB_D_V_FINAL <= |TLB_D_V_FINAL_0;
            TLB_D_D_FINAL <= |TLB_D_D_FINAL_0;
            TLB_D_MAT_FINAL <= |TLB_D_MAT_FINAL_0;
            TLB_D_PLV_FINAL <= |TLB_D_PLV_FINAL_0;
            TLB_D_PPN_FINAL <= TLB_D_PPN_FINAL_0;
            VA_D_reg3 <= VA_D_reg2[`TLB_VPPN_LEN];
            en_d_reg3 <= en_d_reg2;
            TAG_OFFSET_D_reg3 <= TAG_OFFSET_D_reg2;
            SOL_reg3 <= SOL_reg2;
        /*end
        else begin
            TLB_D_V_FINAL <= TLB_D_V_FINAL;
            TLB_D_D_FINAL <= TLB_D_D_FINAL;
            TLB_D_MAT_FINAL <= TLB_D_MAT_FINAL;
            TLB_D_PLV_FINAL <= TLB_D_PLV_FINAL;
            TLB_D_PPN_FINAL <= TLB_D_PPN_FINAL;
            VA_D_reg3 <= VA_D_reg3;
            en_d_reg3 <= en_d_reg3;
            TAG_OFFSET_D_reg3 <= TAG_OFFSET_D_reg3;
            SOL_reg3 <= SOL_reg3;
        end*/
    end
end

assign TLB_I_V_FINAL_0    =   TLB_I_V_TRANS_reg;
assign TLB_I_D_FINAL_0    =   TLB_I_D_TRANS_reg;
assign TLB_I_MAT_FINAL_0  =   TLB_I_MAT_TRANS_reg;
assign TLB_I_PLV_FINAL_0  =   TLB_I_PLV_TRANS_reg;
assign TLB_D_V_FINAL_0    =   TLB_D_V_TRANS_reg;
assign TLB_D_D_FINAL_0    =   TLB_D_D_TRANS_reg;
assign TLB_D_MAT_FINAL_0  =   TLB_D_MAT_TRANS_reg;
assign TLB_D_PLV_FINAL_0  =   TLB_D_PLV_TRANS_reg;
assign PA_TAG_OFFSET_I_OUT = TAG_OFFSET_I_reg3;
assign PA_TAG_OFFSET_D_OUT = TAG_OFFSET_D_reg3;

generate
    for (i = 0; i < `TLB_PPN_LEN; i = i + 1)begin
        assign TLB_I_PPN_FINAL_0[i] = TLB_I_PPN_TRANS_FINAL[i];
        assign TLB_D_PPN_FINAL_0[i] = TLB_D_PPN_TRANS_FINAL[i];
    end
endgenerate

wire        DMW0_JUDGE_I = VA_I_reg2[`TLB_VPPN_LEN : `TLB_VPPN_LEN - 2] == CSR_DMW0[`DMW0_VSEG];
wire [`TLB_VPPN_LEN:0] DMW0_PPN_I = {CSR_DMW0[`DMW0_PSEG], VA_I_reg2[`TLB_VPPN_LEN - 3:0]};
wire        DMW1_JUDGE_I = VA_I_reg2[`TLB_VPPN_LEN : `TLB_VPPN_LEN - 2] == CSR_DMW1[`DMW0_VSEG];
wire [`TLB_VPPN_LEN:0] DMW1_PPN_I = {CSR_DMW1[`DMW1_PSEG], VA_I_reg2[`TLB_VPPN_LEN - 3:0]};
wire        DMW0_JUDGE_D = VA_D_reg2[`TLB_VPPN_LEN : `TLB_VPPN_LEN - 2] == CSR_DMW0[`DMW0_VSEG];
wire [`TLB_VPPN_LEN:0] DMW0_PPN_D = {CSR_DMW0[`DMW0_PSEG], VA_D_reg2[`TLB_VPPN_LEN - 3:0]};
wire        DMW1_JUDGE_D = VA_D_reg2[`TLB_VPPN_LEN : `TLB_VPPN_LEN - 2] == CSR_DMW1[`DMW0_VSEG];
wire [`TLB_VPPN_LEN:0] DMW1_PPN_D = {CSR_DMW1[`DMW1_PSEG], VA_D_reg2[`TLB_VPPN_LEN - 3:0]};

reg TLB_en_I = 0;
reg TLB_en_D = 0;

always @(posedge clk or negedge rstn)begin
    if (~rstn) begin
        PA_I <= 0;
        PA_D <= 0;
        is_cached_I <= 0;
        is_cached_D <= 0;
        TLB_en_I <= 0;
        TLB_en_D <= 0;
    end
    else if (flush)begin
        PA_I <= 0;
        PA_D <= 0;
        is_cached_I <= 0;
        is_cached_D <= 0;
        TLB_en_I <= 0;
        TLB_en_D <= 0;
    end
    else begin
        PA_I <= CSR_PG ? (DMW0_JUDGE_I ? DMW0_PPN_I : (DMW1_JUDGE_I ? DMW1_PPN_I : TLB_I_PPN_FINAL_0)) : VA_I_reg2;
        PA_D <= CSR_PG ? (DMW0_JUDGE_D ? DMW0_PPN_D : (DMW1_JUDGE_D ? DMW1_PPN_D : TLB_D_PPN_FINAL_0)) : VA_D_reg2;
        is_cached_I <= CSR_PG ? (DMW0_JUDGE_I ? CSR_DMW0[4] : (DMW1_JUDGE_I ? CSR_DMW1[4] : |TLB_I_MAT_TRANS)) : CSR_CRMD[5];
        is_cached_D <= CSR_PG ? (DMW0_JUDGE_D ? CSR_DMW0[4] : (DMW1_JUDGE_D ? CSR_DMW1[4] : |TLB_D_MAT_TRANS)) : CSR_CRMD[7];
        TLB_en_I <= CSR_PG & ~(DMW0_JUDGE_I | DMW1_JUDGE_I);
        TLB_en_D <= CSR_PG & ~(DMW0_JUDGE_D | DMW1_JUDGE_D);
    end
end
//TLB SEARCH PART

wire [`TLB_NUM - 1:0] CSR_TLBSRCH;

generate 
    for(i = 0; i < `TLB_NUM; i = i + 1)begin
        assign CSR_TLBSRCH[i] = rd_TLB_E[i] & (rd_TLB_G[i] | (rd_TLB_ASID[i] == CSR_ASID)) & (rd_TLB_VPPN[i] == CSR_VPPN[`TLBEHI_VPPN]);
    end
endgenerate

reg [`TLB_NUM - 1:0] CSR_TLBSRCH_HIT_reg = 0;
reg                  CSR_TLBSRCH_VALID_reg = 0;

always @(posedge clk or negedge rstn)begin
    if(~rstn)begin
        CSR_TLBSRCH_HIT_reg <= 0;
        CSR_TLBSRCH_VALID_reg <= 0;
    end
    else if (TLBSRCH_valid) begin
        CSR_TLBSRCH_HIT_reg <= CSR_TLBSRCH;
        CSR_TLBSRCH_VALID_reg <= 1;
    end
    else begin
        CSR_TLBSRCH_HIT_reg <= 0;
        CSR_TLBSRCH_VALID_reg <= 0;
    end
end

wire [5:0]  CSR_TLBSRCH_INDEX_tmp, CSR_TLBSRCH_INDEX;
wire        CSR_TLBSRCH_HIT;

clog2 cl2(
    .in(CSR_TLBSRCH_HIT_reg),
    .out(CSR_TLBSRCH_INDEX_tmp)
);

assign CSR_TLBSRCH_INDEX = |CSR_TLBSRCH_HIT_reg ? CSR_TLBSRCH_INDEX_tmp - 1 : 0;
assign CSR_TLBSRCH_HIT = |CSR_TLBSRCH_HIT_reg;

always @(posedge clk or negedge rstn)begin
    if(~rstn)begin
        TLBSRCH_INDEX <= 0;
        TLBSRCH_hit <= 0;
        TLBSRCH_ready <= 0;
    end
    else begin
        TLBSRCH_INDEX <= CSR_TLBSRCH_INDEX[4:0];
        TLBSRCH_hit <= CSR_TLBSRCH_HIT;
        if(CSR_TLBSRCH_VALID_reg & TLBSRCH_ready) TLBSRCH_ready <= 0;
        else if (CSR_TLBSRCH_VALID_reg) TLBSRCH_ready <= 1;
        else TLBSRCH_ready <= 0;
    end
end

//TLB READ PART

always @(posedge clk or negedge rstn)begin
    if(~rstn)begin
        TLBRD_hit <= 0;
        TLB_CPR <= 0;
        TLB_TRANS_1 <= 0;
        TLB_TRANS_2 <= 0;
        TLBRD_ready <= 0;
    end
    else if (TLBRD_valid) begin
        TLBRD_hit <= rd_TLB_E[TLBRD_INDEX];
        TLB_CPR <= tlb_cpr[TLBRD_INDEX];
        TLB_TRANS_1 <= tlb_trans_1[TLBRD_INDEX];
        TLB_TRANS_2 <= tlb_trans_2[TLBRD_INDEX];
        if (TLBRD_ready) TLBRD_ready <= 0;
        else TLBRD_ready <= 1;
    end
end


//TLB WRITE PART

always @(posedge clk or negedge rstn)begin
    if (~rstn)begin
        TLBWR_ready <= 0;
        TLBINVLD_ready <= 0;
        for (j = 0; j < `TLB_NUM; j = j + 1)begin
            tlb_cpr[j] <= 0;
            tlb_trans_1[j] <= 0;
            tlb_trans_2[j] <= 0;
        end
    end
    else if (TLBWR_valid) begin
        if (TLBWR_ready) begin
            TLBWR_ready <= 0;
        end
        else begin
            TLBWR_ready <= 1;
        end
        tlb_cpr[CSR_TLBIDX[`TLBIDX_INDEX]] <= TLB_CPR_w;
        tlb_trans_1[CSR_TLBIDX[`TLBIDX_INDEX]] <= TLB_TRANS_1_w;
        tlb_trans_2[CSR_TLBIDX[`TLBIDX_INDEX]] <= TLB_TRANS_2_w;
    end
    else if (TLBFILL_valid) begin
        if (TLBFILL_ready) begin
            TLBFILL_ready <= 0;
        end
        else begin
            TLBFILL_ready <= 1;
        end
        tlb_cpr[stable_counter] <= TLB_CPR_w;
        tlb_trans_1[stable_counter] <= TLB_TRANS_1_w;
        tlb_trans_2[stable_counter] <= TLB_TRANS_2_w;
    end
    else if (TLBINVLD_valid) begin
        if (TLBINVLD_ready)begin 
            TLBINVLD_ready <= 0;
        end
        else begin
            TLBINVLD_ready <= 1;
        end
        case(TLBINVLD_OP)
            5'h00, 5'h01: begin
                for (j = 0; j < `TLB_NUM; j = j + 1)begin
                    tlb_cpr[j][`TLB_E] <= 0;
                end
            end
            5'h02: begin
                for (j = 0; j < `TLB_NUM; j = j + 1)begin
                    if (rd_TLB_G[j]) tlb_cpr[j][`TLB_E] <= 0;
                end
            end
            5'h03: begin
                for (j = 0; j < `TLB_NUM; j = j + 1)begin
                    if (~rd_TLB_G[j]) tlb_cpr[j][`TLB_E] <= 0;
                end
            end
            5'h04: begin
                for (j = 0; j < `TLB_NUM; j = j + 1)begin
                    if (~rd_TLB_G[j] & (rd_TLB_ASID[j] == TLBINVLD_ASID)) tlb_cpr[j][`TLB_E] <= 0;
                end
            end
            5'h05: begin
                for (j = 0; j < `TLB_NUM; j = j + 1)begin
                    if (~rd_TLB_G[j] & (rd_TLB_ASID[j] == TLBINVLD_ASID) & (rd_TLB_VPPN[j] == TLBINVLD_VA)) tlb_cpr[j][`TLB_E] <= 0;
                end
            end
            5'h06: begin
                for (j = 0; j < `TLB_NUM; j = j + 1)begin
                    if ((rd_TLB_G[j] | (rd_TLB_ASID[j] != TLBINVLD_ASID)) & (rd_TLB_VPPN[j] == TLBINVLD_VA)) tlb_cpr[j][`TLB_E] <= 0;
                end
            end
        endcase
    end
end

//TLB INVALIDATE PART

//TLB_EXP
TLB_EXP tlb_exp(
    .vaddr0(VA_I_reg3),
    .en0(en_i_reg3 & TLB_en_I),
    .plv0_1bit(plv_1bit), //crmd_plv
    .is_if_0(1), //PIF 
    .is_store_0(0), //PIS
    .is_load_0(0), //PIL
    .tlbhit0(|TLB_I_HIT), //TLBR TLB重填例外
    .tlb_d0(TLB_I_D_FINAL), //页脏为1，PME 页修改例外 找到dirty页
    .tlb_v0(TLB_I_V_FINAL), //页有效为1，PIF PIS PIL
    .tlb_plv0_1bit(plv_1bit), //页特权等级，PPI
    .exception0(tlb_exception_code_i),
    //.tlbexception_flag0(tlbexception_flag0), //直接把exception0按位或就行，反正INT不会有TLB生成
    
    .vaddr1(VA_D_reg3),
    .en1(en_d_reg3 & TLB_en_D),
    .plv1_1bit(plv_1bit), //crmd_plv
    .is_if_1(0), //PIF
    .is_store_1(SOL_reg3), //PIS
    .is_load_1(~SOL_reg3), //PIL
    .tlbhit1(|TLB_D_HIT), //TLBR TLB重填例外
    .tlb_d1(TLB_D_D_FINAL), //页脏为1，PME 页修改例外 找到dirty页
    .tlb_v1(TLB_D_V_FINAL), //页有效为1，PIF PIS PIL
    .tlb_plv1_1bit(plv_1bit), //页特权等级，PPI
    .exception1(tlb_exception_code_d)
    //.tlbexception_flag1(|tlb_exception_code_d) //直接把exception0按位或就行，反正INT不会有TLB生成
);

endmodule
