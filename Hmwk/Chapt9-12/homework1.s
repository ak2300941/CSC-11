/*
	Andrew Kim
	October 7th, 2015
	Using Compare Instructions
*/

.global _start
_start:
	MOV R0, #1		@Initialize count
loop:
	ADD R0, R0, #1		@Increment count
	CMP R0, #50		@Compare with limit
	BLE loop		
