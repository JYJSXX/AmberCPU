`timescale 1ns/1ps

module shift_register#(
    parameter WIDTH = 512
)
(
    input clk,
    input rstn,
    input flush,
    input [31:0] data_in,
    output reg [WIDTH - 1:0] data_out,
    input ready
);

always @ (posedge clk)
begin
    if (~rstn)
        data_out <= 0;
    else if (flush)
        data_out <= 0;
    else if (ready)
        data_out <= {data_in, data_out[WIDTH - 1:32]};
    else
        data_out <= data_out;
end

endmodule

module shift_register_n#(
    parameter WIDTH = 512
)
(
    input clk,
    input rstn,
    input [WIDTH - 1:0] data_in,
    input data_in_valid,
    output [31:0] data_out,
    input ready
);

reg [WIDTH - 1 : 0] data_buffer = 0;

always @ (posedge clk)
begin
    if (~rstn)
        data_buffer <= 0;
    else if (data_in_valid)
        data_buffer <= data_in;
    else if (ready)
        data_buffer <= {32'b0, data_buffer[WIDTH - 1:32]};
end

assign data_out = data_buffer[31:0];

endmodule