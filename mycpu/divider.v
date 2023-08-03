`timescale 1ns/1ps
module divider(
    input                           clk,
    input                           rstn,
    input           [31:0]          dividend,
    input           [31:0]          divisor,
    input                           en,
    input                           flush_exception,                        //异常处理时清空除法器
    input                           sign,

    output  reg     [31:0]          quotient,
    output  reg     [31:0]          remainder,
    output                          stall_divider,
    output                          ready
);

    wire    [31:0]  dividend_abs = sign & dividend[31] ? ~dividend + 1 : dividend; //被除数的绝对值
    wire    [31:0]  divisor_abs = sign & divisor[31] ? ~divisor + 1 : divisor;     //除数的绝对值
    wire    [5:0]   digit_dividend;
    wire    [5:0]   digit_divisor;
    reg     [63:0]  dividend_reg = 0;                                       //被除数寄存器
    reg     [63:0]  divisor_reg = 0;                                        //除数寄存器
    wire    [63:0]  minus = dividend_reg - divisor_reg;                     //差值
    reg     [5:0]   digit_dividend_reg = 0;                                 //记录被除数的位数
    reg     [5:0]   digit_divisor_reg = 0;                                  //记录除数的位数
    reg             shift = 0;                                              //除数右移信号
    reg             dividend_sign = 0;                                      //记录被除数的符号
    reg             divisor_sign = 0;                                       //记录除数的符号
    reg     [5:0]   shift_count = 0;
    reg             sign_reg = 0;
    wire    [31:0]  quotient_nxt = {quotient[30:0], ~minus[63]};              //商的下一个值

    clog2 dividend_clog2(
        .in(dividend_abs),
        .out(digit_dividend)
    );
    clog2 divisor_clog2(
        .in(divisor_abs),
        .out(digit_divisor)
    );

    always @(posedge clk or negedge rstn)
    begin
        if (~rstn)
        begin
            divisor_reg <= 0;
            shift_count <= 0;
        end
        else if (flush_exception)
        begin
            divisor_reg <= 0;
            shift_count <= 0;
        end
        else if (shift)
        begin
            divisor_reg <= {1'b0, divisor_reg[63:1]};
            shift_count <= shift_count + 1;
        end
        else
        begin
            divisor_reg <= {32'b0, divisor_abs} << (digit_dividend - digit_divisor + 1);
            shift_count <= 0;
        end
    end

    localparam [2:0]
                    DIV_IDLE = 0,
                    DIV_INIT = 1,
                    DIV_CALC = 2,
                    DIV_DONE = 3,
                    DIV_HOLD = 4,
                    DIV_PREPARE = 5;

    reg     [2:0]   div_state = DIV_IDLE, div_next_state = DIV_IDLE;
    assign ready = (div_state == DIV_DONE);
    assign stall_divider = (div_state != DIV_IDLE);

    always @(posedge clk or negedge rstn)
    begin
        if(~rstn)
            div_state <= DIV_IDLE;
        else if (flush_exception)
            div_state <= DIV_IDLE;
        else
            div_state <= div_next_state;
    end

    always @(*)
    begin
        div_next_state = div_state;
        case(div_state)
            DIV_IDLE:
            begin
                if(en)
                    div_next_state = DIV_INIT;
            end
            DIV_INIT:
            begin
                if(digit_divisor_reg > digit_dividend_reg || (~|digit_divisor_reg))
                    div_next_state = DIV_HOLD;
                else 
                    div_next_state = DIV_CALC;
            end
            DIV_HOLD:
            div_next_state = DIV_DONE;
            DIV_CALC:
            begin
                if(shift_count == digit_dividend_reg - digit_divisor_reg + 1)
                    div_next_state = DIV_PREPARE;
            end
            DIV_PREPARE: div_next_state = DIV_DONE;
            DIV_DONE:
            begin
                div_next_state = DIV_IDLE;
            end
        endcase
    end

    always @(posedge clk or negedge rstn)
    begin
        if(~rstn)
        begin
            digit_dividend_reg <= 0;
            digit_divisor_reg <= 0;
            dividend_reg <= 0;
            dividend_sign <= 0;
            divisor_sign <= 0;
            quotient <= 0;
            remainder <= 0;
            shift <= 0;
            sign_reg <= 0;
        end

        else if (flush_exception)
        begin
            digit_dividend_reg <= 0;
            digit_divisor_reg <= 0;
            dividend_reg <= 0;
            dividend_sign <= 0;
            divisor_sign <= 0;
            quotient <= 0;
            remainder <= 0;
            shift <= 0;
            sign_reg <= 0;
        end

        else
            case(div_state)
                DIV_IDLE:
                begin
                    quotient <= 0;
                    remainder <= 0;
                    if(en)
                    begin
                        digit_dividend_reg <= digit_dividend;
                        digit_divisor_reg <= digit_divisor;
                        sign_reg <= sign;
                        dividend_reg <= {32'b0, dividend_abs};
                        dividend_sign <= dividend[31];
                        divisor_sign <= divisor[31];
                        shift <= 1;
                    end

                    else
                    begin
                        digit_dividend_reg <= 0;
                        digit_divisor_reg <= 0;
                        sign_reg <= 0;
                        dividend_reg <= 0;
                        dividend_sign <= 0;
                        divisor_sign <= 0;
                        shift <= 0;
                    end
                end
                DIV_INIT:
                begin
                    digit_dividend_reg <= digit_dividend_reg;
                    digit_divisor_reg <= digit_divisor_reg;
                    sign_reg <= sign_reg;
                    dividend_reg <= dividend_reg;
                    dividend_sign <= dividend_sign;
                    divisor_sign <= divisor_sign;
                    // if(digit_divisor_reg > digit_dividend_reg || (~|digit_divisor_reg))
                    // begin
                    //     shift <= 0;
                    //     quotient <= 0;
                    //     remainder <= (sign_reg & dividend_sign) ? ~dividend_reg[31:0] + 1 : dividend_reg[31:0];
                    // end
                    // else
                    if(~(digit_divisor_reg > digit_dividend_reg || (~|digit_divisor_reg)))
                    begin
                        shift <= 1;
                        quotient <= 0;
                        remainder <= 0;
                    end
                end
                DIV_HOLD:
                begin
                    shift <= 0;
                    quotient <= 0;
                    remainder <= (sign_reg & dividend_sign) ? ~dividend_reg[31:0] + 1 : dividend_reg[31:0];
                end
                DIV_CALC:
                begin
                    if(shift_count == digit_dividend_reg - digit_divisor_reg + 1)
                    begin
                        shift <= 0;
                    end

                    else
                    begin
                        shift <= 1;
                        remainder <= 0;
                        digit_dividend_reg <= digit_dividend_reg;
                        digit_divisor_reg <= digit_divisor_reg;
                        dividend_sign <= dividend_sign;
                        divisor_sign <= divisor_sign;
                        quotient <= quotient_nxt;
                        if (minus[63] == 0)
                        begin
                            dividend_reg <= minus;
                        end
                        else
                        begin
                            dividend_reg <= dividend_reg;
                        end
                    end
                end
                DIV_PREPARE: begin
                    shift <= 0;
                    quotient <= sign_reg & (dividend_sign ^ divisor_sign) ? ~quotient_nxt + 1 : quotient_nxt;
                    remainder <= (sign_reg & dividend_sign) ? ~(minus[63] ? dividend_reg[31:0] : minus[31:0]) + 1 : (minus[63] ? dividend_reg[31:0] : minus[31:0]);
                end
                DIV_DONE:
                begin
                    shift <= 0;
                    quotient <= 0;
                    remainder <= 0;
                    digit_dividend_reg <= 0;
                    sign_reg <= 0;
                    digit_divisor_reg <= 0;
                    dividend_reg <= 0;
                    dividend_sign <= 0;
                    divisor_sign <= 0;
                end
            endcase
    end


endmodule