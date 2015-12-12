/*
	Andrew Kim
	December 11th, 2015
	Final
	Problem 1
*/

.data

/* Messages */
.balign 4 
title: .asciz "Guess the Number\nI have a number between 1 and 1000 can you guess my number?\nYou will be given a maximum of 10 guesses. Please type your first guess.\n"

.balign 4
msg1: .asciz "Guess: "

.balign 4
msg2: .asciz "Congratulations, You guessed the number!\n"

.balign 4
msg3: .asciz "Too High. Try again.\n"

.balign 4
msg4: .asciz "Too Low. Try again.\n"

.balign 4
test:  .asciz "%d\n"

/* Format Pattern */
.balign 4
scan: .asciz "%d"

/* Store */
.balign 4
store: .word 1000

.balign 4
number: .word 0

.balign 4
return: .word 0

.text

.global main
main:
	/* Exit Setup */
	LDR R1, address_return
	STR LR, [R1]
	/* Display Message */
	LDR R0, address_title
	BL printf
	/* Set Timer Seed */
	MOV R0, #0
	BL time
	BL srand
	/* Make Random Number */
	BL rand
	MOV R1, #1000
	BL mod
	
	/* Exit */
	LDR LR, address_return
	LDR LR, [LR]
	BX LR

address_title: .word title
address_msg1: .word msg1
address_msg2: .word msg2
address_msg3: .word msg3
address_msg4: .word msg4
address_test: .word test
address_scan: .word scan
address_store: .word store
address_number: .word number
address_return: .word return

/* External */
.global printf
.global scanf
.global rand
.global srand
.global time
