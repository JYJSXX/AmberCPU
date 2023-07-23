`define TLB_VALEN       32                  //虚拟地址长度
`define TLB_PALEN       32                  //物理地址长度

`define TLB_E           0                   //TLB有效位
`define TLB_ASID        10:1                //地址空间标识符
`define TLB_G           11                  //全局位
`define TLB_PS          17:12               //页大小
`define TLB_VPPN        `TLB_VALEN + 4:18   //虚拟双页号

`define TLB_V           0:0                 //页表项有效位
`define TLB_D           1:1                 //页表项脏位
`define TLB_MAT         3:2                 //存储访问类型
`define TLB_PLV         5:4                 //特权等级
`define TLB_PPN         `TLB_PALEN - 7:6    //物理页号

`define TLB_VPPN_LEN    `TLB_VALEN - 13     //虚拟双页号长度
`define TLB_PPN_LEN     `TLB_PALEN - 12     //物理页号长度

`define TLB_CPRLEN      `TLB_VALEN + 5      //TLB比较部分长度
`define TLB_TRANSLEN    `TLB_PALEN - 6      //TLB转换部分长度
`define TLB_NUM         32                  //TLB项数