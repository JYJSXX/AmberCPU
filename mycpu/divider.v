module divider(
    input                           clk,
    input                           rstn,
    input           [31:0]          dividend,
    input           [31:0]          divisor,
    input                           en,
    input                           flush_exception,

    output  reg     [31:0]          quotient,
    output  reg     [31:0]          remainder,
    output                          stall_divider,
    output                          ready
);

    wire    [5:0]   digit_dividend = $clog2(dividend);
    wire    [5:0]   digit_divisor = $clog2(divisor);
    reg     [63:0]  dividend_reg = 0;
    reg     [63:0]  divisor_reg = 0;
    reg             shift = 0;

    always @(posedge clk or negedge rstn)
    begin
        if (~rstn)
            divisor_reg <= 0;
        else if (shift)
            divisor_reg <= {1'b0, divisor_reg[63:1]};
        else
            divisor_reg <= {divisor, 32'b0};
    end

    localparam [1:0]
                    DIV_IDLE = 0,
                    DIV_CALC = 1,
                    DIV_DONE = 2;

    reg     [1:0]   div_state = DIV_IDLE, div_next_state = DIV_IDLE;
    assign ready = (div_state == DIV_DONE);

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
                    if (digit_divisor > digit_dividend || digit_divisor == 0)
                        div_next_state = DIV_DONE;
                    else
                        div_next_state = DIV_CALC;
            end
            DIV_CALC:
            begin
                if(dividend_reg >= divisor_reg)
                    div_next_state = DIV_DONE;
            end
            DIV_DONE:
            begin
                if(flush_exception)
                    div_next_state = DIV_IDLE;
            end
        endcase
    end

    always @(posedge clk or negedge rstn)
    begin
        if(~rstn)
        begin
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
                    if(en)
                    begin
                        if (digit_divisor > digit_dividend || digit_divisor == 0)
                        begin
                            dividend_reg <= 0;
                            divisor_reg <= 0;
                            quotient <= 0;
                            remainder <= dividend;
                        end
                    end

                    else
                    begin
                        dividend_reg <= 0;
                        divisor_reg <= 0;
                    end
                end
                DIV_CALC:
                begin
                    dividend_reg <= dividend_reg - divisor_reg;
                end
                DIV_DONE:
                begin
                    dividend_reg <= dividend_reg;
                    divisor_reg <= divisor_reg;
                end
            endcase
    end


endmodule