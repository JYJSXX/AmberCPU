# icache接口解读

信号后括号为位宽，eg: pc(32)

**平凡输入**

- clk(1)：cpu时钟
- rstn(1)：复位信号

**与CPU的交流**

输入端：

- rvalid(1)：cpu读请求
- raddr(32): cpu读请求pc（VA虚拟地址）
- p_addr(32): cpu读请求pc（物理地址，比VA晚一个时钟到来）
- uncache(1): 绕过cache访存信号
- cookie_in(32): 附加信息（cache不做处理仅仅缓存一级）
- cacop_en(1): cacop指令对icache的操作（需要先判断cacop操作对象后直接传给icache)
- cacop_code(2)： cacop指令code[4:3]，操作码
- tlb_exception(7): TLB异常信息码

输出端：

- rready(1): icache完成信号（包括cacop、uncache等操作）,同时给出指令
- rdata(64): icache一次给出两条指令
- pc_out(32): icache存储之前的pc（VA），并发出（对应这两条指令的起始地址）
- badv(32): 无效虚拟地址
- exception(7)：异常报错信息码
- cookie_out(32)：缓存一级的附加信息
- cacop_ready(1)：接受到cacop指令，开始执行操作
- cacop_complete(1)：完成cacop指令

**与AXI的交流**

输出端：

- i_rvalid(1): icache向AXI请求数据信号
- i_raddr(32): icache向AXI请求数据起始地址（uncache会做特殊处理，请求的地址为要的指令的起始地址）

输入端：

- i_rready(1): AXI向cache完成访存信号
- i_rdata(512): AXI向cache传递的数据块
