/*
	Andrew Kim
	September 23rd, 2015
	Multiply-Shift Problem 2
	Area * 1/pi = r^2
*/

.global _start
_start:
	MOV R1, #110;		@BP  0 WD 8
	LDR R2, =0x00517CC1	@BP-24 WD 24
	MUL R0, R2, R1		@BP-24 WD 32
	LSR R0, #24
	MOV R7, #1
	SWI 0
