module EX1_FORWARD(
    //待接入alu的数据
    input [4:0] ex1_rj,
    input [4:0] ex1_rk,
    input [31:0] ex1_rj_data,
    input [31:0] ex1_rk_data,
    //从mb_ex段间输入
    input [4:0] mb_ex_rd0,
    input [4:0] mb_ex_rd1,
    input [31:0] mb_ex_data_0,
    input [31:0] mb_ex_data_1,
    input mb_ex_data_0_valid,
    input mb_ex_data_1_valid,
    //从ex1_ex2段间输入
    input [4:0] ex1_ex2_rd0,
    input [4:0] ex1_ex2_rd1,
    input ex1_ex2_data_0_valid, //可不可以前递，没算好不能前递
    input ex1_ex2_data_1_valid,
    input [31:0] ex1_ex2_data_0,
    input [31:0] ex1_ex2_data_1,
    
    //从ex2_wb段间输入
    input [4:0] ex2_wb_rd0,
    input [4:0] ex2_wb_rd1,
    input ex2_wb_data_0_valid,
    input ex2_wb_data_1_valid,
    input [31:0] ex2_wb_data_0,
    input [31:0] ex2_wb_data_1,
    //向ex1段输出
    output reg [31:0] ex1_rj_data_o,
    output reg [31:0] ex1_rk_data_o,

    output     forward_stall,
    output      forward_flag_j,
    output      forward_flag_k,
    output      [31:0] forward_data_j,
    output      [31:0] forward_data_k
);
    wire [3:0] forward_case_j;
    assign forward_case_j[0] = (ex1_rj==ex1_ex2_rd1);
    assign forward_case_j[1] = (ex1_rj==ex1_ex2_rd0);
    assign forward_case_j[2] = (ex1_rj==ex2_wb_rd1);
    assign forward_case_j[3] = (ex1_rj==ex2_wb_rd0);
    assign forward_flag_j = |forward_case_j;
    assign forward_data_j = (forward_case_j[0])?ex1_ex2_data_1:
                                (forward_case_j[1])?ex1_ex2_data_0:
                                (forward_case_j[2])?ex2_wb_data_1:
                                (forward_case_j[3])?ex2_wb_data_0:0;
    
    wire [3:0] forward_case_k;
    assign forward_case_k[0] = (ex1_rk==ex1_ex2_rd1);
    assign forward_case_k[1] = (ex1_rk==ex1_ex2_rd0);
    assign forward_case_k[2] = (ex1_rk==ex2_wb_rd1);
    assign forward_case_k[3] = (ex1_rk==ex2_wb_rd0);
    assign forward_flag_k = |forward_case_k;
    assign forward_data_k = (forward_case_k[0])?ex1_ex2_data_1:
                                (forward_case_k[1])?ex1_ex2_data_0:
                                (forward_case_k[2])?ex2_wb_data_1:
                                (forward_case_k[3])?ex2_wb_data_0:0;

    reg temp = 0;
    reg forward_stall_1 = 0;
    reg forward_stall_2 = 0;
    assign forward_stall = forward_stall_1 | forward_stall_2;
    always@(*)begin
        ex1_rj_data_o=ex1_rj_data;
        ex1_rk_data_o=ex1_rk_data;
        forward_stall_1=0;
        forward_stall_2=0;
        temp = 0;
        // forward_flag=1;
        // forward_data=0;
        if(ex1_rj!=0)begin
            if(ex1_rj == mb_ex_rd1) begin
                if(mb_ex_data_1_valid) begin
                    forward_stall_1=0;
                    ex1_rj_data_o=mb_ex_data_1;
                    // forward_flag=1;
                    // forward_data=mb_ex_data_1;
                end else begin
                    forward_stall_1=1;
                end
            end
            else if(ex1_rj == mb_ex_rd0) begin
                if(mb_ex_data_0_valid) begin
                    forward_stall_1=0;
                    ex1_rj_data_o=mb_ex_data_0;
                    // forward_flag=1;
                    // forward_data=mb_ex_data_0;
                end else begin
                    forward_stall_1=1;
                    temp = 1;
                end
            end
        else if(ex1_rj==ex1_ex2_rd1) begin
            if(ex1_ex2_data_1_valid) begin
                forward_stall_1=0;
                ex1_rj_data_o=ex1_ex2_data_1;
                // forward_flag=1;
                // forward_data=ex1_ex2_data_1;
            end else begin
                forward_stall_1=1;
            end
            
        end else if(ex1_rj==ex1_ex2_rd0) begin
            if(ex1_ex2_data_0_valid) begin
                forward_stall_1=0;
                ex1_rj_data_o=ex1_ex2_data_0;
                // forward_flag=1;
                // forward_data=ex1_ex2_data_0;
            end else begin
                forward_stall_1=1;
            end
        end else if(ex1_rj==ex2_wb_rd1) begin
            if(ex2_wb_data_1_valid)begin
                forward_stall_1=0;
                ex1_rj_data_o=ex2_wb_data_1;
                // forward_flag=1;
                // forward_data=ex2_wb_data_1;
            end else begin
                forward_stall_1=1;
            end
        end else if(ex1_rj==ex2_wb_rd0) begin
            if(ex2_wb_data_0_valid)begin
                forward_stall_1=0;
                ex1_rj_data_o=ex2_wb_data_0;
                // forward_flag=1;
                // forward_data=ex2_wb_data_0;
            end else begin
                forward_stall_1=1;
            end
        end 
        end
        // else forward_flag=0;

        if(ex1_rk!=0)begin
            if(ex1_rk == mb_ex_rd1) begin
                if(mb_ex_data_1_valid) begin
                    forward_stall_2=0;
                    ex1_rk_data_o=mb_ex_data_1;
                end else begin
                    forward_stall_2=1;
                end
            end
            else if(ex1_rk == mb_ex_rd0) begin
                if(mb_ex_data_0_valid) begin
                    forward_stall_2=0;
                    ex1_rk_data_o=mb_ex_data_0;
                end else begin
                    forward_stall_2=1;
                end
            end
        else if(ex1_rk==ex1_ex2_rd1 ) begin
            if(ex1_ex2_data_1_valid) begin
                forward_stall_2=0;
                ex1_rk_data_o=ex1_ex2_data_1;
            end else begin
                forward_stall_2=1;
            end
            
        end else if(ex1_rk==ex1_ex2_rd0) begin
            if(ex1_ex2_data_0_valid) begin
                forward_stall_2=0;
                ex1_rk_data_o=ex1_ex2_data_0;
            end else begin
                forward_stall_2=1;
            end
        
        end else if(ex1_rk==ex2_wb_rd1) begin
            if(ex2_wb_data_1_valid)begin
                forward_stall_2=0;
                ex1_rk_data_o=ex2_wb_data_1;
            end else begin
                forward_stall_2=1;
            end
        end else if(ex1_rk==ex2_wb_rd0) begin
            if(ex2_wb_data_0_valid)begin
                forward_stall_2=0;
                ex1_rk_data_o=ex2_wb_data_0;
            end else begin
                forward_stall_2=1;
            end
        end
        end

    end
endmodule