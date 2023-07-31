`include "define.vh"
`include "exception.vh"
`include "config.vh"
`timescale 1ns/1ps
module EX2_WB(
    input clk,
    input aresetn,
    output flush_out_all,
    input flush_to_tlb,
    //input ex2_valid, 这个信号不要了，由下面一堆valid/div_ready/dcache_ready来代替
    input wen_csr,
    output reg ex2_allowin,
    input csr_ren_ex2,
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
    // input EN_VA_D,
    input reg_ex1_is_priviledeged_0,
    input ex1_ex2_is_priviledged_1,
    input [31:0] reg_ex1_pc0,
    output reg [31:0] ex2_wb_data_0,
    output reg [31:0] ex2_wb_data_1,
    output reg [31:0] ex2_wb_data_2,
    output reg ex2_wb_data_0_valid,
    output reg ex2_wb_data_1_valid,
    output reg ex2_wb_data_2_valid,
    output reg [4:0] ex2_wb_rd0,
    output reg [4:0] ex2_wb_rd1,
    output reg [4:0] ex2_wb_rd2,
    input        [4:0] rd_dcache_out,
    output reg ex2_wb_we0,
    output reg ex2_wb_we1,
    output reg ex2_wb_we2,
    // output ld_stall_flag,


    //dcache
    input [31:0] dcache_data,
    input dcache_ready,
    input dcache_w_ready,

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
    output reg exception_cpu_interrupt,
    output reg [31:0] badv_out,
    output reg wen_badv,
    output reg tlb_exception, //决定是否回到直接地址翻译
    input [31:0] era_in,
    input cpu_interrupt,
    input [31:0] csr_era,
    output reg [31:0] era_out,
    output reg wen_era,
    output reg [18:0] vppn_out,
    output reg wen_vppn,
    output  [31:0] pc_from_WB,
    output set_by_priv,
    output flush_by_exception,
    output flush_to_priv_wr_csr,
    input  [31:0] eentry,
    input  [31:0] tlbrentry
);
// wire ld_stall_flag;
assign pc_from_WB = (tlb_exception) ? tlbrentry : eentry;
assign set_by_priv = tlb_exception | exception_flag_out;
assign flush_to_priv_wr_csr = tlb_exception | exception_flag_out | uop0[`INS_ERTN];
// reg tlb_d_valid_reg;
// always@(*)begin
//         tlb_d_valid_reg = EN_VA_D & (~flush_to_tlb);
//     end

assign flush_out_all = exception_flag_out;
assign flush_by_exception = set_by_priv;
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
        exception_cpu_interrupt <= 0;
    end
    else begin
        exception_flag_out <= exception_flag_in | cpu_interrupt;
        ecode_out <= ecode_in;
        badv_out <= badv_in;
        wen_badv <= exception_flag_in && set_badv;
        tlb_exception <= exception_flag_in && (ecode_in == `EXP_TLBR);
        if(era_in!=0) era_out <= era_in;
        wen_era <= exception_flag_in | cpu_interrupt;
        vppn_out <= badv_in[18:0];
        wen_vppn <= exception_flag_in && set_vppn;
        exception_cpu_interrupt <= cpu_interrupt;
    end

end

// reg [31:0] pc_mem_reg = 0;
// reg [31:0] inst_mem_reg = 0;
// reg mem_count = 1;

//     always @(posedge clk)begin
//         if(~aresetn) begin
//             pc_mem_reg <= 0;
//             inst_mem_reg <= 0;
//             mem_count <= 1;
//         end
//         else if (ex2_allowin & dcache_valid_buf[0])begin
//             pc_mem_reg <= pc0;
//             inst_mem_reg <= ex1_ex2_inst0;
//             mem_count <= 0;
//         end
//         else
//             mem_count <= 1;
//     end

reg [`WIDTH_UOP-1:0] uop0_reg=0;
reg [`WIDTH_UOP-1:0] uop1_reg=0;
always@(posedge clk) begin
    uop0_reg <= uop0;
    uop1_reg <= uop1;
