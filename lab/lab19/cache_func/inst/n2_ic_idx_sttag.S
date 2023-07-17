#include <asm.h>
#include <regdef.h>
#include <cpu_cde.h>

LEAF(n2_ic_idx_sttag_test)
    .set noreorder
    addiu s0, s0 ,1
    addiu s2, zero, 0x0
######################################################
# Test cache instruction, op: icache index store tag #
######################################################
# cache line to be test, 32Byte: 8 insts
    .align 5
code_block:
    b	change_code # 0
    nop             # 1
    nop             # 2
    nop             # 3
code_to_be_changed:
    j	inst_error  # 4
    nop             # 5
    nop             # 6
    nop             # 7
# cache block end

    .align 5
new_code:
    j	inst_pass
    nop
    nop
    nop

change_code:
## uncache write new code to the same physical address
    la	t0, code_to_be_changed
# kseg1(uncached)
    lui	t1, 0x2000
    or	t0, t1, t0
# store new code
    la	t1, new_code
    lw	t2, 0x0(t1)
    sw	t2, 0x0(t0)

## invalid the old code in icache
# get code_block address
    la	t0, code_block
# remain index (bit 11..5), clear way and tag
    li	t1, 0x00000fe0 
    and t0, t1, t0
# make access address in kseg0 (unmapped)
    lui	t1, 0x8000
    or	t0, t0, t1
# invalid code_block in icache (way 0)
    .set mips32
    cache ICIndexStTag, 0(t0)
    .set mips0
# invalid code_block in icache (way 1)
    ori t0, t0, 0x1000 # way is bit 12
    .set mips32
    cache ICIndexStTag, 0(t0)
    .set mips0

## go back to changed code
    la	t0, code_to_be_changed
    li  t1,  0xdfffffff
    and	t0, t1, t0
    jr  t0
    nop

inst_pass:
###detect exception
    bne s2, zero, inst_error
    nop
###score ++
    addiu s3, s3, 1
###output (s0<<24)|s3
inst_error:  
    sll t1, s0, 24
    or t0, t1, s3 
    sw t0, 0(s1)
    jr ra
    nop
END(n2_ic_idx_sttag_test)
