/*
        Andrew Kim
        September 23rd, 2015
        Multiply-Shift Problem 5
        Area = Pi * r^2
*/

.global _start
_start:
	LDR R1, =0x00006800	@BP-12 WD 16
	LDR R2, =0x00003243	@BP-12 WD 16
	MUL R0, R2, R1		@BP-24 WD 32
	LSR R0, #24
	MOV R7, #1
	SWI 0
