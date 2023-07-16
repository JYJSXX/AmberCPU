/*
3bit动态分支预测器
taken/not taken 由两种2bit预测器通过计分来选择，预留了一种策略，初始状态是taken
跳转PC如果有历史记录就提供pred_pc，否则就返回not taken,这时的pred_pc=fetch_pc+8
预测表中的内容直到fact_tpc来更新
*/


module BTB #(
    parameter DEPTH=16
) (
    input               rstn,
    input               clk,
    //00 not branch;01 unconditinonal branch,10 PC relative
    //from predecoder
    input   [1:0]       inst_btype,

    input   [31:0]      fetch_pc,
    output  [31:0]      pred_pc,
    output  reg         pred_taken,

    //below signal from the same stage
    input   [31:0]      fact_pc,
    input   [31:0]      fact_tpc,//target pc from ex0
    input               fact_taken,
    input               predict_dir_fail,
    input               predict_add_fail

);
    localparam      PC_INDEX_WIDTH       =   8,
                    EASY_STRONG_TAKEN    =   2'b00,
                    EASY_STRONG_NOTAKEN  =   2'b01,
                    EASY_WEAK_TAKEN      =   2'b10,
                    EASY_WEAK_NOTAKEN    =   2'b11,
                    HARD_STRONG_TAKEN    =   2'b00,
                    HARD_STRONG_NOTAKEN  =   2'b01,
                    HARD_WEAK_TAKEN      =   2'b10,
                    HARD_WEAK_NOTAKEN    =   2'b11,
                    IDLE                 =   2'b10,
                    TOP_IDLE             =   2'b00,//static no taken
                    TOP_EASY             =   2'b01,
                    TOP_HARD             =   2'b10,
                    TOP_RESR             =   2'b11;//strategy reserved



    reg [1:0] EASY_STATE,NEXT_EASY_STATE;
    reg [1:0] HARD_STATE,NEXT_HARD_STATE;
    reg [1:0] TOP_STATE , NEXT_TOP_STATE;
    reg [1<<(PC_INDEX_WIDTH-1):0]   MASK;
    reg [1:0]  SCORE;

    wire taken;
    wire we;//TODO
    wire [31:0] pred_pc_hang;
    wire       hit;
    wire [PC_INDEX_WIDTH-1:0]       INDEX;



    assign we = fact_taken&&predict_add_fail;
    assign INDEX=fetch_pc[PC_INDEX_WIDTH-2:3] ;
    assign pred_valid=MASK[INDEX];
    assign pred_pc=pred_valid?_pred_pc:fetch_pc+8;
    assign hit = !predict_dir_fail;
    
    
    DualPortRAM#(//write after read
        .DATA_WIDTH  ( 32 ),
        .ADDR_WIDTH  ( PC_INDEX_WIDTH )
    )u_DualPortRAM(
        .clk         ( clk         ),
        .readAddrA   ( fetch_pc[PC_INDEX_WIDTH+2:3]   ),
        .readAddrB   ( fact_pc [PC_INDEX_WIDTH+2:3]   ),
        .writeAddr   ( fact_pc [PC_INDEX_WIDTH+2:3]   ),
        .writeData   ( fact_tpc   ),
        .writeEnable ( we ),
        .readDataA   ( _pred_pc   ),
        .readDataB   ( pred_pc_hang   )
    );


    always @(posedge clk or negedge rstn) begin//FSM
        if(!rstn)begin
            TOP_STATE<=TOP_IDLE;
            EASY_STATE<=IDLE;
            HARD_STATE<=IDLE;
        end else begin
            TOP_STATE<=NEXT_TOP_STATE;
            EASY_STATE<=NEXT_EASY_STATE;
            HARD_STATE<=NEXT_HARD_STATE;
        end
    end

    always @(posedge clk or negedge rstn) begin//MASK&&SCORE
        if (!rstn) begin
            MASK<=0;
            SCORE<=0;
        end else begin
            if (we) begin
                MASK[INDEX]<=1;
            end  else if(inst_btype==2'b00) begin
                MASK[INDEX]<=0;
            end
            
            case (SCORE)
                2'b00:SCORE<=hit?2'b00:2'b01;
                2'b01:SCORE<=hit?2'b00:2'b10;
                2'b10:SCORE<=hit?2'b11:2'b01;
                2'b11:SCORE<=hit?2'b11:2'b10;
                default: SCORE<=2'b10;
            endcase

        end
    end

    always @(*) begin
        case (EASY_STATE)
            EASY_STRONG_TAKEN:begin
                NEXT_EASY_STATE=fact_taken?EASY_STRONG_TAKEN:EASY_WEAK_NOTAKEN;
            end 
            EASY_STRONG_NOTAKEN:begin
                NEXT_EASY_STATE=!fact_taken?EASY_STRONG_NOTAKEN:EASY_WEAK_TAKEN;
            end
            EASY_WEAK_TAKEN:begin
                NEXT_EASY_STATE=fact_taken?EASY_STRONG_TAKEN:EASY_WEAK_NOTAKEN;
            end
            EASY_WEAK_NOTAKEN:begin
                NEXT_EASY_STATE=!fact_taken?EASY_STRONG_NOTAKEN:EASY_WEAK_TAKEN;
            end
            default: NEXT_EASY_STATE=EASY_WEAK_TAKEN;
        endcase
    end
    always @(*) begin
        case (HARD_STATE)
            HARD_STRONG_TAKEN:begin
                NEXT_HARD_STATE=fact_taken?HARD_STRONG_TAKEN:HARD_WEAK_TAKEN;
            end 
            HARD_STRONG_NOTAKEN:begin
                NEXT_HARD_STATE=!fact_taken?HARD_STRONG_NOTAKEN:HARD_WEAK_NOTAKEN;
            end
            HARD_WEAK_TAKEN:begin
                NEXT_HARD_STATE=fact_taken?HARD_STRONG_TAKEN:HARD_WEAK_NOTAKEN;
            end
            HARD_WEAK_NOTAKEN:begin
                NEXT_HARD_STATE=!fact_taken?HARD_STRONG_NOTAKEN:HARD_WEAK_TAKEN;
            end
            default: NEXT_HARD_STATE=HARD_WEAK_TAKEN;
        endcase
    end

    always @(*) begin
        case (SCORE[1])
            1'b1:NEXT_TOP_STATE=TOP_EASY;
            1'b0:NEXT_TOP_STATE=TOP_HARD;
        endcase
    end

    always @(*) begin///taken logic
        case (TOP_STATE)
            TOP_IDLE:begin
                taken=0;
            end 
            TOP_EASY:begin
                taken=~EASY_STATE[0];
            end
            TOP_HARD:begin
                taken=~HARD_STATE[0];
            end
            TOP_RESR: 
                taken=1;
        endcase

        //00 not branch;01 unconditinonal branch,10 PC relative
        case (inst_btype)
            2'b00:pred_taken=0;
            2'b01:pred_taken=1;
            2'b10:pred_taken=taken;
            default: pred_taken=taken;
        endcase
    end
endmodule