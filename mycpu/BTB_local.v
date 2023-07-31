`include "define.vh"
module BTB_local (
    input           clk,
    input           rstn,
    input   [31:0]  fetch_pc,
    input   [31:0]  fact_tpc,
    input           fact_taken,
    output          pred_taken
);
    wire [7:0]      FACT_HASH_INDEX;
    wire [7:0]      CHECK_HASH_INDEX;
    reg  [255:0]    TAG_TABLE;

    assign      FACT_HASH_INDEX  =   {fact_tpc[19],fact_tpc[16:12],fact_tpc[5:4]};
    assign      CHECK_HASH_INDEX =   {fetch_pc[19],fetch_pc[16:12],fetch_pc[5:4]};
    assign      pred_taken  =   TAG_TABLE[CHECK_HASH_INDEX];
    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            TAG_TABLE<=0;
        end else begin
            TAG_TABLE[FACT_HASH_INDEX]<=fact_taken;
        end
    end
endmodule