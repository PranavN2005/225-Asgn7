.text
#ASGN7 BY PRANAV NALLAPERUMAL AND SCOTT FRIZZELL
.globl	printInt		
printInt:	
	#li      a7,1           
        #ecall
	#ret
	
	lw t1, TCR
	lw t0, (t1)
	andi t0, t0, 1
	beq t0, zero, printInt
	lw t1, TDR
	addi	a0,	a0,	48
	sw a0, (t1) # write char
	ret
	
.globl	readInt		
readInt:	
	lw t1, RCR # get RCR addr
	lw t0, (t1)# get RCR value
	andi t0, t0, 1
	beq t0, zero, readInt
	lw t1, RDR # get RDR addr
	lw a0, (t1) # read char
	addi	a0,	a0,	-48
	ret
.globl	printString
printString:
	addi sp,sp,-16
	sw ra,12(sp)
	sw s0,8(sp)
	sw	s1,	4(sp)
	mv s0,a0
	li s1, 0 #index
ploop:
	
	add t1,s0,s1 
	lb a0,0(t1)
	beq a0,zero, pend
	jal printChar
	addi s1,s1,1
	b ploop
pend:
	lw	s1,	4(sp)
	lw s0,8(sp)
	lw ra,12(sp)
	addi sp,sp,16
	ret
	
	
	

.globl printChar
printChar:
	lw t1, TCR
lw t0, (t1)
andi t0, t0, 1
beq t0, zero, printChar
lw t1, TDR
sb a0, (t1) # write char
	ret

	
.globl readChar		
readChar:		
	lw t1, RCR # get RCR addr
	lw t0, (t1)# get RCR value
	andi t0, t0, 1
	beq t0, zero, readChar
	lw t1, RDR # get RDR addr
	lbu a0, (t1) # read char
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
	
.data

RCR: .word 0xffff0000
RDR: .word 0xffff0004
TCR: .word 0xffff0008
TDR: .word 0xffff000c
