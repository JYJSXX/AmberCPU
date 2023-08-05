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
    parameter PC_INDEX_WIDTH       =   6
) (
    input               rstn,
    input               clk,
    input               if0_allowin,
    //00 not branch;01 unconditinonal branch
    //10 PC relative 11 indirect(uncondition too)
    //from predecoder
    input   [1:0]       inst_btype,
    input   [31:0]      inst_pc,

    input   [31:0]      fetch_pc,
    input   [31:0]      nex_pc,
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
    reg [1:0]                       taken=0;
    reg [1:0]                       btype=0;//reg for temp save
    reg [(PC_INDEX_WIDTH-1):0]      bindex=0;



    wire                            we;
    wire                            hash_we;
    wire                            adv_we;
    wire                            local_we;

    wire [31:0]                     PCAdd;
    wire [PC_INDEX_WIDTH-1:0]       HASH_INDEX;
    wire [PC_INDEX_WIDTH-1:0]       HASH_FACT_INDEX;
    wire [PC_INDEX_WIDTH-1:0]       INDEX;
    wire [PC_INDEX_WIDTH-1:0]       FACT_INDEX;
    wire [PC_INDEX_WIDTH-1:0]       PRE_INDEX;
    wire                            pred_valid;
    wire                            check=(pred_pc!=PCAdd)&&(pred_taken!=2'b00);
    wire [31:0]                     pred_pc_hang;
    wire [1 :0]                     local_taken;

    wire [31:0]                     adv_pred_pc;
    wire [1 :0]                     adv_taken;

    wire                            hit;
    wire                            Bhit;//from IF0
    wire                            Uhit;
    wire                            adv_hit;
    wire                            check_Bhit;//from pre_decoder
    wire                            check_Uhit;
    wire [1:0]                      check_taken;



    assign we       = fact_taken;
    assign hash_we  = 1'b1;
    assign local_we = predict_add_fail;
    assign adv_we   = fact_taken&&(predict_add_fail||predict_dir_fail);

    assign INDEX=fetch_pc[PC_INDEX_WIDTH+2:3];
    // assign HASH_INDEX={fetch_pc[12],fetch_pc[10],fetch_pc[8:3]};

    assign FACT_INDEX=fact_pc[PC_INDEX_WIDTH+2:3];
    // assign HASH_FACT_INDEX={fact_pc[12],fact_pc[10],fact_pc[8:3]};

    assign hit=taken==check_taken;//全局检查
    assign Bhit=BMASK[INDEX];
    assign Uhit=UMASK[INDEX];
    assign check_Bhit=BMASK[PRE_INDEX];
    assign check_Uhit=UMASK[PRE_INDEX];
    assign PCAdd     =  fetch_pc[2]?fetch_pc+4:fetch_pc+8;

    assign         pred_taken= adv_hit?adv_taken:2'b00;
    assign         pred_pc   = (pred_taken!=2'b00)?adv_pred_pc:PCAdd;
    
    `ifdef BTB_LOG
        reg [31:0] suc_cnt=0;
        reg [31:0] tot_cnt=0;
        reg [31:0] fal_dir_cnt=0;
        reg [31:0] fal_add_cnt=0;
        reg [31:0] br_tot=0;

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
                br_tot<=fact_taken?br_tot+1:br_tot;
                fal_add_cnt<=predict_add_fail?fal_add_cnt+1:fal_add_cnt;
                fal_dir_cnt<=predict_dir_fail?fal_dir_cnt+1:fal_dir_cnt;
                suc_cnt<=(fact_taken&&!predict_add_fail&&!predict_dir_fail)?suc_cnt+1:suc_cnt;
            end
        end

    `endif

    BTB_advance u_BTB_advance(
        .rstn           ( rstn        ),
        .clk            ( clk         ),
        .fetch_pc       ( fetch_pc    ),
        .pred_pc        ( adv_pred_pc ),
        .pred_taken     ( adv_taken   ),
        .fact_taken     ( fact_taken  ),
        .fact_pc        ( fact_pc     ),
        .fact_tpc       ( fact_tpc    ),
        .predict_dir_fail(predict_dir_fail),
        .predict_add_fail(predict_add_fail),
        .hit            ( adv_hit)
    );




    always @(posedge clk or negedge rstn) begin
        if(!rstn)begin
            btype<=0;
            bindex<=0;
        end else begin
            btype<=inst_btype;
            bindex<=inst_pc[PC_INDEX_WIDTH+2:3];
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
    `endif
endmodule