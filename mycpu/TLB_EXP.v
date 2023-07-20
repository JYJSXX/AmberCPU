`include "../config.vh"
`include "../exception.vh"

module TLB_EXP(
    input [31:0] vaddr0,
    input en0,
    input [1:0] plv0, //crmd_plv
    input is_if_0, //PIF 
    input is_store_0, //PIS
    input is_load_0, //PIL
    input tlbhit0, //TLBR TLB重填例外
    input tlb_d0, //页脏为1，PME 页修改例外 找到dirty页
    input tlb_v0, //页有效为1，PIF PIS PIL
    input [1:0] tlb_plv0, //页特权等级，PPI
    output [6:0] exception0,
    output tlbexception_flag0, //直接把exception0按位或就行，反正INT不会有TLB生成

    input [31:0] vaddr1,
    input en1,
    input [1:0] plv1, //crmd_plv
    input is_if_1, //PIF
    input is_store_1, //PIS
    input is_load_1, //PIL
    input tlbhit1, //TLBR TLB重填例外
    input tlb_d1, //页脏为1，PME 页修改例外 找到dirty页
    input tlb_v1, //页有效为1，PIF PIS PIL
    input [1:0] tlb_plv1, //页特权等级，PPI
    output [6:0] exception1,
    output tlbexception_flag1
    
);
assign exception0[6:0] = 
{7{plv0==2'b11&&vaddr0[31]}} & `EXP_ADEF |
 {7{!tlbhit0}} & `EXP_TLBR|
 { 7{is_if_0&&!tlb_v0}}& `EXP_PIF|
 { 7{is_store_0&&!tlb_v0}} & `EXP_PIS|
 { 7{is_load_0&&!tlb_v0}} & `EXP_PIL|
 { 7{plv0>tlb_plv0} }& `EXP_PPI|
 {7{is_store_0&&!tlb_d0}} & `EXP_PME;
assign tlbexception_flag0 = |exception0[6:0];

assign exception1[6:0] = 
{7{plv1==2'b11&&vaddr1[31]}} & `EXP_ADEF |
 {7{!tlbhit1}} & `EXP_TLBR|
 { 7{is_if_1&&!tlb_v1}}& `EXP_PIF|
 { 7{is_store_1&&!tlb_v1}} & `EXP_PIS|
 { 7{is_load_1&&!tlb_v1}} & `EXP_PIL|
 { 7{plv1>tlb_plv1} }& `EXP_PPI|
 {7{is_store_1&&!tlb_d1}} & `EXP_PME;
assign tlbexception_flag1 = |exception1[6:0];
endmodule