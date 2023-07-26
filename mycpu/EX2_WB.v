`include "define.vh"
`include "exception.vh"
`timescale 1ns/1ps
module EX2_WB(
    input clk,
    input aresetn,
    input flush_in,
    output flush_out_all,
    //input ex2_valid, 这个信号不要了，由下面一堆valid/div_ready/dcache_ready来代替
    output reg ex2_allowin,
    input [31:0] pc0,
    input [31:0] pc1,
    input [31:0] ex1_ex2_inst0,
    input [31:0] ex1_ex2_inst1,
    input [`WIDTH_UOP-1:0] uop0,
    input [`WIDTH_UOP-1:0] uop1,
    input [31:0] ex2_result0, //乘法和要写的分支已经在里面了
    input [31:0] ex2_result1,
    input [4:0] ex_rd0,
    input [4:0] ex_rd1,
    input ex2_result0_valid,
    input ex2_result1_valid,
    input en_VA_D_OUT,
    output reg [31:0] ex2_wb_data_0,
    output reg [31:0] ex2_wb_data_1,
    output reg ex2_wb_data_0_valid,
    output reg ex2_wb_data_1_valid,
    output reg [4:0] ex2_wb_rd0,
    output reg [4:0] ex2_wb_rd1,
    output reg ex2_wb_we0,
    output reg ex2_wb_we1,

    //除法
    input [31:0] quotient,
    input [31:0] remainder,
    input stall_divider,
    input div_ready,

    //dcache
    input [31:0] dcache_data,
    input dcache_ready,

    //csr 三条读写csr的指令都要写
    input [31:0] csr_data_in,
    input csr_ready,

    //debug port
    output reg [31:0] debug0_wb_pc,
    output  [ 3:0] debug0_wb_rf_wen,
    output  [ 4:0] debug0_wb_rf_wnum,
    output  [31:0] debug0_wb_rf_wdata,
    output reg [31:0] debug0_wb_inst,
    output reg debug0_valid,

    output reg [31:0] debug1_wb_pc,
    output  [ 3:0] debug1_wb_rf_wen,
    output  [ 4:0] debug1_wb_rf_wnum,
    output  [31:0] debug1_wb_rf_wdata,
    output reg [31:0] debug1_wb_inst,
    output reg debug1_valid,

    //exception
    //input [31:0] csr_estat, //从csr
    //input [31:0] csr_crmd,
    
    input [6:0] ecode_in,//从前一级流水
    input exception_flag_in,
    input [31:0] badv_in,
    output reg[6:0] ecode_out,
    output reg exception_flag_out,
    output reg [31:0] badv_out,
    output reg wen_badv,
    output reg tlb_exception, //决定是否回到直接地址翻译
    input [31:0] era_in,
    input cpu_interrupt,
    output reg [31:0] era_out,
    output reg wen_era,
    output reg [18:0] vppn_out,
    output reg wen_vppn,
    output  [31:0] pc_from_WB,
    input  [31:0] eentry,
    input  [31:0] tlbrentry
);
assign pc_from_WB = (tlb_exception) ? tlbrentry : eentry;
reg tlb_d_valid_reg;
always@(*)begin
        tlb_d_valid_reg = en_VA_D_OUT;
    end

assign flush_out_all = exception_flag_out;
//wire csr_crmd_ie;
//assign csr_crmd_ie = csr_crmd[2];
//wire [12:0] csr_estat_is;
//assign csr_estat_is = csr_estat[12:0];
wire set_badv;
assign set_badv = (ecode_in == `EXP_PIL) || (ecode_in == `EXP_PIS) 
|| (ecode_in == `EXP_PIF) || (ecode_in == `EXP_PME) || (ecode_in == `EXP_PPI)
 || (ecode_in == `EXP_ADEF)  || (ecode_in == `EXP_ALE) || (ecode_in == `EXP_TLBR);
wire set_vppn;
assign set_vppn = (ecode_in == `EXP_PIL) || (ecode_in == `EXP_PIS) 
|| (ecode_in == `EXP_PIF) || (ecode_in == `EXP_PME) || (ecode_in == `EXP_PPI)
 || (ecode_in == `EXP_TLBR);
always@(posedge clk)begin
    if(~aresetn)begin
        ecode_out <= 0;
        exception_flag_out <= 0;
        badv_out <= 0;
        wen_badv <= 0;
        tlb_exception <= 0;
        era_out <= 0;
        wen_era <= 0;
        vppn_out <= 0;
        wen_vppn <= 0;
    end
    else begin
        exception_flag_out <= exception_flag_in | cpu_interrupt;
        ecode_out <= ecode_in;
        badv_out <= badv_in;
        wen_badv <= exception_flag_in && set_badv;
        tlb_exception <= exception_flag_in && (ecode_in == `EXP_TLBR);
        era_out <= era_in;
        wen_era <= exception_flag_in | cpu_interrupt;
        vppn_out <= badv_in[18:0];
        wen_vppn <= exception_flag_in && set_vppn;
        
    end

end


