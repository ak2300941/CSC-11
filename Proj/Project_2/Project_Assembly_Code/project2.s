/*	Andrew Kim
	November 8th, 2015
	Project 1
	Tic Tac Toe
*/

.data

/* Messages */
.balign 4
msg1: .asciz "\nTic Tac Toe\n1. Start Game\n2. End Game\nEnter Choice: "

.balign 4
msg2: .asciz "\nTic Tac Toe\nUse # from 1 to 9 as input\n\n"

.balign 4
msg3: .asciz "\nPlayer 1: "

.balign 4
msg4: .asciz "\nPlayer 2: "

.balign 4
msgp1win: .asciz "Player 1 Wins\n"

.balign 4
msgp2win: .asciz "Player 2 Wins\n"

.balign 4
pic: .asciz "\n|%c|%c|%c|"

.balign 4
space: .asciz "\n"

.balign 4
msgtest: .asciz "Number stored is %c\n"

.balign 4
msgloc: .asciz "Here i am "

/* Format Pattern */
.balign 4
scand: .asciz "%d"

.balign 4
scanc: .asciz "%s"

/* Store */
.balign 4
choice: .word 0

.balign 4
turn: .word '0'

.balign 4
player1: .word 0

.balign 4
player2: .word 0

.balign 4
n1: .word '1'	@49

.balign 4
n2: .word '2'	@50

.balign 4
n3: .word '3'	@51

.balign 4
n4: .word '4'	@52

.balign 4
n5: .word '5'	@53

.balign 4
n6: .word '6'	@54

.balign 4
n7: .word '7'	@55

.balign 4
n8: .word '8'	@56

.balign 4
n9: .word '9'	@57

.balign 4
return: .word 0

/* Project 2 Stuff */
againmsg: .asciz "Play again? (y, n): "
.balign 4
yes: .word 'y'
.balign 4
choicep: .word 0
.balign 4
percent: .float 0
.balign 4
player1pt: .float 0
.balign 4
player2pt: .float 0
.balign 4
one: .float 1
.balign 4
hundred: .float 100
.text

.global main
main:
	/* Exit Setup */
	LDR R1, address_return
	STR LR, [R1]

startmenu:
	/* Display Message */
	LDR R0, address_msg1
	BL printf
	/* Get Input for Choice */
	LDR R0, address_scand
	LDR R1, address_choice
	BL scanf
	/* Choice decides */
	LDR R1, address_choice
	LDR R1, [R1]
	CMP R1, #1
	BEQ game
	CMP R1, #2
	BEQ exit
	BAL exit

exit:
	/* Exit */
	LDR LR, address_return
	LDR LR, [LR]
	BX LR

game:
	/* Display Message */
	LDR R0, address_msg2
	BL printf
	/* Get Picture of Game */
	BAL gamepic

gamestart1:
	/* Display Message */
	LDR R0, address_msg3
	BL printf
	/* Get Player 1 Input */
	LDR R0, address_scand
	LDR R1, address_player1
	BL scanf
	BAL gamelogic1

gamelogic1:
	/* Logic */
	LDR R0, address_player1
	LDR R0, [R0]
	CMP R0, #1		@#49 = 1
	BEQ p1location1
	CMP R0, #2
	BEQ p1location2
	CMP R0, #3
	BEQ p1location3
	CMP R0, #4
	BEQ p1location4
	CMP R0, #5
	BEQ p1location5
	CMP R0, #6
	BEQ p1location6
	CMP R0, #7
	BEQ p1location7
	CMP R0, #8
	BEQ p1location8
	CMP R0, #9
	BEQ p1location9
	BAL exit

p1location1:
	LDR R0, address_n1
	LDR R1, [R0]
	CMP R1, #49		@#49 = 1
	BNE gamestart1
	MOV R2, #88		@#88 = X
	STR R2, [R0]
	/* Add Turn++ */
	LDR R3, address_turn
	LDR R4, [R3]
	ADD R4, R4, #1
	STR R4, [R3]
	BAL gamepic

