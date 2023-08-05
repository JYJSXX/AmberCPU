module mul(
    input           clk,
    input           rstn,
    // input           mul_en,
    input   [31:0]  mul_src1,
    input   [31:0]  mul_src2,
    input           sign,
    output reg [63:0]  mul_res
);
    wire [31:0] mul_stage1_res_hh, mul_stage1_res_hl, mul_stage1_res_lh, mul_stage1_res_ll, mul_compensate;
    reg [31:0] mul_stage1_res_hh_reg = 0, mul_stage1_res_hl_reg = 0, mul_stage1_res_lh_reg = 0, mul_stage1_res_ll_reg = 0, mul_compensate_reg = 0;
    // reg en_reg = 1;
Mul_Stage_1 mul_1(
    .mul_src1(mul_src1),
    .mul_src2(mul_src2),
    .sign(sign),
    .mul_stage1_res_hh(mul_stage1_res_hh),
    .mul_stage1_res_hl(mul_stage1_res_hl),
    .mul_stage1_res_lh(mul_stage1_res_lh),
    .mul_stage1_res_ll(mul_stage1_res_ll),
    .mul_compensate(mul_compensate)
);


mul_0 m0(
    .mul_en_in(1'b1),
    .mul_rd_in(5'b0),
    .mul_sel_in(1'b0),
    .mul_sign(sign),
    .mul_sr0(mul_src1),
    .mul_sr1(mul_src2)

);
// always @(posedge clk or negedge rstn)begin
//     if (~rstn)begin
//         mul_stage1_res_hh_reg <= 0;
//         mul_stage1_res_hl_reg <= 0;
//         mul_stage1_res_lh_reg <= 0;
//         mul_stage1_res_ll_reg <= 0;
//         mul_compensate_reg <= 0;
//         en_reg <= 0;
//     end
//     else if (~mul_en)begin
//         mul_stage1_res_hh_reg <= 0;
//         mul_stage1_res_hl_reg <= 0;
//         mul_stage1_res_lh_reg <= 0;
//         mul_stage1_res_ll_reg <= 0;
//         mul_compensate_reg <= 0;
//         en_reg <= 0;
//     end
//     else begin
//         mul_stage1_res_hh_reg <= mul_stage1_res_hh;
//         mul_stage1_res_hl_reg <= mul_stage1_res_hl;
//         mul_stage1_res_lh_reg <= mul_stage1_res_lh;
//         mul_stage1_res_ll_reg <= mul_stage1_res_ll;
//         mul_compensate_reg <= mul_compensate;
//         en_reg <= 1;
//     end
// end

wire [63:0] mul_result;
Mul_Stage_2 MS2(
    .mul_stage1_res_hh(mul_stage1_res_hh),
    .mul_stage1_res_hl(mul_stage1_res_hl),
    .mul_stage1_res_lh(mul_stage1_res_lh),
    .mul_stage1_res_ll(mul_stage1_res_ll),
    .mul_compensate(mul_compensate),
    .mul_stage2_res(mul_result)
);

always @(posedge clk)begin
    if (~rstn)begin
        mul_res <= 0;
    end
    // else if (~en_reg)begin
    //     mul_res <= 0;
    // end
    else begin
        mul_res <= mul_result;
    end
end


endmodule