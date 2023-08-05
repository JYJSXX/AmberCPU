`include "config.vh"
module dirty_table#(
    parameter TAG_WIDTH = 20,
    parameter INDEX_WIDTH = 6
)
(
    input clk,
    // input rstn,
    input [1:0] we,
    input [1:0] re,
    input [INDEX_WIDTH-1:0] r_addr,
    input [INDEX_WIDTH-1:0] w_addr,
    input w_data,
    output r_data
   // output dirty_signal,        // 当前是否有dirty block
    // `ifdef IBAR
    // ,input ibar,
    // input ibar_ready,       // ibar发送完当前的脏行后置为1
    // output reg [INDEX_WIDTH-1:0] dirty_addr,
    // output way0, 
    // output way1,
    // output reg ibar_complete,   // ibar处理完
    // output reg ibar_valid       // 找到脏块后置1，ibar_ready置1后置0
    // `endif
);
    reg [INDEX_WIDTH:0] dirty_num=0;        // dirty block number, max = 128
    reg [1:0] dirty_table [0:(1<<INDEX_WIDTH)-1];
    reg [INDEX_WIDTH:0] crt_num=0;
    reg [5:0] crt_addr=0;
    reg [1:0] csr=0, nsr=0;
    reg hit2=0;
    localparam
        IDLE = 2'b00,
        SEARCH = 2'b01,
        WRITE = 2'b10,
        DONE = 2'b11;
    integer i;
    initial begin
        for (i = 0; i < (1<<INDEX_WIDTH); i = i + 1) begin
            dirty_table[i] = 0;
        end
        dirty_num = 0;
    end
    always @(posedge clk) begin
        if(|we) begin
            if(we[0]) dirty_table[w_addr][0] <= w_data;
            if(we[1]) dirty_table[w_addr][1] <= w_data;
            if(w_data) dirty_num <= dirty_num + 1;
            if(!w_data && (dirty_num != 0)) dirty_num <= dirty_num - 1;
        end
        else begin
            dirty_table[w_addr] <= dirty_table[w_addr];
            dirty_num <= (csr == DONE) ? crt_num : dirty_num;
        end
    end

    assign r_data = dirty_table[r_addr][re[1]];
    //assign dirty_signal = dirty_num ? 1 : 0;

    /*
    ibar 处理设计：
    接收到ibar信号后，遍历dirty_table，找到第一个dirty block，将其地址存入dirty_addr，将其标记为无效，dirty_num--，并将ibar_valid置为1
    ibar状态机得到数据并写回后，发回ibar_ready信号，此时ibar_valid置为0, 从当前addr开始继续遍历
    重复上述过程直到dirty_num为0，结束ibar处理
    */
    `ifdef IBAR
    always @(posedge clk) begin
        if(!rstn) begin
            csr <= IDLE;
        end
        else begin
            csr <= nsr;
        end
    end

    always @(posedge clk) begin
        case(csr)
            IDLE: begin
                crt_addr <= 0;
                crt_num  <= dirty_num;
            end
            SEARCH: begin
                crt_addr <= crt_addr + 1;
                crt_num  <= crt_num;
            end
            WRITE: begin
                crt_addr <= crt_addr;
                if(ibar_ready && ibar_valid)
                    crt_num <= crt_num - (hit2 ? 2 : 1);
                else
                    crt_num <= crt_num;
            end
            DONE: begin
                crt_addr <= 0;
                crt_num <= 0;
            end
        endcase
    end

    assign way0 = dirty_table[crt_addr][0];
    assign way1 = dirty_table[crt_addr][1];


    always @(*) begin
        nsr = csr;
        ibar_valid = 0;
        // way0 = 0;
        // way1 = 0;
        hit2 = 0;
        ibar_complete = 0;
        dirty_addr = 0;
        case(csr)
            IDLE: begin
                if(ibar) begin
                    nsr = SEARCH;
                end
            end
            SEARCH: begin
                if(dirty_table[crt_addr][0] || dirty_table[crt_addr][1]) begin
                    // way0 = dirty_table[crt_addr][0];
                    // way1 = dirty_table[crt_addr][1];
                    dirty_addr = crt_addr;
                    nsr = WRITE;
                end
                else if(crt_num == 0) begin
                    nsr = DONE;
                end
            end
            WRITE: begin
                dirty_addr = crt_addr;
                ibar_valid = 1;
                hit2 = way0 && way1;
                if(ibar_ready) begin
                    // dirty_table[crt_addr][0] = 0;
                    // dirty_table[crt_addr][1] = 0;
                    if(crt_num == 0) begin
                        nsr = DONE;
                    end
                    else begin
                        nsr = SEARCH;
                    end
                end
            end
            DONE: begin
                ibar_complete = 1;
                nsr = IDLE;
            end
            default: begin
                nsr = IDLE;
            end
        endcase
    end
    `endif 


endmodule