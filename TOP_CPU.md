目前为八级流水顺序双发

EX段划了两段，~~目的是使相关的指令可以同时运行~~


上半部分exe unit(EU0)可以执行任何类型的计算任务包括访存
下半部分exe unit(EU1)仅执行简单的可在一个周期出结果的ALU运算


但是简单的相关问题应该插入NOP来解决。

> 段间寄存器使用valid——ready协议握手来解决Stall的产生丢失指令或者重复发射指令的问题,段间寄存器间，发出数据的是主，接受数据的是从,valid-ready对流水段可见，但是由段间寄存器模块就接受流水段的组合信号后产生。流水段仅产生组合逻辑
> 
> 空指令NOP使用定义的ADDI R0,R0,0来替代
> Flush信号的优先级可以考虑和rstn统一处理，不需要经过valid-ready握手
>
> CSR>MUL/DIV>ALU
> 以下类型以双发：ALU+ALU，ALU+CSR，LD/ST+ALU
> 其余类型在IQ段diapatch单发，另一个发射槽设为NOP

## FIFO:
fetch_buf,co_pcbuf用于缓存ICache的取指结果和PC，co_pcbuf采用与fetch_buf完全相同的控制逻辑，但是内容是对应的pc(仅储存偶数位PC/上半执行单元部分的PC)

同时接受到两条PRIV指令（CSRWR/CSRXCHG/TLB[:3]/IBAR）或者PRIV+OTHER时将下路替换NOP，下一次在IF1根据PC[2]再将上路替换NOP，这样只需要一位的FLAG

## predecoder
1. 预判branch类型，提供给btb用作掩码
2. 判断IBAR/CSR/TLB[:3]，提供给IF1_FIFO进入状态机
```mermaid
graph LR
IDLE-->WAIT_EX_IBAR-->WAIT_CACHE_IDLE-->WAIT_FETCH-->IDLE
```
## 段间寄存器valid-ready握手协议//TODO 逻辑不完善
```mermaid
graph LR
    段间寄存器1--readygo_12-->段间寄存器2
    段间寄存器2--allowin_21-->段间寄存器1
    段间寄存器2--readygo_23-->段间寄存器3
    段间寄存器3--allowin_23-->段间寄存器2
```

这里的段间寄存器指的是段间寄存器

```
readygo_23和allowin_21由流水段传入段间寄存器的组合信号，由段间寄存器产生
readygo_23和allowin_21还与段间寄存器自身情况有关，这里假设自身准备好，如果自身没准备好，对外readygo_23和allowin_21均为0
readygo_23不能受allowin_23控制
伪代码表示：
readygo_23 =valid (valid表示自身情况,无阻塞的流水段逻辑恒为1,有阻塞的先0,有效时数据和valid同时为1) 
allowin_21 = allowin_23 || ready (ready表示自身情况)
if(readygo_12 && allowin_23&&allowin_21)
	更新段间寄存器2
if(~readygo_12 && allowin_23&&readygo_23)
	清空段间寄存器2（所有控制信号置为0，防止上一周期的指令被重复执行）
if(~allowin_23||~allowin21)
	维持段间寄存器2（所有寄存器值不动，防止上一周期的指令被丢失）
```

## 异常处理
## exception信号
exception[6:0]存放{ESUBCODE,ECODE}(见clap exception.vh)
excp_flag[1:0] 00表示无异常，10表示上路异常，01表示下路异常，11表示上下路同时异常
由于指令集改版，我们现在不能使用判断exception是否为0来使得更早触发的异常不被覆盖，因此添加了额外的
标志位exception_flag来标志当前是否已经发生异常，若是则不能将更晚的异常覆盖进exception数组中

## ibar_signal & ibar_pos 信号
ibar_siganl表示当前指令组（同时发射的两条）

## 例外处理逻辑
首先介绍例外处理的通用逻辑，CPU的异常均在WB段进行提交，
1. INT中断：接受SOC的硬件和CPU定时器中断信号和特权指令写软件中断时，由CSR发出中断信号，WB段向CSR写入ECODE同时清空流水线
## 什么时候flush(由谁发出，发给谁)
1.WB段如果exception为1，给全流水线发送flush
