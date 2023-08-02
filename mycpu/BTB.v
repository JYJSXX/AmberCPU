/*
3bit动态分支预测器
taken/not taken 由两种2bit预测器通过计分来选择，预留了一种策略，初始状态是taken
跳转PC如果有taken就根据历史记录就提供pred_pc，否则就返回not taken,这时的pred_pc=fetch_pc+8
预测表中的内容直到fact_tpc来更新
区分
1.非跳转指令       BPOS对应index=0
2.无条件跳转指令    UPOS对应index=1
3.条件跳转指令      BPOS对应index=1

00 not branch;01 unconditinonal branch
10 PC relative 11 indirect(uncondition too)

2224/90296
2235/90530
*/
`include "config.vh"

module BTB #(
    parameter PC_INDEX_WIDTH       =   8
) (
    input               rstn,
    input               clk,
    input               if0_allowin,
    //00 not branch;01 unconditinonal branch
    //10 PC relative 11 indirect(uncondition too)
    //from predecoder
    input   [1:0]       inst_btype,
    input   [PC_INDEX_WIDTH-1:0] inst_index,

    input   [31:0]      fetch_pc,
    output  [31:0]      pred_pc,
    output  [1 :0]      pred_taken,

    //below signal from the same stage
    input   [31:0]      fact_pc,
    input   [31:0]      fact_tpc,//target pc from ex0
    input               fact_taken,
    input               predict_dir_fail,
    input               predict_add_fail

);
    `ifdef BTB_CLOSE
        assign pred_pc=fetch_pc+8;  
        assign pred_taken=0;

    `endif

    `ifndef BTB_CLOSE
        localparam      EASY_STRONG_TAKEN    =   2'b00,
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
                        TOP_LOCAL            =   2'b11;//strategy reserved


    reg [1:0] EASY_STATE=0,NEXT_EASY_STATE=0;
    reg [1:0] HARD_STATE=0,NEXT_HARD_STATE=0;
    reg [1:0] TOP_STATE=0, NEXT_TOP_STATE=0;
    reg [(1<<PC_INDEX_WIDTH)-1:0]   UMASK=0;
    reg [(1<<PC_INDEX_WIDTH)-1:0]   BMASK=0;
    reg [2:0]                       SCORE=0;
    reg                             taken=0;
    reg [1:0]                       btype=0;//reg for temp save
    reg [(PC_INDEX_WIDTH-1):0]      bindex=0;



    wire                            we;
    wire [31:0]                     guess_pc;
    wire [PC_INDEX_WIDTH-1:0]       INDEX;
    wire [PC_INDEX_WIDTH-1:0]       FACT_INDEX;
    wire                            pred_valid;
    wire                            check=(pred_pc!=PCAdd)&&(pred_taken!=2'b00);
    wire [31:0]                     pred_pc_hang;
    wire                            local_taken;
    wire                            hit;
    wire                            Bhit;//from predecoder
    wire                            Uhit;
    wire                            check_Bhit;
    wire                            check_Uhit;
    wire [31:0]                     PCAdd;



    assign we = fact_taken;
    assign INDEX={fetch_pc[19],fetch_pc[16:12],fetch_pc[5:4]};
    // assign FACT_INDEX=fact_pc[PC_INDEX_WIDTH+2:3];
    assign FACT_INDEX={fact_pc[19],fact_pc[16:12],fact_pc[5:4]};
    assign hit=taken==fact_taken;//全局检查
    assign Bhit=BMASK[INDEX];
    assign Uhit=UMASK[INDEX];
    assign check_Bhit=BMASK[INDEX];
    assign check_Uhit=UMASK[INDEX];
    assign PCAdd     =  fetch_pc[2]?fetch_pc+4:fetch_pc+8;
    // assign pred_taken=Uhit?1:taken;
    // assign pred_pc   =  pred_taken?
    //                     (guess_pc==0)?PCAdd:
    //                                     guess_pc:PCAdd;
    assign      pred_taken=guess_pc==0?0:
                                    Uhit?1:
                                        Bhit?{1'b0,taken}:2'b00;
    assign      pred_pc   = (pred_taken!=2'b00)?guess_pc:PCAdd;
    
    `ifdef BTB_LOG
        reg [31:0] suc_cnt=0;
        reg [31:0] tot_cnt=0;
        reg [31:0] fal_dir_cnt=0;
        reg [31:0] fal_add_cnt=0;

        reg [31:0] last_pc;
        always @(posedge clk or negedge rstn) begin
            last_pc<=fetch_pc;
            if(!rstn)begin
                suc_cnt<=0;
                tot_cnt<=0;
                fal_add_cnt<=0;
                fal_dir_cnt<=0;
                last_pc<=0;
            end else if(last_pc!=fetch_pc)begin
                tot_cnt<=tot_cnt+1;
                fal_add_cnt<=predict_add_fail?fal_add_cnt+1:fal_add_cnt;
                fal_dir_cnt<=predict_dir_fail?fal_dir_cnt+1:fal_dir_cnt;
            end
        end

    `endif
    
    DualPortRAM #(
        //write after read,for conditional branch(btype =10)
        //for PC colloct
        .DATA_WIDTH  ( 32 ),
        .ADDR_WIDTH  ( PC_INDEX_WIDTH )
    )u_DualPortRAM(
        .clk         ( clk         ),
        .readAddrA   ( INDEX       ),
        .readAddrB   ( FACT_INDEX  ),
        .writeAddr   ( FACT_INDEX  ),
        .writeData   ( fact_tpc    ),
        .writeEnable ( we          ),
        .readDataA   ( guess_pc    ),
        .readDataB   ( pred_pc_hang)
    );

    BTB_local u_BTB_local(//for local taken predict
        .clk        ( clk        ),
        .rstn       ( rstn       ),
        .fetch_pc   ( fetch_pc   ),
        .fact_tpc   ( fact_tpc   ),
        .fact_taken ( fact_taken ),
        .pred_taken ( local_taken)
    );



    always @(posedge clk or negedge rstn) begin//FSM
        if(!rstn)begin
            TOP_STATE<=TOP_IDLE;
            EASY_STATE<=IDLE;
            HARD_STATE<=IDLE;
        end else if(if0_allowin)begin
            TOP_STATE<=NEXT_TOP_STATE;
            EASY_STATE<=NEXT_EASY_STATE;
            HARD_STATE<=NEXT_HARD_STATE;
        end
    end

    always @(posedge clk or negedge rstn) begin//MASK&&SCORE
        if (!rstn) begin
            SCORE<=3'b000;
        end
        else begin
            case (SCORE)
                3'b000:SCORE<=hit?3'b000:3'b001;
                3'b001:SCORE<=hit?3'b001:3'b010;
                3'b010:SCORE<=hit?3'b010:3'b011;
                3'b011:SCORE<=hit?3'b010:3'b100;
                3'b100:SCORE<=hit?3'b100:3'b011;
                default:SCORE<=3'b100;
            endcase

        end 
    end
    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            btype<=0;
            bindex<=0;
        end else begin
            btype<=inst_btype;
            bindex<=inst_index;
        end
    end
    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            UMASK<=0;
        end else begin
            if(check_Uhit==1&&!btype[0])UMASK<=0;
            else if(btype[0])begin
                UMASK[INDEX]<=1;
            end
        end
    end
    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            BMASK<=0;
        end else begin
            if(check_Bhit==1&&btype!=2'b00)BMASK[bindex]<=0;
            else if(btype!=2'b00)begin
                BMASK[bindex]<=1;
            end
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
    end//0.217066
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
        if(SCORE==3'b010||SCORE==3'b011)begin
            NEXT_TOP_STATE=TOP_LOCAL;
        end else if(SCORE==3'b001)begin
            NEXT_TOP_STATE=TOP_EASY;
        end else if(SCORE==3'b100)begin
            NEXT_TOP_STATE=TOP_HARD;
        end else if(SCORE==3'b000)begin
            NEXT_TOP_STATE=TOP_IDLE;
        end else begin
            NEXT_TOP_STATE=TOP_LOCAL;
        end
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
            TOP_LOCAL: 
                taken=local_taken;
        endcase
    end

    `endif
    wire a;
endmodule