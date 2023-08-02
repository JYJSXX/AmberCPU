`include "define.vh"
module IF0 (
    input clk,
    input rstn,

    //for hand shake with pipeline
    output if0_readygo,
    input if0_allowin,  
    input flush,
    // input [1:0] flush_cause,

    //for pc update
    input set_pc_from_ID,
    input [31:0]pc_from_ID,
    input set_pc_from_EX,
    input [31:0]pc_from_EX,
    input set_pc_from_WB,
    input [31:0]pc_from_WB,
    input set_pc_from_PRIV,//from if1_fifo
    input [31:0]pc_from_PRIV,
    // input [31:0]fact_tpc,

    //for BTB
    input [31:0]pred_pc,
    input [1 :0]pred_taken,
    output [31:0] fetch_pc,

    //for TLB
    // output rvalid,
    output [31:0] raddr,
    // output reg[31:0]cookie_in=114514,

    //other
    output [31:0] pc_next,
    output [1 :0] pc_taken,
    output pc_in_stall
    
);
    localparam PRED_FAIL = 2'b11;

    reg  [31:0] pc=0;//指令集手册P68
    reg         branch_stat=0;//第一次跳转后置1,然后变0
    wire [31:0] PcAdd;
    // wire [31:0] pc_next;
    assign PcAdd        =   pc[2]?pc+4:pc+8;
    assign pc_next      =   (pred_taken!=2'b00)?pred_pc:PcAdd;
    assign pc_taken     =   pred_taken;
    assign fetch_pc     =   pc;
    assign raddr        =   pc;
    assign pc_in_stall  =   !if0_allowin;
    assign if0_readygo  =   if0_allowin;
    wire   [31:0]  npc  =   if0_allowin?fetch_pc:0;     

    always @(posedge clk) begin
        if (!rstn) begin
            pc<=`PC_RESET;
        end
        else if(set_pc_from_WB)begin
            // if(pc_from_WB[2])begin
            //     branch_stat<=1;
            // end
            pc<=pc_from_WB;
        end
        // else if(flush&&flush_cause==PRED_FAIL)begin
        //     if(fact_tpc[2])begin
        //         branch_stat<=1;
        //     end
        //     pc<=fact_tpc;
        // end
        else if(set_pc_from_EX)begin
            // if(pc_from_EX[2])begin
            //     branch_stat<=1;
            // end
            pc<=pc_from_EX;
        end
        else if(set_pc_from_ID)begin
            pc<=pc_from_ID;
        end 
        else if(set_pc_from_PRIV)begin
            pc<=pc_from_PRIV;
        end
        else if (if0_readygo&&if0_allowin) begin
            // if(branch_stat)begin
            //     pc<={pc_next[31:3],3'b000};
            // end else begin
            //     pc<=pc_next;
            // end
            pc<=pc_next;
            // branch_stat<=pc_next[2];
        end 
        else 
        begin
            pc<=pc;
            // branch_stat<=0;
        end
    end
endmodule