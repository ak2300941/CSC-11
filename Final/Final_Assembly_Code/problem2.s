/*
	Andrew Kim
	December 12th 2015
	Final
	Problem 2
*/

.data

/* Messages */
pvmsg: .asciz "PV (1000 to 5000) :"
intmsg: .asciz "Interest (5 to 10 percent) :"
yearmsg: .asciz "Years (1 to 20) :"
answer: .asciz "Value: %f\n"
test: .asciz "Iterator %d\n"
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
iter2: .word 0
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
	/* Store Variables */
	LDR R0, =pv
	VSTR S6, [R0]
	/* Store Answer in Array */
	LDR R0, =array
	VMOV R5, S6
	STR R5, [R0, R1, LSL #2]
	/* Loop Logic */
	ADD R1, R1, #1		@Increment Counter +1
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
	LDR R5, [R0]		@Years
	/* Loop Logic */
	CMP R1, R5
	BLE loop
	/* Iterator #1 */
	MOV R6, #1
	LDR R7, =iter2
	STR R6, [R7]
displayloop:
	/* Display */
	/* Loop */
	LDR R0, =answer
	LDR R5, =array
	LDR R4, [R5, R6, LSL #2]
	VMOV S0, R4
	VCVT.F64.F32 D0, S0
	VMOV R2, R3, D0
	BL printf
	/* Reload */
	LDR R7, =iter2
	LDR R6, [R7]
	ADD R6, R6, #1
	STR R6, [R7]
	LDR R8, =iter
	LDR R9, [R8]
	CMP R6, R9		@i <= year
	BLT displayloop

	POP {IP, PC}

.global printf
.global scanf
