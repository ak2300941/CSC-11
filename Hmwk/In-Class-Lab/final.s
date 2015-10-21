/*	Andrew Kim
	October 21st, 2015
	Using Functions from different file
	Adding Multiplication by 5
*/

.data

/* First message */
.balign 4
message1: .asciz "Hey, type a number: "

/* Second message */
.balign 4
message2: .asciz "%d times 5 is %d\n"

/* Format pattern for scanf */
.balign 4
scan_pattern: .asciz "%d"

/* Where scanf will store the number read */
.balign 4
number_read: .word 0

.balign 4
return: .word 0

.text

.global main
main:
	LDR R1, address_of_return	@R1 <- &address_of_return
	STR LR, [R1]			@*R1 <- LR
	LDR R0, address_of_message1	@R0 <- &message1
	BL printf			@Call to printf
	
	LDR R0, address_of_scan_pattern	@R0 <- &scan_pattern
	LDR R1, address_of_number_read	@R1 <- &number_read
	BL scanf			@Call to scanf
	
	LDR R0, address_of_number_read	@R0 <- &number_read
	LDR R0, [R0]			@R0 <- *R0
	BL multi_by_5

	MOV R2, R0			@R2 <- R0
	LDR R1, address_of_number_read	@R1 <- &number_read
	LDR R1, [R1]			@R1 <- *R1
	LDR R0, address_of_message2	@R0 <- &message2
	BL printf			@Call to printf

	LDR LR, address_of_return	@LR <- &address_of_return
	LDR LR, [LR]			@LR <- *LR
	BX LR				@return from main using LR

address_of_message1: .word message1
address_of_message2: .word message2
address_of_scan_pattern: .word scan_pattern
address_of_number_read: .word number_read
address_of_return: .word return

/* External */
.global printf
.global scanf
