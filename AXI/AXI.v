module axi2dpram(
	input aclk,
	input aresetn,
 
	//aw channel
	input [7:0]aw_id,
	input [31:0]aw_addr,
	input [3:0]aw_len,
	input [2:0] aw_size,
	input aw_valid,
	output aw_ready,
 
	//w channel
	input [31:0] w_data,
	input [3:0]  w_strb,
	input        w_last,
	input w_valid,
	output w_ready,
 
	//b channel
	output  [7:0] b_id,
	output  b_valid,
	input  b_ready,
 
	//ar channel
	input [3:0]ar_id,
	input [31:0]ar_addr,
	//input [3:0]ar_len = 0,
	input [2:0] arsize,
    //input [1:0] arburst = 2'b01,
	input ar_valid,
	output ar_ready,
 
	//r channel
	output  [7:0] r_id,
	output  [31:0] r_data,
	output        r_last,
	output        r_valid,
	input         r_ready
	
);
 
	wire ram_wr_en;
	wire ram_rd_en;
	wire [7:0] ram_wr_addr;
	wire [7:0] ram_rd_addr;
	wire [31:0] ram_wr_data;
	wire [31:0] ram_rd_data;
 
	wire aw_wren;
	wire aw_rden;
	wire [7+32+3-1:0] aw_din;
	wire [7+32+3-1:0] aw_dout;
 
	wire ar_wren;
	wire ar_rden;
	wire [7+32+3-1:0] ar_din;
	wire [7+32+3-1:0] ar_dout;
 
	wire w_wren;
	wire w_rden;
	wire [32+4-1:0] w_din;
	wire [32+4-1:0] w_dout;
	wire [4:0]	w_pointer;
 
	reg r_wren;
	wire r_rden;
	wire [32+1+8-1:0] r_din;
	wire [32+1+8-1:0] r_dout;
 
	wire [7:0]b_din ;
	wire [7:0]b_dout ;
	wire b_wren ; 
	wire b_rden ;
 
 
	wire [7:0]  id_mark;
	wire [31:0] addr_mark;
	wire [3:0]  len_mark;
	reg  [4:0]   w_counter;
	wire [4:0]  len_counter_max;
	reg w_state;
	reg w_state_start;
 
	wire [7:0]  id_mark_r;
	wire [31:0] addr_mark_r;
	wire [3:0]  len_mark_r;
	reg  [4:0]   r_counter;
	wire [4:0]  len_counter_max_r;
	reg r_state;
	reg r_state_start;
	reg r_last_prepare;
	reg [7:0] r_id_prepare;
 
	wire aw_sync,aw_full,aw_empty;
	wire ar_sync,ar_full,ar_empty,r_empty;
	wire w_sync,w_full;
	wire b_sync,b_empty;
 
 
	assign aw_ready = !aw_full;//输出到 manager
	assign w_ready  = !w_full;//输出到 manager
	assign b_valid  = !b_empty;//输出到 manager
	assign ar_ready = !ar_full;//输出到manager
	assign r_valid  = !r_empty;//输出到 manager
 
	assign aw_sync = aw_valid && aw_ready; //握手信号
	assign w_sync  = w_valid  && w_ready;//握手信号
	assign b_sync  = b_ready &&  b_valid ;//握手信号
	assign ar_sync = ar_valid && ar_ready;//握手信号
	assign r_sync  = r_ready && r_valid;//握手信号
 
 
	//-------------------------------------------------------------
	//-------------------write main logic---------------------------
	//-------------------------------------------------------------
	
	//aw fifo opreat 
	assign aw_din = {aw_id,aw_addr,aw_len}; //aw fifo data in
	assign aw_wren = aw_sync; 
	assign aw_rden = (w_counter == len_counter_max) ? 1:0; //当达到len最大的时候，开始读aw一次。
 
	//w fifo opreat 
	assign w_din = {w_data,w_strb};//w fifo data in
	assign w_wren = w_sync;
	assign w_rden = w_state && (w_counter!=1'b0); 
	//b fifo opreat 
	assign b_din =  id_mark;
	assign b_wren = (w_counter == len_counter_max) ? 1:0; 
	assign b_rden = b_sync;
	assign b_id   = b_dout;
	assign {id_mark,addr_mark,len_mark} = aw_dout;
	assign len_counter_max = len_mark + 1'b1 ;
//写开始信号产生,脉冲信号
	always@(posedge aclk or negedge aresetn)
	begin
		if(!aresetn)
	 		w_state_start <= 1'b0; 
		else begin
			if(!aw_empty && (w_pointer >= len_counter_max) && !w_state )
				w_state_start <= 1'b1;
			else
				w_state_start <= 1'b0;
		end
	end
//写信号产生,电平信号
	always@(posedge aclk or negedge aresetn)
	begin
		if(!aresetn)
			w_state <= 1'b0;
		else begin
			if(w_counter == len_counter_max)
				w_state <= 1'b0;
			else if(w_state_start)
				w_state <= 1'b1;
			else
				w_state <= w_state;
		end
	end
//计数每一个outstanding里面的transfer的数量，达到了len+1之后归零
	always@(posedge aclk or negedge aresetn)
	begin
		if(!aresetn)
			w_counter <= 5'b0;
		else begin
			if(w_counter == len_counter_max)
				w_counter <= 5'b0;
			else if(w_state)
				w_counter <= w_counter + 1'b1;
			else
				w_counter <= w_counter;
		end
	end
	//ram w
	assign ram_wr_en = w_rden;
	assign ram_wr_data = w_dout[32+4-1:4];
	assign ram_wr_addr = addr_mark[31:2] + (w_counter - 1'b1);
 
 
	//-------------------------------------------------------------
	//-------------------read main logic---------------------------
	//-------------------------------------------------------------
 
 
	//ar fifo opreat 
	assign {id_mark_r,addr_mark_r,len_mark_r} = ar_dout;
	assign ar_din = {ar_id,ar_addr,ar_len};
	assign ar_wren = ar_sync;
	assign ar_rden = (r_counter == len_counter_max_r) ? 1:0; 
 
 
	//r fifo opreat 
//r_last_prepare 
	always@(posedge aclk or negedge aresetn)
	begin
		if(!aresetn)
			r_last_prepare <= 1'b0;
		else
			r_last_prepare <= ((r_counter == len_counter_max_r) ? 1:0);
	end
//r_id_prepare
	always@(posedge aclk or negedge aresetn)
	begin
		if(!aresetn)
			r_id_prepare <= 1'b0;
		else
			r_id_prepare <= id_mark_r;
	end
 
	assign r_din = {r_id_prepare,ram_rd_data,r_last_prepare};
 
	always@(posedge aclk or negedge aresetn)// 延迟一个周期 
	begin
		if(!aresetn)
			r_wren <= 1'b0;
		else
			r_wren <= ram_rd_en;
	end
	assign r_rden = r_sync;
	assign {r_id,r_data,r_last} = r_dout;
	//----
	assign len_counter_max_r = len_mark_r + 1'b1 ;
 
	always@(posedge aclk or negedge aresetn)
	begin
		if(!aresetn)
	 		r_state_start <= 1'b0; 
		else begin
			if(!ar_empty && !r_state )
				r_state_start <= 1'b1;
			else
				r_state_start <= 1'b0;
		end
	end
	always@(posedge aclk or negedge aresetn)
	begin
		if(!aresetn)
			r_state <= 1'b0;
		else begin
			if(r_counter == len_counter_max_r)
				r_state <= 1'b0;
			else if(r_state_start)
				r_state <= 1'b1;
			else
				r_state <= r_state;
		end
	end
	always@(posedge aclk or negedge aresetn)
	begin
		if(!aresetn)
			r_counter <= 1'b0;
		else begin
			if(r_counter == len_counter_max_r)
				r_counter <= 1'b0;
			else if(r_state)
				r_counter <= r_counter + 1'b1;
			else
				r_counter <= r_counter;
		end
	end
	//ram r
	assign ram_rd_en = r_state && (r_counter!=1'b0);
	assign ram_rd_addr = addr_mark_r[31:2] + (r_counter - 1'b1);
//用于位宽补齐
wire [63:0]good0;
wire [63:0]good1;
wire [63:0]good2;
wire [63:0]good3;
wire [63:0]good4;
wire [63:0]good5;
wire [63:0]good6;
wire [63:0]good7;
wire [63:0]good8;
wire [63:0]good9;
assign good0={22'b0,aw_din};
 
assign aw_dout=good1[41:0];
 
 
 
	sync_fifo   awfifo(
		.rst_n(aresetn),
		.clk(aclk),
 
		.wr_en(aw_wren),
		.din(good0),
 
		.rd_en(aw_rden),
        	.dout(good1),	
 
		.fifo_empty(aw_empty),
		.fifo_full(aw_full)
	);
 
 
 
assign good2={28'b0,w_din};
assign w_dout=good3[35:0];
	sync_fifo   wfifo(
		.rst_n(aresetn),
		.clk(aclk),
		.wr_en(w_wren),
		.din(good2),
		.rd_en(w_rden),
        	.dout(good3),	
		.fifo_empty(),
		.fifo_full(w_full),
		.pointer(w_pointer)
	);
assign good4={56'b0,b_din};
assign b_dout=good5[7:0];
 
 
 
	sync_fifo   bfifo(
		.rst_n(aresetn),
		.clk(aclk),
 
		.wr_en(b_wren),
		.din(good4),
 
		.rd_en(b_rden),
        	.dout(good5),	
 
		.fifo_empty(b_empty),
		.fifo_full()
	);
 
assign good6={20'b0,ar_din};
assign ar_dout=good7[43:0];
	sync_fifo   arfifo(
		.rst_n(aresetn),
		.clk(aclk),
		.wr_en(ar_wren),
		.din(good6),
		.rd_en(ar_rden),
        	.dout(good7),	
		.fifo_empty(ar_empty),
		.fifo_full(ar_full)
	);
assign good8={23'b0,r_din};
assign r_dout=good9[40:0];
 
 
 
 
 
	sync_fifo   rfifo(
		.rst_n(aresetn),
		.clk(aclk),
 
		.wr_en(r_wren),
		.din(good8),
 
		.rd_en(r_rden),
        	.dout(good9),	
		.fifo_empty(r_empty),
		.fifo_full(r_full)
	);
 
 
	dpram#(.RAM_WIDTH(32),
	      .RAM_DEPTH(256),
	      .ADDR_LINE(8))
	func1(
		.wr_clk (aclk),
		.rd_clk (aclk),
		.wr_en  (ram_wr_en),
		.rd_en  (ram_rd_en),
		.wr_addr(ram_wr_addr),
		.rd_addr(ram_rd_addr),
		.wr_data(ram_wr_data),
		.rd_data(ram_rd_data)
	);
 
endmodule