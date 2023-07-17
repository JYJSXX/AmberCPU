目前为九级流水顺序双发

EX段划了两段，~~目的是使相关的指令可以同时运行~~


上半部分exe unit(EU0)可以执行任何类型的计算任务包括访存
下半部分exe unit(EU1)仅执行简单的可在一个周期出结果的ALU运算


但是简单的相关问题应该插入NOP来解决。

> 段间寄存器使用valid——ready协议握手来解决Stall的产生丢失指令或者重复发射指令的问题,流水级间，发出数据的是主，接受数据的是从,valid-ready对流水段可见，但是由段间寄存器模块就接受流水段的组合信号后产生。流水段仅产生组合逻辑
> 
> 空指令NOP使用定义的ADDI R0,R0,0来替代
> Flush信号的优先级可以考虑和rstn统一处理，不需要经过valid-ready握手
>
> CSR>MUL/DIV>ALU
> 以下类型以双发：ALU+ALU，ALU+CSR，LD/ST+ALU
> 其余类型在IQ段diapatch单发，另一个发射槽设为NOP

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

