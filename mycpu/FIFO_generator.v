`include "define.vh"
module FIFO_generator
  #(parameter DATA_WIDTH = 8,
    parameter DEPTH = 16,
    parameter LOG_DEPTH= 4
  )
  (input wire clk,
   input wire rstn,
   input wire flush,
   input wire pop_en,
   input wire [DATA_WIDTH-1:0] din,
   input wire write_en,
   output wire [DATA_WIDTH-1:0] dout,
   output wire nearly_full,
   output wire full,
   output wire nearly_empty,
   output wire empty);

  reg [DATA_WIDTH-1:0] mem [DEPTH-1:0];
  // reg [DATA_WIDTH-1:0] readDataReg;
  reg [LOG_DEPTH-1:0] readPtr=0;
  reg [LOG_DEPTH-1:0] writePtr=0;
  reg [LOG_DEPTH:0] count=0;
  integer i;

  always @(posedge clk) begin
    if (~rstn) begin
      readPtr <= 0;
      writePtr <= 0;
      // readDataReg <= 0;
    end else if (flush) begin
      readPtr <= 0;
      writePtr <= 0;
    end 
    else begin
      // 读操作
      if (pop_en && !empty) begin
        // readDataReg <= mem[readPtr];
        readPtr <= readPtr + 1;
        // count <= count - 1;
      end
      
      // 写操作
      if (write_en && !full) begin
        mem[writePtr] <= din;
        writePtr<=writePtr+1;
        // count <= count + 1;
      end

    end
  end
  always @(posedge clk) begin
      if(~rstn)begin
        count<=0;
      end else if(flush)begin
        count<=0;
      end else begin
        if(pop_en==write_en)begin
          count<=count;
        end else if(pop_en&&!empty)begin
          count<=count-1;
        end else if(write_en&&!full)begin
          count<=count+1;
        end else begin
          count<=count;
        end
      end
  end


  assign full = (count == DEPTH);
  assign nearly_full=(count==DEPTH-1);
  assign empty = (count == 0);
  assign nearly_empty=(count==1);
  assign dout = empty?0:mem[readPtr];

endmodule
