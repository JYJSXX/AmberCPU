`include "define.vh"
module EX1(
    input   clk,
    input   aresetn,
    input   flush,
    input   pc0,
    input   pc1,
    input   is_ALU_0,
    input   is_ALU_1,
    input   is_syscall_0,
    input   is_syscall_1,
    input   is_break_0,
    input   is_break_1,
    input   is_priviledged_0,
    input   is_priviledged_1,
    input   [`WIDTH_UOP-1:0] uop0,
    input   [`WIDTH_UOP-1:0] uop1,
    input   [31:0] imm0,
    input   [31:0] imm1,
    input   [31:0] rj0_data,
    input   [31:0] rj1_data,
    input   [31:0] rk0_data,
    input   [31:0] rk1_data,
    input   [4:0] ex_rj0,
    input   [4:0] ex_rj1,
    input   [4:0] ex_rk0,
    input   [4:0] ex_rk1,
    input   [4:0] ex_rd0,
    input   [4:0] ex_rd1,



    //前递用到的信号
    //从ex1_ex2段间输入
    input [4:0] ex1_ex2_rd_0,
    input [4:0] ex1_ex2_rd_1,
    input [31:0] ex1_ex2_data_0,
    input [31:0] ex1_ex2_data_1,
    input ex1_ex2_data_0_valid, //可不可以前递，没算好不能前递
    input ex1_ex2_data_1_valid,
    //从ex2_wb段间输入
    input [4:0] ex2_wb_rd_0,
    input [4:0] ex2_wb_rd_1,
    input [31:0] ex2_wb_data_0,
    input [31:0] ex2_wb_data_1,
    input ex2_wb_data_0_valid,
    input ex2_wb_data_1_valid,

    //csr
    input [31:0] tid, //读时钟id的指令RDCNTID用到

    //读时钟的指令RDCNTV(L/H)要用到，从cpu_top接进来
    input [63:0] stable_counter,

    //分支预测
    input predict_to_branch, //分支预测的信号
    input [31:0] pc0_predict,
    output predict_dir_fail, //分支预测跳不跳失败的信号
    output predict_addr_fail, //分支预测往哪跳失败的信号
    output fact_taken, //实际跳不跳
    output [31:0] fact_pc, //分支指令的pc
    output [31:0] fact_tpc, //目标地址pc

    //给cache
    output valid_dcache,
    output op_dcache, //0读1写
    output [3:0] write_type_dcache, //写入类型,0b0001为byte,0b0011为half,0b1111为word
    output [31:0] addr_dcache,
    output [31:0] w_data_dcache,
    output [0:0] is_atom_dcache,

    //给mul
    output [31:0] mul_stage1_res_hh,
    output [31:0] mul_stage1_res_hl,
    output [31:0] mul_stage1_res_lh,
    output [31:0] mul_stage1_res_ll,
    output [31:0] mul_compensate

);
wire [3:0] ctrl0;
wire [31:0] a_1;
wire [31:0] b_1;
wire [31:0] y_1;
wire [3:0] ctrl1;
wire [31:0] a_2;
wire [31:0] b_2;
wire [31:0] y_2;
assign ctrl0 = uop0[`UOP_ALUOP];
EX1_FORWARD ex1_forward1(
    .ex1_rj(ex_rj0),
    .ex1_rk(ex_rk0),
    .ex1_ex2_data_0_valid(ex1_ex2_data_0_valid),
    .ex1_ex2_data_1_valid(ex1_ex2_data_1_valid),
    .ex1_ex2_data_0(ex1_ex2_data_0),
    .ex1_ex2_data_1(ex1_ex2_data_1),
    .ex1_ex2_rd_0(ex1_ex2_rd_0),
    .ex1_ex2_rd_1(ex1_ex2_rd_1),
    .ex2_wb_data_0_valid(ex2_wb_data_0_valid),
    .ex2_wb_data_1_valid(ex2_wb_data_1_valid),
    .ex2_wb_data_0(ex2_wb_data_0),
    .ex2_wb_data_1(ex2_wb_data_1),
    .ex2_wb_rd_0(ex2_wb_rd_0),
    .ex2_wb_rd_1(ex2_wb_rd_1),
    .ex1_rj_data(ex_rj0_data),
    .ex1_rk_data(ex_rk0_data),
    .ex1_rj_data_o(rj0_data_o),
    .ex1_rk_data_o(rk0_data_o)

);

