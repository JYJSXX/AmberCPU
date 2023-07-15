
#`include "define.vh"
module FIFO(
    input clk,
    input rstn,
    input [31:0] inst0_i,
    input [31:0] inst1_i,

    //hand shake signal,stage DO NOT GEN SIGNAL!!!
    //stage read signal,write info to stage-stage regs
    input fifo_valid,
    input fifo_ready,

    output reg[31:0] inst0_o,
    output reg[31:0] inst1_o,
    output fetch_buf_empty,
    output fetch_buf_full,
    #`ifdef FIFO_ID_DIFFTEST

    `endif 
);
    wire write_en;
    wire read_en;
    wire empty,full;
    assign fetch_buf_empty      =   empty;//compete for w&r fifo at the same time
    assign fetch_buf_full       =   full;
    assign write_en             =   fifo_valid&&fifo_ready;
    assign read_en              =   fifo_valid&&fifo_ready;
    fifo_generator fetch_buf(
        .clk                        ( clk      ),
        .rstn                       ( rstn     ),
        .write_en                   ( write_en ),
        .read_en                    ( read_en  ),
        .data_in                    ( data_in  ),
        .data_out                   ( data_out ),
        .empty                      ( empty    ),
        .full                       ( full     ),
        .fifo_exception             (fifo_exception)
    );
    pre_decoder pre_decoder(
        .inst0_i    ( inst0_i ),
        .inst1_i    ( inst1_i ),
        .type       ( type   )
    );

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin

        end else begin
            
        end
    end
    always @(*) begin
        if (empty&&write_en&&read_en) begin//special case bypass
            inst0_o=inst0_i;
            inst1_o=inst1_i;
        end else if(!empty)begin
            inst0_o=data_out[31:0];
            inst1_o=data_out[63:32];
        end else begin
            inst0_o=`INST_NOP;
            inst1_o=`INST_NOP;
        end
    end 

endmodule