# MyCPU
共享文字版资料放在src/Share_ref.md下
数据通路设计在DataPath.drawio下
推荐使用RTL拓展
## AXI部分

目前AXI的写过程仿真层面已通过验证

> TODO: AXI~SRAM转接桥中将部分reg型output转为wire型


## CPU部分

除法器仿真层面上通过

> TODO: 若除法器处于关键路径上，可以考虑赋值单拎一周期