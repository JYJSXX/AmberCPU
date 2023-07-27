/*
This module is inside the ID_REG ,which is implemented by FSM
we can issue 2 irrelative inst
but any valid priv_flag makes iq only issues one inst for 2 cycles
*/
`include "define.vh"
`timescale 1ns/1ps
module IQ (
    input clk,
    input rstn,
    input flush,

    output id_allowin,
    output reg_readygo,
    input  id_readygo,
    input  reg_allowin,


    input  [31:0] id_reg_pc0,
    input  [31:0] id_reg_pc1,
    input  [31:0] id_reg_pc_next,
    input  [31:0] id_reg_inst0,
    input  [31:0] id_reg_inst1,
    input  [31:0] id_reg_badv,
    input  [1 :0] id_reg_priv_flag,
    input  [1 :0] id_reg_excp_flag,
    input  [1 :0] id_reg_branch_flag,
    input  [6:0] id_reg_exception,
    input  id_reg_is_ALU_0 ,
    input  id_reg_is_ALU_1 ,
    input  id_reg_is_syscall_0 ,
    input  id_reg_is_syscall_1 ,
    input  id_reg_is_break_0 ,
    input  id_reg_is_break_1 ,
    input  id_reg_is_priviledged_0 ,
    input  id_reg_is_priviledged_1 ,
    input  [`WIDTH_UOP-1:0] id_reg_uop0 ,
    input  [`WIDTH_UOP-1:0] id_reg_uop1 ,
    input  [31:0] id_reg_imm0 ,
    input  [31:0] id_reg_imm1 ,
    input  [4:0] id_reg_rd0 ,
    input  [4:0] id_reg_rd1 ,
    input  [4:0] id_reg_rj0 ,
    input  [4:0] id_reg_rj1 ,
    input  [4:0] id_reg_rk0 ,
    input  [4:0] id_reg_rk1 ,

    output  reg [31:0] iq_pc0,
    output  reg [31:0] iq_pc1,
    output  reg [31:0] iq_pc_next,
    output  reg [31:0] iq_inst0,
    output  reg [31:0] iq_inst1,
    output  reg [31:0] iq_badv,
    output  reg        iq_excp_flag,
    output  reg        iq_branch_flag,
    output  reg [6:0]  iq_exception,
    output  reg iq_is_ALU_0 ,
    output  reg iq_is_ALU_1 ,
    output  reg iq_is_syscall_0 ,
    output  reg iq_is_syscall_1 ,
    output  reg iq_is_break_0 ,
    output  reg iq_is_break_1 ,
    output  reg iq_is_priviledged_0 ,
    output  reg iq_is_priviledged_1 ,
    output  reg [`WIDTH_UOP-1:0] iq_uop0 ,
    output  reg [`WIDTH_UOP-1:0] iq_uop1 ,
    output  reg [31:0] iq_imm0 ,
    output  reg [31:0] iq_imm1 ,
    output  reg [4:0]  iq_rd0 ,
    output  reg [4:0]  iq_rd1 ,
    output  reg [4:0]  iq_rj0 ,
    output  reg [4:0]  iq_rj1 ,
    output  reg [4:0]  iq_rk0 ,
    output  reg [4:0]  iq_rk1 

    
);

    reg         mod       = 0;//mod=0 initial mod=1 single-issue
    reg      single_en    = 0;
    reg      id_reg_valid = 0;

    assign reg_readygo    = id_reg_valid;//!!!!
    assign id_allowin   =(!single_en||(mod&&single_en))&reg_allowin;

    always @(*) begin//logic for single_en
        if (id_reg_is_ALU_0&&id_reg_is_ALU_1&&(
            (id_reg_rd0!=id_reg_rj1)&&(id_reg_rd0!=id_reg_rk1)&&
            (id_reg_rd1!=id_reg_rj0)&&(id_reg_rd1!=id_reg_rk0)||
            (id_reg_rd0==0)         ||(id_reg_rd1==0)
        )) begin
            single_en=0;
        end else begin
            single_en=1;
        end
    end
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            id_reg_valid<=0;
        end else if(id_allowin&&!mod)begin
            id_reg_valid<=id_readygo;
        end
    end
    always @(posedge clk) begin
        if((mod&&reg_allowin)||!rstn||flush)begin
            mod<=0;
        end else if(reg_allowin)begin
            mod<=single_en?1:0;            
        end
    
    end

    always @(*) begin
        if(mod)begin
            iq_pc0=id_reg_pc1;
            iq_pc1=`PC_RESET;
            iq_pc_next=id_reg_pc_next;
            iq_inst0=id_reg_inst1;
            iq_inst1=`INST_NOP;
            iq_badv=id_reg_badv;
            iq_excp_flag=id_reg_excp_flag[1];
            iq_branch_flag=id_reg_branch_flag[1];
            iq_exception=id_reg_exception;
            iq_is_ALU_0 =id_reg_is_ALU_1;
            iq_is_ALU_1 =1'b1;//TODO NOTICE HERE IS REPLACED BY NOP
            iq_is_syscall_0=id_reg_is_syscall_1;
            iq_is_syscall_1=1'b0;
            iq_is_break_0=id_reg_is_break_1;
            iq_is_break_1=1'b0;
            iq_is_priviledged_0=id_reg_is_priviledged_1;
            iq_is_priviledged_1=0;
            iq_uop0=id_reg_uop1;
            iq_uop1='h0000_0000_0000_0000_0000;
            iq_imm0=id_reg_imm1;
            iq_imm1=0;
            iq_rd0 = id_reg_rd1;
            iq_rd1 = 0;
            iq_rj0 = id_reg_rj1;
            iq_rj1 = 0;
            iq_rk0 = id_reg_rk1;
            iq_rk1 = 0;
        end else begin
            iq_pc0  = id_reg_pc0;
            iq_pc_next=id_reg_pc_next;
            // iq_reg_pc1  = id_reg_pc1;
            iq_inst0  = id_reg_inst0;
            // iq_reg_inst1  = id_reg_inst1;
            iq_badv  = id_reg_badv;
            // iq_excp_flag  = id_reg_excp_flag;
            iq_exception  = id_reg_exception;
            iq_is_ALU_0  = id_reg_is_ALU_0;
            // iq_is_ALU_1  = id_reg_is_ALU_1;
            iq_is_syscall_0  = id_reg_is_syscall_0;
            // iq_is_syscall_1  = id_reg_is_syscall_1;
            iq_is_break_0  = id_reg_is_break_0;
            // iq_is_break_1  = id_reg_is_break_1;
            iq_is_priviledged_0  = id_reg_is_priviledged_0;
            // iq_is_priviledged_1  = id_reg_is_priviledged_1;
            iq_uop0  = id_reg_uop0;
            // iq_uop1  = id_reg_uop1;
            iq_imm0  = id_reg_imm0;
            // iq_imm1  = id_reg_imm1;
            iq_rd0  = id_reg_rd0;
            // iq_rd1  = id_reg_rd1;
            iq_rj0  = id_reg_rj0;
            // iq_rj1  = id_reg_rj1;
            iq_rk0  = id_reg_rk0;
            // iq_rk1  = id_reg_rk1;
            if(single_en)begin
                iq_pc1=`PC_RESET;
                iq_inst1=`INST_NOP;

                iq_excp_flag=id_reg_excp_flag[0];
                iq_branch_flag=id_reg_branch_flag[0];
                iq_is_ALU_1 =1'b1;
                iq_is_syscall_1=1'b0;
                iq_is_break_1=1'b0;
                iq_is_priviledged_1=0;
                iq_uop1='h0000_0000_0000_0000_0000;
                iq_imm1=0;
                iq_rd1 = 0;
                iq_rj1 = 0;
                iq_rk1 = 0;
            end else begin
                iq_pc1    = id_reg_pc1;
                iq_inst1  = id_reg_inst1;
                iq_excp_flag  = |id_reg_excp_flag[1:0];
                iq_branch_flag=|id_reg_branch_flag[1:0];
                iq_is_ALU_1  = id_reg_is_ALU_1;
                iq_is_syscall_1  = id_reg_is_syscall_1;
                iq_is_break_1  = id_reg_is_break_1;
                iq_is_priviledged_1  = id_reg_is_priviledged_1;
                iq_uop1  = id_reg_uop1;
                iq_imm1  = id_reg_imm1;
                iq_rd1  = id_reg_rd1;
                iq_rj1  = id_reg_rj1;
                iq_rk1  = id_reg_rk1;
            end
        end
    end

    
endmodule