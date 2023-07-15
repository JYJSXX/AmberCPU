module fifo_generator#(
    parameter   DEPTH = 16,
                WIDTH = 64
)(
  input wire clk,
  input wire rstn,
  input wire write_en,
  input wire read_en,
  input wire [WIDTH:0] data_in,
  output wire [WIDTH:0] data_out,
  output wire empty,
  output wire full,
  output wire fifo_exception
);

  

  reg [WIDTH-1:0] memory [0:DEPTH-1];
  reg [WIDTH-1:0] read_ptr;
  reg [WIDTH-1:0] write_ptr;
  reg empty;
  reg full;

  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      read_ptr <= 0;
      write_ptr <= 0;
      empty <= 1;
      full <= 0;
    end else begin
      if (write_en && !full) begin
        memory[write_ptr] <= data_in;
        write_ptr <= write_ptr + 1;
        if (write_ptr == DEPTH-1)
          full <= 1;
        if (empty)
          empty <= 0;
      end
      if (read_en && !empty) begin
        data_out <= memory[read_ptr];
        read_ptr <= read_ptr + 1;
        if (read_ptr == DEPTH-1)
          empty <= 1;
        if (full)
          full <= 0;
      end
    end
  end
  assign fifo_exception=(write_en&&full)||(read_en&&empty);

endmodule
