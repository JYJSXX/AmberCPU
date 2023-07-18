module dirty_table(
    input clk,
    input [1:0] we,
    input [1:0] re,
    input [5:0] r_addr,
    input [5:0] w_addr,
    input w_data,
    output reg r_data
);
    reg [1:0] dirty_table [0:63];
    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            dirty_table[i] = 0;
        end
    end
    always @(posedge clk) begin
        if(we[0]) dirty_table[w_addr][0] <= w_data;
        if(we[1]) dirty_table[w_addr][1] <= w_data;
    end

    always @(posedge clk) begin
        if(re[0]) r_data<= dirty_table[r_addr][0];
        if(re[1]) r_data<= dirty_table[r_addr][1];
    end

endmodule