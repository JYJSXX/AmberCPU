`include "define.vh"
module EX2_WB(
    input clk,
    input aresetn,
    input flush_in,
    output flush_out,
    //input ex2_valid, 这个信号不要了，由下面一堆valid/div_ready/dcache_ready来代替
    output reg ex2_ready,
    input [31:0] pc0,
    input [31:0] pc1,
    input [31:0] ex1_ex2_inst0,
    input [31:0] ex1_ex2_inst1,
    input [`WIDTH_UOP-1:0] uop0,
    input [`WIDTH_UOP-1:0] uop1,
    input [31:0] ex2_result0, //乘法和要写的分支已经在里面了
    input [31:0] ex2_result1,
    input [5:0] ex_rd0,
    input [5:0] ex_rd1,
    input ex2_result0_valid,
    input ex2_result1_valid,

    output reg [31:0] ex2_wb_data_0,
    output reg [31:0] ex2_wb_data_1,
    output reg ex2_wb_data_0_valid,
    output reg ex2_wb_data_1_valid,
    output reg [5:0] ex2_wb_rd0,
    output reg [5:0] ex2_wb_rd1,
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

    output reg [31:0] debug1_wb_pc,
    output  [ 3:0] debug1_wb_rf_wen,
    output  [ 4:0] debug1_wb_rf_wnum,
    output  [31:0] debug1_wb_rf_wdata,
    output reg [31:0] debug1_wb_inst

);
wire [3:0] cond0;
wire [3:0] cond1;
assign cond0 = uop0[`UOP_COND];
assign cond1 = uop1[`UOP_COND];
    always@(posedge clk)begin
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
                ex2_wb_data_0 <= ex2_result0;
                ex2_wb_data_0_valid <= 1;
                ex2_wb_rd0 <= ex_rd0;
                ex2_wb_we0 <= 1;
            end
            else if(uop0[`INS_CSR]) begin
                ex2_wb_data_0 <= csr_data_in;
                ex2_wb_data_0_valid <= csr_ready;
                ex2_wb_rd0 <= ex_rd0;
                ex2_wb_we0 <= csr_ready;
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
    ex2_ready=0;
    if((ex2_wb_data_0_valid | dcache_ready | div_ready) && ex2_wb_data_1_valid) begin
        ex2_ready=1;
    end
end

always@(posedge clk)begin
    debug0_wb_pc <= pc0;
    debug0_wb_inst <= ex1_ex2_inst0;
    debug1_wb_pc <= pc1;
    debug1_wb_inst <= ex1_ex2_inst1;
end
//下面这些自带一个周期延迟，和上面的同步
assign debug0_wb_rf_wen = ex2_wb_we0;
assign debug0_wb_rf_wnum = ex2_wb_rd0;
assign debug0_wb_rf_wdata = ex2_wb_data_0;
assign debug1_wb_rf_wen = ex2_wb_we1;
assign debug1_wb_rf_wnum = ex2_wb_rd1;
assign debug1_wb_rf_wdata = ex2_wb_data_1;
endmodule