p1location2:
        LDR R0, address_n2
        LDR R1, [R0]
        CMP R1, #50
        BNE gamestart1
        MOV R2, #88
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p1location3:
        LDR R0, address_n3
        LDR R1, [R0]
        CMP R1, #51
        BNE gamestart1
        MOV R2, #88
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p1location4:
        LDR R0, address_n4
        LDR R1, [R0]
        CMP R1, #52
        BNE gamestart1
        MOV R2, #88
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p1location5:
        LDR R0, address_n5
        LDR R1, [R0]
        CMP R1, #53
        BNE gamestart1
        MOV R2, #88
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p1location6:
        LDR R0, address_n6
        LDR R1, [R0]
        CMP R1, #54
        BNE gamestart1
        MOV R2, #88
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p1location7:
        LDR R0, address_n7
        LDR R1, [R0]
        CMP R1, #55
        BNE gamestart1
        MOV R2, #88
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p1location8:
        LDR R0, address_n8
        LDR R1, [R0]
        CMP R1, #56
        BNE gamestart1
        MOV R2, #88
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p1location9:
        LDR R0, address_n9
        LDR R1, [R0]
        CMP R1, #57
        BNE gamestart1
        MOV R2, #88
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

gamestart2:
        /* Display Message */
        LDR R0, address_msg4
        BL printf
        /* Get Player 1 Input */
        LDR R0, address_scand
        LDR R1, address_player2
        BL scanf
        BAL gamelogic2

gamelogic2:
        /* Logic */
        LDR R0, address_player2
        LDR R0, [R0]
        CMP R0, #1              @#49 = 1
        BEQ p2location1
        CMP R0, #2
        BEQ p2location2
        CMP R0, #3
        BEQ p2location3
        CMP R0, #4
        BEQ p2location4
        CMP R0, #5
        BEQ p2location5
        CMP R0, #6
        BEQ p2location6
        CMP R0, #7
        BEQ p2location7
        CMP R0, #8
        BEQ p2location8
        CMP R0, #9
        BEQ p2location9
        BAL exit

p2location1:
        LDR R0, address_n1
        LDR R1, [R0]
        CMP R1, #49             @#49 = 1
        BNE gamestart2
        MOV R2, #79             @#79 = O
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p2location2:
        LDR R0, address_n2
        LDR R1, [R0]
        CMP R1, #50
        BNE gamestart2
        MOV R2, #79
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p2location3:
        LDR R0, address_n3
        LDR R1, [R0]
        CMP R1, #51
        BNE gamestart2
        MOV R2, #79
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p2location4:
        LDR R0, address_n4
        LDR R1, [R0]
        CMP R1, #52
        BNE gamestart2
        MOV R2, #79
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p2location5:
        LDR R0, address_n5
        LDR R1, [R0]
        CMP R1, #53
        BNE gamestart2
        MOV R2, #79
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p2location6:
        LDR R0, address_n6
        LDR R1, [R0]
        CMP R1, #54
        BNE gamestart2
        MOV R2, #79
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p2location7:
        LDR R0, address_n7
        LDR R1, [R0]
        CMP R1, #55
        BNE gamestart2
        MOV R2, #79
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p2location8:
        LDR R0, address_n8
        LDR R1, [R0]
        CMP R1, #56
        BNE gamestart2
        MOV R2, #79
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

p2location9:
        LDR R0, address_n9
        LDR R1, [R0]
        CMP R1, #57
        BNE gamestart2
        MOV R2, #79
        STR R2, [R0]
        /* Add Turn++ */
        LDR R3, address_turn
        LDR R4, [R3]
        ADD R4, R4, #1
        STR R4, [R3]
        BAL gamepic

