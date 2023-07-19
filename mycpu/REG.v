`include "define.vh"

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
	output reg[31:0]        rdata4
	
	//output wire[31:0] reg1 //存放BL指令的返回地址
	
);

    reg[31:0]  regs[0:31];
    //assign reg1 = regs[1];

    always @ (posedge clk) begin
        
        case ({we2, we1})
		2'b01: if (waddr1 != 0) regs[waddr1] <= wdata1;
		2'b10: if (waddr2 != 0) regs[waddr2] <= wdata2;
		2'b11: begin
		     if (waddr2 != 0) regs[waddr2] <= wdata2;
		     if (waddr1 != waddr2 && waddr1 != 0) begin // 没有发生“写后写”（WAW）相关
		         regs[waddr1] <= wdata1;
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
            case ({we2, we1})
			 2'b01: rdata1 = (raddr1 == waddr1) ? wdata1 : regs[raddr1];
			 2'b10: rdata1 = (raddr1 == waddr2) ? wdata2 : regs[raddr1];
			 2'b11: begin
			     if (raddr1 == waddr2) rdata1 = wdata2;
			     else if (raddr1 == waddr1) rdata1 = wdata1;
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
            case ({we2, we1})
			 2'b01: rdata2 = (raddr2 == waddr1) ? wdata1 : regs[raddr2];
			 2'b10: rdata2 = (raddr2 == waddr2) ? wdata2 : regs[raddr2];
			 2'b11: begin
			     if (raddr2 == waddr2) rdata2 = wdata2;
			     else if (raddr2 == waddr1) rdata2 = wdata1;
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
            case ({we2, we1})
			 2'b01: rdata3 = (raddr3 == waddr1) ? wdata1 : regs[raddr3];
			 2'b10: rdata3 = (raddr3 == waddr2) ? wdata2 : regs[raddr3];
			 2'b11: begin
			     if (raddr3 == waddr2) rdata3 = wdata2;
			     else if (raddr3 == waddr1) rdata3 = wdata1;
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
            case ({we2, we1})
			 2'b01: rdata4 = (raddr4 == waddr1) ? wdata1 : regs[raddr4];
			 2'b10: rdata4 = (raddr4 == waddr2) ? wdata2 : regs[raddr4];
			 2'b11: begin
			     if (raddr4 == waddr2) rdata4 = wdata2;
			     else if (raddr4 == waddr1) rdata4 = wdata1;
			     else rdata4 = regs[raddr4];
			 end
			 default: rdata4 = regs[raddr4];
            endcase
        end
    end

endmodule