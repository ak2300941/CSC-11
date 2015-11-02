/*	Andrew Kim
	November 1st, 2015
	Midterm
	Menu for Midterm
*/

.data

/* Messages */
.balign 4
msg1: .asciz "\nMenu for Midterm\nChoice 1: Problem 1\nChoice 2: Problem 2\nChoice 3: Problem 3\n"

/* Format Pattern */
.balign 4
scand: .asciz "%d"

/* Store */
.balign 4
input: .asciz "%d"

.balign 4
return: .word 0

.text

.global main
main:
	/* Exit Setup */
	LDR R1, address_return
	STR LR ,[R1]
	/* Display Message */
	LDR R0, address_msg1
	BL printf
	/* Get Input for Choice of Problem */
	LDR R0, address_scand
	LDR R1, address_input
	BL scanf
	/* Choice decides Problem */
	LDR R1, address_input
	LDR R1, [R1]
	CMP R1, #1
	BEQ Function1
	CMP R1, #2
	BEQ Function2
	CMP R1, #3
	BEQ Function3
	BAL exit
exit:
	/* Exit */
	LDR LR, address_return
	LDR LR, [LR]
	BX LR

Function1:
	BL Problem1
	BL main
Function2:
	BL Problem2
	BL main
Function3:
	BL Problem3
	BL main

address_msg1: .word msg1
address_scand: .word scand
address_input: .word input
address_return: .word return

/* External */
.global printf
.global scanf
