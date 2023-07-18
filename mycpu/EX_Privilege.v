`include "define.vh"

module EX_Privilege(
    input                               clk,
    input                               rstn,

    input                               en,             //使能信号 valid信号
    input           [31:0]              rd_data,        //R[rd]
    input           [31:0]              rj_data,        //R[rj]
    input           [31:0]              ins,            //指令
    input           [WIDTH_UOP - 1 : 0] pr_type,        //指令类型
    output                              done,           //特权指令握手ready信号

    //CSR
    output  reg     [31:0]              csr_addr,       //csr 读写地址
    output  reg     [31:0]              csr_wdata,      //csr 写数据
    output  reg                         csr_wen,        //csr 写使能
    output  reg                         csr_ren,        //csr 读使能
    input           [31:0]              csr_rdata,      //csr 读数据
    output  reg     [31:0]              csr_rdata_reg,  //csr -> rj 写数据
    //CACOP
    output  reg     [1:0]               cacop_ins_type, //cacop 指令类型
    output          [31:0]              cacop_vaddr,    //cacop 虚拟地址
    output  reg                         cacop_i_en,     //cacop icache使能
    output  reg                         cacop_d_en,     //cacop dcache使能
    input                               cacop_i_ready,  //cacop icache ar通道握手
    input                               cacop_d_ready,  //cacop dcache ar通道握手
    input                               cacop_i_done,   //cacop icache r通道握手
    input                               cacop_d_done    //cacop dcache r通道握手
    //ERTN
    output  reg                         ertn_en,        //ertn使能
    //IDLE
    input                               i_idle,         //i_cache 是否处于idle状态
    input                               d_idle,         //d_cache 是否处于idle状态
    output  reg                         block_cache,    //是否阻塞cache
    output  reg                         block_clock     //是否阻塞时钟
    
);

    wire    [13:0]      csr_num = ins[23:10];
    wire    [4:0]       rj = ins[9:5];
    wire                isxchg = |rj[4:1];

    assign cacop_ins_type = ins[4:3];
    wire is_icache = cacop_ins_type == pr_type[`INS_CACHE] & (ins[2:0] == 3'b000);
    wire is_dcache = cacop_ins_type == pr_type[`INS_CACHE] & (ins[2:0] == 3'b001);
    wire [11:0] imm = ins[21:10]
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
        PR_IDLE = 8;
    reg [4:0] PR_state = PR_INIT, PR_next_state = PR_INIT;

    always @(posedge clk or negedge rstn)
    begin
        if(~rstn)
            PR_state <= PR_INIT;
        else
            PR_state <= next_state;
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
            end
            PR_CSR:
            begin
                csr_addr = csr_num;
                csr_wdata = isxchg ? ((~rj_data & csr_rdata_reg) | (rj_data & rd_data)) : rd_data;
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
                block_cache = 1
            end
            PR_IDLE:
            begin
                block_clock = 1;
                block_cache = 1;
                done = 1;
            end
            
        endcase
    end

    always @(posedge clk or negedge rstn)
    begin
        if (~rstn)
        begin
            cacop_i_en <= 0;
            cacop_d_en <= 0;
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
            endcase
        end
    end

    
endmodule