/*	Andrew Kim
	October 21st, 2015
	Making Functions
	Hello World
*/

.data

greeting:
	.asciz "Hello world"

.balign 4
return:.word 0

.text

.global main
main:
	LDR R1, address_of_return	@R1 <- &address_of_return
	STR LR, [R1]			@R1 <- LR

	LDR R0, address_of_greeting	@R0 <- &address_of_greeting
					@First parameter of puts

	BL puts				@Call to puts
					@LR <- address of next instruction
	
	LDR R1, address_of_return	@R1 <- &address_of_return
	LDR LR, [R1]			@LR <- R1
	BX LR				@return from main

address_of_greeting: .word greeting
address_of_return: .word return

/* External */
.global puts
