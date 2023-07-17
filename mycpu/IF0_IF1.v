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
    assign if0_ready= 1;
    assign if1_valid= ~stall?0:1;

    always @(posedge clk or negedge rstn) begin
        if((~rstn)||flush)begin
            if0_if1_pc<=`zero;
        end else begin
            if (!stall) begin
                if0_if1_pc<=fetch_pc;
            end
        end
    end
cjb
endmodule