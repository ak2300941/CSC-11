/*
	Andrew Kim
	October 17th, 2015
	Creating For Loop
*/

.global _start
_start:
	MOV R0, #0		@Initialize/Give #0
	MOV R1, #1		@Counter
forloop:
	ADD R0, R0, R1		@Add +1 to R0
	ADD R1, R1, #1		@Increment Counter
	CMP R1, #10		@Compare
	BLE forloop		@R1 <= 10
	MOV R7, #1
	SWI 0
