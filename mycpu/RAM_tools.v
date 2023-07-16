module SinglePortRAM #(
    parameter DATA_WIDTH = 32,
              ADDR_WIDTH = 32,
              INIT_FILE = ""
)(
    input clk,                    // Clock
    input [ADDR_WIDTH-1:0] addr,  // Address
    input [DATA_WIDTH-1:0] din,   // Data Input
    input we,                     // Write Enable
    output [DATA_WIDTH-1:0] dout  // Data Output
); 
    reg [ADDR_WIDTH-1:0] addr_r;  // Address Register
    reg [DATA_WIDTH-1:0] ram [0:(1 << ADDR_WIDTH)-1];

    initial $readmemh(INIT_FILE, ram); // initialize memory

    assign dout = ram[addr_r]; 

    always @(posedge clk) begin
        addr_r <= addr;
        if (we) ram[addr] <= din;
    end

endmodule

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
