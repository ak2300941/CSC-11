/*
	Andrew Kim
	September 28th, 2015
	Div/Mod 1
	Divide using subtration and loops only
*/

.global _start
_start:
	/*Initialize the Registers*/
	MOV R1, #0		@Result of R3/R2
	MOV R2, #6		@Denominator
	MOV R3, #55		@Numerator
	/*Loop and Keep Subtracting Off the Denominator*/
	MOV R0, R3		@Place the Numerator in R0
	_while_R0_GE_R2:	@Loop until the Division is over
	CMP R0, R2		@Compare R0 and R2
	BLT _output		@Exit and Output the Result
		ADD R1, R1, #1	@Increment the Division Counter
		SUB R0, R0, R2	@Subtract the Denominator from the Numerator
	BAL _while_R0_GE_R2
	/*Output the Result*/
	_output:
	MOV R7, #1
	SWI 0
