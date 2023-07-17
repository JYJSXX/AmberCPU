module pre_decoder (
    input clk,
    input rstn,
    input fifo_valid,
    input fifo_ready,

    input [31:0]        fifo_inst0,
    input [31:0]        fifo_inst1,
    input  [31:0]       if1_if0_pc,

    //signal for ibar
    output   reg        ibar_signal=0,//00 normal, 01 ibar,10 unconditional branch
    output [31:0]       pc_from_ibar,
    //0:inst 0 is ibar,1:inst 1 is ibar
    //valid only when ibar_signal=1
    output              ibar_pos
);
    // 0 0 1 1 1
    reg     ibar_tmp=0 ;

    wire    ibar_exist;
    wire    ibar_0,ibar_1;
    assign  ibar_0=(fifo_inst0[31:27]==5'b00111)&&fifo_inst0[15];
    assign  ibar_1=(fifo_inst1[31:27]==5'b00111)&&fifo_inst1[15];
    assign  ibar_exist=ibar_0||ibar_1;
    assign  ibar_pos=ibar_0?0:1;
    assign  pc_from_ibar = if1_if0_pc;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            ibar_tmp<=0;
        end else begin
            if(ibar_signal)begin
                ibar_signal<=0;
            end else if (!ibar_tmp&&ibar_exist) begin
                ibar_signal<=1;
            end

            ibar_tmp<=ibar_exist;
        end
    end
    /*
    inst:       000011110001010
    tmp        :0000011110001010
    ibar_signal:000010000001010
    */
endmodule