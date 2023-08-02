module DualPortRAM
  #(parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 8)
  (input wire clk,
   input wire [ADDR_WIDTH-1:0] readAddrA,
   input wire [ADDR_WIDTH-1:0] readAddrB,
   input wire [ADDR_WIDTH-1:0] writeAddr,
   input wire [DATA_WIDTH-1:0] writeData,
   input wire writeEnable,
   output  [DATA_WIDTH-1:0] readDataA,
   output  [DATA_WIDTH-1:0] readDataB);

  reg [DATA_WIDTH-1:0] memory [(1<<ADDR_WIDTH)-1:0];

  integer i;
  initial begin
    for(i=0; i<(1<<ADDR_WIDTH); i=i+1) begin
      memory[i] = 0;
    end
  end

  always @(posedge clk) begin
    if (writeEnable) begin
      memory[writeAddr] <= writeData;
    end
  end
  assign readDataA = memory[readAddrA];
  assign readDataB = memory[readAddrB];

endmodule
