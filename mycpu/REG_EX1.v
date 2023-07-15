`include "define.vh"
//regfile内嵌于本模块，直接本模块直接与ID_REG相连
module  REG_EX1(
    input   clk,
    input   aresetn,
    input   flush,
    input   is_syscall_0,
    input   is_syscall_1,
    input   is_break_0,
    input   is_break_1,
    input   is_priviledged_0,
    input   is_priviledged_1,
    input   [`WIDTH_UOP-1:0] uop0,
    input   [`WIDTH_UOP-1:0] uop1,
    input   [31:0] imm0,
    input   [31:0] imm1,
    input   [4:0] wb_rd0,
    input   [4:0] wb_rd1,
    input   we_0,
    input   we_1,
    input  [31:0] rd0_data,
    input  [31:0] rd1_data,
    input   [4:0] ex_rj0,
    input   [4:0] ex_rj1,
    input   [4:0] ex_rk0,
    input   [4:0] ex_rk1,
    input   [4:0] ex_rd0,
    input   [4:0] ex_rd1,

    output  reg is_syscall_0_o,
    output  reg is_syscall_1_o,
    output  reg is_break_0_o,
    output  reg is_break_1_o,
    output  reg is_priviledged_0_o,
    output  reg is_priviledged_1_o,
    output  reg [`WIDTH_UOP-1:0] uop0_o,
    output  reg [`WIDTH_UOP-1:0] uop1_o,
    output  reg [31:0] imm0_o,
    output  reg [31:0] imm1_o,

    output  reg [31:0] rj0_data_o,
    output  reg [31:0] rj1_data_o,
    output  reg [31:0] rk0_data_o,
    output  reg [31:0] rk1_data_o,
    output  reg [4:0] ex_rj0_o,
    output  reg [4:0] ex_rj1_o,
    output  reg [4:0] ex_rk0_o,
    output  reg [4:0] ex_rk1_o,
    output  reg [4:0] ex_rd0_o,
    output  reg [4:0] ex_rd1_o


);
wire [31:0] rj0_data;
wire [31:0] rj1_data;
wire [31:0] rk0_data;
wire [31:0] rk1_data;
regfile regfile1( //内部自带写优先
    .clk(clk),
    .aresetn(aresetn),
    .we1(we_0),
    .waddr1(wb_rd0),
    .wdata1(rd0_data),
    .we2(we_1),
    .waddr2(wb_rd1),
    .wdata2(rd1_data),
    .raddr1(ex_rj0),
    .rdata1(rj0_data),
    .raddr2(ex_rj1),
    .rdata2(rj1_data),
    .raddr3(ex_rk0),
    .rdata3(rk0_data),
    .raddr4(ex_rk1),
    .rdata4(rk1_data)
);
always@(posedge clk)begin
    if(aresetn | flush) begin
        is_syscall_0_o <= 0;
        is_syscall_1_o <= 0;
        is_break_0_o <= 0;
        is_break_1_o <= 0;
        is_priviledged_0_o <= 0;
        is_priviledged_1_o <= 0;
        uop0_o <= 0;
        uop1_o <= 0;
        imm0_o <= 0;
        imm1_o <= 0;
        rj0_data_o <= 0;
        rj1_data_o <= 0;
        rk0_data_o <= 0;
        rk1_data_o <= 0;

    end
    else begin
        is_syscall_0_o <= is_syscall_0;
        is_syscall_1_o <= is_syscall_1;
        is_break_0_o <= is_break_0;
        is_break_1_o <= is_break_1;
        is_priviledged_0_o <= is_priviledged_0;
        is_priviledged_1_o <= is_priviledged_1;
        uop0_o <= uop0;
        uop1_o <= uop1;
        imm0_o <= imm0;
        imm1_o <= imm1;
        rj0_data_o <= rj0_data;
        rj1_data_o <= rj1_data;
        rk0_data_o <= rk0_data;
        rk1_data_o <= rk1_data;
    end
    

end
endmodule