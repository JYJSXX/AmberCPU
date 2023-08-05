`include "config.vh"
`include "exception.vh"

module TLB_EXP(
    input vaddr0,
    input en0,
    input plv0_1bit, //crmd_plv
    input is_if_0, //PIF 
    input is_store_0, //PIS
    input is_load_0, //PIL
    input tlbhit0, //TLBR TLB重填例外
    input tlb_d0, //页脏为1，PME 页修改例外 找到dirty页
    input tlb_v0, //页有效为1，PIF PIS PIL
    input tlb_plv0_1bit, //页特权等级，PPI
    output [6:0] exception0,
    //output tlbexception_flag0, //直接把exception0按位或就行，反正INT不会有TLB生成

    input vaddr1,
    input en1,
    input plv1_1bit, //crmd_plv
    input is_if_1, //PIF
    input is_store_1, //PIS
    input is_load_1, //PIL
    input tlbhit1, //TLBR TLB重填例外
    input tlb_d1, //页脏为1，PME 页修改例外 找到dirty页
    input tlb_v1, //页有效为1，PIF PIS PIL
    input tlb_plv1_1bit, //页特权等级，PPI
    output [6:0] exception1
   // output tlbexception_flag1
    
);
wire [6:0] exception0_tmp;
wire [6:0] exception1_tmp;
assign exception0_tmp[6:0] = 
{7{plv0_1bit==1'b1&&vaddr0}} & `EXP_ADEF |
 {7{!tlbhit0}} & `EXP_TLBR|
 { 7{is_if_0&&!tlb_v0}}& `EXP_PIF|
 { 7{is_store_0&&!tlb_v0}} & `EXP_PIS|
 { 7{is_load_0&&!tlb_v0}} & `EXP_PIL|
 { 7{plv0_1bit>tlb_plv0_1bit} }& `EXP_PPI|
 {7{is_store_0&&!tlb_d0}} & `EXP_PME;
//assign tlbexception_flag0 = |exception0[6:0] & en0;
assign exception0 = exception0_tmp[6:0] & {6{en0}};
assign exception1_tmp[6:0] = 
{7{plv1_1bit==1'b1&&vaddr1}} & `EXP_ADEF |
 {7{!tlbhit1}} & `EXP_TLBR|
 { 7{is_if_1&&!tlb_v1}}& `EXP_PIF|
 { 7{is_store_1&&!tlb_v1}} & `EXP_PIS|
 { 7{is_load_1&&!tlb_v1}} & `EXP_PIL|
 { 7{plv1_1bit>tlb_plv1_1bit} }& `EXP_PPI|
 {7{is_store_1&&!tlb_d1}} & `EXP_PME;
assign exception1 = exception1_tmp[6:0] & {6{en1}};
//assign tlbexception_flag1 = |exception1[6:0] & en1;
endmodule