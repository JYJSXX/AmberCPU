`include "define.vh"
module IF0 (
    input clk,
    input rstn,

    //for hand shake with pipeline
    input if0_readygo,
    input if0_allowin,  
    input flush,

    //for pc update
    input set_pc_from_ID,
    input [31:0]pc_from_ID,
    input set_pc_from_EX,
    input [31:0]pc_from_EX,
    input set_pc_from_WB,
    input [31:0]pc_from_WB,
    input set_pc_from_PRIV,//from if1_fifo
    input [31:0]pc_from_PRIV,

    //for BTB
    input [31:0]pred_pc,
    input pred_taken,
    output [31:0] fetch_pc,

    //for ICache
    output rvalid,
    output [31:0] raddr,
    output reg[31:0]cookie_in=114514,

    //other
    output [31:0] pc_next//rready control logic TODO

    
);
    reg  [31:0] pc=`PC_RESET;//指令集手册P68
    // wire [31:0] pc_next;
    
    assign pc_next      =   pred_taken?pred_pc:fetch_pc+8;
    assign fetch_pc     =   pc;
    assign rvalid       =   if0_allowin;
    assign raddr        =   pc;

    always @(posedge clk or negedge rstn) begin
        if (~rstn) begin
            pc<=`PC_RESET;
        end
        else if(set_pc_from_WB)begin
            pc<=pc_from_WB;
        end
        else if(set_pc_from_EX)begin
            pc<=pc_from_EX;
        end
        else if(set_pc_from_ID)begin
            pc<=pc_from_ID;
        end 
        else if(set_pc_from_PRIV)begin
            pc<=pc_from_PRIV;
        end
        else if (if0_readygo&&if0_allowin) begin
            pc<=pc_next;
        end
    end
endmodule