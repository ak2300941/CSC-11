/*	Andrew Kim
	November 8th, 2015
	Project 1
	Tie Function
*/

.data

.balign 4
msgtie: .asciz "Game is a Tie\n"

.balign 4
return1: .word 0

.text

.global tie
tie:
	LDR R1, address_return1
	STR LR, [R1]
	LDR R0, address_msgtie
	BL printf
	LDR LR, address_return1
	LDR LR, [LR]
	BX LR

address_msgtie: .word msgtie
address_return1: .word return1

/* External */
.global printf
.global scanf
