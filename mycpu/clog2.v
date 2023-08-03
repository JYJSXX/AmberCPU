`timescale 1ns/1ps


module clog2(
    input       [31:0]      in,
    output      [5:0]       out
);

// wire r_0, r_1, r_2, r_3, r_4;

// assign r_4 = |in[31:16];
// wire [15:0] in16 = r_4 ? in[31:16] : in[15:0];
// assign r_3 = |in16[15:8];
// wire [7:0] in8 = r_3 ? in16[15:8] : in16[7:0];
// assign r_2 = |in8[7:4];
// wire [3:0] in4 = r_2 ? in8[7:4] : in8[3:0];
// assign r_1 = |in4[3:2];
// wire [1:0] in2 = r_1 ? in4[3:2] : in4[1:0];
// assign r_0 = in2[1];

// assign out = {1'b0, r_4, r_3, r_2, r_1, r_0} + 1;
reg [5:0] a;
    reg [31:0] b;
    always @* begin
        b = in;
        a = 0;
        if(b>=65536)begin a = a+16; b = {16'b0,b[31:16]};end
        if(b>=256)  begin a = a+ 8; b = {24'b0,b[15:8]}; end
        if(b>=16)   begin a = a+ 4; b = {28'b0,b[7:4]};  end
        case(b[3:0])
            4'h0: a = a+0;
            4'h1: a = a+1;
            4'h2: a = a+2;
            4'h3: a = a+2;
            4'h4: a = a+3;
            4'h5: a = a+3;
            4'h6: a = a+3;
            4'h7: a = a+3;
            4'h8: a = a+4;
            4'h9: a = a+4;
            4'ha: a = a+4;
            4'hb: a = a+4;
            4'hc: a = a+4;
            4'hd: a = a+4;
            4'he: a = a+4;
            4'hf: a = a+4;
        endcase
    end
    assign out = a;
endmodule