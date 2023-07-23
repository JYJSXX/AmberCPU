

# TLB信号

## From Pipeline

​    input                               clk,

​    input                               rstn,

​    input                               flush,

> Global flush

## From CSR

​    input       [9:0]                   CSR_ASID,

> The ASID Register of  CSR: The least significant 10 bits

​    input       [31:0]                  CSR_VPPN,

> The VPPN Register of CSR (stand for Virtual Address)

​    input                               CSR_PG,

> The PG Register of CSR (stand for Page Size)

​    input       [31:0]                  CSR_CRMD,

> The CRMD Register of CSR (stand for Current mode)

​    input       [31:0]                  CSR_DMW0,

​    input       [31:0]                  CSR_DMW1,

> The DMW Register of CSR (stand for Direct Mapping Register) 直接映射窗口

​    input       [31:0]                  CSR_TLBEHI,

> The TLBEHI Register of CSR

​    input       [31:0]                  CSR_TLBIDX,

> The TLBIDX Register of CSR

---

## From PC of REG_EX Register To I/D Cache

​    input                               stall_i,

> IF0 Stage stall

​    input                               stall_d,

> EX1 Stage stall

上面两个信号用于保证流水段的阻塞信号不会把地址丢掉

​    input                               en_d,

> Ex1 段是/否(1/0)为访存指令

​    input       [`TLB_VPPN_LEN : 0]     VA_I,

> PC寄存器虚地址(原本要传给Icache的虚地址高20位 即Index)

​    input       [`TLB_VPPN_LEN : 0]     VA_D,

> EX1段虚地址(原本要传给Dcache的虚地址高20位 即Index)

​    input       [11:0]                  TAG_OFFSET_I,

> PC寄存器虚地址(原本要传给Icache的虚地址低12位 即Tag)

​    input       [11:0]                  TAG_OFFSET_D,

> EX1段虚地址(原本要传给Dcache的虚地址低12位 即Tag)

​    //TO CACHE

​    output reg  [`TLB_PPN_LEN - 1:0]    PA_I,

​    output reg  [`TLB_PPN_LEN - 1:0]    PA_D,

> 给I/D Cache 的实地址的高20位

​    output reg                          is_cached_I,

​    output reg                          is_cached_D,

> 给I/D Cache 是否(1/0)是一致可缓存的

​    output                              en_VA_I_OUT,

​    output                              en_VA_D_OUT,

> 给I/D Cache 数据有效位

​    output      [`TLB_VPPN_LEN : 0]     VA_I_OUT,

​    output      [`TLB_VPPN_LEN : 0]     VA_D_OUT,

> 给I/D Cache 虚地址的最高20位

​    output      [11:0]                  VA_TAG_OFFSET_I_OUT,

​    output      [11:0]                  VA_TAG_OFFSET_D_OUT,

> 给I/D Cache 虚地址低12位

​    output      [11:0]                  PA_TAG_OFFSET_I_OUT,

​    output      [11:0]                  PA_TAG_OFFSET_D_OUT,

> 给I/D Cache 实地址低12位

​    output                              SOL_D_OUT,

> 给I/D Cache 访存指令类型(1 for store, 0 for load)

## 特权指令部分

​    input                               TLBSRCH_valid,

​    output reg                          TLBSRCH_ready,

​    output reg                          TLBSRCH_hit,

​    output reg  [4:0]                   TLBSRCH_INDEX,

​    input       [4:0]                   TLBRD_INDEX,

​    input                               TLBRD_valid,

​    output reg                          TLBRD_ready,

​    output reg                          TLBRD_hit,

​    output reg  [`TLB_CPRLEN - 1:0]     TLB_CPR,

​    output reg  [`TLB_TRANSLEN - 1:0]   TLB_TRANS_1,

​    output reg  [`TLB_TRANSLEN - 1:0]   TLB_TRANS_2,

​    input                               TLBWR_valid,

​    output reg                          TLBWR_ready,

​    input                               TLBFILL_valid,

​    output reg                          TLBFILL_ready,

​    input       [`TLB_CPRLEN - 1:0]     TLB_CPR_w,

​    input       [`TLB_TRANSLEN - 1:0]   TLB_TRANS_1_w,

​    input       [`TLB_TRANSLEN - 1:0]   TLB_TRANS_2_w,

​    input                               TLBINVLD_valid,

​    output reg                          TLBINVLD_ready,

​    input       [4:0]                   TLBINVLD_OP,

​    input       [9:0]                   TLBINVLD_ASID,

​    input       [`TLB_VPPN_LEN - 1:0]   TLBINVLD_VA,

> 以上信号全部与EX1段Privilege模块连接

​    input                               store_or_load, //1:store 0:load

> 该由EX1流水段发出 指示访存类型

​    input                               plv_1bit,

​    output     [6:0]                    tlb_exception_code_i,

​    output     [6:0]                    tlb_exception_code_d,

> 以上三条是例外处理用到的信号 pls ask sure

​    input      [4:0]                    stable_counter

> 接计时器后五位