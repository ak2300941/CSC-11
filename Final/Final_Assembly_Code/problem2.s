/*
	Andrew Kim
	December 11th, 2015
	Final
	Problem 2
*/

.data

/* Messages */
.balign 4
answer: .asciz "Future Value: %f\n"

/* Store */
.balign 4
int: .float 1.05
.balign 4
intadd: .float 0.0025
.balign 4
pvalue: .float 1000.0
.balign 4
nint: .float 0
.balign 4
fvalue: .float 0
.balign 4
inc: .word 0

.text

.global main
main:
	PUSH {IP,LR}

	/* Initialize */
	LDR R0, =int
	VLDR S0, [R0]
	LDR R0, =pvalue
	VLDR S1, [R0]
	VMUL.F32 S2, S0, S1		@multiply
	VCVT.F64.F32 D0, S2		@convert to integer
	LDR R0, =answer
	VMOV R2, R3, D0
	BL printf

	POP {IP,PC}

.global printf
.global scanf
