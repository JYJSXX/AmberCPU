//流水线中
`define DualIssue 1'b1
`define SingleIssue 1'b0
`define InstAddrBus 31:0
`define InstBus 31:0
`define DataAddrBus 31:0
`define DataBus 31:0
`define AluOpBus 7:0
`define AluSelBus 2:0
`define INS_ALU   0
`define INS_MUL   1
`define INS_DIV   2
`define INS_ERTN  3
`define INS_CACHE 4
`define INS_TLB   5
`define INS_CSR   6
`define INS_IDLE  7
`define INS_MEM   8
`define INS_BAR   9
`define INS_BR   10
`define INS_SC_OR_LL 11
`define INS_PRELOAD 12
`define INS_ECALL 13
`define INS_TYPE 13:0

`define CTRL_SRC1_RF 0
`define CTRL_SRC1_PC 1
`define CTRL_SRC1_ZERO 2
`define CTRL_SRC1_CNTID 3

`define CTRL_SRC2_RF 0
`define CTRL_SRC2_IMM 1
`define CTRL_SRC2_CNTL 2
`define CTRL_SRC2_CNTH 3

`define UOP_TYPE 13:0
`define UOP_SRC1 15:14
`define UOP_SRC2 17:16
`define UOP_ALUOP 21:18
`define UOP_MD_SEL 18:18
`define UOP_MEM_WIDTH 19:18
`define UOP_MEM_WRITE 20:20
`define UOP_COND 21:18
`define UOP_SIGN 22:22
`define UOP_MEM_ATM 23:23
`define UOP_PRELOAD 24:24
`define UOP_PRIVILEDGED 25:25
//NEMPTY=0，当且仅当指令是flush后填充流水线的空操作
`define UOP_NEMPTY 26:26
`define UOP_ORIGINAL_INST 58:27
`define WIDTH_UOP 59
`define UOP_EXCEPT_TYPE 58:14

`define CTRL_ALU_ADD 0
`define CTRL_ALU_SUB 2
`define CTRL_ALU_SLT 4
`define CTRL_ALU_SLTU 5
`define CTRL_ALU_NOR 8
`define CTRL_ALU_AND 9
`define CTRL_ALU_OR 10
`define CTRL_ALU_XOR 11
`define CTRL_ALU_SLL 14
`define CTRL_ALU_SRL 15
`define CTRL_ALU_SRA 13

//空指令 andi r0, r0, 0
`define INST_NOP 32'b0000001101_000000000000_00000_00000

`define zero 32'h00000000
`define INIT_ADDR 32'h1c00_0000