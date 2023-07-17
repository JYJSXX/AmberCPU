
module pc_reg(

	input aclk,
	input aresetn,
    input[4:0] stall,
    input flush,
    input flush_cause,
    
    input               stallreq_from_icache,
    input               branch_flag,
    input[31:0] npc_actual,
    input[31:0] ex_pc,
    input[31:0] npc_from_cache,
	input[31:0] epc,
	input               ibuffer_full,
	
	output reg[31:0] pc,
	output reg rreq_to_icache
	
);
    
    reg[31:0] npc;
    always @(posedge aclk) begin
        if(~aresetn)
            //龙芯架构32位精简版参考手册  p55 中断例外章节结尾
            pc <= 32'h1C000000;
        else if(set_pc_by_wb)
            pc <= pc_writeback; //出现中断时，pc_writeback会被赋值为中断向量地址，内容由CSR控制
        else if(set_pc_by_ex)
            pc <= pc_executer; //由于跳转或特权指令
        else if(set_pc_by_id)
            pc <= pc_decoder; //受分支预测相关控制
        else if(pc_stall_n)
            pc <= pc_next; //icache未准备好或if_buf已满，pc_next见分支预测器
    end
    always @ (*) begin
        if (resetn == `RstEnable) npc = `Entry;
        else if (flush == `Flush && flush_cause == `Exception) npc = epc;
        else if (flush == `Flush && flush_cause == `FailedBranchPrediction && branch_flag == `Branch) npc = npc_actual;
        else if (flush == `Flush && flush_cause == `FailedBranchPrediction && branch_flag == `NotBranch) npc = ex_pc + 32'h8;
        else if (ibuffer_full) npc = pc;
        else npc = npc_from_cache;
    end
    
    always @ (*) begin
        if (resetn == `RstEnable || flush == `Flush || ibuffer_full) rreq_to_icache = `ReadDisable;
        else rreq_to_icache = `ReadEnable;
    end
    
    always @ (posedge clk) pc <= npc;
    
    
    //////////////////////////
    reg [31:0] branch_count;
    reg [31:0] hit_count;
    
    always@(posedge clk)begin
        if(resetn == `RstEnable)begin
            branch_count <= 0;
            hit_count<= 0;
        end else begin
            if(branch_flag)begin
                branch_count <= branch_count + 1;
            end 
            if(branch_flag && !(branch_flag & flush & flush_cause))begin
                hit_count <= hit_count + 1;
            end
        end
    end
    /////////////////////////
    
endmodule