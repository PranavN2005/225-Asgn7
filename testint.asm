.text
#ASGN7 BY PRANAV NALLAPERUMAL AND SCOTT FRIZZELL
.globl main
main:	
	jal	isrinit
	li 	a0,	42
loop:	
	jal	printChar
	b loop