gamepic:
	/* First Line */
	LDR R0, address_pic
	LDR R1, address_n1
	LDR R1, [R1]
	LDR R2, address_n2
	LDR R2, [R2]
	LDR R3, address_n3
	LDR R3, [R3]
	BL printf
	/* Second Line */
	LDR R0, address_pic
	LDR R1, address_n4
	LDR R1, [R1]
	LDR R2, address_n5
	LDR R2, [R2]
	LDR R3, address_n6
	LDR R3, [R3]
	BL printf
	/* Third Line */
	LDR R0, address_pic
	LDR R1, address_n7
	LDR R1, [R1]
	LDR R2, address_n8
	LDR R2, [R2]
	LDR R3, address_n9
	LDR R3, [R3]
	BL printf
	/* Space */
	LDR R0, address_space
	BL printf
	/* Check Win Conditions */
	BAL winconditions

turncheck:
	/* Check Turns */
	LDR R1, address_turn
	LDR R1, [R1]
	CMP R1, #48		@#48 = 0 (Turn 0)
	BEQ gamestart1
	CMP R1, #49		@#49 = 1 (Turn 1)
	BEQ gamestart2
	CMP R1, #50
	BEQ gamestart1
	CMP R1, #51
	BEQ gamestart2
        CMP R1, #52
        BEQ gamestart1
        CMP R1, #53
        BEQ gamestart2
        CMP R1, #54
        BEQ gamestart1
        CMP R1, #55
        BEQ gamestart2
	CMP R1, #56
        BEQ gamestart1
 	CMP R1, #57
	BEQ tiefunction

tiefunction:
	BL tie
	BAL exit

winconditions:
	/* Check Win Conditions */
	/* Check Player 1 */
        LDR R0, address_n1
        LDR R0, [R0]
        CMP R0, #88
        BEQ p1check1
	BAL part2
part2:
	LDR R0, address_n9
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check9
	BAL part3
part3:
	LDR R0, address_n5
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check5
	BAL part4
part4:
	/* Check Player 2 */
	LDR R0, address_n1
        LDR R0, [R0]
        CMP R0, #79
        BEQ p2check1
        BAL part5
part5:
	LDR R0, address_n9
        LDR R0, [R0]
        CMP R0, #79
        BEQ p2check9
        BAL part6
part6:
        LDR R0, address_n5
        LDR R0, [R0]
        CMP R0, #79
        BEQ p2check5
        BAL turncheck
 
p1check5:
	LDR R0, address_n2
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check52
	LDR R0, address_n6
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check56
	LDR R0, address_n3
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check53
	BAL part4

p1check53:
	LDR R0, address_n7
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1win
	BAL part4

p1check52:
	LDR R0, address_n8
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1win
	BAL part4

p1check56:
	LDR R0, address_n4
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1win
	BAL part4

p1check9:
	LDR R0, address_n8
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check98
	LDR R0, address_n6
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check96
	BAL part3

p1check96:
	LDR R0, address_n3
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1win
	BAL part3

p1check98:
	LDR R0, address_n7
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1win
	BAL part3

p1check1:
	LDR R0, address_n2
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check12
	LDR R0, address_n5
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check15
	LDR R0, address_n4
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1check14
	BAL part2

p1check12:
	LDR R0, address_n3
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1win
	BAL part2

p1check15:
	LDR R0, address_n9
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1win
	BAL part2

p1check14:
	LDR R0, address_n7
	LDR R0, [R0]
	CMP R0, #88
	BEQ p1win
	BAL part2

p2check5:
	LDR R0, address_n2
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2check52
	LDR R0, address_n6
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2check56
	LDR R0, address_n3
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2check53
	BAL turncheck

p2check53:
	LDR R0, address_n7
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2win
	BAL turncheck

p2check52:
	LDR R0, address_n8
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2win
	BAL turncheck

p2check56:
	LDR R0, address_n4
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2win
	BAL turncheck

p2check9:
	LDR R0, address_n8
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2check98
	LDR R0, address_n6
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2check96
	BAL part6

