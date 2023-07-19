`include "TLB.vh"
module TLB(
     
);

reg [`TLB_CPRLEN - 1:0] tlb_cpr [`TLB_NUM - 1:0];          //TLB比较部分
reg [`TLB_TRANSLEN - 1:0] tlb_trans [`TLB_NUM - 1:0];      //TLB转换部分



endmodule