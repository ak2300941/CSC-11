/*
	Andrew Kim
	December 12th, 2015
	Final
	Problem 3
*/

.data

/* Messages */
.balign 4
msg: .asciz "Answer: %d\n"
/* Stores */
inc: .word 0

.text

.global main
main:
	PUSH {IP,LR}
	/* Loop Logic */
	MOV R3, #1		@Increment
loop:
	/* Initialize */
	LDR R1, =0x12b0		@Variable a BP-16
	LDR R2, =0xe041		@Variable b BP-16
	/* Calculate */
	MUL R4, R3, R3		@i * i
	MUL R5, R1, R4		@(a * (i * i))
	MUL R6, R2, R3		@b * i
	ADD R7, R5, R6		@(a * (i * i)) + (b * i)
	/* Loop Logic */
	ADD R3, R3, #1		@Increment Counter +1
	/* Store Variables */
	LDR R0, =inc
	STR R3, [R0]		@Store Increment
	/* Shift Answer to Display */
	LSR R7, #16
	/* Display */
	LDR R0, =msg
	MOV R1, R7
	BL printf
	/* Reload Variables */
	LDR R0, =inc
	LDR R3, [R0]
	/* Loop Logic */
	CMP R3, #255
	BLE loop

	POP {IP, PC}

.global printf
.global scanf
