`include "define.vh"
`include"exception.vh"
`include "config.vh"
`timescale 1ns/1ps
module EX1(
    input   clk,
    input   aclk,
    input   aresetn,
    output   flush,
    input   flush_by_priv,
    input   [31:0] pc0,
    input   [31:0] pc1,
    input   [31:0] inst0,
    input   [31:0] inst1,
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
    input         dcache_ready,
    //input   [4:0] ex_rd0,
    //input   [4:0] ex_rd1,
    output forward_flag_j0,
    output forward_flag_k0,
    output forward_flag_j1,
    output forward_flag_k1,
    output [31:0] forward_data_j0,
    output [31:0] forward_data_k0,
    output [31:0] forward_data_j1,
    output [31:0] forward_data_k1,
    output [31:0] alu_result0,
    output [31:0] alu_result1,
    output alu_result0_valid,
    output alu_result1_valid,
    output ibar,
    output csr_flag_from_ex,
    output tlb_flag_from_ex,
    //前递用到的信号
    //从ex1_ex2段间输入
    input [4:0] ex1_ex2_rd0,
    input [4:0] ex1_ex2_rd1,
    input [31:0] ex1_ex2_data_0,
    input [31:0] ex1_ex2_data_1,
    input ex1_ex2_data_0_valid, //可不可以前递，没算好不能前递
    input ex1_ex2_data_1_valid,
    //从ex2_wb段间输入
    input [4:0] ex2_wb_rd0,
    input [4:0] ex2_wb_rd1,
    input [4:0] ex2_wb_rd2,
    input [31:0] ex2_wb_data_0,
    input [31:0] ex2_wb_data_1,
    input [31:0] ex2_wb_data_2,
    input ex2_wb_data_0_valid,
    input ex2_wb_data_1_valid,
    input ex2_wb_data_2_valid,
    output forward_stall, //需要前递，但还没算出来，给段间寄存器ready信号用
    //csr
    input [31:0] tid, //读时钟id的指令RDCNTID用到

    //读时钟的指令RDCNTV(L/H)要用到，开始从cpu_top接进来,现在放在模块内了
    //input [63:0] stable_counter,

    //分支预测
    input predict_to_branch, //分支预测的信号
    input [31:0] pc0_predict,
    output predict_dir_fail, //分支预测跳不跳失败的信号
    output predict_addr_fail, //分支预测往哪跳失败的信号
    output fact_taken, //实际跳不跳
    output [31:0] fact_pc, //分支指令的pc
    output [31:0] fact_tpc, //目标地址pc

    //给cache
    output rvalid_dcache,
    output wvalid_dcache,
    output op_dcache, //0读1写
    output [3:0] write_type_dcache, //写入类型,0b0001为byte,0b0011为half,0b1111为word
    output [31:0] addr_dcache,
    output [31:0] w_data_dcache,
    output  is_atom_dcache,
   // output uncache, 由csr负责
//     输入端

// - addr(32)：读写地址
// - rvalid (1)：来自流水线的读请求的有效信号。
// - wvalid (1)：来自流水线的写请求的有效信号。
// - wdata (32)：来自流水线的写数据。
// - wstrb (4)：每个写回字（word）的写掩码，如果请求是读请求，则wstrb为4'b0。
// - op (1)：操作类型，0表示读操作，1表示写操作。
// - uncache (1)：指示请求是否为非缓存请求。

// 输出端

// - rready (1)：向流水线发送的读请求的就绪信号。
// - rdata (32)：读取的数据返回给流水线。
// - wready (1): 写请求的就绪信号

    //给mul
    output [31:0] mul_stage1_res_hh,
    output [31:0] mul_stage1_res_hl,
    output [31:0] mul_stage1_res_lh,
    output [31:0] mul_stage1_res_ll,
    output [31:0] mul_compensate,

    //给divider
    output [31:0] quotient,
    output [31:0] remainder,
    output stall_divider,
    output div_ready,

    //下面都是特权指令的
    output privilege_ready,
    //给csr
    output [13:0] csr_addr,
    output [31:0] csr_wdata,
    output csr_wen,
    output csr_ren,
    input [31:0] csr_rdata,
    //给wb段
    output [31:0] csr_rd_data,
    //CACOP
    output [1:0] cacop_ins_type,
    output [31:0] cacop_vaddr,
    output cacop_i_en,
    output cacop_d_en,
    input cacop_i_ready,
    input cacop_d_ready,
    input cacop_i_done,
    input cacop_d_done,
    //ERTN
    output ertn_en,
    //idle
    input i_idle,
    input d_idle,
    output block_cache,
    output block_clock,
    //TLB
    input tlbsrch_ready,
    output tlbsrch_valid,
    input tlbrd_ready,
    output tlbrd_valid,
    input tlbwr_ready,
    output tlbwr_valid,
    input tlbfill_ready,
    output tlbfill_valid,
    input invtlb_ready,
    output invtlb_valid,
    output [4:0] invtlb_op,
    output [31:0] invtlb_asid,
    output [18:0] invtlb_va,

    //exception
    input  plv, //从csr_crmd[0]
    input excp_flag_in,
    input [6:0] exception_in,
    input [31:0] badv_in,
    output reg [31:0] badv_out,
    output reg excp_flag_out,
    output reg [6:0] exception_out,
    output [63:0] stable_counter
`ifdef DIFFTEST
    ,input [31:0] vaddr_diff_in,
    input [31:0] paddr_diff_in,
    input [31:0] data_diff_in,
    output reg [31:0] vaddr_diff_out,
    output reg [31:0] paddr_diff_out,
    output reg [31:0] data_diff_out,
    output reg [63:0] ex_stable_counter,
    output ex1_allowin
`endif


);

