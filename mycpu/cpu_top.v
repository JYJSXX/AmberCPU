module core_top(
    input           aclk,
    input           aresetn,
    input    [ 7:0] intrpt,
    //AXI interface
    //read request
    output   [ 3:0] arid,
    output   [31:0] araddr,
    output   [ 7:0] arlen,
    output   [ 2:0] arsize,
    output   [ 1:0] arburst,
    output   [ 1:0] arlock,
    output   [ 3:0] arcache,
    output   [ 2:0] arprot,
    output          arvalid,
    input           arready,
    //read back
    input    [ 3:0] rid,
    input    [31:0] rdata,
    input    [ 1:0] rresp,
    input           rlast,
    input           rvalid,
    output          rready,
    //write request
    output   [ 3:0] awid,
    output   [31:0] awaddr,
    output   [ 7:0] awlen,
    output   [ 2:0] awsize,
    output   [ 1:0] awburst,
    output   [ 1:0] awlock,
    output   [ 3:0] awcache,
    output   [ 2:0] awprot,
    output          awvalid,
    input           awready,
    //write data
    output   [ 3:0] wid,
    output   [31:0] wdata,
    output   [ 3:0] wstrb,
    output          wlast,
    output          wvalid,
    input           wready,
    //write back
    input    [ 3:0] bid,
    input    [ 1:0] bresp,
    input           bvalid,
    output          bready,

    output [31:0] debug0_wb_pc,
    output [ 3:0] debug0_wb_rf_wen,
    output [ 4:0] debug0_wb_rf_wnum,
    output [31:0] debug0_wb_rf_wdata,
    output [31:0] debug0_wb_inst,
    output debug0_valid,

    output [31:0] debug1_wb_pc,
    output [ 3:0] debug1_wb_rf_wen,
    output [ 4:0] debug1_wb_rf_wnum,
    output [31:0] debug1_wb_rf_wdata,
    output [31:0] debug1_wb_inst,
    output debug1_valid
);

    wire if_buf_full;
    wire icache_ready;
    wire pc_stall_n=icache_ready & ~if_buf_full;

    reg [31:0] pc;
    wire [31:0] pc_next;
    wire set_pc_by_id,set_pc_by_ex,set_pc_by_wb;
    wire [31:0] pc_decoder,pc_executer,pc_writeback,ex_pc_tar;
    //具体处理到具体模块再进行赋值
    always @(posedge aclk) begin
        if(~aresetn)
            //龙芯架构32位精简版参考手册  p55 中断例外章节结尾
            pc <= 32'h1C000000;
        else if(set_pc_by_wb)
            pc <= pc_writeback; //出现中断时，pc_writeback会被赋值为中断向量地址，内容由CSR控制
        else if(set_pc_by_ex)
            pc <= pc_executer; //由于跳转或特权指令
        else if(set_pc_by_id)
            pc <= pc_decoder; //受分支预测相关控制
        else if(pc_stall_n)
            pc <= pc_next; //icache未准备好或if_buf已满，pc_next见分支预测器
    end
endmodule
