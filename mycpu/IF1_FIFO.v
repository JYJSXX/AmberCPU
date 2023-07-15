`include "define.vh"
module IF1_FIFO(

    input aclk,
    input aresetn,
    input flush,
    input flush_cause,
    input[1:0] stall,
    
    input[31:0] pc_i,
    input[31:0] npc_i,
    input               branch_flag_i,
    input[31:0] inst0_i,
    input[31:0] inst1_i,
    input [1:0] issue_i, //issue_i[0] is for inst0, issue_i[1] is for inst1

    //hand shake signal
    input           fetch_buf_full,
    input           if1_valid,
    output  reg     if1_ready,
    input           fifo_ready,
    output  reg     fifo_valid,


    
    output reg[31:0]    pc_o,
    output reg[31:0]    npc_o,
    output reg          branch_flag_o,
    output reg[31:0]    inst0_o,
    output reg[31:0]    inst1_o,
    output reg  [1:0]   issue_o
    
    );
    always @(*) begin//combinational logic for hand shake
        if(fetch_buf_full)begin
            if1_ready=0;
        end
    end
    always @ (posedge aclk) begin
        if (~aresetn) begin
            pc_o <= `INIT_ADDR;
            npc_o <= `INIT_ADDR;
            branch_flag_o <= 0;
            inst0_o <= `INST_NOP;
            inst1_o <= `INST_NOP;
            issue_o <= 'b11;
        end else if (flush == 1) begin
            pc_o <= `INIT_ADDR;
            npc_o <= `INIT_ADDR;
            branch_flag_o <= 0;
            inst0_o <= `INST_NOP;
            inst1_o <= `INST_NOP;
            issue_o <= 'b11;
        end else if (stall[1] == 1 && stall[0] == 1) begin
            pc_o <= `INIT_ADDR;
            npc_o <= `INIT_ADDR;
            branch_flag_o <= 0;
            inst0_o <= `INST_NOP;
            inst1_o <= `INST_NOP;
            issue_o <= 'b11;
        end else if (stall[1] == 1) begin
            pc_o <= pc_i;
            npc_o <= npc_i;
            branch_flag_o <= branch_flag_i;
            inst0_o <= inst0_i;
            inst1_o <= inst1_i;
            issue_o <= issue_i;
        end
    end

    

    
endmodule
