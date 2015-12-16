/* 
 * File:   main.cpp
 * Author: Andrew Kim
 * Created on November 3, 2015, 3:48 PM
 * Project 2
 */

//System Libraries
#include <iostream>
#include <cstdlib>
using namespace std;

//User-Defined Libraries

//No Global Constants

//Function Prototypes

//Execution
int main(int argc, char** argv)
{
    //Declare  Variables
    int choice;
    startmenu:
    cout<<"Tic Tac Toe\n1. Start Game\n2. End Game"<<endl;
    cout<<"Enter Choice: ";
    cin>>choice;
    cout<<endl;
    if(choice==1)
    {
        cout<<"~~~Tic Tac Toe~~~"<<endl;
        //Declare game variables
        int turn = 0;
        char n1 = '1',n2 = '2',n3 = '3',n4 = '4',n5 = '5',n6 = '6',n7 = '7',n8 = '8',n9 = '9';
        //Play game til win/lose/tie
        char player1, player2;
        do{
            goto playerc1;
            playerc1:
            //Turn
            if(turn==9)
            {
                cout << "Game is a Tie\n" <<endl;
                goto startmenu;
            }
            //Display
            cout<<endl;
            cout<<"|"<<n1<<"|"<<n2<<"|"<<n3<<"|"<<endl;
            cout<<"|"<<n4<<"|"<<n5<<"|"<<n6<<"|"<<endl;
            cout<<"|"<<n7<<"|"<<n8<<"|"<<n9<<"|"<<endl;
            //Enter Input Player 1
            cout << "Player 1: ";
            cin >> player1;
            cout << endl;
            //Logic
            if(player1=='1')
            {
                if(n1!='1')
                {
                    cout << "Location already used" <<endl;
                    goto playerc1;
                }
                n1='X';
                turn++;
            }
            if(player1=='2')
            {
                if(n2!='2')
                {
                    cout << "Location already used" <<endl;
                    goto playerc1;
                }
                n2='X';
                turn++;
            }
            if(player1=='3')
            {
                if(n3!='3')
                {
                    cout << "Location already used" <<endl;
                    goto playerc1;
                }
                n3='X';
                turn++;
            }
            if(player1=='4')
            {
                if(n4!='4')
                {
                    cout << "Location already used" <<endl;
                    goto playerc1;
                }
                n4='X';
                turn++;
            }
            if(player1=='5')
            {
                if(n5!='5')
                {
                    cout << "Location already used" <<endl;
                    goto playerc1;
                }
                n5='X';
                turn++;
            }
            if(player1=='6')
            {
                if(n6!='6')
                {
                    cout << "Location already used" <<endl;
                    goto playerc1;
                }
                n6='X';
                turn++;
            }
            if(player1=='7')
            {
                if(n7!='7')
                {
                    cout << "Location already used" <<endl;
                    goto playerc1;
                }
                n7='X';
                turn++;
            }
            if(player1=='8')
            {
                if(n8!='8')
                {
                    cout << "Location already used" <<endl;
                    goto playerc1;
                }
                n8='X';
                turn++;
            }
            if(player1=='9')
            {
                if(n9!='9')
                {
                    cout << "Location already used" <<endl;
                    goto playerc1;
                }
                n9='X';
                turn++;
            }
            //Check Win Condition
            if(n1=='X'&&n2=='X'&&n3=='X')
            {
                cout << "Player 1 Wins\n" << endl;
                goto startmenu;
            }
            if(n4=='X'&&n5=='X'&&n6=='X')
            {
                cout << "Player 1 Wins\n" << endl;
                goto startmenu;
            }
            if(n7=='X'&&n8=='X'&&n9=='X')
            {
                cout << "Player 1 Wins\n" << endl;
                goto startmenu;
            }
            if(n1=='X'&&n4=='X'&&n7=='X')
            {
                cout << "Player 1 Wins\n" << endl;
                goto startmenu;
            }
            if(n2=='X'&&n5=='X'&&n8=='X')
            {
                cout << "Player 1 Wins\n" << endl;
                goto startmenu;
            }
            if(n3=='X'&&n6=='X'&&n9=='X')
            {
                cout << "Player 1 Wins\n" << endl;
                goto startmenu;
            }
            if(n3=='X'&&n5=='X'&&n7=='X')
            {
                cout << "Player 1 Wins\n" << endl;
                goto startmenu;
            }
            if(n1=='X'&&n5=='X'&&n9=='X')
            {
                cout << "Player 1 Wins\n" << endl;
                goto startmenu;
            }
            goto playerc2;
            playerc2:
            //Display
            cout<<"|"<<n1<<"|"<<n2<<"|"<<n3<<"|"<<endl;
            cout<<"|"<<n4<<"|"<<n5<<"|"<<n6<<"|"<<endl;
            cout<<"|"<<n7<<"|"<<n8<<"|"<<n9<<"|"<<endl;
            //Turn Tie check
            if(turn==9)
            {
                cout << "Game is a Tie\n" <<endl;
                goto startmenu;
            }
            //Enter Input Player 2
            cout << "Player 2: ";
            cin >> player2;
            cout << endl;
            //Logic
            if(player2=='1')
            {
                if(n1!='1')
                {
                    cout << "Location already used" <<endl;
                    goto playerc2;
                }
                n1='O';
                turn++;
            }
            if(player2=='2')
            {
                if(n2!='2')
                {
                    cout << "Location already used" <<endl;
                    goto playerc2;
                }
                n2='O';
                turn++;
            }
            if(player2=='3')
            {
                if(n3!='3')
                {
                    cout << "Location already used" <<endl;
                    goto playerc2;
                }
                n3='O';
                turn++;
            }
            if(player2=='4')
            {
                if(n4!='4')
                {
                    cout << "Location already used" <<endl;
                    goto playerc2;
                }
                n4='O';
                turn++;
            }
            if(player2=='5')
            {
                if(n5!='5')
                {
                    cout << "Location already used" <<endl;
                    goto playerc2;
                }
                n5='O';
                turn++;
            }
            if(player2=='6')
            {
                if(n6!='6')
                {
                    cout << "Location already used" <<endl;
                    goto playerc2;
                }
                n6='O';
                turn++;
            }
            if(player2=='7')
            {
                if(n7!='7')
                {
                    cout << "Location already used" <<endl;
                    goto playerc2;
                }
                n7='O';
                turn++;
            }
            if(player2=='8')
            {
                if(n8!='8')
                {
                    cout << "Location already used" <<endl;
                    goto playerc2;
                }
                n8='O';
                turn++;
            }
            if(player2=='9')
            {
                if(n9!='9')
                {
                    cout << "Location already used" <<endl;
                    goto playerc2;
                }
                n9='O';
                turn++;
            }
            //Check Win Condition
            if(n1=='O'&&n2=='O'&&n3=='O')
            {
                cout << "Player 2 Wins\n" << endl;
                goto startmenu;
            }
            if(n4=='O'&&n5=='O'&&n6=='O')
            {
                cout << "Player 2 Wins\n" << endl;
                goto startmenu;
            }
            if(n7=='O'&&n8=='O'&&n9=='O')
            {
                cout << "Player 2 Wins\n" << endl;
                goto startmenu;
            }
            if(n1=='O'&&n4=='O'&&n7=='O')
            {
                cout << "Player 2 Wins\n" << endl;
                goto startmenu;
            }
            if(n2=='O'&&n5=='O'&&n8=='O')
            {
                cout << "Player 2 Wins\n" << endl;
                goto startmenu;
            }
            if(n3=='O'&&n6=='O'&&n9=='O')
            {
                cout << "Player 2 Wins\n" << endl;
                goto startmenu;
            }
            if(n3=='O'&&n5=='O'&&n7=='O')
            {
                cout << "Player 2 Wins\n" << endl;
                goto startmenu;
            }
            if(n1=='O'&&n5=='O'&&n9=='O')
            {
                cout << "Player 2 Wins\n" << endl;
                goto startmenu;
            }
        }while(turn<100);
    }
    else
    {
        return 0;
    }
    return 0;
}

