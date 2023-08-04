`include "define.vh"
module BTB_local (
    input           clk,
    input           rstn,
    input   [31:0]  fetch_pc,
    input   [31:0]  fact_pc,
    input           fact_taken,
    input           we,
    output          pred_taken
);
    wire [7:0]      FACT_HASH_INDEX;
    wire [7:0]      HASH_INDEX;
    reg  [255:0]    TAG_TABLE;

    assign      FACT_HASH_INDEX  =   {fact_pc[12],fact_pc[10],fact_pc[8:3]};
    assign      HASH_INDEX       =   {fetch_pc[12],fetch_pc[10],fetch_pc[8:3]};
    assign      pred_taken       =   TAG_TABLE[HASH_INDEX];
    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            TAG_TABLE<=0;
        end else if(we)begin
            TAG_TABLE[FACT_HASH_INDEX]<=fact_taken;
        end
    end
endmodule