end
wire [3:0] cond0;
wire [3:0] cond1;
assign cond0 = uop0_reg[`UOP_COND];
assign cond1 = uop1_reg[`UOP_COND];
    always@(posedge clk)begin
        if(~aresetn)begin
            ex2_wb_data_0 <= 0;
            ex2_wb_data_1 <= 0;
            ex2_wb_data_0_valid <= 0;
            ex2_wb_data_1_valid <= 0;
            ex2_wb_data_2_valid <= 0;
            ex2_wb_rd0 <= 0;
            ex2_wb_rd1 <= 0;
            ex2_wb_rd2 <= 0;
            ex2_wb_we0 <= 0;
            ex2_wb_we1 <= 0;
            ex2_wb_we2 <= 0;
        end
        else begin
            if(ex2_result0_valid) begin
                //ex2_wb_data_0 <= (ex1_ex2_inst0[30:26]=='b10011 | ex1_ex2_inst0[30:26] == 'b10101)?ex2_result0+4:ex2_result0;
                ex2_wb_data_0 <= (ex1_ex2_inst0[30:26]=='b10011)?ex2_result0+4:ex2_result0;
                ex2_wb_data_0_valid <= 1;
                ex2_wb_rd0 <= ex_rd0;
                ex2_wb_we0 <= 1;
            end
            else if (uop0[`INS_MEM])begin
                if(dcache_ready)begin
                    ex2_wb_data_0 <= dcache_data;
                    ex2_wb_rd0 <= rd_dcache_out;
                    ex2_wb_data_2_valid <= 1;
                    ex2_wb_we2 <= 1;
                end
                else begin
                    ex2_wb_data_0 <= 0;
                    ex2_wb_rd0 <= 0;
                    ex2_wb_data_2_valid <= 0;
                    ex2_wb_we2 <= 0;
                end
            end
            else if(reg_ex1_is_priviledeged_0 ) begin
                ex2_wb_data_0 <= csr_data_in;
                ex2_wb_data_0_valid <= csr_ready & reg_ex1_is_priviledeged_0;
                ex2_wb_rd0 <= ex_rd0;
                ex2_wb_we0 <= csr_ready & reg_ex1_is_priviledeged_0;
            end
            else if(wen_csr) begin
                ex2_wb_data_0 <= csr_data_in;
                ex2_wb_data_0_valid <= 1;
                ex2_wb_rd0 <= ex_rd0;
                ex2_wb_we0 <= 1;

            end
            else if (csr_ren_ex2)begin
                ex2_wb_data_0 <= csr_data_in;
                ex2_wb_data_0_valid <= 1;
                ex2_wb_rd0 <= ex_rd0;
                ex2_wb_we0 <= 1;
            end
            else if(uop0[`INS_DIV]) begin
                ex2_wb_data_0 <= csr_data_in;
                ex2_wb_data_0_valid <= 1;
                ex2_wb_rd0 <= ex_rd0;
                ex2_wb_we0 <= 1;
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
            
            else begin
                ex2_wb_data_1 <= 0;
                ex2_wb_data_1_valid <= 0;
                ex2_wb_rd1 <= 0;
                ex2_wb_we1 <= 0;
            end
            
            // if(uop0_reg[`INS_MEM] && ~cond0[2]) begin //cond[2]为0是ld
            //     if(dcache_w_ready)begin
            //         ex2_wb_data_2 <= dcache_data;
            //         ex2_wb_rd2 <= rd_dcache_out;
            //     end
            //     ex2_wb_data_2_valid <= dcache_w_ready;
            //     ex2_wb_we2 <= dcache_w_ready;
            // end
            // else begin 
            //     ex2_wb_we2 <= 0;
            //     ex2_wb_data_2_valid <= 0;
            //     ex2_wb_rd2 <= 0;
            // end
        end

    end


    // reg [2:0]    dcache_valid_buf = 0;
    // reg buf_sign;
    // reg buf_sign_reg = 1;

    // always @ (posedge clk) buf_sign_reg <= buf_sign;
    //     always @(posedge clk) begin
    //     if(!aresetn | flush_by_exception)begin
    //         dcache_valid_buf<=0;
    //     end 
    //     else if(ex2_allowin)begin
    //         dcache_valid_buf<={dcache_valid_buf[1:0], tlb_d_valid_reg & ~flush_by_exception};            
    //     end
    //     else if (buf_sign & ~buf_sign_reg) begin
    //          dcache_valid_buf<={dcache_valid_buf[1:0], 1'b0 };       
    //         //    dcache_valid_buf <= {dcache_valid_buf[2], 2'b10};
    //     end
        
    // end
    // wire temp = (ex1_ex2_inst0==0 && ex1_ex2_inst1==0) || ( div_ready | csr_ready) || (!dcache_valid_buf[1]  || dcache_ready);
    // wire temp1 = (ex1_ex2_inst0==0 && ex1_ex2_inst1==0 && !(uop0[`INS_DIV] | reg_ex1_is_priviledeged_0));
    // wire temp2 = ( div_ready | csr_ready && (!dcache_valid_buf[1] || dcache_ready ));
    // wire temp3 = (!dcache_valid_buf[1] && !(uop0[`INS_DIV] | reg_ex1_is_priviledeged_0) || dcache_ready);
always@(*) begin
    ex2_allowin=1;
    // buf_sign = 0;
    // ld_stall_flag = 0;
    // if(ex1_ex2_inst0==0 && ex1_ex2_inst1==0 && !(reg_ex1_is_priviledeged_0)) begin
    //     ex2_allowin=1;
    // end
    //else if((ex2_wb_data_0_valid | ~(~dcache_ready && tlb_d_valid_reg)  | div_ready | csr_ready) && ex2_wb_data_1_valid) begin
    if (uop0[`INS_MEM] && ~dcache_ready)
        ex2_allowin = 0;
    // else if( csr_ready)  begin
    //     ex2_allowin=1;
    // end
    // else if(!(reg_ex1_is_priviledeged_0)) 
    //     ex2_allowin=1;
    // else if(/*!(dcache_valid_buf[0] ) && !(uop0[`INS_DIV] | reg_ex1_is_priviledeged_0) || dcache_ready*/(dcache_valid_buf[0]&& ~dcache_valid_buf[1] && ~dcache_ready) || (uop0[`INS_DIV])) begin
    //     ex2_allowin=0;
    //     // buf_sign = 1;
    //     // ld_stall_flag = 1;
    // end

end
assign ld_stall_flag = (uop0[`INS_MEM] && ~dcache_ready);


always@(posedge clk)begin
    if (flush_out_all)begin
        debug0_wb_pc <= 0;
        debug0_wb_inst <= `INST_NOP;
        debug1_wb_pc <= 0;
        debug1_wb_inst <= `INST_NOP;
        debug0_valid <= 0;
        debug1_valid <= 0;
    end
    else begin
        debug0_wb_pc <= /*dcache_ready ? pc_mem_reg : */pc0;
        debug0_wb_inst <= /*dcache_ready ? inst_mem_reg : */ex1_ex2_inst0;
        debug1_wb_pc <= pc1;
        debug1_wb_inst <= ex1_ex2_inst1;
        debug0_valid <= /*dcache_ready ? 1: */(ex2_allowin);
        debug1_valid <= ex2_allowin;
    end

end
//下面这些自带一个周期延迟，和上面的同步
assign debug0_wb_rf_wen = {3'b0,ex2_wb_we0};
assign debug0_wb_rf_wnum = ex2_wb_rd0;
assign debug0_wb_rf_wdata = ex2_wb_data_0;
assign debug1_wb_rf_wen = {3'b0,ex2_wb_we1};
assign debug1_wb_rf_wnum = ex2_wb_rd1;
assign debug1_wb_rf_wdata = ex2_wb_data_1;
endmodule