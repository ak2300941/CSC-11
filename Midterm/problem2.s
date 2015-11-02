/*	Andrew Kim
	October 30th, 2015
	Midterm
	Problem 2
*/

.data

/* Messages */
.balign 4
msg1: .asciz "Choose between package a, b, or c: "

.balign 4
msga: .asciz "Package A Function\n"

.balign 4
msgb: .asciz "Package B Function\n"

.balign 4
msgc: .asciz "Package C Function\n"

.balign 4
msgtest: .asciz "Choice input was %c\n"

.balign 4
msghours: .asciz "Enter # of hours: "

.balign 4
costdisplay: .asciz "Monthly Cost: %d\n"

/* Format Pattern */
.balign 4
scanc: .asciz "%s"

.balign 4
scand: .asciz "%d"

/* Store */
.balign 4
choice: .word 0

.balign 4
hours: .word 0

.balign 4
cost: .word 0

.balign 4
return3: .word 0

.text

.global Problem2
Problem2:
	/* Exit Setup */
	LDR R1, address_return3
	STR LR, [R1]
	/* Display Message */
	LDR R0, address_msg1
	BL printf
	/* Get Choice Input */
	LDR R0, address_scanc
	LDR R1, address_choice
	BL scanf
	/* Check Input */
	LDR R0, address_msgtest
	LDR R1, address_choice
	LDR R1, [R1]
	BL printf
	/* Compare Input with Packages */
	LDR R1, address_choice
	LDR R1, [R1]
	CMP R1, #'a'
	BEQ functiona
	CMP R1, #'b'
	BEQ functionb
	CMP R1, #'c'
	BEQ functionc
	BAL exit

functiona:
	/* Package A */
	LDR R0, address_msga
	BL printf
	/* Display Message */
	LDR R0, address_msghours
	BL printf
	/* Input Hours */
	LDR R0, address_scand
	LDR R1, address_hours
	BL scanf
	/* Compare Hours */
	LDR R1, address_hours
	LDR R1, [R1]
	CMP R1, #11
	BLE afirst
	CMP R1, #11
	BGT asecond
	BAL exit

afirst:
	/* Calculate */
	MOV R1, #30			@cost
	LDR R0, address_costdisplay
	BL printf
	BAL exit

asecond: 
	/* Check if its greater than 22 */
	LDR R0, address_hours
	LDR R0, [R0]
	CMP R0, #22
	BGT athird
	/* Calculate */
        LDR R0, address_hours           @hours
        LDR R0, [R0]
        MOV R1, #30                     @cost
        MOV R2, #3
        MOV R3, #11
        SUB R4, R0, R3
        MUL R2, R2, R4
        ADD R1, R1, R2
        /* Display Cost */
        LDR R0, address_costdisplay
        BL printf
	BAL exit

athird:
	/* Calculate */
	LDR R0, address_hours		@hours
	LDR R0, [R0]
	MOV R1, #63			@cost
	MOV R2, #22
	MOV R3, #0
	SUB R3, R0, R2
	MOV R4, #6
	MUL R4, R3
	ADD R1, R1, R4
	/* Display Cost */
	LDR R0, address_costdisplay
	BL printf
	BAL exit

functionb:
	/* Package B */
	LDR R0, address_msgb
	BL printf
	/* Display Message */
	LDR R0, address_msghours
	BL printf
	/* Input Hours */
	LDR R0, address_scand
	LDR R1, address_hours
	BL scanf
	/* Compare Hours */
	LDR R1, address_hours
	LDR R1, [R1]
	CMP R1, #22
	BLE bfirst
	CMP R1, #22
	BGT bsecond
	BAL exit

bfirst:
	/* Calculate */
	MOV R1, #35			@cost
	LDR R0, address_costdisplay
	BL printf
	BAL exit

bsecond:
	/* Check if its greater than 44 */
	LDR R0, address_hours
	LDR R0, [R0]
	CMP R0, #44
	BGT bthird
	/* Calculate */
        LDR R0, address_hours           @hours
        LDR R0, [R0]
        MOV R1, #35                     @cost
        MOV R2, #2
        MOV R3, #22
        SUB R4, R0, R3
        MUL R2, R2, R4
        ADD R1, R1, R2
        /* Display Cost */
        LDR R0, address_costdisplay
        BL printf
	BAL exit

bthird:
	/* Calculate */
	LDR R0, address_hours		@hours
	LDR R0, [R0]
	MOV R1, #79			@cost
	MOV R2, #44
	MOV R3, #0
	SUB R3, R0, R2
	MOV R4, #4
	MUL R4, R3
	ADD R1, R1, R4
	/* Display Cost */
	LDR R0, address_costdisplay
	BL printf
	BAL exit

functionc:
	/* Package C */
	LDR R0, address_msgc
	BL printf
	/* Display Message */
	LDR R0, address_msghours
	BL printf
	/* Input Hours */
	LDR R0, address_scand
	LDR R1, address_hours
	BL scanf
	/* Compare Hours */
	LDR R1, address_hours
	LDR R1, [R1]
	CMP R1, #33
	BLE cfirst
	CMP R1, #33
	BGT csecond
	BAL exit

cfirst:
	/* Calculate */
	MOV R1, #40			@cost
	LDR R0, address_costdisplay
	BL printf
	BAL exit

csecond:
	LDR R0, address_hours
	LDR R0, [R0]
	CMP R0, #66
	BGT cthird
	/* Calculate */
        LDR R0, address_hours           @hours
        LDR R0, [R0]
        MOV R1, #40                     @cost
        MOV R2, #1
        MOV R3, #33
        SUB R4, R0, R3
        MUL R2, R2, R4
        ADD R1, R1, R2
        /* Display Cost */
        LDR R0, address_costdisplay
        BL printf
	BAL exit

cthird:
	/* Calculate */
	LDR R0, address_hours		@hours
	LDR R0, [R0]
	MOV R1, #73			@cost
	MOV R2, #66
	MOV R3, #0
	SUB R3, R0, R2
	MOV R4, #2
	MUL R4, R3
	ADD R1, R1, R4
	/* Display Cost */
	LDR R0, address_costdisplay
	BL printf
	BAL exit
exit:
	/* Exit */
	LDR LR, address_return3
	LDR LR, [LR]
	BX LR

address_msg1: .word msg1
address_msgtest: .word msgtest
address_msga: .word msga
address_msgb: .word msgb
address_msgc: .word msgc
address_msghours: .word msghours
address_costdisplay: .word costdisplay
address_scanc: .word scanc
address_scand: .word scand
address_choice: .word choice
address_hours: .word hours
address_cost: .word cost
address_return3: .word return3

/* External */
.global printf
.global scanf
