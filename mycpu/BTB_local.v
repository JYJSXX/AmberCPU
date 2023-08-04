`include "define.vh"
module BTB_local (
    input           clk,
    input           rstn,
    input   [31:0]  fetch_pc,
    input   [31:0]  fact_pc,
    input           fact_taken,
    input           we,
    output  [1 :0]  pred_taken
);

    localparam  TAG_WIDTH  = 7,
                INDEX_WIDTH= 7;
    wire [INDEX_WIDTH-1:0]      FACT_HASH_INDEX;
    wire [INDEX_WIDTH-1:0]      HASH_INDEX;
    wire [INDEX_WIDTH-1:0]      INDEX;
    wire [INDEX_WIDTH-1:0]      FACT_INDEX;
    wire [TAG_WIDTH-1:0]     TAG;
    wire [TAG_WIDTH-1:0]     FACT_TAG;
    wire                     hit;
    wire [1:0]  wtaken;
    reg  [1:0]              TAKEN_TABLE[(1<<INDEX_WIDTH)-1:0];
    reg  [TAG_WIDTH-1:0]    TAG_TABLE  [(1<<INDEX_WIDTH)-1:0];

    assign      wtaken=fact_pc[2]?2'b10:2'b01;
    // assign      FACT_HASH_INDEX  =   {fact_pc[12],fact_pc[10],fact_pc[8:3]};
    assign      FACT_INDEX       =   fact_pc[INDEX_WIDTH+2:3];
    // assign      HASH_INDEX       =   {fetch_pc[12],fetch_pc[10],fetch_pc[8:3]};
    assign      INDEX            =   fetch_pc[INDEX_WIDTH+2:3];//[8:3]
    assign      TAG              =   TAG_TABLE[INDEX];
    assign      FACT_TAG         =   fact_pc[TAG_WIDTH+INDEX_WIDTH+2:INDEX_WIDTH+3];//[12:9]
    assign      hit              =   TAG==fetch_pc[TAG_WIDTH+INDEX_WIDTH+2:INDEX_WIDTH+3];
    assign      pred_taken       =   hit?TAKEN_TABLE[INDEX]:2'b00;

    integer i;
    initial begin
        for(i=0; i<(1<<INDEX_WIDTH); i=i+1) begin
        TAKEN_TABLE[i] = 0;
        TAG_TABLE[i]   = 0;
        end
    end
    
    always @(posedge clk) begin
        if(we)begin
            TAKEN_TABLE[FACT_INDEX]<=wtaken;
            TAG_TABLE  [FACT_INDEX]<=FACT_TAG;
        end
    end

endmodule