module FIFO_predecoder (
    input [31:0]        if1_fifo_inst0,
    input [31:0]        if1_fifo_inst1,
    input [31:0]        if1_fifo_pc,

    //signal for priv/ibar/csr inst
    output   [1 :0]      priv_flag,
    output   [1 :0]      ibar_flag,
    output   [1 :0]      csr_flag,
    output   [1 :0]      tlb_flag,
    output   [1 :0]      branch_flag,
    output   [1 :0]      inst_btype,
    output               inst_bpos
    //两条指令中有一条跳转就是跳转，有一条无条件就是无条件
    //00 normal, 10 unconditional branch,10 PC relative, 11 indirect
);
    // 0 0 1 1 1
    // reg     ibar_tmp0=0 ;
    // reg     ibar_tmp1=0;

    wire    inst0_btype,inst1_btype;
    wire    inst0_unconditional,inst1_unconditional;
    wire    inst0_pcrelative,inst1_pcrelative;
    wire    inst0_indirect,inst1_indirect;
    wire    inst0_ibar,inst1_ibar;
    wire    inst0_csr,inst1_csr;
    wire    inst0_tlb,inst1_tlb;

    assign  inst0_ibar=(if1_fifo_inst0[31:27]==5'b00111)&&if1_fifo_inst0[15];
    assign  inst1_ibar=(if1_fifo_inst1[31:27]==5'b00111)&&if1_fifo_inst1[15];
    assign  ibar_flag={inst1_ibar,inst0_ibar};

    assign  inst0_csr={if1_fifo_inst0[31:24]==8'b00000100&&if1_fifo_inst0[9:5]};
    assign  inst1_csr={if1_fifo_inst1[31:24]==8'b00000100&&if1_fifo_inst1[9:5]};
    assign  csr_flag ={inst1_csr,inst0_csr};

    assign  inst0_tlb={
        (if1_fifo_inst0==       32'b0000011_0010010000_01100_00000_00000)||
        (if1_fifo_inst0==       32'b0000011_0010010000_01101_00000_00000)||
        (if1_fifo_inst0[31:15]==17'b0000011_0010010011)
    };
    assign  inst1_tlb={
        (if1_fifo_inst1==       32'b0000011_0010010000_01100_00000_00000)||
        (if1_fifo_inst1==       32'b0000011_0010010000_01101_00000_00000)||
        (if1_fifo_inst1[31:15]==17'b0000011_0010010011)
    };
    assign  tlb_flag={inst1_tlb,inst0_tlb};

    assign  priv_flag=ibar_flag|csr_flag|tlb_flag;


    assign  pc_from_priv= if1_fifo_pc;
    assign  inst0_unconditional=(if1_fifo_inst0[31:27]==5'b01010)||(if1_fifo_inst0[31:27]==5'b01001);
    assign  inst1_unconditional=(if1_fifo_inst1[31:27]==5'b01010)||(if1_fifo_inst1[31:27]==5'b01001);
    assign  inst0_pcrelative   =(if1_fifo_inst0[31:27]==5'b01011)||(if1_fifo_inst0[31:28]==4'b0110 );
    assign  inst1_pcrelative   =(if1_fifo_inst1[31:27]==5'b01011)||(if1_fifo_inst1[31:28]==4'b0110 );
    assign  inst0_indirect     =(if1_fifo_inst0[31:27]==6'b010011);
    assign  inst1_indirect     =(if1_fifo_inst1[31:27]==6'b010011);
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
    assign  branch_flag        ={inst1_btype,inst0_btype};
    assign  inst_bpos          =inst0_btype?0:1;
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