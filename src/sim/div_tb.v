`timescale 1ns / 1ps

module div_tb;

	// Inputs
	reg div_clk;
	reg resetn;
	wire div;
	reg div_signed;
	reg [31:0] x;
	reg [31:0] y;

	// Outputs
	wire [31:0] s;
	wire [31:0] r;
	wire complete;

	// Instantiate the Unit Under Test (UUT)

	divider dvd(
        .clk(div_clk),
        .rstn(resetn),
        .dividend(x),
        .divisor(y),
        .en(div),
        .flush_exception(0),
        .sign(div_signed),

        .quotient(s),
        .remainder(r),
        .ready(complete)
    );

	initial begin
		// Initialize Inputs
		resetn = 0;
      #100;
		resetn = 1;
	end
initial
begin
    div_clk = 1'b0;
    forever
    begin
	     #5 div_clk = 1'b1;
	     #5 div_clk = 1'b0;
	 end
end	

//��������������ڽ��г���
reg div_is_run;
integer wait_clk;
initial
begin
    div_is_run <= 1'b0;
    forever
    begin
	     @(posedge div_clk);
        if (!resetn || complete)
	     begin
	         div_is_run <= 1'b0;
		      wait_clk <= {$random}%4;
	     end
	     else
	     begin
	         repeat (wait_clk)@(posedge div_clk);
	         div_is_run <= 1'b1;
				wait_clk <= 0;
	     end
    end
end
//��������з��ų˷������źźͳ���
assign div = div_is_run;
always @(posedge div_clk)
begin
    if (!resetn || complete)
    begin
		  div_signed <= 1'b0;
		  x          <= 32'd0;
		  y          <= 32'd1;
    end
    else if (!div_is_run)
	 begin
		  div_signed <= {$random}%2; 
		  x          <= $random; 
		  y          <= $random;  //�������������0�ĸ��ʺ�С�������ɺ���
	 end
end

//-----{����ο����}begin
//��һ������x��y�ľ���ֵ�����ж��̺������ķ���
wire x_signed = x[31] & div_signed;               //x�ķ���λ�����޷���ʱ��Ϊ��0
wire y_signed = y[31] & div_signed;               //y�ķ���λ�����޷���ʱ��Ϊ��0
wire [31:0] x_abs;
wire [31:0] y_abs;
assign x_abs = ({32{x_signed}}^x) + x_signed;     //�˴���������������ţ�
assign y_abs = ({32{y_signed}}^y) + y_signed;     //��Ϊverilog��+�����ȼ�����
wire s_ref_signed = (x[31]^y[31]) & div_signed;   //��������  �ķ���λ�����޷���ʱ��Ϊ��0
wire r_ref_signed = x[31] & div_signed;           //�����������ķ���λ�����޷���ʱ��Ϊ��0

//�ڶ���������̺������ľ���ֵ
reg [31:0] s_ref_abs;
reg [31:0] r_ref_abs;
always @(div_clk)
begin
    s_ref_abs <= x_abs/y_abs;
    r_ref_abs <= x_abs-s_ref_abs*y_abs; 
end

//�������������̺������ķ���λ����
wire [31:0] s_ref;
wire [31:0] r_ref;
//�˴���������������ţ���Ϊverilog��+�����ȼ�����
assign s_ref = ({32{s_ref_signed}}^s_ref_abs) + {30'd0,s_ref_signed}; 
assign r_ref = ({32{r_ref_signed}}^r_ref_abs) + r_ref_signed;
//-----{����ο����}end

//�жϽ���Ƿ���ȷ
wire s_ok;
wire r_ok;
assign s_ok = s_ref==s;
assign r_ok = r_ref==r;
reg [5:0] time_out;

//������,����32λ(�������з��Ż����޷�����)��չ��33λ�з��������Ա���10������ʽ��ӡ
wire signed [32:0] x_d     = {div_signed&x[31],x};
wire signed [32:0] y_d     = {div_signed&y[31],y};
wire signed [32:0] s_d     = {div_signed&s[31],s};
wire signed [32:0] r_d     = {div_signed&r[31],r};
wire signed [32:0] s_ref_d = {div_signed&s_ref[31],s_ref};
wire signed [32:0] r_ref_d = {div_signed&r_ref[31],r_ref};
always @(posedge div_clk)
begin
    if (complete && div) //�������
    begin
	     if (s_ok && r_ok)
		  begin
		      $display("[time@%t]: x=%d, y=%d, signed=%d, s=%d, r=%d, s_OK=%b, r_OK=%b",
                      $time,x_d,y_d,div_signed,s_d,r_d,s_ok,r_ok);
		  end
		  else
		  begin
		      $display("[time@%t]Error: x=%d, y=%d, signed=%d, s=%d, r=%d, s_ref=%d, r_ref=%d, s_OK=%b, r_OK=%b",
                      $time,x_d,y_d,div_signed,s_d,r_d,s_ref_d,r_ref_d,s_ok,r_ok);
	         $finish;
		  end
    end
end
always @(posedge div_clk)
begin
    if (!resetn || !div_is_run || complete)
	 begin
	     time_out <= 6'd0;
	 end
    else
    begin
	     time_out <= time_out + 1'b1;
    end
end
always @(posedge div_clk)
begin	    
    if (time_out == 6'd36)
	 begin
		  $display("Error: div no end in 34 clk!");
		  $finish;
	 end
end
 
endmodule

