`define TLB_VALEN       32
`define TLB_PALEN       32
`define TLB_E           0
`define TLB_ASID        10:1
`define TLB_G           11
`define TLB_PS          17:12
`define TLB_VPPN        `TLB_VALEN + 4:18
`define TLB_V           0:0
`define TLB_D           1:1
`define TLB_MAT         3:2
`define TLB_PLV         5:4
`define TLB_PPN         `TLB_PALEN - 7:6
`define TLB_CPRLEN      `TLB_VALEN + 5
`define TLB_TRANSLEN    `TLB_VALEN - 6
`define TLB_NUM         32