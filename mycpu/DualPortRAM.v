module DualPortRAM
  #(parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 10)
  (input wire clk,
   input wire [ADDR_WIDTH-1:0] readAddrA,
   input wire [ADDR_WIDTH-1:0] readAddrB,
   input wire [ADDR_WIDTH-1:0] writeAddr,
   input wire [DATA_WIDTH-1:0] writeData,
   input wire writeEnable,
   output reg [DATA_WIDTH-1:0] readDataA,
   output reg [DATA_WIDTH-1:0] readDataB);

  reg [DATA_WIDTH-1:0] memory [0:(2**ADDR_WIDTH)-1];

  always @(posedge clk) begin
    if (writeEnable) begin
      memory[writeAddr] <= writeData;
    end
    readDataA <= memory[readAddrA];
    readDataB <= memory[readAddrB];
  end

endmodule