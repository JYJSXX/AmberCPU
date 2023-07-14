#include <asm.h>
#include <regdef.h>
#include <cpu_cde.h>

LEAF(n6_dc_hit_inv_test)
    .set noreorder
    addiu s0, s0 ,1
    addiu s2, zero, 0x0
#######################################################
# Test cache instruction, op: dcache hit invalid      #
#######################################################
    # uncached store a specific value in mem
    li	t0, 0xa00d0020
    li  t1, 0xbad0beef
    sw	t1, 0(t0)
    # cached store to init it in dcache
    li	t0, 0x800d0020
    li	t2, 0xc0ffee00
    sw	t2, 0(t0)
    # dcache invalid
    .set mips32
    cache DCHitInv, 0(t0)
    .set mips0
    # cached load it back and check
    li	t0, 0x800d0020
    lw	t0, 0(t0)
    li  t1, 0xbad0beef
    bne t0, t1, inst_error
    nop
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
END(n6_dc_hit_inv_test)
