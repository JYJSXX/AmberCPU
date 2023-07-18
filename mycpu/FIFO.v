
`include "define.vh"
module FIFO(
    input clk,
    input rstn,

    //hand shake signal,stage DO NOT GEN SIGNAL!!!
    //stage read signal,write info to stage-stage regs
    input fifo_valid,
    input fifo_ready,

    input [31:0] inst0_i,
    input [31:0] inst1_i,
    input [31:0] if1_fifo_pc,
    output reg[31:0] inst0_o,
    output reg[31:0] inst1_o,
    output reg[31:0] fifo_pc,//co pc with inst0_o
    output fetch_buf_empty,
    output fetch_buf_full,
    output ibar_signal,
    output ibar_pos
    `ifdef FIFO_ID_DIFFTEST

    `endif 
);
    wire write_en;
    wire pop_en;
    wire empty,full;
    wire [63:0] inst_din,inst_dout;
    wire [31:0] pc_din,pc_dout;

    assign fetch_buf_empty      =   empty;//compete for w&r fifo at the same time
    assign fetch_buf_full       =   full;
    assign write_en             =   fifo_valid;
    assign pop_en               =   fifo_ready;
    assign inst_din             =   {inst1_i[31:0],inst0_i[31:0]};

    always @(*) begin
        if (empty&&write_en&&pop_en) begin//special case bypass
            inst0_o=inst0_i;
            inst1_o=inst1_i;
            fifo_pc=if1_fifo_pc;
        end else if(!empty)begin
            inst0_o=inst_dout[31:0];
            inst1_o=inst_dout[63:32];
            fifo_pc=pc_dout;
        end else begin
            inst0_o=`INST_NOP;
            inst1_o=`INST_NOP;
            fifo_pc=`PC_RESET;
        end
    end 


    fifo_generator #(
        .DATA_WIDTH (   64 ),
        .DEPTH      (   8  )  
    )fetch_buf(
        .clk                        ( clk      ),
        .rstn                       ( rstn     ),
        .pop_en                     ( pop_en  ),
        .din                        ( inst_din  ),
        .write_en                   ( write_en ),
        .dout                       ( inst_dout ),
        .empty                      ( empty    ),
        .full                       ( full     )
    );

    fifo_generator#(
        .DATA_WIDTH ( 32 ),
        .DEPTH      ( 8 )
    )co_pcbuf(
        .clk        ( clk        ),
        .rstn       ( rstn       ),
        .pop_en     ( pop_en     ),
        .din        ( pc_din        ),
        .write_en   ( write_en   ),
        .dout       ( pc_dout       ),
        .full       ( full       ),
        .empty      ( empty      )
    );


    pre_decoder u_pre_decoder(
        .clk           ( clk           ),
        .rstn          ( rstn          ),
        .fifo_valid    ( fifo_valid    ),
        .fifo_ready    ( fifo_ready    ),
        .fifo_inst0    ( inst0_i       ),
        .fifo_inst1    ( inst1_i       ),
        .if1_fifo_pc   ( if1_fifo_pc   ),
        .ibar_signal   ( ibar_signal   ),
        .pc_from_ibar  ( pc_from_ibar  ),
        .ibar_pos      ( ibar_pos      )
    );


    

endmodule