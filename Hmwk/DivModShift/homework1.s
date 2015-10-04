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
	MOV R4, #6		@Denominator
	MOV R5, #55		@Numerator
	/*Initialize the Working Registers with the Data*/
	MOV R0, R5
	MOV R3, R4
shift:
	/*Shift the Denominator left until greater than Numerator, then shift back*/
	LSL R3, #1		@Denominator Shift Left
	LSL R2, #1		@Division Shift Left
	CMP R0, R3		@Compare
	BGT shift		@R0 > R3
	LSR R3, #1		@Shift Denominator Right
	LSR R2, #1		@Shift Division Right
subtract:
	/*Loop and keep Subtracting off the Shifted Denominator*/
	ADD R1, R1, R2		@Increment Division by the Increment
	SUB R0, R0, R3		@Subtract Shifted Denominator with remainder of Numerator
shiftr:
	LSR R2, #1		@Shift Increment Right
	LSR R3, #1		@Shift Denominator Right
	CMP R2, #1		@Compare
	BGT shiftr		@R2 > 1
	CMP R3, R0		@Compare
	BGT shiftr		@R3 > R0
	CMP R0, R3		@Compare
	BGE subtract		@R0 >= R3
	MOV R7, #1
	SWI 0 
