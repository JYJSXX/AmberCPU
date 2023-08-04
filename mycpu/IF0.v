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

    //for BTB
    input [31:0]pred_pc,
    input [1 :0]pred_taken,
    output [31:0] fetch_pc,
    output reg [31:0] nex_pc,

    //for TLB
    // output rvalid,
    output [31:0] raddr,

    //other
    output [31:0] pc_next,
    output [1 :0] pc_taken,
    output pc_in_stall
    
);
    localparam PRED_FAIL = 2'b11;

    reg  [31:0] pc=0;//指令集手册P68
    reg         branch_stat=0;//第一次跳转后置1,然后变0
    wire [31:0] PcAdd;
    // reg  [31:0] nex_pc;     
    // wire [31:0] pc_next;
    assign PcAdd        =   pc[2]?pc+4:pc+8;
    assign pc_next      =   (pred_taken!=2'b00)?pred_pc:PcAdd;
    assign pc_taken     =   pred_taken;
    assign fetch_pc     =   pc;
    assign raddr        =   pc;
    assign pc_in_stall  =   !if0_allowin;
    assign if0_readygo  =   if0_allowin;

    always @(posedge clk) begin
        if (!rstn) begin
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
        else if (if0_readygo&&if0_allowin) begin
            pc<=pc_next;
        end 
        else begin
            pc<=pc;
        end
    end
    always @(*) begin
        if(set_pc_from_WB)begin
            nex_pc=pc_from_WB;
        end
        else if(set_pc_from_EX)begin
            nex_pc=pc_from_EX;
        end
        else if(set_pc_from_ID)begin
            nex_pc=pc_from_ID;
        end 
        else if (if0_readygo&&if0_allowin) begin
            nex_pc=pc_next;
        end 
        else begin
            nex_pc=pc;
        end
    end
endmodule