assign a_1 = uop0[`UOP_SRC1] == `CTRL_SRC1_RF ? rj0_data_o : 
            uop0[`UOP_SRC1] == `CTRL_SRC1_PC ? pc0 :
            uop0[`UOP_SRC1] == `CTRL_SRC1_ZERO ? 0 :tid;
assign b_1= uop0[`UOP_SRC2] == `CTRL_SRC2_RF ? rk0_data_o : 
            uop0[`UOP_SRC2] == `CTRL_SRC2_IMM ? imm0_o :
            uop0[`UOP_SRC2] == `CTRL_SRC2_CNTL ? stable_counter[31:0] : stable_counter[63:32];
EX_ALU ex_alu1(
    .ctrl(ctrl0),
    .a(a_1),
    .b(b_1),
    .y(y_1)
);
wire pc_add_4; //根据控制信号判断要写入pc+4还是y
assign pc_add_4 = pc0 + 4;

EX1_FORWARD ex1_forward2(
    .ex1_rj(ex_rj1),
    .ex1_rk(ex_rk1),
    .ex1_ex2_data_0_valid(ex1_ex2_data_0_valid),
    .ex1_ex2_data_1_valid(ex1_ex2_data_1_valid),
    .ex1_ex2_data_0(ex1_ex2_data_0),
    .ex1_ex2_data_1(ex1_ex2_data_1),
    .ex1_ex2_rd_0(ex1_ex2_rd_0),
    .ex1_ex2_rd_1(ex1_ex2_rd_1),
    .ex2_wb_data_0_valid(ex2_wb_data_0_valid),
    .ex2_wb_data_1_valid(ex2_wb_data_1_valid),
    .ex2_wb_data_0(ex2_wb_data_0),
    .ex2_wb_data_1(ex2_wb_data_1),
    .ex2_wb_rd_0(ex2_wb_rd_0),
    .ex2_wb_rd_1(ex2_wb_rd_1),
    .ex1_rj_data(ex_rj0_data),
    .ex1_rk_data(ex_rk0_data),
    .ex1_rj_data_o(rj1_data_o),
    .ex1_rk_data_o(rk1_data_o)

);
assign a_2 = uop1[`UOP_SRC1] == `CTRL_SRC1_RF ? rj1_data_o : 
            uop1[`UOP_SRC1] == `CTRL_SRC1_PC ? pc1 :
            uop1[`UOP_SRC1] == `CTRL_SRC1_ZERO ? 0 :tid;
assign b_2= uop1[`UOP_SRC2] == `CTRL_SRC2_RF ? rk1_data_o : 
            uop1[`UOP_SRC2] == `CTRL_SRC2_IMM ? imm1_o :
            uop1[`UOP_SRC2] == `CTRL_SRC2_CNTL ? stable_counter[31:0] : stable_counter[63:32];
EX_ALU ex_alu2(
    .ctrl(ctrl1),
    .a(a_2),
    .b(b_2),
    .y(y_2)
);

EX_BRANCH ex_branch(
    .pc(pc0),
    .predict_to_branch(predict_to_branch),
    .pc_predict(pc0_predict),
    .imm(imm0),
    .br_sr1(rj0_data_o),
    .br_sr2(rk0_data_o),
    .uop(uop0),
    .predict_dir_fail(predict_dir_fail),
    .predict_addr_fail(predict_addr_fail),
    .fact_taken(fact_taken),
    .fact_pc(fact_pc),
    .fact_tpc(fact_tpc)
);

Mul_Stage_1 mul_1(
    .mul_src1(rj0_data_o),
    .mul_src2(rk0_data_o),
    .sign(uop0[`UOP_SIGN]),
    .mul_stage1_res_hh(mul_stage1_res_hh),
    .mul_stage1_res_hl(mul_stage1_res_hl),
    .mul_stage1_res_lh(mul_stage1_res_lh),
    .mul_stage1_res_ll(mul_stage1_res_ll),
    .mul_compensate(mul_compensate)
);


endmodule