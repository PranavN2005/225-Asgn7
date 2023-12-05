main:	
	jal	isrinit
	li a0,42
loop:	
	jal	printChar
	b loop
