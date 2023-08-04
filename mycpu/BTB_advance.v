/*
[2:0] discard
[5:3] index
[31:6] tag
*/
`include "config.vh"
module BTB_advance #(
    parameter   INDEX_WIDTH = 7,
                TAG_WIDTH   = 7
) (
    input               rstn,
    input               clk,
    input   [31:0]      nex_pc,
    output  [31:0]      pred_pc,
    output  [1 :0]      pred_taken,

    //below signal from the same stage
    input   [31:0]      fact_pc,
    input   [31:0]      fact_tpc,//target pc from ex0
    input               fact_taken,
    input               predict_dir_fail,
    input               predict_add_fail,
    input               update_en,
    output              btb_cache_hit
);
    wire we1,we2;
    reg  [(1<<INDEX_WIDTH)-1:0]   sel; 
    reg  [(1<<INDEX_WIDTH)-1:0]      valid_mask1;
    reg  [(1<<INDEX_WIDTH)-1:0]      valid_mask2;

    wire [INDEX_WIDTH-1:0]      index;
    wire [INDEX_WIDTH-1:0]      windex;
    wire [31:0]                 wdata=fact_tpc;
    reg  [31:0]                 rdata1;
    reg  [31:0]                 rdata2;
    reg  [TAG_WIDTH-1:0]        rdata3,rdata4;
    reg  [1:0]                  rdata5,rdata6;
    wire [1:0]                  wtaken;
    wire [TAG_WIDTH-1:0]        wtag;
    wire [31:0]                 read_pc1,read_pc2;
    wire [1:0]                  rtaken1,rtaken2;
    wire [TAG_WIDTH-1:0]        rtag1,rtag2;
    wire [TAG_WIDTH-1:0]        cmp_tag;


    (*ram_style="block"*)reg [31:0] pc_mem_1 [(1<<INDEX_WIDTH)-1:0];
    (*ram_style="block"*)reg [31:0] pc_mem_2 [(1<<INDEX_WIDTH)-1:0];
    (*ram_style="block"*)reg [1:0] taken_table_1 [(1<<INDEX_WIDTH)-1:0];
    (*ram_style="block"*)reg [1:0] taken_table_2 [(1<<INDEX_WIDTH)-1:0];
    (*ram_style="block"*)reg [TAG_WIDTH-1:0] tag_table_1 [(1<<INDEX_WIDTH)-1:0];
    (*ram_style="block"*)reg [TAG_WIDTH-1:0] tag_table_2 [(1<<INDEX_WIDTH)-1:0];

    wire   sel_way          =   sel[windex];
    wire   hit1             =   !valid_mask1[index]?1'b0:(rtag1==cmp_tag);
    wire   hit2             =   !valid_mask2[index]?1'b0:(rtag2==cmp_tag);
    assign index            =   nex_pc[INDEX_WIDTH+2:3];//[6:3]
    assign cmp_tag          =   nex_pc[INDEX_WIDTH+TAG_WIDTH+2:INDEX_WIDTH+3];//[22:7]
    assign wtag             =   fact_tpc[INDEX_WIDTH+TAG_WIDTH+2:INDEX_WIDTH+3];
    assign read_pc1         =   valid_mask1[index]?rdata1:0;
    assign read_pc2         =   valid_mask2[index]?rdata2:0;
    assign rtag1            =   valid_mask1[index]?rdata3:0;
    assign rtag2            =   valid_mask2[index]?rdata4:0;
    assign rtaken1          =   valid_mask1[index]?rdata5:0;
    assign rtaken2          =   valid_mask2[index]?rdata6:0;
    assign we1              =   update_en&&!sel_way;
    assign we2              =   update_en&& sel_way;
    assign wtaken           =   fact_pc[2]?2'b10:2'b01;
    assign btb_cache_hit    =   hit1||hit2;
    assign pred_pc          =   hit1?read_pc1:hit2?read_pc2:nex_pc+8;
    assign pred_taken       =   hit1?rtaken1:hit2?rtaken2:2'b00;

    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            valid_mask1<=0;
            valid_mask2<=0;
        end else begin
            if(we1)begin
                if(fact_taken)begin
                    valid_mask1[windex]<=1; 
                end else begin
                    valid_mask1[windex]<=0;
                end
            end
            
            if(we2)begin
                if(fact_taken)begin
                    valid_mask2[windex]<=1; 
                end else begin
                    valid_mask2[windex]<=0;
                end
            end
        end
    end

    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            sel<=0;
        end else begin
            if(hit1||!valid_mask2[index])begin
                sel[index]<=1;
            end else if(hit2||!valid_mask1[index])begin
                sel[index]<=0;
            end
        end
    end
    
    always @(posedge clk ) begin
        if(we1)begin
            pc_mem_1[windex]<=wdata;
        end
        rdata1<=pc_mem_1[index];
    end
    always @(posedge clk ) begin
        if(we2)begin
            pc_mem_2[windex]<=wdata;
        end
        rdata2<=pc_mem_2[index];
    end
    always @(posedge clk ) begin
        if(we1)begin
            tag_table_1[windex]<=wtag;
        end
        rdata3<=tag_table_1[index];
    end
    always @(posedge clk ) begin
        if(we2)begin
            tag_table_2[windex]<=wtag;
        end
        rdata4<=tag_table_2[index];
    end
    always @(posedge clk ) begin
        if(we1)begin
            taken_table_1[windex]<=wtaken;
        end
        rdata5<=taken_table_1[index];
    end
    always @(posedge clk ) begin
        if(we2)begin
            taken_table_2[windex]<=wtaken;
        end
        rdata6<=taken_table_2[index];
    end

    

endmodule