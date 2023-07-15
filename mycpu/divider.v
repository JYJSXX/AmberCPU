module divider(
    input                           clk,
    input                           rstn,
    input           [31:0]          dividend,
    input           [31:0]          divisor,
    input                           en,
    input                           flush_exception, //TODO:
    input                           sign,

    output  reg     [31:0]          quotient,
    output  reg     [31:0]          remainder,
    output                          stall_divider,
    output                          ready
);

    wire    [31:0]  dividend_abs = sign & dividend[31] ? ~dividend + 1 : dividend; //被除数的绝对值
    wire    [31:0]  divisor_abs = sign & divisor[31] ? ~divisor + 1 : divisor;     //除数的绝对值
    wire    [5:0]   digit_dividend = $clog2(dividend_abs);
    wire    [5:0]   digit_divisor = $clog2(divisor_abs);
    reg     [63:0]  dividend_reg = 0;                                       //被除数寄存器
    reg     [63:0]  divisor_reg = 0;                                        //除数寄存器
    wire    [63:0]  minus = dividend_reg - divisor_reg;                     //差值
    reg     [5:0]   digit_dividend_reg = 0;                                 //记录被除数的位数
    reg     [5:0]   digit_divisor_reg = 0;                                  //记录除数的位数
    reg             shift = 0;                                              //除数右移信号
    reg             dividend_sign = 0;                                      //记录被除数的符号
    reg             divisor_sign = 0;                                       //记录除数的符号
    reg     [5:0]   shift_count = 0;

    always @(posedge clk or negedge rstn)
    begin
        if (~rstn)
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
            divisor_reg <= {divisor_abs, 32'b0};
            shift_count <= 0;
        end
    end

    localparam [1:0]
                    DIV_IDLE = 0,
                    DIV_INIT = 1,
                    DIV_CALC = 2,
                    DIV_DONE = 3;

    reg     [1:0]   div_state = DIV_IDLE, div_next_state = DIV_IDLE;
    assign ready = (div_state == DIV_DONE);
    assign stall_divider = (div_state != DIV_IDLE);

    always @(posedge clk or negedge rstn)
    begin
        if(~rstn)
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
                    div_next_state = DIV_DONE;
                else 
                    div_next_state = DIV_CALC;
            end
            DIV_CALC:
            begin
                if(shift_count == digit_dividend_reg - digit_divisor_reg + 1)
                    div_next_state = DIV_DONE;
            end
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
            divisor_reg <= 0;
            quotient <= 0;
            remainder <= 0;
            shift <= 0;
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
                        dividend_reg <= {32'b0, dividend_abs};
                        dividend_sign <= dividend[31];
                        divisor_sign <= divisor[31];
                        shift <= 1;
                    end

                    else
                    begin
                        digit_dividend_reg <= 0;
                        digit_divisor_reg <= 0;
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
                    dividend_reg <= dividend_reg;
                    dividend_sign <= dividend_sign;
                    divisor_sign <= divisor_sign;
                    if(digit_divisor_reg > digit_dividend_reg || (~|digit_divisor_reg))
                    begin
                        shift <= 0;
                        quotient <= 0;
                        remainder <= sign & dividend_sign ? ~dividend_reg + 1 : dividend_reg;
                    end
                    else
                    begin
                        shift <= 1;
                        quotient <= 0;
                        remainder <= 0;
                    end
                end
                DIV_CALC:
                begin
                    if(shift_count == digit_dividend_reg - digit_divisor_reg + 1)
                    begin
                        shift <= 0;
                        quotient <= sign & (dividend_sign ^ divisor_sign) ? ~quotient + 1 : quotient;
                        remainder <= sign & dividend_sign ? ~minus + 1 : minus;
                    end

                    else
                    begin
                        shift <= 1;
                        dividend_reg <= minus;
                        remainder <= minus;
                        digit_dividend_reg <= digit_dividend_reg;
                        digit_divisor_reg <= digit_divisor_reg;
                        dividend_sign <= dividend_sign;
                        divisor_sign <= divisor_sign;
                        if (minus[63] == 0)
                            quotient <= {quotient[30:0], 1'b1};
                        else
                            quotient <= {quotient[30:0], 1'b0};
                    end
                end
                DIV_DONE:
                begin
                    shift <= 0;
                end
            endcase
    end


endmodule