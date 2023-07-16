`include "define.vh"
module EX2_WB(
    input clk,
    input aresetn,
    input flush_in,
    output flush_out,
    input [31:0] pc0,
    input [31:0] pc1,
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
    input dcache_ready

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
endmodule