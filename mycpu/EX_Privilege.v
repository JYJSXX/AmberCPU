`include "define.vh"

module EX_Privilege(
    input                               clk,
    input                               rstn,

    input                               en,
    input           [31:0]              rd_data,
    input           [31:0]              rj_data,
    input           [31:0]              ins,
    input           [WIDTH_UOP - 1 : 0] pr_type,

    output  reg     [31:0]              csr_addr,
    output  reg     [31:0]              csr_wdata,
    output  reg                         csr_wen,
    output  reg                         csr_ren,
    input           [31:0]              csr_rdata
);

    wire    [13:0]      csr_num = ins[23:10];
    wire    [4:0]       rj = ins[9:5];

    localparam [4:0] 
        PR_IDLE = 0,
        PR_CSR = 1;
    reg [4:0] PR_state = PR_IDLE, PR_next_state = PR_IDLE;

    always @(posedge clk or negedge rstn)
    begin
        if(~rstn)
            PR_state <= PR_IDLE;
        else
            PR_state <= next_state;
    end

    always @(*)
    begin
        PR_next_state = PR_state;
        case(PR_state)
            PR_IDLE:
            begin
                if(en)
                begin
                    if(pr_type[`INS_CSR])
                        PR_next_state = PR_CSR;
                    else
                        PR_next_state = PR_IDLE;
                end
            end
            PR_CSR:
            begin
                PR_next_state = PR_IDLE;
            end
        endcase
    end

    always @(*)
    begin
        csr_addr = 0;
        csr_wdata = 0;
        csr_wen = 0;
        csr_ren = 0;
        case(PR_state)
            PR_IDLE:
            begin
                csr_addr = 0;
                csr_wdata = 0;
                csr_wen = 0;
                csr_ren = 0;
            end
            PR_CSR:
            begin
                csr_addr = csr_num;
                csr_wdata = rd_data;
                csr_wen = 1;
                csr_ren = 0;
            end
        endcase
    end

    
endmodule