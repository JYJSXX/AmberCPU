#include <asm.h>
#include <regdef.h>
#include <cpu_cde.h>

#define TEST_NUM 7

##s0, number
##s1, number adress 
##s2, exception use
##s3, score
##s4, exception pc
	.set	noreorder
	.globl	_start
	.globl	start
	.globl	__main
_start:
start:
    disable_trace_cmp_s

# set c0.config.k0 = cached
    .set mips32
    mfc0  t0, c0_config
    andi  t0, t0, 0xfff8
    ori	  t0, t0, 0x3
    mtc0  t0, c0_config
    .set mips0
    
    la	t0, locate
    li	t1, 0xdfffffff # kseg0
    and t0, t0, t1
    jr	t0
    nop

##avoid "j locate" not taken
    lui   t0, 0x8000
    addiu t1, t1, 1
    or    t2, t0, zero
    addu  t3, t5, t6
    lw    t4, 0(t0)
    nop

##avoid cpu run error
.org 0x0e8
    lui   t0, 0x8000
    addiu t1, t1, 1
    or    t2, t0, zero
    addu  t3, t5, t6
    lw    t4, 0(t0)
    nop
.org 0x100
test_finish:
    addiu t0, t0, 1
    b test_finish
    nop
##avoid cpu run error
    lui   t0, 0x8000
    addiu t1, t1, 1
    or    t2, t0, zero
    addu  t3, t5, t6
    lw    t4, 0(t0)

/*
 *  exception handle
 */
.org 0x200
# No tlb exception expected, go fail
    b	cache_fail
    nop
.org 0x380
# No exception expected, go fail
cache_fail:  
    sll	t1, s0, 24
    or	t0, t1, s3 
    sw	t0, 0(s1)
    jr	ra
    nop


locate:
	.set noreorder

    LI (a0, LED_RG1_ADDR)
    LI (a1, LED_RG0_ADDR)
    LI (a2, LED_ADDR)
    LI (s1, NUM_ADDR)

    LI (t1, 0x0002)
    LI (t2, 0x0001)
    LI (t3, 0x0000ffff)
    lui s3, 0

    sw t1, 0(a0)
    sw t2, 0(a1)
    sw t3, 0(a2)
    sw s3, 0(s1)
    lui s0, 0
inst_test:
    jal n1_ic_idx_inv_test
    nop
    jal wait_1s
    nop
    jal n2_ic_idx_sttag_test
    nop
    jal wait_1s
    nop
    jal n3_ic_hit_inv_test
    nop
    jal wait_1s
    nop
    jal n4_dc_idx_wbinv_test
    nop
    jal wait_1s
    nop
    jal n5_dc_idx_sttag_test
    nop
    jal wait_1s
    nop
    jal n6_dc_hit_inv_test
    nop
    jal wait_1s
    nop
    jal n7_dc_hit_wbinv_test
    nop
    jal wait_1s
    nop

test_end:
    LI  (s0, TEST_NUM)
    beq s0, s3, 1f
    nop

    LI (a0, LED_ADDR)
	LI (a1, LED_RG1_ADDR)
    LI (a2, LED_RG0_ADDR)
	
    LI (t1, 0x0002)
    
	sw zero, 0(a0)
    sw t1, 0(a1)
    sw t1, 0(a2)
    b  2f
    nop
1:
    LI (t1, 0x0001)
    LI (a0, LED_RG1_ADDR)
	LI (a1, LED_RG0_ADDR)
    sw t1, 0(a0)
    sw t1, 0(a1)

2:
    la  t0, test_finish
    lui t1, 0x2000
    or  t0, t1, t0
    jr t0
    nop

wait_1s:
    LI (t0,SW_INTER_ADDR)
    LI (t1, 0xaaaa)

    #initial t3
    lw    t2, 0x0(t0)   #switch_interleave: {switch[7],1'b0, switch[6],1'b0...switch[0],1'b0}
    NOP4
    xor   t2, t2, t1
    NOP4
    sll   t3, t2, 9     #t3 = switch interleave << 9
    NOP4
    addiu t3, t3, 1
    NOP4

sub1:  
    addiu t3, t3, -1

    #select min{t3, switch_interleave}
    lw    t2, 0x0(t0)   #switch_interleave: {switch[7],1'b0, switch[6],1'b0...switch[0],1'b0}
    NOP4
    xor   t2, t2, t1
    NOP4
    sll   t2, t2, 9     #switch interleave << 9
    NOP4
    sltu  t4, t3, t2
    NOP4
    bnez  t4, 1f 
    nop
    addu  t3, t2, 0
    NOP4
1:
    bne   t3,zero, sub1
    nop
    jr ra
    nop
