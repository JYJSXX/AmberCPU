`include "TLB.vh"
module TLB(
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

wire [0:0] TLB_I_HIT [`TLB_NUM - 1:0];
wire [0:0] TLB_D_HIT [`TLB_NUM - 1:0];

generate
    for(i = 0; i < `TLB_NUM; i = i + 1)begin
        assign TLB_I_HIT[i] = rd_TLB_E[i] & (rd_TLB_G[i] | (rd_TLB_ASID[i] == CSR_ASID)) & (rd_TLB_VPPN[i] == VA_I[`TLB_VPPN_LEN:1]);
        assign TLB_D_HIT[i] = rd_TLB_E[i] & (rd_TLB_G[i] | (rd_TLB_ASID[i] == CSR_ASID)) & (rd_TLB_VPPN[i] == VA_D[`TLB_VPPN_LEN:1]);
    end
endgenerate

// reg:HIT UNHIT_EXCEPRION



generate
    for(i = 0; i < `TLB_NUM; i = i + 1)begin

    end
endgenerate

endmodule