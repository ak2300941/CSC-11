/*	Andrew Kim
	October 27th, 2015
	Midterm
	Problem 1
*/

.data

/* Messages */
.balign 4
msg1: .asciz "How many hours worked in a week: "

.balign 4
msg2: .asciz "What is the rate of pay: "

.balign 4
msg3: .asciz "Error!!!\nHours need to be 60 or below\n\n"

.balign 4
testinput: .asciz "Hours: %d, Pay: %d\n"

.balign 4
display: .asciz "Hours: %d, Pay: %d, Salary: %d\n"

/* Format Pattern */
.balign 4
scanp: .asciz "%d"

/* Store */
.balign 4
hours: .word 0

.balign 4
pay: .word 0

.balign 4
salary: .word 0

.balign 4
return: .word 0

.text

.global main
main:
	LDR R1, address_return
	STR LR, [R1]
	/* Display Message */
	LDR R0, address_msg1
	BL printf
	/* Gather input for hours */
	LDR R0, address_scanp
	LDR R1, address_hours
	BL scanf
	LDR R1, address_hours
	/* Display Message */
	LDR R0, address_msg2
	BL printf
	/* Gather input for pay */
	LDR R0, address_scanp
	LDR R1, address_pay
	BL scanf
	/* Test Inputs */
	LDR R0, address_testinput
	LDR R1, address_hours
	LDR R1, [R1]
	LDR R2, address_pay
	LDR R2, [R2]
	BL printf
	/* Test for Input for Hours */
	LDR R0, address_hours
	LDR R0, [R0]
	CMP R0, #60
	BGT error
	CMP R0, #40
	BLE straight
	CMP R0, #40
	BGT double

error:
	/* Error Function when Hours >60 */
	LDR R0, address_msg3
	BL printf
	BAL main

straight:
	/* When Hours <=40 */
	LDR R1, address_hours
	LDR R1, [R1]
	LDR R2, address_pay
	LDR R2, [R2]
	LDR R3, address_salary
	LDR R3, [R3]
	/* Calculate */
	MUL R3, R1, R2
	/* Display */
	LDR R0, address_display
	BL printf
	BAL exit

double:
	/* Check when hours go pass 49 */
	LDR R0, address_hours
	LDR R0, [R0]
	CMP R0, #50
	BGE triple
	/* Do Double Pay Function */
	LDR R1, address_hours
	LDR R1, [R1]
	LDR R2, address_pay
	LDR R2, [R2]
	LDR R3, address_salary
	LDR R3, [R3]
	/* Initialize Variables to use */
	MOV R4, #0
	MOV R5, #0
	MOV R6, #0
	MOV R7, #40
	MOV R8, #2
	/* Calculate */
	MUL R3, R7, R2
	MUL R4, R8, R2
	SUB R5, R1, R7
	MUL R6, R5, R4
	ADD R3, R6
	/* Display */
	LDR R0, address_display
	BL printf
	BAL exit

triple:
	/* Do Triple Pay Function */
	LDR R1, address_hours
	LDR R1, [R1]
	LDR R2, address_pay
	LDR R2, [R2]
	LDR R3, address_salary
	LDR R3, [R3]
	/* Initialize Variables to use */
	MOV R4, #0
	MOV R5, #0
	MOV R6, #0
	MOV R7, #0
	MOV R8, #40
	MOV R9, #16
	MOV R10, #49
	MOV R11, #3
	/* Calculate */
	MUL R3, R8, R2
	MUL R4, R9, R2
	ADD R3, R3, R4
	SUB R5, R1, R10
	MUL R6, R11, R2
	MUL R7, R5, R6
	ADD R3, R3, R7
	/* Display */
	LDR R0, address_display
	BL printf
	BAL exit

exit:
	LDR LR, address_return
	LDR LR, [LR]
	BX LR


address_msg1: .word msg1
address_msg2: .word msg2
address_msg3: .word msg3
address_testinput: .word testinput
address_display: .word display
address_scanp: .word scanp
address_hours: .word hours
address_pay: .word pay
address_salary: .word salary
address_return: .word return
/* External */
.global printf
.global scanf
