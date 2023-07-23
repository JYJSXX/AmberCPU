# 仿真文档

自行阅读：https://chiplab.readthedocs.io/zh/latest/Simulation/verilator.html

先到chiplab/sims/verilator/run_prog目录下

打开config-generator.mak设置一下参数(该文件是软链接到chiplab/chip/config-generator.mak的一个文件指针)

```
CPU_2CMT=y
```

用来打开双发射

```
MYCPU_SRC=${CHIPLAB_HOME}/IP/myCPU
```

这部分换成CPU路径

```
MYCPU_SRC=/home/yiran/Desktop/AmberCPU/mycpu
#MYCPU_SRC=${CHIPLAB_HOME}/IP/myCPU
```

想要切换成mycpu就重新注释然后重新跑）

仿真结果看/chiplab/sims/verilator/run_prog/log/func/func_lab19_log (以lab19为例)

log文件夹下有

simu_trace.txt : 仿真过程输出信息的备份

mem_trace.txt : 仿真过程访存信息的备份

simu_trace.fst : 仿真波形文件

uart_output.txt : 假串口输出log

uart_output.txt.real : 真串口输出log

如果仿真过程中被`ctrl-c`强制结束，仅`simu_trace.txt`会保存在`tmp`目录下，波形文件、串口输出的`log`会丢失。为避免该情况，可估算运行时间，并配置`Makefile_run`中的`TIME_LIMIT`选项。（Makefile_run文件在chiplab/sims/verilator/run_prog/下)