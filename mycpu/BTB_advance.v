/*
[2:0] discard
[5:3] index
[31:6] tag
*/
`include "config.vh"
module BTB_advance #(
    parameter   INDEX_WIDTH = 6,
                TAG_WIDTH   = 6
) (
    input               rstn,
    input               clk,
    input   [31:0]      fetch_pc,
    output  [31:0]      pred_pc,
    output  [1 :0]      pred_taken,
    output              hit,

    //below signal from the same stage
    input   [31:0]      fact_pc,
    input   [31:0]      fact_tpc,//target pc from ex0
    input               fact_taken,
    input               predict_dir_fail,
    input               predict_add_fail
);
   
    reg [1:0]   taken_table     [(1<<INDEX_WIDTH)-1:0];
    reg [TAG_WIDTH-1:0]tag_table[(1<<INDEX_WIDTH)-1:0];
    reg [31:0]  guess_table     [(1<<INDEX_WIDTH)-1:0];
    wire[INDEX_WIDTH-1:0]       hash_index;
    wire[INDEX_WIDTH-1:0]       fact_hash_index;
    wire[TAG_WIDTH-1  :0]       tag,fact_tag;
    wire[1:0]                   wtaken;
    wire[1:0]                   taken;
    wire                        we;

    assign hash_index        =   fetch_pc[INDEX_WIDTH+2:3];
    assign fact_hash_index   =   fact_pc[INDEX_WIDTH+2:3];
    assign tag               =   fetch_pc[TAG_WIDTH+INDEX_WIDTH+2:INDEX_WIDTH+3];
    assign fact_tag          =   fact_pc [TAG_WIDTH+INDEX_WIDTH+2:INDEX_WIDTH+3];
    assign wtaken            =   fact_taken?(fact_pc[2]?2'b10:2'b01):2'b00;
    assign we                =   (predict_dir_fail|predict_add_fail);
    assign pred_pc           =   guess_table[hash_index];
    assign taken             =   taken_table[hash_index];
    assign pred_taken        =   (!fetch_pc[2])?taken:{taken[1],1'b0};
    assign hit               =   tag_table[hash_index]==tag;

    integer i;
    initial begin
        for(i=0; i<(1<<INDEX_WIDTH); i=i+1) begin
            taken_table[i] = 0;
            guess_table[i] = 0;
            tag_table  [i] = 0;
        end
    end
    always @(posedge clk) begin 
        if(we)begin
            taken_table[fact_hash_index]<=wtaken;
            guess_table[fact_hash_index]<=fact_tpc;
            tag_table  [fact_hash_index]<=fact_tag;
        end
    end
endmodule
