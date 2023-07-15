//纯组合逻辑，译码器
//【注意】load、br指令的原本位于rd段的源数据被放到了rk，而rd=0，这样可以保证读取寄存器堆时只需要读rk和rj
/* verilator lint_off DECLFILENAME */
//异常 分支预测等和CSR相关的信号 to be continued
`include "define.vh"
module ID_decoder
(
    input [31:0] inst,
    output [31:0] pc, //目前未考虑分支预测，异常等等
    output is_ALU,
    output is_syscall,
    output is_break,
    output is_priviledged,
    output [`WIDTH_UOP-1:0] uop,
    output [31:0] imm,
    output [4:0] rd,
    output [4:0] rj,
    output [4:0] rk
);
//先判断大致种类，然后再细分操作数种类（pc，立即数，寄存器或者时钟），最后判断细致种类
    /////////////////////////////
    //鉴别指令类型
    wire [`INS_TYPE] type_;
    assign type_[`INS_BR] = inst[30]=='b1; //bne,beq,bge,bgeu,blt,bltu，还有两个浮点比较跳转，不管了
    wire is_b_or_bl = inst[30:27]=='b1010; //b或者bl
    wire is_jilr = inst[30:26]=='b10011; //jirl
    assign type_[`INS_BAR] = inst[30:16]=='b011100001110010;  //ibar dbar
    assign type_[`INS_MEM] = inst[30:28]=='b010; //lw,sw,lh,sh,lb,sb,lbu,sbu,lhu,shu
    wire is_preload = inst[30:22]=='b010101011; //preld
    assign type_[`INS_PRELOAD] = is_preload;
    wire is_pcadd = inst[30:25]=='b001110;
    wire is_lui = inst[30:25]=='b001010;
    assign type_[`INS_CSR] = inst[30:24]=='b0000100;
    wire is_alu_imm = inst[30:25]=='b0000001;
    assign type_[`INS_CACHE] = inst[30:22]=='b000011000;
    //这个invalid的含义是与众不同的，这里的invalid表示指令INVTLB，而其他地方的invalid表示unknown instruction
    wire is_invalid_tlb = inst[30:15]=='b0000110010010011;
    assign type_[`INS_IDLE] = inst[30:15]=='b0000110010010001;
    assign type_[`INS_ERTN] = inst[30:10]=='b000011001001000001110;
    assign type_[`INS_TLB] = is_invalid_tlb||
        //inst[30:13]=='b000011001001000001&&inst[12:10]!='b110;
        inst[30:13]=='b000011001001000001&&inst[12:10]<='b101 && inst[12:10]>='b010; //inst[12:10]是110时为ertn指令,在上面已经判断过了
    wire is_ecall = inst[30:17]=='b00000000010101&&inst[15]=='b0; //syscall或者break
    assign type_[`INS_ECALL] = inst[30:17]=='b00000000010101&&inst[15]=='b0; //ecall
    assign is_syscall = is_ecall&inst[16];
    assign is_break = is_ecall&~inst[16];
    assign type_[`INS_MUL] = inst[30:17]=='b00000000001110;
    assign type_[`INS_DIV] = inst[30:17]=='b00000000010000; 
    wire is_alu_sfti = inst[30:20]=='b00000000100&&inst[17:15]=='b001; //逻辑左移和右移，用立即数
    wire is_sra = inst[30:15]=='b0000000000110000; //算术右移
    wire is_time = inst[30:11]=='b00000000000000001100; //三个访问时钟的指令
    wire is_alu = inst[30:19]=='b000000000010; //add,sub,slt,sltu,nor,and,or,xor， 只有sra不在这里，sra最后两位是11，单独拿出来
    assign type_[`INS_ALU]=is_alu||is_time||is_sra||is_alu_sfti||is_alu_imm||is_pcadd||is_lui; 
    assign type_[`INS_SC_OR_LL] = inst[30:25]=='b0010000; //sc或者ll
    wire is_sc = type_[`INS_SC_OR_LL]&inst[24];
    wire is_ll = type_[`INS_SC_OR_LL]&~inst[24];
    assign is_ALU=is_alu||is_alu_imm||is_alu_sfti||is_sra||is_time||is_pcadd||is_lui;
//判断操作数种类
    // reg [1:0]src1,src2;
    // always @* begin
    //     if(is_lui)src1=`CTRL_SRC1_ZERO;
    //     else if(is_pcadd)src1=`CTRL_SRC1_PC;
    //     else if(is_time&&inst[10]==0&&inst[4:0]==0)src1=`CTRL_SRC1_CNTID; //时钟id
    //     else src1=`CTRL_SRC1_RF;
    // end

    // always @* begin
    //     if(is_alu_imm||is_alu_sfti||is_lui||is_pcadd)src2=`CTRL_SRC2_IMM;
    //     else if(is_time) begin
    //         if(inst[10]==0&&inst[4:0]!=0)
    //             src2=`CTRL_SRC2_CNTL; //时钟低位
    //         else
    //             src2=`CTRL_SRC2_CNTH; //时钟高位
    //     end
    //     else src2=`CTRL_SRC2_RF;
    // end
    //上面注释的和下面一样的，不知道下面的会不会快一点
    wire [1:0] src1,src2;
    assign src1 = is_lui|inst[10]==0&&inst[4:0]!=0?`CTRL_SRC1_ZERO:is_pcadd?`CTRL_SRC1_PC:is_time&&inst[10]==0&&inst[4:0]==0?`CTRL_SRC1_CNTID:`CTRL_SRC1_RF;
    assign src2 = is_alu_imm||is_alu_sfti||is_lui||is_pcadd?`CTRL_SRC2_IMM:is_time?inst[10]==0&&inst[4:0]!=0?`CTRL_SRC2_CNTL:`CTRL_SRC2_CNTH:`CTRL_SRC2_RF;


//判断alu种类
    reg [`UOP_ALUOP] alu_op;
    reg alu_op_invalid;
    always @* begin
        alu_op_invalid=0;
        alu_op=`CTRL_ALU_ADD; //lui和pcadd也当成add处理，修改一下src1就行了
        if(is_alu)
            alu_op=inst[18:15];
        else if(is_alu_imm) begin
            case(inst[24:22])
            3'b000: alu_op=`CTRL_ALU_SLT;
            3'b001: alu_op=`CTRL_ALU_SLTU;
            3'b010: alu_op=`CTRL_ALU_ADD;
            3'b101: alu_op=`CTRL_ALU_AND;
            3'b110: alu_op=`CTRL_ALU_OR;
            3'b111: alu_op=`CTRL_ALU_XOR;
            default: begin
                alu_op=0;
                alu_op_invalid=1;
            end
            endcase
        end
        else if(is_alu_sfti) begin
            case(inst[19:18])
            2'b00: alu_op=`CTRL_ALU_SLL;
            2'b01: alu_op=`CTRL_ALU_SRL;
            2'b10: alu_op=`CTRL_ALU_SRA;
            default: begin
                alu_op=0;
                alu_op_invalid=1;
            end
            endcase
        end
        else if(is_sra) alu_op=`CTRL_ALU_SRA;
    end
   

//判断是否是特权指令
assign uop[`UOP_PRIVILEDGED] = type_[`INS_CACHE] | type_[`INS_TLB] | type_[`INS_CSR] | type_[`INS_ERTN] | type_[`INS_IDLE] | type_[`INS_BAR];
    //Hit类的CACOP指令可以在用户态下执行,当成普通的访存处理
    assign is_priviledged = type_[`INS_CACHE]&&inst[4:3]!=2 || type_[`INS_TLB] || type_[`INS_CSR] || type_[`INS_ERTN] || type_[`INS_IDLE];
    
    //判断是否是跳转指令
    reg [3:0] cond;
    reg br_invalid; //排除掉bceqz和bcnez两条浮点跳转指令
    always @* begin
        cond=0;
        br_invalid=0;
        if(type_[`INS_BR]) begin
            cond = inst[29:26];
            case(inst[29:26])
            //jirl, b, bl
            4'b0011, 4'b0100, 4'b0101,
            //beq
            4'b0110,
            //bne
            4'b0111,
            //blt
            4'b1000,
            //bge
            4'b1001,
            //bltu
            4'b1010,
            //bgeu
            4'b1011: ;
            default: br_invalid=1; //排除掉bceqz和bcnez两条浮点跳转指令
            endcase
        end
    end

    //assign uop[`UOP_TYPE]=(!uop_nempty||invalid_instruction)?0:type_;
    assign uop[`UOP_SRC1]=src1;
    assign uop[`UOP_SRC2]=src2;
    assign uop[`UOP_MEM_ATM]= ~inst[27];
    
    //符号域: 乘除的inst[16]、访存的inst[25]
    assign uop[`UOP_SIGN]=
        (type_[`INS_MUL]|type_[`INS_DIV])&~inst[16] |
        (type_[`INS_MEM])&~inst[25];
    
    //各种指令格式的操作位（包括alu、mul、div、mem、br）
    assign uop[`UOP_COND]=
        {4{type_[`INS_ALU]}}&alu_op | 
        {3'b0,type_[`INS_DIV]&inst[15]} | //1为模 0为除
        {3'b0,type_[`INS_MUL]&(inst[15]|inst[16])} | //取高位
        //inst[27]==1时是保留取字和条件存字，宽度是32位
        {4{type_[`INS_MEM]}}&{1'b0,inst[24],inst[27]?inst[23:22]:2'b10}|
        {4{type_[`INS_BR]}}&cond;


            ///////////////////////////////////
    //非法指令检查
    wire type_invalid = type_==0&!is_ecall; //syscall和break不算非法指令，但也未出现在定义的11种指令类型中

    wire invtlb_invalid = is_invalid_tlb && inst[4:0]>5'h6; //INVTLB指令的op无效
    
    assign invalid_instruction=alu_op_invalid||type_invalid||br_invalid||inst[31]||invtlb_invalid;// ||exception!=0;
    //当IF段出现异常时，认为


    //目标地址
    assign rd =
        (type_[`INS_CACHE]||
        type_[`INS_TLB]||
        type_[`INS_IDLE]||
        is_preload||
        type_[`INS_MEM]&&uop[`UOP_MEM_WRITE]&&!uop[`UOP_MEM_ATM]||
        //除了jilr和bl之外的分支
        type_[`INS_BR]&&!is_jilr&&inst[29:26]!='b0101)?0: //这些不需要写寄存器的指令都向r0写，防止乱写
            inst[30:26]==('b10101)?1: //bl 向r1写PC+4
            (inst[4:0]|{5{is_time}}&inst[9:5]); //time指令的rd是inst[9:5]，虽然指令编码写的是rj，但是是要向rj里面写
    
    //源地址1
    assign rj =
        (type_[`INS_TLB]&~is_invalid_tlb||
        type_[`INS_IDLE]||
        is_pcadd||is_lui||is_b_or_bl||is_time)?0:
        inst[9:5];
    
    //源地址2
    assign rk = 
        (is_alu || is_sra ||
        type_[`INS_MUL] ||
        type_[`INS_DIV] || is_invalid_tlb)? inst[14:10]: 
            (type_[`INS_MEM]&&uop[`UOP_MEM_WRITE] || type_[`INS_BR]&&!(is_b_or_bl||is_jilr) || type_[`INS_CSR])? inst[4:0]:0; //store br这些指令没有rk，可以这时把当前目标寄存器的值取出来，万一有用呢
    
//    wire is_u5  = is_alu_sfti;    //u5按 i12处理（所以ALU单元必须截取imm[4:0]）
    wire is_i12 = type_[`INS_CACHE] |
        is_alu_imm&~inst[24] |      //addi、slti、sltui的inst[24]都等于0
        type_[`INS_MEM]&inst[27] |
        is_alu_sfti;
    wire is_u12 = is_alu_imm&inst[24];//andi、ori、xori的inst[24]都等于1
    wire is_i14 = type_[`INS_CSR];
    wire is_i14_sll2 = type_[`INS_MEM]&~inst[27];
    wire is_i16 = type_[`INS_BR]&~is_b_or_bl;
    wire is_i26 = is_b_or_bl;
    wire is_i20 = is_pcadd|is_lui;
    
    wire [31:0] i12_result = {{20{inst[21]}},inst[21:10]};
    wire [31:0] u12_result = {20'b0,inst[21:10]};
    wire [31:0] i14_result = {{18{inst[23]}},inst[23:10]};
    wire [31:0] i16_result = {{16{inst[25]}},inst[25:10]};
    wire [31:0] i26_result = {{6{inst[9]}},{inst[9:0],inst[25:10]}};
    wire [31:0] i20_result = {inst[24:5],12'b0};
    wire [31:0] i14_sll2_result = {{16{inst[23]}},inst[23:10],2'b0};
    
    assign imm = 
        i12_result&{32{is_i12}} |
        u12_result&{32{is_u12}} |
        i14_result&{32{is_i14}} |
        i14_sll2_result&{32{is_i14_sll2}} |
        i16_result&{32{is_i16}} |
        i26_result&{32{is_i26}} |
        i20_result&{32{is_i20}};
    endmodule