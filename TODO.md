# 尚未实现的模块中信号名称(自行搜索)

**cpu_top.v**

- [ ]  debug0_valid,
- [ ]  debug1_valid,
- [ ]  assign clk=aclk; //TODO:idle的时钟没写，暂时用clk代替
- [ ]  wire [1:0] if1_excp_flag;//TODO :alert icache to pass this signal
- [ ] .fifo_id_flush_cause ( fifo_id_flush_cause ),  // TODO: To be completed

**BTB.v**

- [ ] pred_pc_hang

**IQ.v**

- [ ] iq_is_ALU_1 =1'b1;//TODO NOTICE HERE IS REPLACED BY NOP

**dcache.v**

- [ ] input                   flush,              // TODO 还没接入

**TLB.v**

- [x] .vaddr0(VA_I_reg3), //todo: