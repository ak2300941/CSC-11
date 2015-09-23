/*
	Andrew Kim
	September 22nd, 2015
	Multiply-Shift Problem 1
	Convert Months to Years
	88/12
*/

.global _start
_start:
	MOV R1, #88		@BP  0 WD 7
	LDR R2, =0x00155556	@BP-24 WD 24
	MUL R0, R2, R1		@BP-24 WD 31
	LSR R0, #24
	MOV R7, #1
	SWI 0	
