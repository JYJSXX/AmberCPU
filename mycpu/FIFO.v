
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
    input [31:0] if1_fifo_pc_next,
    input [31:0] if1_fifo_icache_badv,
    input [31:0] if1_fifo_icache_cookie_out,
    input [6 :0] if1_fifo_icache_exception,
    input        if1_fifo_icache_excp_flag,
    input        if1_fifo_cacop_ready,
    input        if1_fifo_cacop_complete,


    output reg [31:0] inst0_o,
    output reg [31:0] inst1_o,

    output reg [31:0] fifo_pc,//co pc with inst0_o 
    output wire[31:0] fifo_pcAdd,
    output reg [31:0] fifo_pc_next,
    output reg [31:0] fifo_badv,

    output reg [31:0] fifo_cookie_out,
    output reg [6 :0] fifo_exception, 
    output reg        fifo_excp_flag,
    output reg        fifo_ibar_signal,
    output reg        fifo_cacop_ready,
    output reg        fifo_cacop_complete,

    output fetch_buf_empty,
    output fetch_buf_full,
    output ibar_signal,
    output ibar_pos//TODO pos actual meaning in pending...
    `ifdef FIFO_ID_DIFFTEST

    `endif 
);
    localparam BUF_DEPTH = 8;
    //if1_fifo_x->x_din->x_dout->fifo_x
    wire write_en;
    wire pop_en;
    wire empty,full;
    wire pcbdv_empty,pcbdv_full;
    wire stat_empty,stat_full;
    wire [63:0] inst_din,inst_dout;
    wire [97:0] pcbdv_din,pcbdv_dout;
    wire [42:0] stat_din,stat_dout;//[41:10]cookie,[9:3]exception,[2:2]excp_flag,[1:1]ready,[0:0]complete

    assign empty                =   fetch_buf_empty;
    assign full                 =   fetch_buf_full;
    assign write_en             =   fifo_valid;
    assign pop_en               =   fifo_ready;
    assign inst_din             =   {inst1_i[31:0],inst0_i[31:0]};
    assign pcbdv_din            =   {if1_fifo_pc[31:0],if1_fifo_icache_badv[31:0]};
    assign stat_din             =   {if1_fifo_icache_cookie_out[31:0],if1_fifo_icache_exception[6:0],
                                     if1_fifo_icache_excp_flag       ,ibar_signal,
                                     if1_fifo_cacop_ready            ,if1_fifo_cacop_complete};

    assign fifo_pcAdd=fifo_pc+4;

    always @(*) begin
        if (empty&&write_en&&pop_en) begin//special case bypass
            inst0_o=inst0_i;
            inst1_o=inst1_i;
            fifo_pc=if1_fifo_pc;
            fifo_pc_next=if1_fifo_pc_next;
            fifo_badv=if1_fifo_icache_badv;
            fifo_cookie_out=if1_fifo_icache_cookie_out;
            fifo_exception=if1_fifo_icache_exception;
            fifo_excp_flag=if1_fifo_icache_excp_flag;
            fifo_ibar_signal=ibar_signal;
            fifo_cacop_ready=if1_fifo_cacop_ready;
            fifo_cacop_complete=if1_fifo_cacop_complete;
        end else if(!empty)begin
            inst0_o=inst_dout[31:0];
            inst1_o=inst_dout[63:32];
            fifo_pc=pcbdv_dout[63:32];
            fifo_pc_next=pcbdv_dout[95:64];
            fifo_badv=pcbdv_dout[31:0];
            fifo_cookie_out=stat_dout[42:11];
            fifo_exception=stat_dout[10:4];
            fifo_excp_flag=stat_dout[3:3];
            fifo_ibar_signal=stat_dout[2:2];
            fifo_cacop_ready=stat_dout[1:1];
            fifo_cacop_complete=stat_dout[0:0];
        end else begin
            inst0_o=`INST_NOP;
            inst1_o=`INST_NOP;
            fifo_pc=`PC_RESET;
            fifo_pc_next=`PC_RESET+8;
            fifo_badv=`PC_RESET;
            fifo_cookie_out=1919810;
            fifo_exception=0;
            fifo_excp_flag=0;
            fifo_ibar_signal=0;
            fifo_cacop_ready=0;
            fifo_cacop_complete=0;
        end
    end 


    fifo_generator #(
        .DATA_WIDTH (   64 ),
        .DEPTH      (   BUF_DEPTH  )  
    )fetch_buf(
        .clk                        ( clk      ),
        .rstn                       ( rstn     ),
        .pop_en                     ( pop_en  ),
        .din                        ( inst_din  ),
        .write_en                   ( write_en ),
        .dout                       ( inst_dout ),
        .full                       ( fetch_buf_full     ),
        .empty                      ( fetch_buf_empty    )
    );

    fifo_generator#(
        .DATA_WIDTH ( 96 ),
        .DEPTH      ( BUF_DEPTH )
    )co_pcbdvbuf(
        .clk        ( clk        ),
        .rstn       ( rstn       ),
        .pop_en     ( pop_en     ),
        .din        ( pcbdv_din        ),
        .write_en   ( write_en   ),
        .dout       ( pcbdv_dout       ),
        .full       ( pcbdv_full       ),
        .empty      ( pcbdv_empty      )
    );

    fifo_generator#(
        .DATA_WIDTH ( 42 ),
        .DEPTH      ( BUF_DEPTH )
    )co_statbuf(
        .clk        ( clk        ),
        .rstn       ( rstn       ),
        .pop_en     ( pop_en     ),
        .din        ( stat_din       ),
        .write_en   ( write_en   ),
        .dout       ( stat_dout      ),
        .full       ( stat_full       ),
        .empty      ( stat_empty      )
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