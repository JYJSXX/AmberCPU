`include "define.vh"
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
    //debug
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


    

    wire clk;
    assign clk=aclk; //idle的时钟没写，暂时用clk代替

    wire id_readygo;
    wire id_allowin;
    wire reg_readygo;
    wire reg_allowin;
    wire [31:0] fifo_id_inst0;
    wire [31:0] fifo_id_inst1;
    wire [31:0] fifo_id_pc0;
    wire [31:0] fifo_id_pc1;
    wire [31:0] fifo_id_badv;
    wire [1:0] fifo_id_excp_flag;
    wire [6:0] fifo_id_exception;
    wire [1:0] fifo_id_priv_flag;
    wire ID_is_ALU_0;
    wire ID_is_ALU_1;
    wire ID_is_syscall_0;
    wire ID_is_syscall_1;
    wire ID_is_break_0;
    wire ID_is_break_1;
    wire ID_is_priviledged_0;
    wire ID_is_priviledged_1;
    wire [`WIDTH_UOP-1:0] ID_uop0;
    wire [`WIDTH_UOP-1:0] ID_uop1;
    wire [31:0] ID_imm0;
    wire [31:0] ID_imm1;
    wire [4:0] ID_rd0;
    wire [4:0] ID_rd1;
    wire [4:0] ID_rj0;
    wire [4:0] ID_rj1;
    wire [4:0] ID_rk0;
    wire [4:0] ID_rk1;
    wire [31:0] iq_pc0;
    wire [31:0] iq_pc1;
    wire [31:0] iq_inst0;
    wire [31:0] iq_inst1;
    wire [31:0] iq_badv;
    wire [1 :0] iq_excp_flag;
    wire [6:0] iq_exception;
    wire iq_is_ALU_0 ;
    wire iq_is_ALU_1 ;
    wire iq_is_syscall_0 ;
    wire iq_is_syscall_1 ;
    wire iq_is_break_0 ;
    wire iq_is_break_1 ;
    wire iq_is_priviledged_0 ;
    wire iq_is_priviledged_1 ;
    wire [`WIDTH_UOP-1:0] iq_uop0 ;
    wire [`WIDTH_UOP-1:0] iq_uop1 ;
    wire [31:0] iq_imm0 ;
    wire [31:0] iq_imm1 ;
    wire [4:0]  iq_rd0 ;
    wire [4:0]  iq_rd1 ;
    wire [4:0]  iq_rj0 ;
    wire [4:0]  iq_rj1 ;
    wire [4:0]  iq_rk0 ;
    wire [4:0]  iq_rk1 ;
    ID_REG top_ID_REG(
        .aclk(clk),
        .aresetn(aresetn),
        .id_readygo(id_readygo),
        .id_allowin(id_allowin),
        .reg_readygo(reg_readygo),
        .reg_allowin(reg_allowin),
        .fifo_id_inst0(fifo_id_inst0),
        .fifo_id_inst1(fifo_id_inst1),
        .fifo_id_pc0(fifo_id_pc0),
        .fifo_id_pc1(fifo_id_pc1),
        .fifo_id_badv(fifo_id_badv),
        .fifo_id_excp_flag(fifo_id_excp_flag),
        .fifo_id_exception(fifo_id_exception),
        .fifo_id_priv_flag(fifo_id_priv_flag),
        .is_ALU_0(ID_is_ALU_0),
        .is_ALU_1(ID_is_ALU_1),
        .is_syscall_0(ID_is_syscall_0),
        .is_syscall_1(ID_is_syscall_1),
        .is_break_0(ID_is_break_0),
        .is_break_1(ID_is_break_1),
        .is_priviledged_0(ID_is_priviledged_0),
        .is_priviledged_1(ID_is_priviledged_1),
        .uop0(ID_uop0),
        .uop1(ID_uop1),
        .imm0(ID_imm0),
        .imm1(ID_imm1),
        .rd0(ID_rd0),
        .rd1(ID_rd1),
        .rj0(ID_rj0),
        .rj1(ID_rj1),
        .rk0(ID_rk0),
        .rk1(ID_rk1),
        .iq_pc0(iq_pc0),
        .iq_pc1(iq_pc1),
        .iq_inst0(iq_inst0),
        .iq_inst1(iq_inst1),
        .iq_badv(iq_badv),
        .iq_excp_flag(iq_excp_flag),
        .iq_exception(iq_exception),
        .iq_is_ALU_0(iq_is_ALU_0),
        .iq_is_ALU_1(iq_is_ALU_1),
        .iq_is_syscall_0(iq_is_syscall_0),
        .iq_is_syscall_1(iq_is_syscall_1),
        .iq_is_break_0(iq_is_break_0),
        .iq_is_break_1(iq_is_break_1),
        .iq_is_priviledged_0(iq_is_priviledged_0),
        .iq_is_priviledged_1(iq_is_priviledged_1),
        .iq_uop0(iq_uop0),
        .iq_uop1(iq_uop1),
        .iq_imm0(iq_imm0),
        .iq_imm1(iq_imm1),
        .iq_rd0(iq_rd0),
        .iq_rd1(iq_rd1),
        .iq_rj0(iq_rj0),
        .iq_rj1(iq_rj1),
        .iq_rk0(iq_rk0),
        .iq_rk1(iq_rk1)
    );
    wire forward_stall;
    wire ex_allowin;
    wire ex_readygo;
    REG_EX1 top_REG_EX1(
        .clk(clk),
        .aresetn(aresetn),
        .flush(1'b0),//flush部分to do
        .forward_stall(forward_stall),
        .reg_readygo(reg_readygo),
        .reg_allowin(reg_allowin),
        .ex_allowin(ex_allowin),
        .ex_readygo(ex_readygo),
        .id_reg_pc0(iq_pc0),
        .id_reg_pc1(iq_pc1),
        .id_reg_inst0(iq_inst0),
        .id_reg_inst1(iq_inst1),
        .id_reg_exception(iq_exception),
        .id_reg_excp_flag(iq_excp_flag),
    );

endmodule