assign csr_flag_from_ex = uop0[`INS_CSR];
assign tlb_flag_from_ex = uop0[`INS_TLB] && (inst0[11:10] == 2'b00 || inst0[11:10] ==2'b01 || inst0[15]);
    reg [63:0] stable_counter_reg;
    assign flush=  predict_addr_fail || predict_dir_fail || uop0[`INS_ERTN];
    always @(posedge aclk)
        if(~aresetn) stable_counter_reg<=0;
        else stable_counter_reg <= stable_counter_reg+1;
    assign stable_counter = stable_counter_reg;   
`ifdef DIFFTEST      
    always@(posedge clk)begin
        if(ex1_allowin) begin
            ex_stable_counter <= stable_counter;
            vaddr_diff_out <= vaddr_diff_in;
            paddr_diff_out <= paddr_diff_in;
            data_diff_out <= data_diff_in;
        end
    end
    `endif
always@(*)begin
    if(excp_flag_in) begin
        exception_out = exception_in;
        excp_flag_out = excp_flag_in;
        badv_out = badv_in;
    end
    else begin
        if(is_syscall_0) begin
            exception_out = `EXP_SYS;
            excp_flag_out = 1;
            badv_out = pc0;
        end
        else if(is_break_0) begin
            exception_out = `EXP_BRK;
            excp_flag_out = 1;
            badv_out = pc0;
        end
        else if(is_priviledged_0 && plv && ~(uop0[`INS_ERTN] && privilege_ready)) begin
            exception_out = `EXP_IPE;
            excp_flag_out = 1;
            badv_out = pc0;
        end
        else begin
            exception_out = 0;
            excp_flag_out = 0;
            badv_out = 0;
        end
    end
end
assign ibar = uop0[`INS_BAR];
wire [3:0] cond0;
wire [31:0] a_1;
wire [31:0] b_1;
wire [31:0] y_1;
wire [3:0] cond1;
wire [31:0] a_2;
wire [31:0] b_2;
wire [31:0] y_2;
wire [31:0] pc_add_4; //根据控制信号判断要写入pc+4还是y
assign pc_add_4 = pc0 + 4;
assign cond0 = uop0[`UOP_COND];
assign cond1 = uop1[`UOP_COND];
assign alu_result0_valid = is_ALU_0 || uop0[`INS_BR] || inst0 == 32'b0;
assign alu_result1_valid = is_ALU_1 || uop1[`INS_BR] || inst1 == 32'b0; //beq之类的就向r0写，应该也没什么问题
assign alu_result0 = uop0[`INS_BR]? pc_add_4:y_1;
assign alu_result1 = y_2; //跳转指令单发，只在0号，1号alu不发射跳转
wire [31:0] rj0_data_o;
wire [31:0] rk0_data_o;
wire [31:0] rk1_data_o;
wire [31:0] rj1_data_o;
wire forward_stall1;
wire forward_stall2;
EX1_FORWARD ex1_forward1(
    .ex1_rj(ex_rj0),
    .ex1_rk(ex_rk0),
    .ex1_ex2_data_0_valid(ex1_ex2_data_0_valid),
    .ex1_ex2_data_1_valid(ex1_ex2_data_1_valid),
    .ex1_ex2_data_0(ex1_ex2_data_0),
    .ex1_ex2_data_1(ex1_ex2_data_1),
    .ex1_ex2_rd0(ex1_ex2_rd0),
    .ex1_ex2_rd1(ex1_ex2_rd1),
    .ex2_wb_data_0_valid(ex2_wb_data_0_valid),
    .ex2_wb_data_1_valid(ex2_wb_data_1_valid),
    .ex2_wb_data_2_valid(ex2_wb_data_2_valid),
    .ex2_wb_data_0(ex2_wb_data_0),
    .ex2_wb_data_1(ex2_wb_data_1),
    .ex2_wb_data_2(ex2_wb_data_2),
    .ex2_wb_rd0(ex2_wb_rd0),
    .ex2_wb_rd1(ex2_wb_rd1),
    .ex2_wb_rd2(ex2_wb_rd2),
    .ex1_rj_data(rj0_data),
    .ex1_rk_data(rk0_data),
    .ex1_rj_data_o(rj0_data_o),
    .ex1_rk_data_o(rk0_data_o),
    .forward_stall(forward_stall1),
    .forward_flag_j(forward_flag_j0),
    .forward_data_j(forward_data_j0),
    .forward_flag_k(forward_flag_k0),
    .forward_data_k(forward_data_k0)
);

assign a_1 = uop0[`UOP_SRC1] == `CTRL_SRC1_RF ? rj0_data_o : 
            uop0[`UOP_SRC1] == `CTRL_SRC1_PC ? pc0 :
            uop0[`UOP_SRC1] == `CTRL_SRC1_ZERO ? 0 :tid;
assign b_1= uop0[`UOP_SRC2] == `CTRL_SRC2_RF ? rk0_data_o : 
            uop0[`UOP_SRC2] == `CTRL_SRC2_IMM ? imm0 :
            uop0[`UOP_SRC2] == `CTRL_SRC2_CNTL ? stable_counter[31:0] : stable_counter[63:32];
EX_ALU ex_alu1(
    .ctrl(cond0),
    .a(a_1),
    .b(b_1),
    .y(y_1)
);


EX1_FORWARD ex1_forward2(
    .ex1_rj(ex_rj1),
    .ex1_rk(ex_rk1),
    .ex1_ex2_data_0_valid(ex1_ex2_data_0_valid),
    .ex1_ex2_data_1_valid(ex1_ex2_data_1_valid),
    .ex1_ex2_data_0(ex1_ex2_data_0),
    .ex1_ex2_data_1(ex1_ex2_data_1),
    .ex1_ex2_rd0(ex1_ex2_rd0),
    .ex1_ex2_rd1(ex1_ex2_rd1),
    .ex2_wb_data_0_valid(ex2_wb_data_0_valid),
    .ex2_wb_data_1_valid(ex2_wb_data_1_valid),
    .ex2_wb_data_2_valid(ex2_wb_data_2_valid),
    .ex2_wb_data_0(ex2_wb_data_0),
    .ex2_wb_data_1(ex2_wb_data_1),
    .ex2_wb_data_2(ex2_wb_data_2),
    .ex2_wb_rd0(ex2_wb_rd0),
    .ex2_wb_rd1(ex2_wb_rd1),
    .ex2_wb_rd2(ex2_wb_rd2),
    .ex1_rj_data(rj1_data),
    .ex1_rk_data(rk1_data),
    .ex1_rj_data_o(rj1_data_o),
    .ex1_rk_data_o(rk1_data_o),
    .forward_stall(forward_stall2),
    .forward_flag_j(forward_flag_j1),
    .forward_data_j(forward_data_j1),
    .forward_flag_k(forward_flag_k1),
    .forward_data_k(forward_data_k1)
);
assign a_2 = uop1[`UOP_SRC1] == `CTRL_SRC1_RF ? rj1_data_o : 
            uop1[`UOP_SRC1] == `CTRL_SRC1_PC ? pc1 :
            uop1[`UOP_SRC1] == `CTRL_SRC1_ZERO ? 0 :tid;
assign b_2= uop1[`UOP_SRC2] == `CTRL_SRC2_RF ? rk1_data_o : 
            uop1[`UOP_SRC2] == `CTRL_SRC2_IMM ? imm1:
            uop1[`UOP_SRC2] == `CTRL_SRC2_CNTL ? stable_counter[31:0] : stable_counter[63:32];
EX_ALU ex_alu2(
    .ctrl(cond1),
    .a(a_2),
    .b(b_2),
    .y(y_2)
);

EX_BRANCH ex_branch(
    .pc(pc0),
    .inst(inst0),
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
EX_Privilege ex_privilege(
    .clk(clk),
    .rstn(aresetn),
    .en(is_priviledged_0 && ~plv && ~dcache_ready),     
    .rk_data(rk0_data_o),      
    .rj_data(rj0_data_o),      
    .ins(inst0),          
    .flush_by_priv (flush_by_priv),
    . pr_type(uop0),     
    .done(privilege_ready),         
    .csr_addr(csr_addr),     
    .csr_wdata(csr_wdata),
    .csr_wen(csr_wen),
    .csr_ren(csr_ren),
    .csr_rdata(csr_rdata),  
    .csr_rdata_reg(csr_rd_data),
    .cacop_ins_type(cacop_ins_type),
    .cacop_vaddr(cacop_vaddr),  
    .cacop_i_en(cacop_i_en),
    .cacop_d_en(cacop_d_en),
    .cacop_i_ready(cacop_i_ready),
    .cacop_d_ready(cacop_d_ready),
    .cacop_i_done(cacop_i_done),
    .cacop_d_done(cacop_d_done),
    .ertn_en(ertn_en),
    .i_idle(i_idle),
    .d_idle(d_idle),
    .block_cache(block_cache),
    .block_clock(block_clock),
    .tlbsrch_ready(tlbsrch_ready),
    .tlbsrch_valid(tlbsrch_valid),
    .tlbrd_ready(tlbrd_ready),
    .tlbrd_valid(tlbrd_valid),
    .tlbwr_ready(tlbwr_ready),
    .tlbwr_valid(tlbwr_valid),
    .tlbfill_ready(tlbfill_ready),
    .tlbfill_valid(tlbfill_valid),
    .invtlb_ready(invtlb_ready),
    .invtlb_valid(invtlb_valid),
    .invtlb_op(invtlb_op),
    .invtlb_asid(invtlb_asid),
    .invtlb_va(invtlb_va)
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
divider divider1(
    .clk(clk),
    .rstn(aresetn),
    .dividend(rj0_data_o),
    .divisor(rk0_data_o),
    .en(uop0[`INS_DIV]),
    .flush_exception(flush | flush_by_priv),
    .sign(uop0[`UOP_SIGN]),
    .quotient(quotient),
    .remainder(remainder),
    .stall_divider(stall_divider),
    .ready(div_ready)
);
assign is_atom_dcache = uop0[`UOP_MEM_ATM];
assign rvalid_dcache=uop0[`INS_MEM] & ~cond0[2] & ~forward_stall;
assign wvalid_dcache=uop0[`INS_MEM] & cond0[2] & ~forward_stall;
assign op_dcache=cond0[2];
assign write_type_dcache=(cond0[1:0]==0)?4'b0001:(cond0[1:0]==1)?4'b0011:4'b1111;
assign addr_dcache = rj0_data_o+imm0;
assign w_data_dcache = rk0_data_o;
assign forward_stall = forward_stall1 | forward_stall2;
endmodule