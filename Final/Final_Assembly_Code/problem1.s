/*
	Andrew Kim
	December 13th, 2015
	Final
	Problem 1
*/

.data

/* Messages */
msggame: .asciz "Guess the Number\nI have a number between 1 and 1000 can you guess my number?\nYou will be given a maximum of 10 guesses. Please type your first guess.\n"
win: .asciz "Congratulations, You guessed the number!\nWould you like to play again(y or n)?\n"
low: .asciz "Too Low. Try again.\n"
high: .asciz "Too High. Try again.\n"
many: .asciz "Too Many Tries.\n"
test: .asciz "Random Number: %d\n"
choose: .asciz "Guess: "
/* Store */
.balign 4
player: .word 0
.balign 4
number: .word 0
.balign 4
guesses: .word 10
.balign 4
thousand: .word 1000
.balign 4
yes: .word 'y
/* Format = */
.balign 4
scan: .asciz "%d"
scans: .asciz "%s"
.text

.global problem1
problem1:
	PUSH {IP,LR}

start:
	/* Display */
	LDR R0, =msggame
	BL printf
	/* Initialize */
	MOV R0, #0
	BL time
	BL srand
	BL rand
	/* Recount Guess to 10 when played again */
	LDR R5, =guesses
	LDR R6, [R5]
	MOV R6, #10
	STR R6, [R5]
	/* Get Random Number */
	MOV R1, R0
	LDR R2, =thousand
	LDR R2, [R2]
	BL divMod
	ADD R1, R1, #1
	/* Store Number */
	LDR R0, =number
	STR R1, [R0]
	/* Display Random Number */
	@LDR R0, =test
	@BL printf
loop:
	/* Display */
	LDR R0, =choose
	BL printf
	/* Input */
	LDR R0, =scan
	LDR R1, =player
	BL scanf
	LDR R0, =player
	LDR R0, [R0]			@Player #
	LDR R1, =number
	LDR R1, [R1]			@Number
	CMP R0, R1
	BEQ victory			@Player = Number
	CMP R0, R1
	BGT highv
	CMP R0, R1
	BLT lowv

lowv:
	/* Guess-- */
	LDR R0, =guesses
	LDR R1, [R0]
	SUB R1, R1, #1
	STR R1, [R0]
	CMP R1, #0
	BLE bend
	/* Too Low Message */
	LDR R0, =low
	BL printf
	BAL loop

highv:
	/* Guess -- */
	LDR R0, =guesses
	LDR R1, [R0]
	SUB R1, R1, #1
	STR R1, [R0]
	CMP R1, #0
	BLE bend
	/* Too High Message */
	LDR R0, =high
	BL printf
	BAL loop

victory:
	/* Win Message */
	LDR R0, =win
	BL printf
	/* Choice to Play Again */
	LDR R0, =scans
	LDR R1, =player
	BL scanf
	LDR R0, =player
	LDR R0, [R0]
	LDR R1, =yes
	LDR R1, [R1]
	CMP R0, R1
	BEQ start
	BAL end

end:
	POP {IP,PC}

bend:
	LDR R0, =many
	BL printf

	POP {IP,PC}

.global printf
.global scanf
.global divMod
.global time
.global srand
.global ramd


