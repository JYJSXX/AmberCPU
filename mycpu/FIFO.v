
`include "define.vh"
module FIFO(
    input clk,
    input rstn,
    input flush,

    //hand shake signal,stage DO NOT GEN SIGNAL!!!
    //stage read signal,write info to stage-stage regs
    input           fifo_readygo,
    output          fifo_allowin,
    input           fifo_ready,
    output          fifo_valid,
    

    
    input [1 :0] priv_flag,
    input [1 :0] branch_flag,
    input [31:0] if1_fifo_inst0,
    input [31:0] if1_fifo_inst1,
    input [31:0] if1_fifo_pc,
    input [31:0] if1_fifo_pc_next,

    input [31:0] if1_fifo_icache_badv,
    input [31:0] if1_fifo_icache_cookie_out,
    input [6 :0] if1_fifo_icache_exception,
    input [1:0]  if1_fifo_icache_excp_flag,


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
    output reg [1 :0] fifo_branch_flag
    
);
    localparam BUF_DEPTH = 8;
    //if1_fifo_x->x_din->x_dout->fifo_x
    wire fetch_buf_empty;
    wire fetch_buf_full;
    wire write_en;
    wire pop_en;
    wire empty,full;
    wire pcbdv_empty,pcbdv_full;
    wire stat_empty,stat_full;
    wire [63:0] inst_din,inst_dout;
    wire [95:0] pcbdv_din,pcbdv_dout;
    wire [44:0] stat_din,stat_dout;
    //[31:0]cookie  [38:32]exception [40:39]excp_flag [42:41]ibar_flag
    //[43:43]cacop_ready  [44:44]cacop_complete

    assign  empty               =   fetch_buf_empty;
    assign  full                =   fetch_buf_full;
    assign  write_en            =   fifo_readygo;                        
    assign  pop_en              =   fifo_ready;
    assign  inst_din            =   {if1_fifo_inst1[31:0],if1_fifo_inst0[31:0]};
    assign  fifo_pcAdd          =   fifo_pc+4;
    assign  pcbdv_din           =   {
                                        if1_fifo_pc_next[31:0],
                                        if1_fifo_pc[31:0],
                                        if1_fifo_icache_badv[31:0]
                                    };
    assign  stat_din            =   {
                                        branch_flag[1:0],
                                        priv_flag[1:0],
                                        if1_fifo_icache_excp_flag[1:0],
                                        if1_fifo_icache_exception[6:0],
                                        if1_fifo_icache_cookie_out[31:0]
                                    };
    assign  fifo_valid          =   !fetch_buf_empty;
    assign  fifo_allowin        =   !fetch_buf_full;


    always @(*) begin
        if (fifo_valid)begin
            fifo_inst0=inst_dout[31:0];
            fifo_inst1=inst_dout[63:32];
            fifo_pc=pcbdv_dout[63:32];
            fifo_pc_next=pcbdv_dout[95:64];
            fifo_badv=pcbdv_dout[31:0];
            
            fifo_cookie_out=stat_dout[31:0];
            fifo_exception=stat_dout[38:32];
            fifo_excp_flag=stat_dout[40:39];
            fifo_priv_flag=stat_dout[42:41];
            fifo_branch_flag=stat_dout[44:43];
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
            fifo_branch_flag=2'b00;
        end
    end 


    FIFO_generator #(
        .DATA_WIDTH (   64 ),
        .DEPTH      (   BUF_DEPTH  )  
    )fetch_buf(
        .clk                        ( clk      ),
        .rstn                       ( rstn    ),
        .flush                      ( flush         ),
        .pop_en                     ( pop_en  ),
        .din                        ( inst_din  ),
        .write_en                   ( write_en ),
        .dout                       ( inst_dout ),
        .full                       ( fetch_buf_full     ),
        .empty                      ( fetch_buf_empty    )
    );

    FIFO_generator#(
        .DATA_WIDTH ( 96 ),
        .DEPTH      ( BUF_DEPTH ) 
    )co_pcbdvbuf(
        .clk        ( clk        ),
        .rstn       ( rstn&!flush       ),
        .flush                      ( flush         ),
        .pop_en     ( pop_en     ),
        .din        ( pcbdv_din        ),
        .write_en   ( write_en   ),
        .dout       ( pcbdv_dout       ),
        .full       ( pcbdv_full       ),
        .empty      ( pcbdv_empty      )
    );

    FIFO_generator#(
        .DATA_WIDTH ( 45 ),
        .DEPTH      ( BUF_DEPTH )
    )co_statbuf(
        .clk        ( clk        ),
        .rstn       ( rstn &!flush      ),
        .flush                      ( flush         ),
        .pop_en     ( pop_en     ),
        .din        ( stat_din       ),
        .write_en   ( write_en   ),
        .dout       ( stat_dout      ),
        .full       ( stat_full       ),
        .empty      ( stat_empty      )
    );

endmodule