module EX1_FORWARD(
    //待接入alu的数据
    input [4:0] ex1_rj,
    input [4:0] ex1_rk,
    input [31:0] ex1_rj_data,
    input [31:0] ex1_rk_data,
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

    output reg forward_stall
);
    always@(*)begin
        ex1_rj_data_o=ex1_rj_data;
        ex1_rk_data_o=ex1_rk_data;
        forward_stall=0;
        if(ex1_rj!=0)begin
        if(ex1_rj==ex1_ex2_rd1) begin
            if(ex1_ex2_data_1_valid) begin
                forward_stall=0;
                ex1_rj_data_o=ex1_ex2_data_1;
            end else begin
                forward_stall=1;
            end
            
        end else if(ex1_rj==ex1_ex2_rd0) begin
            if(ex1_ex2_data_0_valid) begin
                forward_stall=0;
                ex1_rj_data_o=ex1_ex2_data_0;
            end else begin
                forward_stall=1;
            end
        
        end else if(ex1_rj==ex2_wb_rd1) begin
            if(ex2_wb_data_1_valid)begin
                forward_stall=0;
                ex1_rj_data_o=ex2_wb_data_1;
            end else begin
                forward_stall=1;
            end
        end else if(ex1_rj==ex2_wb_rd0) begin
            if(ex2_wb_data_0_valid)begin
                forward_stall=0;
                ex1_rj_data_o=ex2_wb_data_0;
            end else begin
                forward_stall=1;
            end
        end 
        end

        if(ex1_rk!=0)begin
        if(ex1_rk==ex1_ex2_rd1 ) begin
            if(ex1_ex2_data_1_valid) begin
                forward_stall=0;
                ex1_rk_data_o=ex1_ex2_data_1;
            end else begin
                forward_stall=1;
            end
            
        end else if(ex1_rk==ex1_ex2_rd0) begin
            if(ex1_ex2_data_0_valid) begin
                forward_stall=0;
                ex1_rk_data_o=ex1_ex2_data_0;
            end else begin
                forward_stall=1;
            end
        
        end else if(ex1_rk==ex2_wb_rd1) begin
            if(ex2_wb_data_1_valid)begin
                forward_stall=0;
                ex1_rk_data_o=ex2_wb_data_1;
            end else begin
                forward_stall=1;
            end
        end else if(ex1_rk==ex2_wb_rd0) begin
            if(ex2_wb_data_0_valid)begin
                forward_stall=0;
                ex1_rk_data_o=ex2_wb_data_0;
            end else begin
                forward_stall=1;
            end
        end
        end

    end
endmodule