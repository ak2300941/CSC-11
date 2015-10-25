/*	Andrew Kim
	October 24th, 2015
	Example Homework
	Make Menu with Conversions
*/

.data

/* Messages */

/* Message 1 */
.balign 4
message1: .asciz "Input beginning and end of temperature range: "

.balign 4
testmsg: .asciz "%d and %d\n"

/* Format pattern for scanning inputs */

/* Takes in 2 Inputs */
.balign 4
scan_pattern: .asciz "%d, %d"

/* Where scanf will store the number read */
.balign 4
beg: .word 0

.balign 4
end: .word 0

.text

.global main
main:
	/* Display Message1 */
	LDR R0, address_of_message1		@R0 <- &message1
	BL printf				@Call printf
	/* Call scanf, and pass address of format */
	LDR R0, address_of_scan_pattern		@R0 <- &scan_pattern
	LDR R1, address_of_beg			@R1 <- Ready to store
	LDR R2, address_of_end			@R2 <- Ready to store
	BL scanf				@Call to scanf
	LDR R1, address_of_beg			@R1 <- Store #
	LDR R2, address_of_end			@R2 <- Store #
	LDR R1, [R1]
	LDR R2, [R2]
	LDR R0, address_of_testmsg		@R0 <- &testmsg
	BL printf

	/* Exit */
	BX LR

address_of_message1: .word message1
address_of_testmsg: .word testmsg
address_of_scan_pattern: .word scan_pattern
address_of_beg: .word beg
address_of_end: .word end


/* External */
.global printf
.global scanf