wire [3:0] cond0;
wire [3:0] cond1;
assign cond0 = uop0[`UOP_COND];
assign cond1 = uop1[`UOP_COND];
    always@(posedge clk or negedge aresetn)begin
        if(~aresetn)begin
            ex2_wb_data_0 <= 0;
            ex2_wb_data_1 <= 0;
            ex2_wb_data_0_valid <= 0;
            ex2_wb_data_1_valid <= 0;
            ex2_wb_rd0 <= 0;
            ex2_wb_rd1 <= 0;
            ex2_wb_we0 <= 0;
            ex2_wb_we1 <= 0;
        end
        else begin
            if(ex2_result0_valid) begin
                //ex2_wb_data_0 <= (ex1_ex2_inst0[30:26]=='b10011 | ex1_ex2_inst0[30:26] == 'b10101)?ex2_result0+4:ex2_result0;
                ex2_wb_data_0 <= (ex1_ex2_inst0[30:26]=='b10011)?ex2_result0+4:ex2_result0;
                ex2_wb_data_0_valid <= 1;
                ex2_wb_rd0 <= ex_rd0;
                ex2_wb_we0 <= 1;
            end
            else if(uop0[`INS_CSR]) begin
                ex2_wb_data_0 <= csr_data_in;
                ex2_wb_data_0_valid <= csr_ready & uop0[`INS_CSR];
                ex2_wb_rd0 <= ex_rd0;
                ex2_wb_we0 <= csr_ready & uop0[`INS_CSR];
            end
            else if(uop0[`INS_DIV]) begin
                if(cond0[0]) begin
                    ex2_wb_data_0 <= remainder;
                    ex2_wb_data_0_valid <= div_ready;
                    ex2_wb_rd0 <= ex_rd0;
                    ex2_wb_we0 <= div_ready;
                end
                else begin
                    ex2_wb_data_0 <= quotient;
                    ex2_wb_data_0_valid <= div_ready;
                    ex2_wb_rd0 <= ex_rd0;
                    ex2_wb_we0 <= div_ready;
                end
            end
            else if(uop0[`INS_MEM] && ~cond0[2]) begin //cond[2]为0是ld
                    ex2_wb_data_0 <= dcache_data;
                    ex2_wb_data_0_valid <= dcache_ready;
                    ex2_wb_rd0 <= ex_rd0;
                    ex2_wb_we0 <= dcache_ready;
            end
            else begin
                ex2_wb_data_0 <= 0;
                ex2_wb_data_0_valid <= 0;
                ex2_wb_rd0 <= 0;
                ex2_wb_we0 <= 0;
            end


            if(ex2_result1_valid)begin
                ex2_wb_data_1 <= ex2_result1;
                ex2_wb_data_1_valid <= 1;
                ex2_wb_rd1 <= ex_rd1;
                ex2_wb_we1 <= 1;
            end
            else if(uop1[`INS_DIV]) begin
                if(cond1[0]) begin
                    ex2_wb_data_1 <= remainder;
                    ex2_wb_data_1_valid <= div_ready;
                    ex2_wb_rd1 <= ex_rd1;
                    ex2_wb_we1 <= div_ready;
                end
                else begin
                    ex2_wb_data_1 <= quotient;
                    ex2_wb_data_1_valid <= div_ready;
                    ex2_wb_rd1 <= ex_rd1;
                    ex2_wb_we1 <= div_ready;
                end
            end
            else if(uop1[`INS_MEM] && ~cond1[2]) begin //cond[2]为0是ld
                    ex2_wb_data_1 <= dcache_data;
                    ex2_wb_data_1_valid <= dcache_ready;
                    ex2_wb_rd1 <= ex_rd1;
                    ex2_wb_we1 <= dcache_ready;
            end
            else begin
                ex2_wb_data_1 <= 0;
                ex2_wb_data_1_valid <= 0;
                ex2_wb_rd1 <= 0;
                ex2_wb_we1 <= 0;
            end
        end

    end
always@(*) begin
    ex2_allowin=0;
    if(ex1_ex2_inst0==0 && ex1_ex2_inst1==0) begin
        ex2_allowin=1;
    end

    //else if((ex2_wb_data_0_valid | ~(~dcache_ready && tlb_d_valid_reg)  | div_ready | csr_ready) && ex2_wb_data_1_valid) begin
    else if( ~(~dcache_ready && tlb_d_valid_reg)  | div_ready | csr_ready)  begin
        ex2_allowin=1;
    end
end

always@(posedge clk)begin
    debug0_wb_pc <= pc0;
    debug0_wb_inst <= ex1_ex2_inst0;
    debug1_wb_pc <= pc1;
    debug1_wb_inst <= ex1_ex2_inst1;
    debug0_valid <= ex2_allowin;
    debug1_valid <= ex2_allowin;

end
//下面这些自带一个周期延迟，和上面的同步
assign debug0_wb_rf_wen = {3'b0,ex2_wb_we0};
assign debug0_wb_rf_wnum = ex2_wb_rd0;
assign debug0_wb_rf_wdata = ex2_wb_data_0;
assign debug1_wb_rf_wen = {3'b0,ex2_wb_we1};
assign debug1_wb_rf_wnum = ex2_wb_rd1;
assign debug1_wb_rf_wdata = ex2_wb_data_1;
endmodule