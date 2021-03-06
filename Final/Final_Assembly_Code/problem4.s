/*
	Andrew Kim
	December 12th, 2015
	Final
	Problem 4
*/

.data

/* Messages */
.balign 4
msg: .asciz "Answer: %f\n"
.balign 4
test: .asciz "Digit: %f\n"
/* Store */
.balign 4
a: .float 0.073
.balign 4
b: .float 0.876
.balign 4
inc: .float 0.0
.balign 4
one: .float 1.0
.balign 4
check: .float 255
.text

.global problem4
problem4:
	PUSH {IP,LR}
	MOV R5, #1 		@Increment not in float

loop:
	/* Initialize */
	LDR R0, =a
	VLDR S0, [R0]		@Variable a
	LDR R0, =b
	VLDR S1, [R0]		@Variable b
	LDR R0, =inc
	@VLDR S3, [R0]		@Increment
	@LDR R0, =one
	VMOV S3, R5
	VCVT.F32.S32 S3, S3	@Increment
	VLDR S4, [R0]		@1
	LDR R0, =check
	VLDR S5, [R0]		@255
	/* Calculate */
	VMUL.F32 S6, S3, S3	@i * i
	VMUL.F32 S7, S0, S6	@(a * (i * i))
	VMUL.F32 S8, S1, S3	@b * i
	VADD.F32 S9, S7, S8	@(a * (i * i)) + (b * i)
	/* Loop Logic */
	@VADD.F32 S2, S3, S4		@Increment Counter +1
	ADD R5, R5, #1
	/* Store Variables */
	LDR R0, =inc
	VSTR S2, [R0]
	/* Display */
	VCVT.F64.F32 D0, S9
	LDR R0, =msg
	VMOV R2, R3, D0
	BL printf
	/* Check Iterator */
	@VCVT.F64.F32 D0, S2
	@LDR R0, =test
	@VMOV R2, R3, D0
	@BL printf
	/* Reload Variables */
	LDR R0, =inc
	VLDR S3, [R0]
	/* Loop Logic */
	@VCMP.F32 S3, S5
	@VMRS APSR_nzcv, FPSCR
	CMP R5, #255
	BLE loop

	POP {IP,PC}

.global printf
.global scanf
