
.text

.globl	isrinit
isrinit:
	addi	sp,	sp,	-16
	sw	ra,	12(sp)
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
	#lw	t0,	TCR
	#lw	t1,	0(t0)
	#ori	t1,	t1,	2
	#sw	t1,	0(t0)
	la	a0,	initmsg
	jal	printString
	lw	ra,	12(sp)
	ret

handler:
	addi 	sp,	sp,	-32
	sw 	t0,	28(sp)
	sw	t1,	24(sp)
	sw	a7,	20(sp)
	sw	ra,	16(sp)
	sw	s0,	12(sp)
	sw	s1,	8(sp)
	
	la	t0,	isrCount
	lw	t1,	0(t0)
	addi	t1,	t1,	1
	li	a7,	5
	bne	t1,	a7,	skipReset
	mv	t1,	zero
	la	a7,	main
	csrw	a7,	uepc
skipReset:
	sw	t1,	0(t0)	
	lw	t0,	RDR
	lw	a0,	0(t0)	
	
	sw 	a0, 	4(sp)
	
	la 	a0,	keypress
	jal	printString
	
	lw 	a0,	4(sp)
	jal 	printChar
	li	a0,	'\n'
	jal 	printChar
	lw 	a0,	4(sp)
	lw	s1,	8(sp)
	lw	s0,	12(sp)
	lw	ra,	16(sp)
	lw	a7,	20(sp)
	lw	t1,	24(sp)
	lw	t0,	28(sp)
	addi	sp,	sp,	32
	uret
