/*
	Andrew Kim
	September 23rd, 2015
	Multiply-Shift Problem 3
	Area = pi * r^2
*/

.global _start
_start:
	LDR R1, =0x00007167		@BP -8 WD 16
	LDR R2, =0x0000517d		@BP-16 WD 16
	MUL R0, R2, R1			@BP-24 WD 32
	LSR R0, #24
	MOV R7, #1
	SWI 0


