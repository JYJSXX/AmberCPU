`include "define.vh"
module EX1_MEM(
    input [`WIDTH_UOP-1:0] uop,
    input [31:0] imm,
    input [31:0] rj_data,
    input [31:0] rk_data,
    input [31:0] pc,
    //给cache
    output valid_dcache,
    output op_dcache, //0读1写
    output [3:0] write_type_dcache, //写入类型,0b0001为byte,0b0011为half,0b1111为word
    output [31:0] addr_dcache,
    output [31:0] w_data_dcache,
    output [0:0] is_atom_dcache

);
    assign valid_dcache=uop[`INS_MEM];
    wire [3:0] cond;
    assign cond=uop[`UOP_COND]; //cond[2]是1则为store，否则为load
    assign op_dcache=cond[2];
    assign write_type_dcache=(cond[1:0]==0)?4'b0001:(cond[1:0]==1)?4'b0011:4'b1111;
    assign addr_dcache = rj_data+imm;
    assign w_data_dcache = rk_data;
    assign is_atom_dcache = uop[`UOP_MEM_ATM];

endmodule