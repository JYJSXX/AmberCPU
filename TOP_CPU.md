目前为九级流水顺序双发
EX段划了三段，目的是使相关的指令可以同时运行
上半部分exe unit(EU0)可以执行任何类型的计算任务包括访存
下半部分exe unit(EU1)仅执行简单的可在一个周期出结果的ALU运算
简单构想，如果存在相关，前两段EX(EX0.EX1)让EU0进行，结果在EX2交给EU1，这样可以同时发射两条相关的指令
如果EU0执行LOAD，EU1执行ADD，EX仍然需要Stall，但是可以在EX2前将目标寄存器结果更新，同时EU1在EX0,EX1不执行，EX2获得所需要的值后再计算，也许可以同时发射这种包含LOAD-USE的相关指令
但是这只能解决简单的相关问题，也就是下半部分的EU只能执行最多一个周期出结果的ALU指令，其余情况应该插入NOP来解决。

> 段间寄存器使用valid——ready协议握手来解决Stall的产生丢失指令或者重复发射指令的问题,流水级间，发出数据的是主，接受数据的是从
> 空指令NOP使用定义的ADDI R0,R0,0来替代
> Flush信号的优先级可以考虑和rstn统一处理，不需要经过valid-ready握手
>
> CSR>MUL/DIV>ALU
> 以下类型可以双发：ALU+ALU，ALU+CSR，LD/ST+ALU，ALU+LD/ST
> 其余类型在ID段diapatch单发，另一个发射槽设为NOP

> 

```mermaid
graph LR
    流水级1--valid_12-->流水级2
    流水级2--ready_21-->流水级1
    流水级2--valid_23-->流水级3
    流水级3--ready_23-->流水级2
```

这里的流水级指的是段间寄存器

```
valid_23和ready_21还与流水级自身情况有关，这里假设自身准备好，如果自身没准备好，对外valid_23和ready_21均为0
valid_23不能受ready_23控制
伪代码表示：
valid_23 = valid_12 && valid (valid表示自身情况)
if(valid_12 && ready_23)
	更新流水级2
	ready_21=1
if(valid_12 && ~ready_23)
	维持流水级2（所有寄存器值不动）
	ready_21=0
if(~valid_12 && ready_23)
	清空流水级2（所有控制信号置为0，防止上一周期的指令被重复执行）
	ready_21=1
```

