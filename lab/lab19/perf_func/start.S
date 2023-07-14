#include <asm/asm.h>
#include <asm/regdef.h>
#include <cpu.h>
#include <machine.h>
#include <ns16550.h>
#include <asm/context.h>
#include <cpu_cde.h>

	.set	noreorder
	.globl	_start
	.globl	start
	.globl	__main
_start:
start:
    disable_trace_cmp_s
    li  t0,NUM_MONITOR_ADDR
    sw  zero, 0x0(t0)
    lui t2,0x0040    
	la	sp, _stack
	la	gp, _gp

# set c0.config.k0 = cached
    .set mips32
    mfc0  t0, c0_config
    andi  t0, t0, 0xfff8
    ori	  t0, t0, 0x3
    mtc0  t0, c0_config
    .set mips0

# jump to kseg0
    la    t0, 1f
    li    t1, 0x20000000
    subu  t0, t0, t1  //9fc...
    jr    t0
    nop
1:
	bal	shell			/* Get current execute address */
	nop

	j test_finish
    nop

.org 0x100
test_finish:
    addiu t0, t0, 1
    li t1, 0xff
    LI (t2, UART_ADDR)
    sw t1, 0x0(t2)
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
.org 0x380
1:  
    addiu t0, t0, 1
    b 1b
    nop
