module HazardUnit (
    input flush_from_wb,
    input flush_from_ex2,
    input flush_from_ex1,
    input flush_from_reg,
    input flush_from_id,
    input flush_from_if1_fifo,
    input flush_from_if1,

    output flush_to_ex2_wb,
    output flush_to_ex1_ex2,
    output flush_to_reg_ex1,
    output flush_to_id_reg,
    output flush_to_fifo_id,
    output flush_to_fifo,
    output flush_to_if1_fifo,
    output flush_to_if0_if1,
    output flush_to_if0,
    output flush_to_tlb,
    output flush_to_icache,
    output flush_to_dcache,
    output flush_to_btb
);
    assign  flush_to_ex2_wb         =   flush_from_wb?  1:0;
    assign  flush_to_ex1_ex2        =   flush_from_wb?  1:
                                        flush_from_ex2? 1:0;
    assign  flush_to_reg_ex1        =   flush_from_wb?  1:
                                        flush_from_ex2? 1:
                                        flush_from_ex1? 1:0;
    assign  flush_to_id_reg         =   flush_from_wb?  1:
                                        flush_from_ex2? 1:
                                        flush_from_ex1? 1:
                                        flush_from_reg? 1:0;

    assign  flush_to_fifo_id        =   flush_from_wb ? 1:
                                        flush_from_ex2? 1:
                                        flush_from_ex1? 1:
                                        flush_from_reg? 1:
                                        flush_from_id ? 1:0;

    assign  flush_to_fifo           =   flush_from_wb?  1:
                                        flush_from_ex2? 1:
                                        flush_from_ex1? 1:
                                        flush_from_reg? 1:
                                        flush_from_id ? 1:
                                        flush_from_fifo?1:0;

    assign  flush_to_if1_fifo       =   flush_from_wb?  1:
                                        flush_from_ex2? 1:
                                        flush_from_ex1? 1:
                                        flush_from_reg? 1:
                                        flush_from_id ? 1:
                                        flush_from_fifo?1:0;

    assign  flush_to_if1            =   flush_from_wb?  1:
                                        flush_from_ex2? 1:
                                        flush_from_ex1? 1:
                                        flush_from_reg? 1:
                                        flush_from_id ? 1:
                                        flush_from_fifo?1:
                                        flush_from_if1? 1:0;
    
    assign  flush_to_if0_if1        =   flush_from_wb?  1:
                                        flush_from_ex2? 1:
                                        flush_from_ex1? 1:
                                        flush_from_reg? 1:
                                        flush_from_id ? 1:
                                        flush_from_fifo?1:
                                        flush_from_if1? 1:0;
    assign  flush_to_if0            =   flush_to_if0_if1;

    assign  flush_to_tlb            =   flush_to_reg_ex1;
    assign  flush_to_icache         =   flush_to_if0_if1;
    assign  flush_to_dcache         =   flush_to_reg_ex1;
    assign  flush_to_btb            =   flush_to_if0_if1;

endmodule