
`include "define.vh"
module FIFO(
    input clk,
    input rstn,

    //hand shake signal,stage DO NOT GEN SIGNAL!!!
    //stage read signal,write info to stage-stage regs
    input fifo_readygo,
    input fifo_allowin,

    
    input [1 :0] priv_flag,
    input [31:0] if1_fifo_inst0,
    input [31:0] if1_fifo_inst1,
    input [31:0] if1_fifo_pc,
    input [31:0] if1_fifo_pc_next,

    input [31:0] if1_fifo_icache_badv,
    input [31:0] if1_fifo_icache_cookie_out,
    input [6 :0] if1_fifo_icache_exception,
    input [1:0]  if1_fifo_icache_excp_flag,
    // input        if1_fifo_cacop_ready,
    // input        if1_fifo_cacop_complete,


    output reg [31:0] fifo_inst0,
    output reg [31:0] fifo_inst1,

    output reg [31:0] fifo_pc,//co pc with fifo_inst0 
    output wire[31:0] fifo_pcAdd,
    output reg [31:0] fifo_pc_next,
    output reg [31:0] fifo_badv,

    output reg [31:0] fifo_cookie_out,
    output reg [6 :0] fifo_exception, 
    output reg [1 :0] fifo_excp_flag,
    output reg [1 :0] fifo_priv_flag,
    // output reg        fifo_cacop_ready,
    // output reg        fifo_cacop_complete,

    output fetch_buf_empty,
    output fetch_buf_full
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
    wire [95:0] pcbdv_din,pcbdv_dout;
    wire [42:0] stat_din,stat_dout;
    //[31:0]cookie  [38:32]exception [40:39]excp_flag [42:41]ibar_flag
    //[43:43]cacop_ready  [44:44]cacop_complete

    assign empty                =   fetch_buf_empty;
    assign full                 =   fetch_buf_full;
    assign write_en             =   fifo_readygo;//do not use full/empty signal here,use it in stage-stage reg module to adjust allowin/readygo!!!
    assign pop_en               =   fifo_allowin;
    assign inst_din             =   {if1_fifo_inst1[31:0],if1_fifo_inst0[31:0]};
    assign pcbdv_din            =   {
                                        if1_fifo_pc_next[31:0],
                                        if1_fifo_pc[31:0],
                                        if1_fifo_icache_badv[31:0]
                                    };
    assign stat_din             =   {
                                        // if1_fifo_cacop_complete,
                                        // if1_fifo_cacop_ready,
                                        priv_flag,
                                        if1_fifo_icache_excp_flag,
                                        if1_fifo_icache_exception[6:0],
                                        if1_fifo_icache_cookie_out[31:0]
                                    };

    assign fifo_pcAdd=fifo_pc+4;

    always @(*) begin
        if (empty&&write_en&&pop_en) begin//special case bypass
            fifo_inst0=if1_fifo_inst0;
            fifo_inst1=if1_fifo_inst1;
            fifo_pc=if1_fifo_pc;
            fifo_pc_next=if1_fifo_pc_next;

            fifo_badv=if1_fifo_icache_badv;
            fifo_cookie_out=if1_fifo_icache_cookie_out;
            fifo_exception=if1_fifo_icache_exception;
            fifo_excp_flag=if1_fifo_icache_excp_flag;
            fifo_priv_flag=priv_flag;
            // fifo_cacop_ready=if1_fifo_cacop_ready;
            // fifo_cacop_complete=if1_fifo_cacop_complete;
        end else if(!empty)begin
            fifo_inst0=inst_dout[31:0];
            fifo_inst1=inst_dout[63:32];
            fifo_pc=pcbdv_dout[63:32];
            fifo_pc_next=pcbdv_dout[95:64];
            fifo_badv=pcbdv_dout[31:0];
            
            fifo_cookie_out=stat_dout[31:0];
            fifo_exception=stat_dout[38:32];
            fifo_excp_flag=stat_dout[40:39];
            fifo_priv_flag=stat_dout[42:41];
            // fifo_cacop_ready=stat_dout[43:43];
            // fifo_cacop_complete=stat_dout[44:44];
        end else begin
            fifo_inst0=`INST_NOP;
            fifo_inst1=`INST_NOP;
            fifo_pc=`PC_RESET;
            fifo_pc_next=`PC_RESET+8;

            fifo_badv=`PC_RESET;
            fifo_cookie_out=1919810;
            fifo_exception=7'b0000000;
            fifo_excp_flag=2'b00;
            fifo_priv_flag=2'b00;
            // fifo_cacop_ready=0;
            // fifo_cacop_complete=0;
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
        .DATA_WIDTH ( 43 ),
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





    

endmodule