/*
	Andrew Kim
	December 12th 2015
	Final
	Problem 2
*/

.data

/* Messages */
.balign 4
pvmsg: .asciz "PV (1000 to 5000) :"
.balign 4
intmsg: .asciz "Interest (5 to 10 percent) :"
.balign 4
yearmsg: .asciz "Years (1 to 20) :"
.balign 4
answer: .asciz "Value: %f\n"
/* Format Pattern */
.balign 4
scan: .asciz "%f"
.balign 4
scand: .asciz "%d"
/* Store */
.balign 4
pv: .float 0
.balign 4
int: .float 0
.balign 4
years: .word 0
.balign 4
hundred: .float 100
.balign 4
one: .float 1
.balign 4
iter: .word 0
.balign 4
array: .skip 80
.text

.global problem2
problem2:
	PUSH {IP,LR}

	/* User input */
	LDR R0, =pvmsg
	BL printf
	LDR R0, =scan
	LDR R1, =pv
	BL scanf		@Present Value
	LDR R0, =intmsg
	BL printf
	LDR R0, =scan
	LDR R1, =int
	BL scanf		@Interest Value
	LDR R0, =yearmsg
	BL printf
	LDR R0, =scand
	LDR R1, =years
	BL scanf		@Years Value
	/* Turn Interest to Decimal */
	LDR R0, =int
	VLDR S0, [R0]		@Interest
	LDR R0, =hundred
	VLDR S1, [R0]		@100
	VDIV.F32 S0, S0, S1	@Turn to decimal to solve equation
	/* Store Interest */
	LDR R0, =int
	VSTR S0, [R0]
	/* Loop Logic */
	MOV R1, #1		@Iterator
	/* Initialize */
	LDR R0, =pv
	VLDR S2, [R0]		@PV
loop:
	/* Initialize */
	LDR R0, =years
	VLDR S3, [R0]		@Years
	LDR R0, =one
	VLDR S4, [R0]		@1
 	/* Calculate */
	VADD.F32 S5, S4, S0	@1 + Interest
	VMUL.F32 S6, S2, S5	@PV * (1 + Interest)
	/* Loop Logic */
	ADD R1, R1, #1		@Increment Counter +1
	/* Store Variables */
	LDR R0, =pv
	VSTR S6, [R0]
	/* Store Answer in Array */
	LDR R0, =array
	VSTR S6, [R0]
	/* Store Other Variables */
	LDR R0, =iter
	STR R1, [R0]
	/* Display */
	@VCVT.F64.F32 D0, S6
	@LDR R0, =answer
	@VMOV R2, R3, D0
	@BL printf
	/* Reload Variables */
	LDR R0, =pv
	VLDR S2, [R0]		@PV
	LDR R0, =int
	VLDR S0, [R0]		@Interest
	LDR R0, =iter
	LDR R1, [R0]		@Iterator
	LDR R0, =years
	LDR R5,[R0]		@Years
	/* Loop Logic */
	CMP R1, R5
	BLE loop
	/* Loop to Display Answer from array */
	/* Iteratior 1 */
	MOV R1, #1
	LDR R0, =iter
	STR R1, [R0]
	/* Display */
	LDR R0, =array
	VLDR S0, [R0]
	VCVT.F64.F32 D0, S0
	LDR R0, =answer
	VMOV R2, R3, D0
	BL printf
	/* Loop */
	LDR R0, =iter
	LDR R1, [R0]
	ADD R1, R1, #1
	STR R1, [R0]
	LDR R0, =years
	LDR R2, [R0]
	CMP R1, R2
	BLE loop

	POP {IP, PC}

.global printf
.global scanf
