`include "../config.vh"

module cache_reg#(
    parameter DATA_WIDTH = 32,
    )(
    input clk,
    input rstn,
    input we,
    input [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout);

    always @(posedge clk) begin
        if(!rstn) begin
            dout <= 0;
        end
        else if(we) begin
            dout <= din;
        end
    end
    
endmodule