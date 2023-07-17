# Cache参数

**Cache参数**

2路组相连

每路64行

每行64字节

**地址分布：**

31-12：20位tag

11-6: index 64行）

5-0: offset（一行64字节 

**CACOP指令**

实现方式为将指定cache行的tag清零

**栅障指令**

Icache：无效掉TagV表中的所有行

待完成：

Dcache：无效掉TagV表中的所有行，同时将脏行写回主存

# Icache接口

> 信号名后括号中为位宽，eg: pc(32)

**平凡输入**

- clk(1)：cpu时钟
- rstn(1)：复位信号

**与CPU的交流**

输入端：

- rvalid(1)：cpu读请求
- raddr(32): cpu读请求pc（VA虚拟地址）
- p_addr(32): cpu读请求pc（物理地址，比VA晚一个时钟到来）
- flush(1): 来自cpu的flush信号（用于冲刷当前指令，不会再输出rready信号，相当于此次访存没有发生）
- uncache(1): 绕过cache访存信号
- cookie_in(32): 附加信息（cache不做处理仅仅缓存一级）
- cacop_en(1): cacop指令对icache的操作（需要先判断cacop操作对象后直接传给icache)
- cacop_code(2)： cacop指令code[4:3]，操作码
- tlb_exception(7): TLB异常信息码
- ibar(1): 栅障指令信号

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
- i_rlen (8): 默认15，当uncache访问的时候是1；

输入端：

- i_rready(1): AXI向cache完成访存信号
- i_rdata(512): AXI向cache传递的数据块

# Dcache接口

**平凡输入**

- clk(1)：cpu时钟
- rstn(1)：复位信号

**与CPU交流**

输入端

- addr(32)：读写地址
- p_addr(32): 物理地址
- rvalid (1)：来自流水线的读请求的有效信号。
- wvalid (1)：来自流水线的写请求的有效信号。
- wdata (32)：来自流水线的写数据。
- wstrb (4)：每个写回字（word）的写掩码，如果请求是读请求，则wstrb为4'b0。
- op (1)：操作类型，0表示读操作，1表示写操作。
- uncache (1)：指示请求是否为非缓存请求。
- signed_ext (1): 是否要存储符号位扩展的数据（1就扩展）
- tlb_exception (7): TLB异常信息码
- cacop_en(1): cacop指令对dcache的操作（需要先判断cacop操作对象后直接传给dcache)
- cacop_code(2)： cacop指令code[4:3]，操作码
- is_atom (1): 原子指令load信号
- llbit (1): 原子指令llbit

输出端

- rready (1)：向流水线发送的读请求的就绪信号。
- rdata (64)：读取的数据返回给流水线。
- wready (1): 写请求的就绪信号
- exception (7): 异常信息码
- badv (32): 无效虚拟地址
- cacop_ready(1)：接受到cacop指令，开始执行操作
- cacop_complete(1)：完成cacop指令
- llbit_set (1): 完成原子指令load，将llbit置为1
- llbit_clear (1): 完成原子指令store，将llbit清零

**与AXI交流**

输出端：

读：

- d_rvalid (1)：向主存发送的读请求的有效信号。
- d_raddr (32)：读取的地址发送给主存。
- d_rsize (3)：表示一次读取的数据大小，如果d_rsize = n，则一次读取2^n字节。
- d_rlen (8)：表示读取的数据数量，如果d_rlen = n，则读取n+1次。

写：

- d_wavalid (1): 写请求信号
- d_wdata (32)：写入主存的数据。
- d_wstrb (4)：每个写回字的写掩码。
- d_wlast (1)：表示写入数据的最后一个beat。
- d_wsize (3)：表示一次写入的数据大小，如果d_wsize = n，则一次写入2^n字节。
- d_wlen (8)：表示写入的数据数量，如果d_wlen = n，则写入n+1次。

输入端：

读：

- d_rready (1)：来自主存的读请求的就绪信号。
- d_rdata (32)：从主存读取的数据。
- d_rlast (1)：表示读取数据的最后一个beat。

写：

- d_wready (1)：来自主存的写请求的就绪信号。

**写回**

输出： d_bready (1): 向主存的写回请求

输入： d_bvalid (1)：来自主存的写回请求的有效信号。

**DIFFTEST**

output       [31:0] vaddr_diff,

output       [31:0] paddr_diff,

output       [31:0] data_diff

# 优化方向

victim cache

预取

Dcache写缓冲区

