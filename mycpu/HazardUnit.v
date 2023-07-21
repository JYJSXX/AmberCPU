module HazardUnit (
    input flush_from_wb,
    input flush_from_ex2,
    input flush_from_ex1,
    input flush_from_reg,
    input flush_from_id,
    input flush_from_fifo,
    input flush_from_if1,

    output flush_to_ex2_wb,
    output flush_to_ex1_ex2,
    output flush_to_reg_ex1,
    output flush_to_id_reg,
    output flush_to_fifo_id,
    output flush_to_fifo,
    output flush_to_if1_fifo,
    output flush_to_if1,
    output flush_to_if0,
    output flush_to_tlb,
    output flush_to_icache,
    output flush_to_dcache,
    output flush_to_btb
);
    
endmodule