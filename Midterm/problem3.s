/*	Andrew Kim
	October 30th, 2015
	Midterm
	Problem 3
*/

.data

/* Messages */
.balign 4
msg1: .asciz "Type in the number you want to output from: "

.balign 4
msg2: .asciz "Output: %d\n"

/* Format Pattern */
.balign 4
scanp: .asciz "%d"

/* Store */
.balign 4
input: .word 0

.balign 4
output: .word 0

.balign 4
return4: .word 0

.text

.global Problem3
Problem3:
	/* Exit setup */
	LDR R1, address_return4
	STR LR, [R1]
	/* Display Message */
	LDR R0, address_msg1
	BL printf
	/* Get User Input */
	LDR R0, address_scanp
	LDR R1, address_input
	BL scanf
	/* Compare Input */
	LDR R0, address_input
	LDR R0, [R0]
	CMP R0, #2
	BLE function1
	CMP R0, #2
	BGT function2

function1:
	/* When input is 1 or 2 */
	LDR R0, address_msg2
	MOV R1, #1
	BL printf
	BAL exit

function2:
	/* When input is 3 and greater */
	/* Initialize for loop */
	MOV R1, #2
	/* Variables */
	MOV R2, #1		@F2
	MOV R3, #1		@F1
	LDR R5, address_input
	LDR R5, [R5]
forloop:
	/* Calculating within the loop */
	MOV R4, R2
	ADD R2, R2, R3
	MOV R3, R4
	/* Back to Loop */
	ADD R1, R1, #1
	CMP R1, R5
	BLT forloop
	/* Exiting forloop*/
	MOV R1, R2
	LDR R0, address_msg2
	BL printf
	BAL exit

exit:
	LDR LR, address_return4
	LDR LR, [LR]
	BX LR

address_msg1: .word msg1
address_msg2: .word msg2
address_scanp: .word scanp
address_input: .word input
address_output: .word output
address_return4: .word return4

/* External */
.global printf
.global scanf
