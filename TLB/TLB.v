`include "TLB.vh"
module TLB(
    input                       clk,
    input                       rstn,

    input [9:0]                 CSR_ASID,
    input [18:0]                CSR_VPPN,

    input [`TLB_VPPN_LEN : 0]     VA_I,
    input [`TLB_VPPN_LEN : 0]     VA_D,
    input                       PG,
    input [2:0]                 DMW0_VSEG,
    input [2:0]                 DMW1_VSEG,
    input [2:0]                 DMW0_PSEG,
    input [2:0]                 DMW1_PSEG,
    output [`TLB_PPN_LEN - 1:0] PA_I,
    output [`TLB_PPN_LEN - 1:0] PA_D

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

always @(posedge clk or negedge rstn) begin
    for(j = 0; j < `TLB_NUM; j = j + 1)begin
        if (~rstn)begin
            TLB_I_HIT_4K_OUT[j] <= 0;
            TLB_D_HIT_4K_OUT[j] <= 0;
            TLB_I_HIT_4M_OUT[j] <= 0;
            TLB_D_HIT_4M_OUT[j] <= 0;
            TLB_PS_EQUAL_4K[j]  <= 0;
            TLB_D_VA_12_ODD[j]  <= 0;
            TLB_I_VA_12_ODD[j]  <= 0;
            TLB_D_VA_21_ODD[j]  <= 0;
            TLB_I_VA_21_ODD[j]  <= 0;
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
        else begin
            TLB_I_HIT_4K_OUT[j] <= TLB_I_HIT_4K_IN[j];
            TLB_D_HIT_4K_OUT[j] <= TLB_D_HIT_4K_IN[j];
            TLB_I_HIT_4M_OUT[j] <= TLB_I_HIT_4M_IN[j];
            TLB_D_HIT_4M_OUT[j] <= TLB_D_HIT_4M_IN[j];
            TLB_PS_EQUAL_4K[j]  <= (rd_TLB_PS[j] == 12);
            TLB_D_VA_12_ODD[j]  <= VA_D[12];
            TLB_I_VA_12_ODD[j]  <= VA_I[12];
            TLB_D_VA_21_ODD[j]  <= VA_D[21];
            TLB_I_VA_21_ODD[j]  <= VA_I[21];
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
wire    [1:0]                   TLB_I_MAT      [`TLB_NUM - 1:0];
wire    [1:0]                   TLB_I_PLV      [`TLB_NUM - 1:0];
wire    [`TLB_PPN_LEN - 1:0]    TLB_I_PPN      [`TLB_NUM - 1:0];
wire    [0:0]                   TLB_D_V        [`TLB_NUM - 1:0];
wire    [0:0]                   TLB_D_D        [`TLB_NUM - 1:0];
wire    [1:0]                   TLB_D_MAT      [`TLB_NUM - 1:0];
wire    [1:0]                   TLB_D_PLV      [`TLB_NUM - 1:0];
wire    [`TLB_PPN_LEN - 1:0]    TLB_D_PPN      [`TLB_NUM - 1:0];

generate
    for (i = 0; i < `TLB_NUM; i = i + 1)begin
        if (~TLB_I_HIT[i])begin
            assign TLB_I_V[i]      =   0;
            assign TLB_I_D[i]      =   0;
            assign TLB_I_MAT[i]    =   0;
            assign TLB_I_PLV[i]    =   0;
            assign TLB_I_PPN[i]    =   0;
        end
        else if (TLB_I_ODD[i])begin
            assign TLB_I_V[i]      =   rd_TLB_V_2_reg;
            assign TLB_I_D[i]      =   rd_TLB_D_2_reg;
            assign TLB_I_MAT[i]    =   rd_TLB_MAT_2_reg;
            assign TLB_I_PLV[i]    =   rd_TLB_PLV_2_reg;
            assign TLB_I_PPN[i]    =   rd_TLB_PPN_2_reg;
        end
        else begin
            assign TLB_I_V[i]      =   rd_TLB_V_1_reg;
            assign TLB_I_D[i]      =   rd_TLB_D_1_reg;
            assign TLB_I_MAT[i]    =   rd_TLB_MAT_1_reg;
            assign TLB_I_PLV[i]    =   rd_TLB_PLV_1_reg;
            assign TLB_I_PPN[i]    =   rd_TLB_PPN_1_reg;
        end
        if (~TLB_D_HIT[i])begin
            assign TLB_D_V[i]      =   0;
            assign TLB_D_D[i]      =   0;
            assign TLB_D_MAT[i]    =   0;
            assign TLB_D_PLV[i]    =   0;
            assign TLB_D_PPN[i]    =   0;
        end
        else if (TLB_D_ODD[i])begin
            assign TLB_D_V[i]      =   rd_TLB_V_2_reg;
            assign TLB_D_D[i]      =   rd_TLB_D_2_reg;
            assign TLB_D_MAT[i]    =   rd_TLB_MAT_2_reg;
            assign TLB_D_PLV[i]    =   rd_TLB_PLV_2_reg;
            assign TLB_D_PPN[i]    =   rd_TLB_PPN_2_reg;
        end
        else begin
            assign TLB_D_V[i]      =   rd_TLB_V_1_reg;
            assign TLB_D_D[i]      =   rd_TLB_D_1_reg;
            assign TLB_D_MAT[i]    =   rd_TLB_MAT_1_reg;
            assign TLB_D_PLV[i]    =   rd_TLB_PLV_1_reg;
            assign TLB_D_PPN[i]    =   rd_TLB_PPN_1_reg;
        end
    end
endgenerate

wire [`TLB_NUM - 1:0]   TLB_I_PPN_TRANS [`TLB_PPN_LEN - 1:0];
wire [`TLB_NUM - 1:0]   TLB_D_PPN_TRANS [`TLB_PPN_LEN - 1:0];

genvar k;

generate
    for (i = 0; i < `TLB_NUM; i = i + 1)begin
        for (k = 0; k < `TLB_PPN_LEN; k = k + 1)begin
            assign TLB_I_PPN_TRANS[k][i] = TLB_I_PPN[i][k];
            assign TLB_D_PPN_TRANS[k][i] = TLB_D_PPN[i][k];
        end
    end
endgenerate

endmodule