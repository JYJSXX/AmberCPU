module EX_Privilege(
    input clk,
    input rstn,

    input en,
    input csr,
    input [31:0] rd_data,
    input [31:0] rj_data,
    input [13:0] csr_num,

    output reg [31:0] csr_addr,
    output reg [31:0] csr_wdata,
    output reg csr_wen,
    output reg csr_ren,
    input [31:0] csr_rdata
);

    localparam [4:0] PR_IDLE = 0,
                    PR_CSR_READ = 1,
                    PR_CSR_WRITE = 2,
                    PR_CSR_XCHG = 3;
    reg [4:0] PS_state = PR_IDLE, PS_next_state = PR_IDLE;

    always @(posedge clk or negedge rstn)
    begin
        if(~rstn)
            PS_state <= PR_IDLE;
        else
            PS_state <= next_state;
    end

    always @(*)
    begin
        PS_next_state = PS_state;
        case(PS_state)
            PR_IDLE:
            begin
                if(en)
                begin
                    if(csr)
                        PS_next_state = PR_CSR_READ;
                    else
                        PS_next_state = PR_CSR_WRITE;
                end
            end
            PR_CSR_READ:
            begin
                PS_next_state = PR_CSR_XCHG;
            end
            PR_CSR_WRITE:
            begin
                PS_next_state = PR_CSR_XCHG;
            end
            PR_CSR_XCHG:
            begin
                PS_next_state = PR_IDLE;
            end
        endcase
    end
    
endmodule