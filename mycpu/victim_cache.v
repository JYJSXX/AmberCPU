/*
设计思路：
大小可调（在不影响总时序的情况下，尽可能大）
采用全相连的方式
采用计数器替换策略
*/
module victim_cache#(
    CAPACITY = 8 // 容量
)
(
    input clk,
    input rstn,
    // 20位tag+6位index
    //读
    input [25:0] r_tag,
    output victim_hit,
    output [511:0] data_out,
    //写
    input [25:0] w_tag,
    input we,
    input [511:0] data_in
);
    //tag寄存器，最高位为有效位
    reg [26:0] tag [0:CAPACITY-1];
    //数据寄存器
    reg [511:0] data [0:CAPACITY-1];
    //有效位
    wire [CAPACITY-1:0] valid;
    genvar i;
    generate
        for (i = 0; i < CAPACITY; i = i + 1) begin: tag_reg
            assign valid[i] = tag[i][26];
        end
    endgenerate
    //计数器，每次有写入时加1，不断循环
    localparam COUNTER_WIDTH = funclog2(CAPACITY);
    reg [COUNTER_WIDTH-1:0] counter;

    //读，类似于Dram，组合逻辑
    wire [CAPACITY-1:0] hit;
    generate
        for(i = 0; i < CAPACITY; i = i + 1) begin: hit_gen
            assign hit[i] = valid[i] && (tag[i][25:0] == r_tag[25:0]);
        end
    endgenerate
    assign victim_hit = |hit;
    assign data_out = data[hit];

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
        else if(we) begin
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
