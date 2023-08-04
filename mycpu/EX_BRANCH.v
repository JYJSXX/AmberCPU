`include "define.vh"
module EX_BRANCH(
    input [31:0] pc,
    input        CMT,
    input       way, //0 way or 1 way
    input [31:0] inst,
    input predict_to_branch,
    input [31:0] pc_predict, //预测器输出，预测器认为不跳转就
    input [31:0] imm,
    input [31:0] br_sr1,
    input [31:0] br_sr2, //把从forward那里出来的信号接进来
    input [`WIDTH_UOP-1:0] uop,
    output reg predict_dir_fail, //跳不跳错了
    output reg predict_addr_fail, //跳到哪里错了
    output fact_taken, //到底跳不跳
    output  [31:0] fact_pc, //分支指令的pc
    output  [31:0] fact_tpc //目标地址pc
);
parameter  JIRL = 'b0011;
parameter  B    = 'b0100;
parameter  BL   = 'b0101;
parameter  BEQ  = 'b0110;
parameter  BNE  = 'b0111;
parameter  BLT  = 'b1000;
parameter  BGE  = 'b1001;
parameter  BLTU = 'b1010;
parameter  BGEU = 'b1011;
    wire is_branch;
    assign is_branch = uop[`INS_BR];
    wire ready_to_branch;

    wire [31:0] pc_real_branch;
    wire [31:0] pcAdd=~way ? (CMT?pc+4:pc+8) : pc+4;
    assign pc_real_branch = inst[29:26] == 'b0011 ? {imm[29:0],2'b00}+br_sr1: 
                                        is_branch ? pc+{imm[29:0],2'b00} : pcAdd;

    wire br_sr1_eq_sr2;
    wire br_sr1_lt_sr2_unsign;
    wire br_sr1_lt_sr2_sign;
    assign br_sr1_eq_sr2        = (br_sr1 == br_sr2);
    assign br_sr1_lt_sr2_unsign = (br_sr1 < br_sr2);
    assign br_sr1_lt_sr2_sign   = (br_sr1[31] && ~br_sr2[31]) ? 1'b1 :
                                  (~br_sr1[31] && br_sr2[31]) ? 1'b0 : br_sr1_lt_sr2_unsign;
    assign ready_to_branch = (uop[`UOP_COND] == JIRL) ||
                             (uop[`UOP_COND] == B) ||
                             (uop[`UOP_COND] == BL) ||
                             (uop[`UOP_COND] == BEQ && br_sr1_eq_sr2) ||
                             (uop[`UOP_COND] == BNE && ~br_sr1_eq_sr2) ||
                             (uop[`UOP_COND] == BLT && br_sr1_lt_sr2_sign) ||
                             (uop[`UOP_COND] == BGE && ~br_sr1_lt_sr2_sign) ||
                             (uop[`UOP_COND] == BLTU && br_sr1_lt_sr2_unsign) ||
                             (uop[`UOP_COND] == BGEU && ~br_sr1_lt_sr2_unsign);
    always @(*) begin
        if((is_branch&ready_to_branch)^predict_to_branch) begin //跳不跳预测错了
            predict_dir_fail=1'b1;
            predict_addr_fail=1'b1;
        end
        //跳到哪里预测错了
        else if(is_branch  && ready_to_branch && predict_to_branch && pc_predict!=pc_real_branch) begin
            predict_dir_fail=1'b0;
            predict_addr_fail=1'b1;
        end else begin
            predict_dir_fail=1'b0;
            predict_addr_fail=1'b0;
        end
    end
    assign fact_taken = is_branch&ready_to_branch;
    assign fact_pc = pc;
    assign fact_tpc = fact_taken?pc_real_branch:pcAdd;
endmodule