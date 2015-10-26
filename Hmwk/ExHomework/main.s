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

/* Message 2 */
.balign 4
message2: .asciz "If range is degree Centigrade input 1: "

/* Message 3 */
.balign 4
message3: .asciz "If range is degree Fagrenheit input 2: "

/* Message 4 */
.balign 4
message4: .asciz "Display Degree Centigrade to Degree Fahrenheit\n"

/* Message 5 */
.balign 4
message5: .asciz "Display Degree Fahrenheit to Degree Centigrade\n"

/* Message to Check Input */
.balign 4
testmsg: .asciz "%d and %d\n"

.balign 4
testcho: .asciz "Choice is %d\n"

/* Format pattern for scanning inputs */

/* Takes in 2 Inputs */
.balign 4
scan_pattern1: .asciz "%d %d"

/* Take in 1 Input */
.balign 4
scan_pattern2: .asciz "%d"

/* Where scanf will store the number read */
.balign 4
beg: .word 0

.balign 4
end: .word 0

.balign 4
choice: .word 0

.text

.global main
main:
	/* Display Message1 */
	LDR R0, address_of_message1		@R0 <- &message1
	BL printf				@Call printf
	/* Call scanf, and pass address of format */
	LDR R0, address_of_scan_pattern1	@R0 <- &scan_pattern1
	LDR R1, address_of_beg			@R1 <- Stored into
	LDR R2, address_of_end			@R2 <- Stored into
	BL scanf				@Call to scanf
	LDR R1, address_of_beg			@R1 <- Reloading after function
	LDR R2, address_of_end			@R2 <- Reloading after function
	LDR R1, [R1]
	LDR R2, [R2]
	LDR R0, address_of_testmsg		@R0 <- &testmsg
	BL printf
	/* Display Message2 */
	LDR R0, address_of_message2		@R0 <- &message2
	BL printf				@Call printf
	/* Display Message3 */
	LDR R0, address_of_message3		@R0 <- &message3
	BL printf				@Call printf
	/* Call scanf, and pass address of format */
	LDR R0, address_of_scan_pattern2	@R0 <- &scan_pattern2
	LDR R1, address_of_choice		@R3 <- Ready to store
	BL scanf				@Call to scanf
	LDR R1, address_of_choice		@R3 Reloading after function
	LDR R1, [R1]
	LDR R0, address_of_testcho		@R0 <- &testcho
	BL printf
	LDR R0, address_of_choice		@Reload code to use in another function
	LDR R0, [R0]				@Load Register value inside the address
	CMP R0, #1				@Compare
	BEQ Problem1				@R0 = 1 Go to Problem1
	BGT Problem2				@R0 > 1 Go to Problem2
Problem1:
	LDR R0, address_of_message4
	BL printf
	BX LR

Problem2:
	LDR R0, address_of_message5
	BL printf
	BX LR

address_of_message1: .word message1
address_of_message2: .word message2
address_of_message3: .word message3
address_of_message4: .word message4
address_of_message5: .word message5
address_of_testmsg: .word testmsg
address_of_testcho: .word testcho
address_of_scan_pattern1: .word scan_pattern1
address_of_scan_pattern2: .word scan_pattern2
address_of_beg: .word beg
address_of_end: .word end
address_of_choice: .word choice

/* External */
.global printf
.global scanf
