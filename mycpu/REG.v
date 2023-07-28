`include "define.vh"
`include "config.vh"
module regfile(

	input clk,
	input aresetn,
	
	//写端口1
	input               we1,
	input[4:0]    		waddr1,
	input[31:0]     	wdata1,
	
	//写端口2
	input               we2,
	input[4:0]   		waddr2,
	input[31:0]        	wdata2,
	
	//读端口1
	input[4:0]     		raddr1,
	output reg[31:0]    rdata1,
	
	//读端口2
	input[4:0]     		raddr2,
	output reg[31:0]    rdata2,
	
	//读端口3
	input wire[4:0]   		raddr3,
	output reg[31:0]        rdata3,
	
	//读端口4
	input wire[4:0]   		raddr4,
	output reg[31:0]        rdata4,

	//写端口3
	input               we3,
	input[4:0]    		waddr3,
	input[31:0]     	wdata3
	
	//output wire[31:0] reg1 //存放BL指令的返回地址
	`ifdef DIFFTEST
	,output [31:0] reg_diff0,
	output [31:0] reg_diff1,
	output [31:0] reg_diff2,
	output [31:0] reg_diff3,
	output [31:0] reg_diff4,
	output [31:0] reg_diff5,
	output [31:0] reg_diff6,
	output [31:0] reg_diff7,
	output [31:0] reg_diff8,
	output [31:0] reg_diff9,
	output [31:0] reg_diff10,
	output [31:0] reg_diff11,
	output [31:0] reg_diff12,
	output [31:0] reg_diff13,
	output [31:0] reg_diff14,
	output [31:0] reg_diff15,
	output [31:0] reg_diff16,
	output [31:0] reg_diff17,
	output [31:0] reg_diff18,
	output [31:0] reg_diff19,
	output [31:0] reg_diff20,
	output [31:0] reg_diff21,
	output [31:0] reg_diff22,
	output [31:0] reg_diff23,
	output [31:0] reg_diff24,
	output [31:0] reg_diff25,
	output [31:0] reg_diff26,
	output [31:0] reg_diff27,
	output [31:0] reg_diff28,
	output [31:0] reg_diff29,
	output [31:0] reg_diff30,
	output [31:0] reg_diff31,
	input [31:0] debug0_wb_inst
	`endif
	
);

    reg[31:0]  regs[0:31];
    //assign reg1 = regs[1];
