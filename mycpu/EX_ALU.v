`include "../config.vh"
`include "define.vh"
/* verilator lint_off DECLFILENAME */
module EX_ALU (
    input  [3:0]   ctrl,
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] y
);
    wire op_add;
    wire op_sub;
    wire op_slt;
    wire op_sltu;
    wire op_and;
    wire op_or;
    wire op_nor;
    wire op_xor;
    wire op_sll;
    wire op_srl;
    wire op_sra;
    assign op_add  =  ctrl==`CTRL_ALU_ADD;
    assign op_sub  =  ctrl==`CTRL_ALU_SUB;
    assign op_slt  =  ctrl==`CTRL_ALU_SLT;
    assign op_sltu =  ctrl==`CTRL_ALU_SLTU;
    assign op_and  =  ctrl==`CTRL_ALU_AND;
    assign op_or   =  ctrl==`CTRL_ALU_OR;
    assign op_nor  =  ctrl==`CTRL_ALU_NOR;
    assign op_xor  =  ctrl==`CTRL_ALU_XOR;
    assign op_sll  =  ctrl==`CTRL_ALU_SLL;
    assign op_srl  =  ctrl==`CTRL_ALU_SRL;
    assign op_sra  =  ctrl==`CTRL_ALU_SRA;
    wire[ 31:0 ]add_sub_result;
    wire[ 31:0 ]slt_result;
    wire[ 31:0 ]sltu_result;
    wire[ 31:0 ]and_result;
    wire[ 31:0 ]nor_result;
    wire[ 31:0 ]or_result;
    wire[ 31:0 ]xor_result;
    wire[ 31:0 ]sll_result;
    wire[ 31:0 ]srl_result;
    wire[ 31:0 ]sra_result;
    wire [63:0] sr64_result;
    assign and_result = a&b;
    assign or_result  = a|b;
    assign nor_result = ~or_result;
    assign xor_result = a^b;
    wire [ 31:0 ]adder_a;
    wire [ 31:0 ]adder_b;
    wire adder_cin;
    wire [ 31:0 ]adder_result;
    wire adder_cout;
    assign adder_a                   = a;
    assign adder_b                   = ( op_sub|op_slt|op_sltu )?~b:b;
    assign adder_cin                 = ( op_sub|op_slt|op_sltu )?1'b1:1'b0;
    assign {adder_cout,adder_result} = {1'b0,adder_a}+{1'b0,adder_b}+{32'b0,adder_cin};
    assign add_sub_result            = adder_result;
    assign slt_result[ 31:1 ]        = 31'b0;
    assign slt_result[ 0 ]           = ( a[ 31 ]&~b[ 31 ] )|( ~( a[ 31 ]^b[ 31 ] )&adder_result[ 31 ] );
    assign sltu_result[ 31:1 ]       = 31'b0;
    assign sltu_result[ 0 ]          = ~adder_cout;
    assign sll_result                = a<<b[ 4:0 ];
    assign srl_result                = a>>b[ 4:0 ];
    // SRL, SRA result
    assign sr64_result = {{32{op_sra & a[31]}}, a[31:0]} >> b[4:0]; //rj >> i5 

    assign sra_result   = sr64_result[31:0];
    assign y                = ((( {32{op_add|op_sub}}&add_sub_result )
                                        |( {32{op_slt}}&slt_result )
                                        |( {32{op_sltu}}&sltu_result )
                                        |( {32{op_and}}&and_result )
                                        |( {32{op_nor}}&nor_result )
                                        |( {32{op_or}}&or_result )
                                        |( {32{op_xor}}&xor_result )
                                        |( {32{op_sll}}&sll_result )
                                        |( {32{op_srl}}&srl_result )
                                        |( {32{op_sra}}&sra_result )));

endmodule
