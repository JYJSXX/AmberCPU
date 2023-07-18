`include "define.vh"
module fifo_generator
  #(parameter DATA_WIDTH = 8,
    parameter DEPTH = 16)
  (input wire clk,
   input wire rstn,
   input wire pop_en,
   input wire [DATA_WIDTH-1:0] din,
   input wire write_en,
   output wire [DATA_WIDTH-1:0] dout,
   output wire full,
   output wire empty);

  reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
  // reg [DATA_WIDTH-1:0] readDataReg;
  reg [DEPTH-1:0] readPtr;
  reg [DEPTH-1:0] writePtr;
  reg [DEPTH-1:0] count;

  always @(posedge clk or negedge rstn) begin
    if (~rstn) begin
      readPtr <= 0;
      writePtr <= 0;
      count <= 0;
      // readDataReg <= 0;
    end else begin
      // 读操作
      if (pop_en && !empty) begin
        // readDataReg <= mem[readPtr];
        readPtr <= readPtr + 1;
        count <= count - 1;
      end
      
      // 写操作
      if (write_en && !full) begin
        mem[writePtr] <= din;
        writePtr<=writePtr+1;
        count <= count + 1;
      end
    end
  end


  assign full = (count == DEPTH);
  assign empty = (count == 0);
  assign dout = empty?`INST_NOP:mem[readPtr];

endmodule
