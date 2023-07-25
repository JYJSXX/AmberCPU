`include "define.vh"

module EX_Privilege(
    input                               clk,
    input                               rstn,

    input                               en,             //使能信号 valid信号
    input           [31:0]              rk_data,        //R[rk]
    input           [31:0]              rj_data,        //R[rj]
    input           [31:0]              ins,            //指令
    input           [`WIDTH_UOP - 1 : 0] pr_type,        //指令类型
    output   reg                        done,           //特权指令握手ready信号

    //CSR
    output  reg     [13:0]              csr_addr,       //csr 读写地址
    output  reg     [31:0]              csr_wdata,      //csr 写数据
    output  reg                         csr_wen,        //csr 写使能
    output  reg                         csr_ren,        //csr 读使能
    input           [31:0]              csr_rdata,      //csr 读数据
    output  reg     [31:0]              csr_rdata_reg,  //csr -> rd 写数据
    //CACOP
    output          [1:0]               cacop_ins_type, //cacop 指令类型
    output          [31:0]              cacop_vaddr,    //cacop 虚拟地址
    output  reg                         cacop_i_en,     //cacop icache使能
    output  reg                         cacop_d_en,     //cacop dcache使能
    input                               cacop_i_ready,  //cacop icache ar通道握手
    input                               cacop_d_ready,  //cacop dcache ar通道握手
    input                               cacop_i_done,   //cacop icache r通道握手
    input                               cacop_d_done,    //cacop dcache r通道握手
    //ERTN
    output  reg                         ertn_en,        //ertn使能
    //IDLE
    input                               i_idle,         //i_cache 是否处于idle状态
    input                               d_idle,         //d_cache 是否处于idle状态
    output  reg                         block_cache,    //是否阻塞cache
    output  reg                         block_clock,     //是否阻塞时钟

    //TLB
    input                               tlbsrch_ready,  //tlb告诉exe已经查完了
    output   reg                        tlbsrch_valid,        //exe告诉tlb按值查找得到索引
    input                               tlbrd_ready,    //tlb告诉exe已经读完了
    output   reg                        tlbrd_valid,          //exe告诉tlb按索引读取
    input                               tlbwr_ready,    //tlb告诉exe已经写完了
    output   reg                        tlbwr_valid,          //exe告诉tlb写入
    input                               tlbfill_ready,  //tlb告诉exe已经填完了
    output   reg                        tlbfill_valid,        //exe告诉tlb写入
    input                               invtlb_ready,   //tlb告诉exe已经写完了
    output   reg                        invtlb_valid,         //exe告诉tlb写入
    output           [4:0]              invtlb_op,
    output           [31:0]             invtlb_asid,
    output           [18:0]             invtlb_va
    
);
    assign invtlb_op = ins[4:0];
    assign invtlb_asid = rj_data;
    assign invtlb_va = rk_data[31:13];
    wire [1:0] pri_tlb_type;
    wire invtlb;
    assign pri_tlb_type=ins[11:10]; //10 TLBSRCH  11 TLBRD  00 TLBWR  01 TLBFILL
    assign invtlb=ins[16];
    wire    [13:0]      csr_num = ins[23:10];
    wire    [4:0]       rj = ins[9:5];
    wire                isxchg = |rj[4:1];

    assign cacop_ins_type = ins[4:3];
    wire is_icache = pr_type[`INS_CACHE] & (ins[2:0] == 3'b000);
    wire is_dcache = pr_type[`INS_CACHE] & (ins[2:0] == 3'b001);
    wire [11:0] imm = ins[21:10];
    wire [31:0] imm_ext = {{20{imm[11]}}, imm};
    assign cacop_vaddr = rj_data + imm_ext;

    localparam [4:0] 
        PR_INIT = 0,
        PR_CSR = 1,
        PR_CACOP_I_CALL = 2,
        PR_CACOP_I_WAIT = 3,
        PR_CACOP_D_CALL = 4,
        PR_CACOP_D_WAIT = 5,
        PR_ERTN = 6,
        PR_IDLE_WAIT = 7,
        PR_IDLE = 8,
        PR_TLBSRCH = 9,
        PR_TLBRD = 10,
        PR_TLBWR = 11,
        PR_TLBFILL = 12,
        PR_TLBINV = 13;

    reg [4:0] PR_state = PR_INIT, PR_next_state = PR_INIT;

    always @(posedge clk or negedge rstn)
    begin
        if(~rstn)
            PR_state <= PR_INIT;
        else
            PR_state <= PR_next_state;
    end

    always @(*)
    begin
        PR_next_state = PR_state;
        case(PR_state)
            PR_INIT:
            begin
                if(en)
                begin
                    if(pr_type[`INS_CSR])
                        PR_next_state = PR_CSR;
                    else if (is_icache)
                        PR_next_state = PR_CACOP_I_CALL;
                    else if (is_dcache)
                        PR_next_state = PR_CACOP_D_CALL;
                    else if (pr_type[`INS_ERTN])
                        PR_next_state = PR_ERTN;
                    else if (pr_type[`INS_IDLE])
                        PR_next_state = PR_IDLE_WAIT;
                    else if(pr_type[`INS_TLB] && pri_tlb_type == 2'b10)
                        PR_next_state = PR_TLBSRCH;
                    else if(pr_type[`INS_TLB] && pri_tlb_type == 2'b11)
                        PR_next_state = PR_TLBRD;
                    else if(pr_type[`INS_TLB] && pri_tlb_type == 2'b00)
                        PR_next_state = PR_TLBWR;
                    else if(pr_type[`INS_TLB] && pri_tlb_type == 2'b01)
                        PR_next_state = PR_TLBFILL;
                    else if(pr_type[`INS_TLB] && invtlb)
                        PR_next_state = PR_TLBINV;
                    else
                        PR_next_state = PR_INIT;
                end
            end
            PR_CSR:
            begin
                PR_next_state = PR_INIT;
            end
            PR_CACOP_I_CALL:
            begin
                if(cacop_i_ready)
                    PR_next_state = PR_CACOP_I_WAIT;
            end
            PR_CACOP_I_WAIT:
            begin
                if(cacop_i_done)
                    PR_next_state = PR_INIT;
            end
            PR_CACOP_D_CALL:
            begin
                if(cacop_d_ready)
                    PR_next_state = PR_CACOP_D_WAIT;
            end
            PR_CACOP_D_WAIT:
            begin
                if(cacop_d_done)
                    PR_next_state = PR_INIT;
            end
            PR_ERTN:
            begin
                PR_next_state = PR_INIT;
            end
            PR_IDLE_WAIT:
            begin
                if(i_idle & d_idle)
                    PR_next_state = PR_IDLE;
            end
            PR_IDLE:
            begin
                PR_next_state = PR_INIT;
            end
            PR_TLBSRCH:
            begin
                if(tlbsrch_ready)
                    PR_next_state = PR_INIT;
                else
                    PR_next_state = PR_TLBSRCH;
            end
            PR_TLBRD:
            begin
                if(tlbrd_ready)
                    PR_next_state = PR_INIT;
                else
                    PR_next_state = PR_TLBRD;
            end
            PR_TLBWR:
            begin
                if(tlbwr_ready)
                    PR_next_state = PR_INIT;
                else
                    PR_next_state = PR_TLBWR;
            end
            PR_TLBFILL:
            begin
                if(tlbfill_ready)
                    PR_next_state = PR_INIT;
                else
                    PR_next_state = PR_TLBFILL;
            end
            PR_TLBINV:
            begin
                if(invtlb_ready)
                    PR_next_state = PR_INIT;
                else
                    PR_next_state = PR_TLBINV;
            end
            default:
                PR_next_state = PR_INIT;
        endcase
    end

    always @(*)
    begin
        csr_addr = 0;
        csr_wdata = 0;
        csr_wen = 0;
        csr_ren = 0;
        done = 0;
        ertn_en = 0;
        block_cache = 0;
        block_clock = 0;
        tlbsrch_valid = 0;
        tlbrd_valid = 0;
        tlbwr_valid = 0;
        tlbfill_valid = 0;
        invtlb_valid = 0;
        case(PR_state)
            PR_INIT:
            begin
                if(en & pr_type[`INS_CSR])
                begin
                    csr_addr = csr_num;
                    csr_ren = 1;
                end
                else if (en & pr_type[`INS_ERTN])
                    ertn_en = 1;
                else if (en & pr_type[`INS_IDLE])
                    block_cache = 1;
                else if(en && pr_type[`INS_TLB] && pri_tlb_type == 2'b10)
                    tlbsrch_valid = 1;
                else if(en && pr_type[`INS_TLB] && pri_tlb_type == 2'b11)
                    tlbrd_valid = 1;
                else if(en && pr_type[`INS_TLB] && pri_tlb_type == 2'b00)
                    tlbwr_valid = 1;
                else if(en && pr_type[`INS_TLB] && pri_tlb_type == 2'b01)
                    tlbfill_valid = 1;
                else if(en && pr_type[`INS_TLB] && invtlb)
                    invtlb_valid = 1;
            end
            PR_CSR:
            begin
                csr_addr = csr_num;
                csr_wdata = isxchg ? ((~rj_data & csr_rdata_reg) | (rj_data & rk_data)) : rk_data;
                csr_wen = |rj;
                csr_ren = 1;
                done = 1;
            end
            PR_CACOP_I_WAIT:
            begin
                if (cacop_i_done)
                    done = 1;
            end
            PR_CACOP_D_WAIT:
            begin
                if (cacop_d_done)
                    done = 1;
            end
            PR_ERTN:
            begin
                done = 1;
            end
            PR_IDLE_WAIT:
            begin
                block_cache = 1;
            end
            PR_IDLE:
            begin
                block_clock = 1;
                block_cache = 1;
                done = 1;
            end
            PR_TLBSRCH:
            if (tlbsrch_ready)
                done=1;
            PR_TLBRD:
            if(tlbrd_ready)
                done=1;
            PR_TLBWR:
            if(tlbwr_ready)
                done=1;
            PR_TLBFILL:
            if(tlbfill_ready)
                done=1;
            PR_TLBINV:
            if(invtlb_ready)
                done=1;
            default:
                done = 0;
        endcase
    end

    always @(posedge clk or negedge rstn)
    begin
        if (~rstn)
        begin
            cacop_i_en <= 0;
            cacop_d_en <= 0;
            csr_rdata_reg <= 0;
        end
        else
        begin
            case(PR_state)
                PR_INIT:
                begin
                    cacop_i_en <= 0;
                    cacop_d_en <= 0;
                    if (en & pr_type[`INS_CSR])
                        csr_rdata_reg <= csr_rdata;
                end
                PR_CACOP_I_CALL:
                begin
                    cacop_d_en <= 0;
                    if(cacop_i_ready)
                        cacop_i_en <= 0;
                    else cacop_i_en <= 1;
                end
                PR_CACOP_I_WAIT:
                begin
                    cacop_i_en <= 0;
                    cacop_d_en <= 0;
                end
                PR_CACOP_D_CALL:
                begin
                    cacop_i_en <= 0;
                    if (cacop_d_en)
                        cacop_d_en <= 0;
                    else cacop_d_en <= 1;
                end
                PR_CACOP_D_WAIT:
                begin
                    cacop_i_en <= 0;
                    cacop_d_en <= 0;
                end
                default: ;
            endcase
        end
    end

    
endmodule