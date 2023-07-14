module ID(
    input aclk,arestn, //时钟, 复位
    ////控制信号////
    input input_valid,
    input flush,
    input [1:0]read_en,         //读取使能，00: 不读取, 01: 读取一条, 11: 读取两条, 10:无效
    output full,                //full信号相当于stall
    input [1:0] plv,            //当前的特权等级
    ////输入信号////
    input [31:0] inst0, inst1,  //两条待解码指令
    input first_inst_jmp,       //第一条指令发生了跳转（即inst1无效）
    ////输出信号////
    output [31:0] ctrl0,ctrl1,  //控制信号
    output [31:0] imm0,imm1,    //立即数段
    output [4:0] rd0,rd1,       //rd段
    output [4:0] rj0,rj1,       //rj段
    output [4:0] rk0,rk1       //rk段
);

endmodule