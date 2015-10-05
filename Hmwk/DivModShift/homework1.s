/*
	Andrew Kim
	September 30th, 2015
	Div/Mod Shift
	Use the Shifted Subtraction Method
*/

.global _start
_start:
	/*Initialize The Registers*/
	MOV R0, #0		@Result of R5%R4 start with Numerator
	MOV R1, #0		@Result of R5/R4 start with 0
	MOV R2, #1		@Increment Value start with 1
	MOV R3, #0		@Decrement Value start with Denominator
	/*Declaration of Variables Holding Inputs*/
	MOV R4, #10		@Denominator
	MOV R5, #21		@Numerator
	/*Initialize the Working Registers with the Data*/
	MOV R0, R5
	MOV R3, R4
shiftleft:
	/*Shift the Denominator left until greater than Numerator, then shift back*/
	LSL R3, #1		@Denominator Shift Left
	LSL R2, #1		@Division Shift Left
	CMP R0, R3		@Compare
	BGT shiftleft		@R0 > R3
	LSR R3, #1		@Shift Denominator Right
	LSR R2, #1		@Shift Division Right
subtract:
	CMP R0, R3		@Compare
	BLT output		@R0 < R3
	ADD R1, R1, R2		@Increment division by the increment
	SUB R0, R0, R3		@Subtract shifted Denominator with remainder of Numerator
	/*Shift right until denominator is less than numerator*/
shiftright:
	CMP R2, #1		@Compare
	BEQ subtract		@R2 == 1
	CMP R3, R0		@Compare
	BLE subtract		@R3 <= R0
	LSR R2, #1		@Shifted Increment Right
	LSR R3, #1		@Shifted Denominator Left
	BAL shiftright		@Shift Denominator until less than Numerator
	BAL subtract		@Keep Looping until the division is complete
output:
	MOV R0, R1		@See Output on 21/10
	MOV R7, #1
	SWI 0
