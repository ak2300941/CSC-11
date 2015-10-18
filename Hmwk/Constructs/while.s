/*
        Andrew Kim
        October 17th, 2015
        Creating While Loop
*/

.global _start
_start:
	MOV R0, #0 		@Initialize/Give #0
	MOV R1, #1		@Counter
whileloop:
	CMP R1, #10		@Compare
	BGT end			@R1>10 go to end
	ADD R0, R0, R1		@Add +1 to R0
	ADD R1, R1, #1		@Increment Counter
	BAL whileloop		@Move back to whileloop
end:
	MOV R7, #1
	SWI 0
