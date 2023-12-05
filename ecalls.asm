.text
.globl	printInt		
printInt:	
	li      a7,1           
        ecall
	ret
	
.globl	readInt		
readInt:	
		li      a7,5
        	ecall
		ret
.globl	printString
printString:	
	li 	a7,	4
	ecall
	ret

.globl printChar
printChar:
	li 	a7,	11
	ecall
	ret

	
.globl readChar		
readChar:		
	li      a7,	12		          
        ecall
	ret
		
.globl	exitProgram
exitProgram:		
	li	a7,	10
	ecall

.globl readString
readString:	
	addi 	sp,	sp,	-16
	sw 	ra, 	12(sp)
	sw	s0, 	8(sp)
	mv	s0,	a0
while:	jal	readChar
	li	t0,	'\n'
	beq	a0,	t0,	eWhile
	sb	a0,	0(s0)
	addi	s0,	s0,	1
	b	while
	
eWhile:	sb	zero,	0(s0)
	lw	ra,	12(sp)
	lw	s0,	8(sp)
	addi	sp,	sp, 16	
	ret