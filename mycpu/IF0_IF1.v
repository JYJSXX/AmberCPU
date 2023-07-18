`include "define.vh"
module IF0_IF1 (
    input               clk,
    input               rstn,

    //hand shake
    input               if0_valid,
    output              if0_ready,
    output              if1_valid,
    input               if1_ready,
    input               flush,
    input               flush_cause,
    input               stall,

    input [31:0]        p_addr,
    input [31:0]        raddr,
    input [31:0]        fetch_pc,

    output reg[31:0]    if0_if1_pc 

);
    assign if0_ready= if1_ready;
    assign if1_valid= if0_valid;

    always @(posedge clk or negedge rstn) begin
        if((~rstn)||flush||(!if0_valid&&if1_ready))begin
            //clear stage-stage reg
            if0_if1_pc<=`PC_RESET;
        end else begin
            if (!stall&&(if0_valid&&if1_ready)) begin
                //update stage-stage reg
                if0_if1_pc<=fetch_pc;
            end else if (!if1_ready) begin
                //hold stage-stage reg
            end
        end
    end
endmodule