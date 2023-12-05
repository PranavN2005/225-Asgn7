.data
initmsg:	.string	"\nInitializing Interrupts\n"

RCR: .word 0xffff0000
RDR: .word 0xffff0004
TCR: .word 0xffff0008
TDR: .word 0xffff000c	

.globl	isrinit
isrinit:
	la	t0,	handler
	csrw	t0,	utvec
	li	t0,	1
	csrs	t0,	ustatus
	li 	t0, 	256
	csrs	t0, 	uie
	lw	t0,	RCR
	lw	t1,	0(t0)
	ori	t1,	t1,	2
	sw	t1,	0(t0)
	lw	t0,	TCR
	lw	t1,	0(t0)
	ori	t1,	t1,	2
	sw	t1,	0(t0)
	la	a0,	initmsg
	jal	printString
	ret

handler:
	addi	sp,	sp,	-16
	
	
	
	
	
	