p2check96:
	LDR R0, address_n3
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2win
	BAL part6

p2check98:
	LDR R0, address_n7
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2win
	BAL part6

p2check1:
	LDR R0, address_n2
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2check12
	LDR R0, address_n5
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2check15
	LDR R0, address_n4
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2check14
	BAL part5

p2check12:
	LDR R0, address_n3
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2win
	BAL part5

p2check15:
	LDR R0, address_n9
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2win
	BAL part5

p2check14:
	LDR R0, address_n7
	LDR R0, [R0]
	CMP R0, #79
	BEQ p2win
	BAL part5

p1win:
	LDR R0, address_msgp1win
	BL printf
	LDR R0, =player1pt
	VLDR S0, [R0]
	LDR R0, =one
	VLDR S1, [R0]
	VADD.F32 S2, S0, S1		@Increment +1
	LDR R0, =player1pt
	VSTR S2, [R0]
	/* Play Again */
	LDR R0, =againmsg
	BL printf
	LDR R0, =scanc
	LDR R1, =choicep
	BL scanf
	LDR R0, =choicep
	LDR R1, [R0]
	LDR R0, =yes
	LDR R2, [R0]
	CMP R1, R2
	BEQ reset
	BAL exit

p2win:
	LDR R0, address_msgp2win
	BL printf
	LDR R0, =player2pt
	VLDR S0, [R0]
	LDR R0, =one
	VLDR S1, [R0]
	VADD.f32 S2, S0, S1
	LDR R0, =player2pt
	VSTR S2, [R0]
	/* Play Again */
        LDR R0, =againmsg
        BL printf
        LDR R0, =scanc
        LDR R1, =choicep
        BL scanf
        LDR R0, =choicep
        LDR R1, [R0]
        LDR R0, =yes
        LDR R2, [R0]
        CMP R1, R2
        BEQ reset
        BAL exit

reset:
	LDR R0, =n1
	LDR R1, [R0]
	MOV R1, #'1'
	STR R1, [R0]		@1
	LDR R0, =n2
	LDR R1, [R0]
	MOV R1, #'2'
	STR R1, [R0]		@2
	LDR R0, =n3
	LDR R1, [R0]
	MOV R1, #'3'
	STR R1, [R0]		@3
	LDR R0, =n4
	LDR R1, [R0]
	MOV R1, #'4'
	STR R1, [R0]		@4
	LDR R0, =n5
        LDR R1, [R0]
        MOV R1, #'5'
        STR R1, [R0]            @5
        LDR R0, =n6
        LDR R1, [R0]
        MOV R1, #'6'
        STR R1, [R0]            @6
        LDR R0, =n7
        LDR R1, [R0]
        MOV R1, #'7'
        STR R1, [R0]            @7
        LDR R0, =n8
        LDR R1, [R0]
        MOV R1, #'8'
        STR R1, [R0]            @8
	LDR R0, =n9
	LDR R1, [R0]
	MOV R1, #'9'
	STR R1, [R0]		@9
	LDR R0, =turn
	LDR R1, [R0]
	MOV R1, #'0'
	STR R1, [R0]
	BAL startmenu

address_msg1: .word msg1
address_msg2: .word msg2
address_msg3: .word msg3
address_msg4: .word msg4
address_msgp1win: .word msgp1win
address_msgp2win: .word msgp2win
address_pic: .word pic
address_space: .word space
address_msgtest: .word msgtest
address_msgloc: .word msgloc
address_scand: .word scand
address_scanc: .word scanc
address_choice: .word choice
address_player1: .word player1
address_player2: .word player2
address_turn: .word turn
address_n1: .word n1
address_n2: .word n2
address_n3: .word n3
address_n4: .word n4
address_n5: .word n5
address_n6: .word n6
address_n7: .word n7
address_n8: .word n8
address_n9: .word n9
address_return: .word return

/* External */
.global printf
.global scanf
