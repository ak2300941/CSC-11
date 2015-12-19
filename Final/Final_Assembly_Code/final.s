/*
	Andrew Kim
	December 13th, 2015
	Final
	Menu for Final
*/

.data

/* Messages */
msg: .asciz "\nMenu for Midterm\nChoice 1: Problem 1\nChoice 2: Problem 2\nChoice 3: Problem 3\nChoice 4: Problem 4\n"
/* Format Input */
.balign 4
scan: .asciz "%d"
/* Store */
.balign 4
input: .asciz "%d"
.balign 4
return: .word 0

.global main
main:
	@PUSH {IP,LR}
	LDR R1, =return
	STR LR, [R1]

loop:
	/* Menu Message */
	LDR R0, =msg
	BL printf
	/* User Input */
	LDR R0, =scan
	LDR R1, =input
	BL scanf
	/* Choice decides problem */
	LDR R0, =input
	LDR R0, [R0]
	CMP R0, #1
	BEQ Function1
	CMP R0, #2
	BEQ Function2
	CMP R0, #3
	BEQ Function3
	CMP R0, #4
	BEQ Function4
	BAL exit

exit:
	@POP {IP,PC}
	LDR LR, =return
	LDR LR, [LR]
	BX LR

Function1:
	BL problem1
	BL loop

Function2:
	BL problem2
	BL loop

Function3:
	BL problem3
	BL loop

Function4:
	BL problem4
	BL loop

.global printf
.global scanf
.global problem1
.global problem2
.global problem3
.global problem4
