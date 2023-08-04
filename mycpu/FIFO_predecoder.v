module FIFO_predecoder
(
    input [31:0]            if1_fifo_inst0,
    input [31:0]            if1_fifo_inst1,
    input [31:0]            if1_fifo_pc,
    output   [1 :0]         inst_btype,
    output   [31:0]         inst_pc
    //两条指令中有一条跳转就是跳转，有一条无条件就是无条件
    //00 normal, 10 unconditional branch,10 PC relative, 11 indirect
);

    wire[1:0]    inst0_btype,inst1_btype;
    wire    inst0_unconditional,inst1_unconditional;
    wire    inst0_pcrelative,inst1_pcrelative;
    wire    inst0_indirect,inst1_indirect;

    assign  inst0_unconditional=(if1_fifo_inst0[31:27]==5'b01010)||(if1_fifo_inst0[31:27]==5'b01001);
    assign  inst1_unconditional=(if1_fifo_inst1[31:27]==5'b01010)||(if1_fifo_inst1[31:27]==5'b01001);
    assign  inst0_pcrelative   =(if1_fifo_inst0[31:27]==5'b01011)||(if1_fifo_inst0[31:28]==4'b0110 );
    assign  inst1_pcrelative   =(if1_fifo_inst1[31:27]==5'b01011)||(if1_fifo_inst1[31:28]==4'b0110 );
    assign  inst0_indirect     =(if1_fifo_inst0[31:26]==6'b010011);
    assign  inst1_indirect     =(if1_fifo_inst1[31:26]==6'b010011);
    assign  inst0_btype        =inst0_unconditional ?   2'b01:
                                inst0_pcrelative    ?   2'b10:
                                inst0_indirect      ?   2'b11:
                                                        2'b00;

    assign  inst1_btype        =inst1_unconditional ?   2'b01:
                                inst1_pcrelative     ?   2'b10:
                                inst1_indirect      ?   2'b11:
                                                        2'b00;
    assign  inst_btype          =inst1_btype!=2'b00  ?   inst1_btype:
                                if1_fifo_pc[2]      ?   2'b00:
                                inst0_btype ==2'b11 ?   2'b11:2'b00;
    assign  inst_pc             =if1_fifo_pc;
endmodule