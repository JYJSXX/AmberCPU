`include "define.vh"
module BTB_global #(
    parameter MASS  = 2   
) (
    input   clk,
    input   rstn,
    input   [31:0] fetch_pc,
    input   predict_add_fail,
    input   predict_dir_fail,
    input   fact_taken,
    output  glob_taken
);
    assign glob_taken=0;
endmodule