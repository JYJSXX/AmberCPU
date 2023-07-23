# 仿真文档

自行阅读：https://chiplab.readthedocs.io/zh/latest/Simulation/verilator.html

复制一份chiplab用于仿真自己的CPU，和示例mycpu做对比

打开chiplab/chip/config-generator.mak设置一下参数

```
CPU_2CMT=y
```

用来打开双发射

```
MYCPU_SRC=${CHIPLAB_HOME}/IP/myCPU
```

这部分换成CPU路径

仿真结果看/chiplab/sims/verilator/run_prog/log/func/func_lab19_log (以lab19为例)

log文件夹下有

simu_trace.txt : 仿真过程输出信息的备份

mem_trace.txt : 仿真过程访存信息的备份

simu_trace.fst : 仿真波形文件

uart_output.txt : 假串口输出log

uart_output.txt.real : 真串口输出log

如果仿真过程中被ctrl-c强制结束，所有文件都会丢失，对应log文件夹不会被创建。为避免该情况，可估算运行时间，并配置Makefile_run中的TIME_LIMIT选项。(Makefile_run文件在chiplab/sims/verilator/run_prog/下)