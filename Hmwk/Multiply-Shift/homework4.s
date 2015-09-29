/*
        Andrew Kim
        September 23rd, 2015
        Multiply-Shift Problem 4
        Area = Pi * r^2
*/

.global _start
_start:
	MOV R1, #6		@BP 0  WD 3
	LDR R2, =0x03243F6A	@BP-20 WD 24
	MUL R3, R1, R1		@BP 0  WD 6
	MUL R0, R2, R3		@BP-20 WD 30 
	LSR R0, #24
	MOV R7, #1
	SWI 0
