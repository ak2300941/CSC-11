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
.balign 4
testint: .asciz "Interest Rate: %f\n"
/* Store */
.balign 4
int: .float 1.05	@Interest
.balign 4
intadd: .float 0.0025	@Interest Add
.balign 4
pvalue: .float 1000.0	@Present Value
.balign 4
nint: .float 0		@New Interest
.balign 4
fvalue: .float 0.0	@Future Value
.balign 4
inc: .word 0		@increment

.text

.global main
main:
	PUSH {IP,LR}

	/* Initialize */
	LDR R0, =int
	VLDR S0, [R0]		@Interest
	LDR R0, =intadd
	VLDR S1, [R0]		@Interest Add
	LDR R0, =pvalue
	VLDR S2, [R0]		@Present Value
	LDR R0, =fvalue
	VLDR S3, [R0]		@Future Value
	/* Loop */
	MOV R1, #1
loop:
	/* Calculation */
	VMUL.F32 S4, S0, S2	@PV * Interest
	VADD.F32 S5, S4, S3	@FV + (PV * Interest)
	VADD.F32 S6, S0, S1	@Increst + Added Interest = New Interest
	/* Store Variables */
	LDR R0, =inc
	STR R1, [R0]		@Store Increment
	LDR R0, =nint
	VSTR S6, [R0]		@Store New Interest
	LDR R0, =fvalue
	VSTR S5, [R0]		@Store Future Value
	/* Display */
	VCVT.F64.F32 D0, S5	@Convert to Integer
	LDR R0, =answer
	VMOV R2, R3, D0
	BL printf
	/* Check Interest */
	@VCVT.F64.F32 D0, S6
	@LDR R0, =testint
	@VMOV R2, R3, D0
	@BL printf
	/* Reload Variables */
	LDR R0, =inc
	LDR R1, [R0]		@Reload Increment Counter
	LDR R0, =nint
	VLDR S0, [R0]		@Reload Interest
	LDR R0, =intadd
	VLDR S1, [R0]		@Reload Interest Add
	LDR R0, =fvalue
	VLDR S3, [R0]		@Reload Future Value
	LDR R0, =pvalue
	VLDR S2, [R0]		@Reload Present Value
	ADD R1, R1, #1		@Increment Counter +1
	CMP R1, #20
	BLE loop

	POP {IP,PC}

.global printf
.global scanf

