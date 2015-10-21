/*	Andrew Kim
	October 21st, 2015
	Using Functions
	Multiply by 5 Function
*/

.data

.balign 4
return2: .word 0

.text

/* multi_by_5 function */
.global multi_by_5
multi_by_5:
	LDR R1, address_of_return2	@R1 <- &address_of_return
	STR LR, [R1]			@*R1 <- LR
	ADD R0, R0, R0, LSL #2		@R0 <- R0 + 4*R0
	LDR LR, address_of_return2	@LR <- &address_of_return
	LDR LR, [LR]			@LR <- *LR
	BX LR				@return from main using LR

address_of_return2: .word return2
