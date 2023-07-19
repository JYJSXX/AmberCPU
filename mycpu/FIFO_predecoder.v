module pre_decoder (
    input clk,
    input rstn,
    input fifo_valid,
    input fifo_ready,

    input [31:0]        fifo_inst0,
    input [31:0]        fifo_inst1,
    input [31:0]        if1_fifo_pc,

    //signal for ibar
    output   [1:0]      ibar_flag,//0:inst 0 is ibar,1:inst 1 is ibar
    output   [31:0]     pc_from_ibar, 
    output   [1:0]      inst_btype,
    //两条指令中有一条跳转就是跳转，有一条无条件就是无条件
    //00 normal, 01 ibar,10 unconditional branch,10 PC relative, 11 indirect
    output              inst_bpos//last branch pos,0 means maybe skip
);
    // 0 0 1 1 1
    reg     ibar_tmp0=0 ;
    reg     ibar_tmp1=0;

    wire    ibar_0,ibar_1;
    wire    inst0_btype,inst1_btype;
    wire    inst0_unconditional,inst1_unconditional;
    wire    inst0_pcrelative,inst1_pcrelative;
    wire    inst0_indirect,inst1_indirect;

    assign  ibar_0=(fifo_inst0[31:27]==5'b00111)&&fifo_inst0[15];
    assign  ibar_1=(fifo_inst1[31:27]==5'b00111)&&fifo_inst1[15];
    assign  ibar_flag={ibar_1,ibar_0};

    assign  pc_from_ibar = if1_fifo_pc;
    assign  inst0_unconditional=(fifo_inst0[31:27]==5'b01010)||(fifo_inst0[31:27]==5'b01001);
    assign  inst1_unconditional=(fifo_inst1[31:27]==5'b01010)||(fifo_inst1[31:27]==5'b01001);
    assign  inst0_pcrelative   =(fifo_inst0[31:27]==5'b01011)||(fifo_inst0[31:28]==4'b0110 );
    assign  inst1_pcrelative   =(fifo_inst1[31:27]==5'b01011)||(fifo_inst1[31:28]==4'b0110 );
    assign  inst0_indirect     =(fifo_inst0[31:27]==6'b010011);
    assign  inst1_indirect     =(fifo_inst1[31:27]==6'b010011);
    assign  inst0_btype        =inst0_unconditional ?   2'b01:
                                inst0_pcrelative    ?   2'b10:
                                inst0_indirect      ?   2'b11:
                                                        2'b00;

    assign  inst1_btype        =inst1_unconditional ?   2'b01:
                                inst1_pcrelative    ?   2'b10:
                                inst1_indirect      ?   2'b11:
                                                        2'b00;
    assign  inst_btype         =inst1_btype         ?   inst1_btype:
                                if1_fifo_pc[2]      ?   2'b00:
                                inst0_btype ==2'b11 ?   2'b11:2'b00;

    // always @(posedge clk or negedge rstn) begin//get posedge for ibar
    //     if (!rstn) begin
    //         ibar_tmp0<=0;
    //         ibar_tmp1<=1;
    //     end else begin
    //         if(ibar_signal)begin
    //             ibar_signal<=0;
    //         end else if (!ibar_tmp&&ibar_exist) begin
    //             ibar_signal<=1;
    //         end

    //         ibar_tmp<=ibar_exist;
    //     end
    // end
    /*
    inst:       000011110001010
    tmp        :0000011110001010
    ibar_signal:000010000001010
    */
endmodule