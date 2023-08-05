/*
设计思路：
大小可调（在不影响总时序的情况下，尽可能大）
采用全相连的方式
采用计数器替换策略
*/
module victim_icache#(
    parameter TAG_WIDTH = 20,
    parameter INDEX_WIDTH = 6
)
(
    input clk,
    input rstn,
    // 20位tag+6位index
    //读
    input [TAG_WIDTH+INDEX_WIDTH-1:0] r_tag,
    output victim_hit,
    output [511:0] data_out,
    //写
    input [TAG_WIDTH+INDEX_WIDTH-1:0] w_tag,
    input we,
    input [511:0] data_in
);
    localparam COUNTER_WIDTH = 4;
    localparam CAPACITY = 16; // 容量
    //读，类似于Dram，组合逻辑
    wire [CAPACITY-1:0] hit;
    wire [COUNTER_WIDTH-1:0] hit_index;
    // assign hit_index = hit[0] ? 0 : (hit[1] ? 1 : (hit[2] ? 2 : (hit[3] ? 3 : 0)));
    assign hit_index = hit[0] ? 0 : (hit[1] ? 1 : (hit[2] ? 2 : (hit[3] ? 3 : (hit[4] ? 4 : (hit[5] ? 5 : (hit[6] ? 6 : (hit[7] ? 7 : (hit[8] ? 8 : (hit[9] ? 9 : (hit[10] ? 10 : (hit[11] ? 11 : (hit[12] ? 12 : (hit[13] ? 13 : (hit[14] ? 14 : (hit[15] ? 15 : 0)))))))))))))));
    wire [INDEX_WIDTH-1:0] windex;
    wire [TAG_WIDTH-1:0] wtag;
    wire victim_valid;
    // assign victim_valid = w_tag[25];
    assign wtag = w_tag[TAG_WIDTH+INDEX_WIDTH-1:INDEX_WIDTH];
    assign windex = w_tag[INDEX_WIDTH-1:0];

    wire [INDEX_WIDTH-1:0] rindex;
    wire [TAG_WIDTH-1:0] rtag;
    assign rtag = r_tag[TAG_WIDTH+INDEX_WIDTH-1:INDEX_WIDTH];
    assign rindex = r_tag[INDEX_WIDTH-1:0];


    //tag寄存器，最高位为有效位
    reg [26:0] tag [0:CAPACITY-1];
    
    //数据寄存器
    reg [511:0] data [0:CAPACITY-1];
    integer k;
    initial begin
        for(k = 0; k < CAPACITY; k = k + 1) begin
            tag[k] = 0;
            data[k] = 0;
        end
    end
    //有效位
    wire [CAPACITY-1:0] valid;
    genvar i;
    generate
        for (i = 0; i < CAPACITY; i = i + 1) begin: tag_reg
            assign valid[i] = tag[i][26];
        end
    endgenerate
    //计数器，每次有写入时加1，不断循环
    reg [COUNTER_WIDTH-1:0] counter=0;

    generate
        for(i = 0; i < CAPACITY; i = i + 1) begin: hit_gen
            assign hit[i] = valid[i] && (tag[i][25:0] == r_tag[25:0]);
        end
    endgenerate
    assign victim_hit = |hit;
    //找到最早的hit
    // assign hit_index = hit[0] ? 0 : (hit[1] ? 1 : (hit[2] ? 2 : (hit[3] ? 3 : (hit[4] ? 4 : (hit[5] ? 5 : (hit[6] ? 6 : (hit[7] ? 7 : 0)))))));
    assign data_out = |hit ? data[hit_index] : 0;

    //对we信号取边沿
    reg we_pre=0;
    reg we_now=0;
    wire counter_we;
    always @(posedge clk) begin
        if(!rstn) begin
            we_pre <= 0;
            we_now <= 0;
        end
        else begin
            we_pre <= we_now;
            we_now <= we;
        end
    end

    assign counter_we = we_now && !we_pre;

    //写，时序逻辑
    integer j;
    always @(posedge clk) begin
        if(!rstn) begin
            counter <= 0;
            for(j = 0; j < CAPACITY; j = j + 1) begin
                tag[j] <= 0;
                data[j] <= 0;
            end
        end
        else if(counter_we) begin
            counter <= counter + 1;
            tag[counter] <= {1'b1, w_tag};
            data[counter] <= data_in;
        end
    end

    function integer funclog2;
        input integer value;
        begin
            value = value-1;
            for (funclog2=0; value>0; funclog2=funclog2+1)
                value = value>>1;
        end
    endfunction

endmodule
