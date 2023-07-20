`include "TLB.vh"
`include "../csr.vh"
module TLB(
    input                               clk,
    input                               rstn,

    input       [9:0]                   CSR_ASID,
    input       [18:0]                  CSR_VPPN,
    input                               CSR_PG,
    input       [31:0]                  CSR_CRMD,
    input       [31:0]                  CSR_DMW0,
    input       [31:0]                  CSR_DMW1,
    input       [31:0]                  CSR_TLBEHI, 

    input                               stall_i,//读使能
    input                               stall_d,
    input       [`TLB_VPPN_LEN : 0]     VA_I,
    input       [`TLB_VPPN_LEN : 0]     VA_D,
    output      [`TLB_PPN_LEN - 1:0]    PA_I,
    output      [`TLB_PPN_LEN - 1:0]    PA_D,
    output                              is_cached_I,
    output                              is_cached_D,

    //Priv      
    input                               TLBSRCH_valid,
    output                              TLBSRCH_ready,
    output reg                          TLBSRCH_hit,
    output reg  [4:0]                   TLBSRCH_INDEX,

    input                               TLBRD_INDEX,
    input                               TLBRD_valid,
    output                              TLBRD_ready,
    output reg                          TLBRD_hit,
    output reg  [`TLB_CPRLEN - 1:0]     TLB_CPR,
    output reg  [`TLB_TRANSLEN - 1:0]   TLB_TRANS_1,
    output reg  [`TLB_TRANSLEN - 1:0]   TLB_TRANS_2,



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
reg                             stall_i_reg                           ;
reg                             stall_d_reg                           ;
// reg                             CSR_PG_reg                          ;
// reg                             CSR_CRMD_reg                        ;
// reg                             CSR_DMW0_reg                        ;
// reg                             CSR_DMW1_reg                        ;
reg     [`TLB_VPPN_LEN : 0]     VA_D_reg                            ;
reg     [`TLB_VPPN_LEN : 0]     VA_I_reg                            ;

initial begin
    stall_i_reg = 0;
    stall_d_reg = 0;
    CSR_TLBSRCH_HIT_reg = 0;
    // CSR_PG_reg = 0;
    // CSR_CRMD_reg = 0;
    // CSR_DMW0_reg = 0;
    // CSR_DMW1_reg = 0;
    VA_I_reg = 0;
    VA_D_reg = 0;
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
        stall_i_reg <= 0;
        stall_d_reg <= 0;
        // CSR_PG_reg <= 0;
        // CSR_CRMD_reg <= 0;
        // CSR_DMW0_reg <= 0;
        // CSR_DMW1_reg <= 0;
        VA_I_reg <= 0;
        VA_D_reg <= 0;
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
        stall_i_reg <= stall_i;
        stall_d_reg <= stall_d;
        // CSR_PG_reg <= CSR_PG;
        // CSR_CRMD_reg <= CSR_CRMD;
        // CSR_DMW0_reg <= CSR_DMW0;
        // CSR_DMW1_reg <= CSR_DMW1;

        VA_I_reg <= VA_I;
        VA_D_reg <= VA_D;
        for(j = 0; j < `TLB_NUM; j = j + 1)begin
            if(~stall_i) begin
                TLB_I_HIT_4K_OUT[j] <= TLB_I_HIT_4K_IN[j];
                TLB_I_HIT_4M_OUT[j] <= TLB_I_HIT_4M_IN[j];
                TLB_I_VA_12_ODD[j]  <= VA_I[12];
                TLB_I_VA_21_ODD[j]  <= VA_I[21];
            end
            else begin
                TLB_I_HIT_4K_OUT[j] <= TLB_I_HIT_4K_OUT[j];
                TLB_I_HIT_4M_OUT[j] <= TLB_I_HIT_4M_OUT[j];
                TLB_I_VA_12_ODD[j]  <= TLB_I_VA_12_ODD[j];
                TLB_I_VA_21_ODD[j]  <= TLB_I_VA_21_ODD[j];
            end
            if(~stall_d) begin
                TLB_D_HIT_4K_OUT[j] <= TLB_D_HIT_4K_IN[j];
                TLB_D_HIT_4M_OUT[j] <= TLB_D_HIT_4M_IN[j];
                TLB_D_VA_12_ODD[j]  <= VA_D[12];
                TLB_D_VA_21_ODD[j]  <= VA_D[21];
            end
            else begin
                TLB_D_HIT_4K_OUT[j] <= TLB_D_HIT_4K_OUT[j];
                TLB_D_HIT_4M_OUT[j] <= TLB_D_HIT_4M_OUT[j];
                TLB_D_VA_12_ODD[j]  <= TLB_D_VA_12_ODD[j];
                TLB_D_VA_21_ODD[j]  <= TLB_D_VA_21_ODD[j];
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
        assign TLB_I_D[i]      =   {TLB_I_HIT[i]} & (TLB_I_ODD[i] ? rd_TLB_D_2_reg[i] : rd_TLB_V_1_reg[i]);
        assign TLB_I_MAT[i]    =   {TLB_I_HIT[i]} & (TLB_I_ODD[i] ? rd_TLB_MAT_2_reg[i][0] : rd_TLB_V_1_reg[i]);
        assign TLB_I_PLV[i]    =   {TLB_I_HIT[i]} & (TLB_I_ODD[i] ? rd_TLB_PLV_2_reg[i][0] : rd_TLB_V_1_reg[i]);
        assign TLB_I_PPN[i]    =   {(`TLB_PPN_LEN - 1){TLB_I_HIT[i] & TLB_D_V[i]}} & (TLB_I_ODD[i] ? rd_TLB_PPN_2_reg[i] : rd_TLB_V_1_reg[i]);

        assign TLB_D_V[i]      =   {TLB_D_HIT[i]} & (TLB_D_ODD[i] ? rd_TLB_V_2_reg[i] : rd_TLB_V_1_reg[i]);
        assign TLB_D_D[i]      =   {TLB_D_HIT[i]} & (TLB_D_ODD[i] ? rd_TLB_D_2_reg[i] : rd_TLB_V_1_reg[i]);
        assign TLB_D_MAT[i]    =   {TLB_D_HIT[i]} & (TLB_D_ODD[i] ? rd_TLB_MAT_2_reg[i][0] : rd_TLB_V_1_reg[i]);
        assign TLB_D_PLV[i]    =   {TLB_D_HIT[i]} & (TLB_D_ODD[i] ? rd_TLB_PLV_2_reg[i][0] : rd_TLB_V_1_reg[i]);
        assign TLB_D_PPN[i]    =   {(`TLB_PPN_LEN - 1){TLB_D_HIT[i] & TLB_D_V[i]}} & (TLB_D_ODD[i] ? rd_TLB_PPN_2_reg[i] : rd_TLB_V_1_reg[i]);
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
reg                     stall_i_reg2 = 0;
reg                     stall_d_reg2 = 0;
// reg                     CSR_PG_reg2 = 0;
// reg                     CSR_CRMD_reg2 = 0;
// reg                     CSR_DMW0_reg2 = 0;
// reg                     CSR_DMW1_reg2 = 0;
reg [`TLB_VPPN_LEN : 0] VA_I_reg2 = 0;
reg [`TLB_VPPN_LEN : 0] VA_D_reg2 = 0;

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
        stall_i_reg2 <= 0;
        stall_d_reg2 <= 0;
        // CSR_PG_reg2 <= 0;
        // CSR_CRMD_reg2 <= 0;
        // CSR_DMW0_reg2 <= 0;
        // CSR_DMW1_reg2 <= 0;
        VA_I_reg2 <= 0;
        VA_D_reg2 <= 0;
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
        end
        else begin
            TLB_I_V_TRANS_reg <= TLB_I_V_TRANS_reg;
            TLB_I_D_TRANS_reg <= TLB_I_D_TRANS_reg;
            TLB_I_MAT_TRANS_reg <= TLB_I_MAT_TRANS_reg;
            TLB_I_PLV_TRANS_reg <= TLB_I_PLV_TRANS_reg
            VA_I_reg2 <= VA_I_reg2
        end
        if (~stall_d)begin
            TLB_D_V_TRANS_reg <= TLB_D_V_TRANS;
            TLB_D_D_TRANS_reg <= TLB_D_D_TRANS;
            TLB_D_MAT_TRANS_reg <= TLB_D_MAT_TRANS;
            TLB_D_PLV_TRANS_reg <= TLB_D_PLV_TRANS;
            VA_D_reg2 <= VA_D_reg;
        end
        else begin
            TLB_D_V_TRANS_reg <= TLB_D_V_TRANS_reg;
            TLB_D_D_TRANS_reg <= TLB_D_D_TRANS_reg;
            TLB_D_MAT_TRANS_reg <= TLB_D_MAT_TRANS_reg;
            TLB_D_PLV_TRANS_reg <= TLB_D_PLV_TRANS_reg;
            VA_D_reg2 <= VA_D_reg2;
        end
        stall_i_reg2 <= stall_i_reg;
        stall_d_reg2 <= stall_d_reg;
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
        assign TLB_I_PPN_TRANS_FINAL[i] = |TLB_I_PPN_TRANS[i];
        assign TLB_D_PPN_TRANS_FINAL[i] = |TLB_D_PPN_TRANS[i];
    end
endgenerate

wire [`TLB_NUM - 1:0]       TLB_I_V_FINAL;
wire [`TLB_NUM - 1:0]       TLB_I_D_FINAL;
wire [`TLB_NUM - 1:0]       TLB_I_MAT_FINAL;
wire [`TLB_NUM - 1:0]       TLB_I_PLV_FINAL;
wire [`TLB_PPN_LEN - 1:0]   TLB_I_PPN_FINAL;
wire [`TLB_NUM - 1:0]       TLB_D_V_FINAL;
wire [`TLB_NUM - 1:0]       TLB_D_D_FINAL;
wire [`TLB_NUM - 1:0]       TLB_D_MAT_FINAL;
wire [`TLB_NUM - 1:0]       TLB_D_PLV_FINAL;
wire [`TLB_PPN_LEN - 1:0]   TLB_D_PPN_FINAL;

assign TLB_I_V_FINAL    =   TLB_I_V_TRANS_reg;
assign TLB_I_D_FINAL    =   TLB_I_D_TRANS_reg;
assign TLB_I_MAT_FINAL  =   TLB_I_MAT_TRANS_reg;
assign TLB_I_PLV_FINAL  =   TLB_I_PLV_TRANS_reg;
assign TLB_D_V_FINAL    =   TLB_D_V_TRANS_reg;
assign TLB_D_D_FINAL    =   TLB_D_D_TRANS_reg;
assign TLB_D_MAT_FINAL  =   TLB_D_MAT_TRANS_reg;
assign TLB_D_PLV_FINAL  =   TLB_D_PLV_TRANS_reg;

generate
    for (i = 0; i < `TLB_PPN_LEN; i = i + 1)begin
        assign TLB_I_PPN_FINAL[i] = TLB_I_PPN_TRANS_FINAL[i];
        assign TLB_D_PPN_FINAL[i] = TLB_D_PPN_TRANS_FINAL[i];
    end
endgenerate

wire        DMW0_JUDGE_I = VA_I_reg2[`DMW0_VSEG] == CSR_DMW0[`DMW0_VSEG];
wire [31:0] DMW0_PPN_I = {CSR_DMW0[`DMW0_PSEG], VA_I_reg2[28:0]};
wire        DMW1_JUDGE_I = VA_I_reg2[`DMW1_VSEG] == CSR_DMW1[`DMW0_VSEG];
wire [31:0] DMW1_PPN_I = {CSR_DMW1[`DMW1_PSEG], VA_I_reg2[28:0]};
wire        DMW0_JUDGE_D = VA_D_reg2[`DMW0_VSEG] == CSR_DMW0[`DMW0_VSEG];
wire [31:0] DMW0_PPN_D = {CSR_DMW0[`DMW0_PSEG], VA_D_reg2[28:0]};
wire        DMW1_JUDGE_D = VA_D_reg2[`DMW1_VSEG] == CSR_DMW1[`DMW0_VSEG];
wire [31:0] DMW1_PPN_D = {CSR_DMW1[`DMW1_PSEG], VA_D_reg2[28:0]};

assign PA_I = CSR_PG_reg2 ? (DMW0_JUDGE_I ? DMW0_PPN_I : (DMW1_JUDGE_I ? DMW1_PPN_I : TLB_I_PPN_FINAL)) : VA_I_reg2;
assign PA_D = CSR_PG_reg2 ? (DMW0_JUDGE_D ? DMW0_PPN_D : (DMW1_JUDGE_D ? DMW1_PPN_D : TLB_D_PPN_FINAL)) : VA_D_reg2;
assign is_cached_I = CSR_PG_reg2 ? (DMW0_JUDGE_I ? CSR_DMW0[4] : (DMW1_JUDGE_I ? CSR_DMW1[4] : TLB_I_MAT_FINAL)) : CSR_CRMD[5];
assign is_cached_D = CSR_PG_reg2 ? (DMW0_JUDGE_D ? CSR_DMW0[4] : (DMW1_JUDGE_D ? CSR_DMW1[4] : TLB_D_MAT_FINAL)) : CSR_CRMD[7];

//TLB SEARCH PART

wire [`TLB_NUM - 1:0] CSR_TLBSRCH;

generate 
    for(i = 0; i < `TLB_NUM; i = i + 1)begin
        assign CSR_TLBSRCH_HIT[i] = rd_TLB_E[i] & (rd_TLB_G[i] | (rd_TLB_ASID[i] == CSR_ASID)) & (rd_TLB_VPPN[i] == CSR_VPPN[`TLBEHI_VPPN]);
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
        CSR_TLBSRCH_HIT_reg <= CSR_TLBSRCH_HIT;
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
        TLBSRCH_HIT <= 0;
        TLBSRCH_ready <= 0;
    end
    else begin
        TLBSRCH_INDEX <= CSR_TLBSRCH_INDEX[4:0];
        TLBSRCH_HIT <= CSR_TLBSRCH_HIT;
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



endmodule