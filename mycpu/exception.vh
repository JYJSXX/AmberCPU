// -*- Verilog -*-
//[5:0] Ecode, [6:6] EsubCode
`define EXP_INT     7'h00   //中断
`define EXP_PIL     7'h01   //load操作页无效例外 TLB BADV
`define EXP_PIS     7'h02   //store操作页无效例外 TLB BADV
`define EXP_PIF     7'h03   //取指操作页无效例外 TLB BADV
`define EXP_PME     7'h04   //页修改例外  TLB BADV
`define EXP_PPI     7'h07   //页特权等级不合规例外 TLB BADV
`define EXP_ADEF    7'h08   //取指地址错例外 ICACHE非对齐或TLB在用户模式访问特权地址 BADV
`define EXP_ADEM    7'h48   //访存指令地址错例外 TLB在用户模式访问特权地址
`define EXP_ALE     7'h09   //地址非对齐例外 DCACE(可能转交给TLB) BADV
`define EXP_SYS     7'h0B   //系统调用例外 EX
`define EXP_BRK     7'h0C   //断点例外 EX
`define EXP_INE     7'h0D   //指令不存在例外 ID
`define EXP_IPE     7'h0E   //指令特权等级错例外 EX
`define EXP_FPD     7'h0F   //浮点指令未使能例外
`define EXP_FPE     7'h12   //基础浮点指令例外
// 0x1A-0x3E  保留编码
`define EXP_TLBR    7'h3F   //TLB重填例外 TLB BADV