`ifdef DIFFTEST
assign reg_diff0  = (we3 && (waddr3 == 0)) ? wdata3: (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 0)) ? wdata1 : regs[0];
assign reg_diff1  = (we3 && (waddr3 == 1)) ? wdata3: (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 1)) ? wdata1 : regs[1];
assign reg_diff2  = (we3 && (waddr3 == 2 )) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 2 )) ? wdata1 : regs[2 ];
assign reg_diff3  = (we3 && (waddr3 == 3 )) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 3 )) ? wdata1 : regs[3 ];
assign reg_diff4  = (we3 && (waddr3 == 4 )) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 4 )) ? wdata1 : regs[4 ];
assign reg_diff5  = (we3 && (waddr3 == 5 )) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 5 )) ? wdata1 : regs[5 ];
assign reg_diff6  = (we3 && (waddr3 == 6 )) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 6 )) ? wdata1 : regs[6 ];
assign reg_diff7  = (we3 && (waddr3 == 7 )) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 7 )) ? wdata1 : regs[7 ];
assign reg_diff8  = (we3 && (waddr3 == 8 )) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 8 )) ? wdata1 : regs[8 ];
assign reg_diff9  = (we3 && (waddr3 == 9 )) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 9 )) ? wdata1 : regs[9 ];
assign reg_diff10 = (we3 && (waddr3 == 10)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 10)) ? wdata1 : regs[10];
assign reg_diff11 = (we3 && (waddr3 == 11)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 11)) ? wdata1 : regs[11];
assign reg_diff12 = (we3 && (waddr3 == 12)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 12)) ? wdata1 : regs[12];
assign reg_diff13 = (we3 && (waddr3 == 13)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 13)) ? wdata1 : regs[13];
assign reg_diff14 = (we3 && (waddr3 == 14)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 14)) ? wdata1 : regs[14];
assign reg_diff15 = (we3 && (waddr3 == 15)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 15)) ? wdata1 : regs[15];
assign reg_diff16 = (we3 && (waddr3 == 16)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 16)) ? wdata1 : regs[16];
assign reg_diff17 = (we3 && (waddr3 == 17)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 17)) ? wdata1 : regs[17];
assign reg_diff18 = (we3 && (waddr3 == 18)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 18)) ? wdata1 : regs[18];
assign reg_diff19 = (we3 && (waddr3 == 19)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 19)) ? wdata1 : regs[19];
assign reg_diff20 = (we3 && (waddr3 == 20)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 20)) ? wdata1 : regs[20];
assign reg_diff21 = (we3 && (waddr3 == 21)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 21)) ? wdata1 : regs[21];
assign reg_diff22 = (we3 && (waddr3 == 22)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 22)) ? wdata1 : regs[22];
assign reg_diff23 = (we3 && (waddr3 == 23)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 23)) ? wdata1 : regs[23];
assign reg_diff24 = (we3 && (waddr3 == 24)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 24)) ? wdata1 : regs[24];
assign reg_diff25 = (we3 && (waddr3 == 25)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 25)) ? wdata1 : regs[25];
assign reg_diff26 = (we3 && (waddr3 == 26)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 26)) ? wdata1 : regs[26];
assign reg_diff27 = (we3 && (waddr3 == 27)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 27)) ? wdata1 : regs[27];
assign reg_diff28 = (we3 && (waddr3 == 28)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 28)) ? wdata1 : regs[28];
assign reg_diff29 = (we3 && (waddr3 == 29)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 29)) ? wdata1 : regs[29];
assign reg_diff30 = (we3 && (waddr3 == 30)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 30)) ? wdata1 : regs[30];
assign reg_diff31 = (we3 && (waddr3 == 31)) ? wdata3 : (debug0_wb_inst[30:28] =='b010 && ~debug0_wb_inst[ 24] &&we1 && (waddr1 == 31)) ? wdata1 : regs[31];

`endif

    always @ (posedge clk) begin

        
        case ({we2, we1, we3})
		3'b010: if (waddr1 != 0) regs[waddr1] <= wdata1;
		3'b100: if (waddr2 != 0) regs[waddr2] <= wdata2;
		3'b001: if(waddr3 != 0) regs[waddr3] <= wdata3;
		3'b110: begin
		     if (waddr2 != 0) regs[waddr2] <= wdata2;
		     if (waddr1 != waddr2 && waddr1 != 0) begin // 没有发生“写后写”（WAW）相关
		         regs[waddr1] <= wdata1;
		     end
		 end
		 3'b101: begin
		     if (waddr1 != 0) regs[waddr1] <= wdata1;
		     if (waddr3 != waddr1 && waddr3 != 0) begin // 没有发生“写后写”（WAW）相关
		         regs[waddr3] <= wdata3;
		     end
		 end
		 3'b011: begin
		     if (waddr2 != 0) regs[waddr2] <= wdata2;
		     if (waddr3 != waddr2 && waddr3 != 0) begin // 没有发生“写后写”（WAW）相关
		         regs[waddr3] <= wdata3;
		     end
		 end
		 3'b111: begin
		     if (waddr1 != 0) regs[waddr1] <= wdata1;
		     if (waddr2 != waddr1 && waddr2 != 0) begin // 没有发生“写后写”（WAW）相关
		         regs[waddr2] <= wdata2;
		     end
		     if (waddr3 != waddr1 && waddr3 != waddr2 && waddr3 != 0) begin // 没有发生“写后写”（WAW）相关
		         regs[waddr3] <= wdata3;
		     end
		 end
		 default: ;
        endcase
    end
    
	
    always @ (*) begin
        if (~aresetn) begin
            rdata1 = `zero;
        end else if (raddr1 == 5'h0) begin
            rdata1 = `zero;
        end else begin
            case ({we2, we1, we3})
			 3'b010: rdata1 = (raddr1 == waddr1) ? wdata1 : regs[raddr1];
			 3'b100: rdata1 = (raddr1 == waddr2) ? wdata2 : regs[raddr1];
			 3'b001: rdata1 = (raddr1 == waddr3) ? wdata3 : regs[raddr1];
			 3'b110: begin
			     if (raddr1 == waddr2) rdata1 = wdata2;
			     else if (raddr1 == waddr1) rdata1 = wdata1;
			     else rdata1 = regs[raddr1];
			 end
			 3'b101: begin
			     if (raddr1 == waddr1) rdata1 = wdata1;
			     else if (raddr1 == waddr3) rdata1 = wdata3;
			     else rdata1 = regs[raddr1];
			 end
			 3'b011: begin
			     if (raddr1 == waddr2) rdata1 = wdata2;
			     else if (raddr1 == waddr3) rdata1 = wdata3;
			     else rdata1 = regs[raddr1];
			 end
			 3'b111: begin
			     if (raddr1 == waddr1) rdata1 = wdata1;
			     else if (raddr1 == waddr2) rdata1 = wdata2;
			     else if (raddr1 == waddr3) rdata1 = wdata3;
			     else rdata1 = regs[raddr1];
			 end
			 default: rdata1 = regs[raddr1];
            endcase
        end
    end
    
    always @ (*) begin
        if (~aresetn) begin
            rdata2 = `zero;
        end else if (raddr2 == 5'h0) begin
            rdata2 = `zero;
        end else begin
            case ({we2, we1, we3})
			 3'b010: rdata2 = (raddr2 == waddr1) ? wdata1 : regs[raddr2];
			 3'b100: rdata2 = (raddr2 == waddr2) ? wdata2 : regs[raddr2];
			 3'b001: rdata2 = (raddr2 == waddr3) ? wdata3 : regs[raddr2];
			 3'b110: begin
			     if (raddr2 == waddr2) rdata2 = wdata2;
			     else if (raddr2 == waddr1) rdata2 = wdata1;
			     else rdata2 = regs[raddr2];
			 end
			 3'b011: begin
			     if (raddr2 == waddr2) rdata2 = wdata2;
			     else if (raddr2 == waddr3) rdata2 = wdata3;
			     else rdata2 = regs[raddr2];
			 end
			 3'b101: begin
			     if (raddr2 == waddr1) rdata2 = wdata1;
			     else if (raddr2 == waddr3) rdata2 = wdata3;
			     else rdata2 = regs[raddr2];
			 end
			 3'b111: begin
			     if (raddr2 == waddr1) rdata2 = wdata1;
			     else if (raddr2 == waddr2) rdata2 = wdata2;
			     else if (raddr2 == waddr3) rdata2 = wdata3;
			     else rdata2 = regs[raddr2];
			 end

			 default: rdata2 = regs[raddr2];
            endcase
        end
    end
    
    always @ (*) begin
        if (~aresetn) begin
            rdata3 = `zero;
        end else if (raddr3 == 5'h0) begin
            rdata3 = `zero;
        end else begin
            case ({we2, we1, we3})
			 3'b010: rdata3 = (raddr3 == waddr1) ? wdata1 : regs[raddr3];
			 3'b100: rdata3 = (raddr3 == waddr2) ? wdata2 : regs[raddr3];
			 3'b001: rdata3 = (raddr3 == waddr3) ? wdata3 : regs[raddr3];
			 3'b110: begin
			     if (raddr3 == waddr2) rdata3 = wdata2;
			     else if (raddr3 == waddr1) rdata3 = wdata1;
			     else rdata3 = regs[raddr3];
			 end
			 3'b011: begin
			     if (raddr3 == waddr2) rdata3 = wdata2;
			     else if (raddr3 == waddr3) rdata3 = wdata3;
			     else rdata3 = regs[raddr3];
			 end
			 3'b101: begin
			     if (raddr3 == waddr1) rdata3 = wdata1;
			     else if (raddr3 == waddr3) rdata3 = wdata3;
			     else rdata3 = regs[raddr3];
			 end
			 3'b111: begin
			     if (raddr3 == waddr2) rdata3 = wdata2;
			     else if (raddr3 == waddr1) rdata3 = wdata1;
			     else if (raddr3 == waddr3) rdata3 = wdata3;
			     else rdata3 = regs[raddr3];
			 end
			 default: rdata3 = regs[raddr3];
            endcase
        end
    end
    
    always @ (*) begin
        if (~aresetn) begin
            rdata4 = `zero;
        end else if (raddr4 == 5'h0) begin
            rdata4 = `zero;
        end else begin
            case ({we2, we1, we3})
			 3'b010: rdata4 = (raddr4 == waddr1) ? wdata1 : regs[raddr4];
			 3'b100: rdata4 = (raddr4 == waddr2) ? wdata2 : regs[raddr4];
			 3'b001: rdata4 = (raddr4 == waddr3) ? wdata3 : regs[raddr4];
			 3'b110: begin
			     if (raddr4 == waddr2) rdata4 = wdata2;
			     else if (raddr4 == waddr1) rdata4 = wdata1;
			     else rdata4 = regs[raddr4];
			 end
			 3'b011: begin
			     if (raddr4 == waddr2) rdata4 = wdata2;
			     else if (raddr4 == waddr3) rdata4 = wdata3;
			     else rdata4 = regs[raddr4];
			 end
			 3'b101: begin
			     if (raddr4 == waddr1) rdata4 = wdata1;
			     else if (raddr4 == waddr3) rdata4 = wdata3;
			     else rdata4 = regs[raddr4];
			 end
			 3'b111: begin
			     if (raddr4 == waddr2) rdata4 = wdata2;
			     else if (raddr4 == waddr1) rdata4 = wdata1;
			     else if (raddr4 == waddr3) rdata4 = wdata3;
			     else rdata4 = regs[raddr4];
			 end
			 default: rdata4 = regs[raddr4];
            endcase
        end
    end

endmodule