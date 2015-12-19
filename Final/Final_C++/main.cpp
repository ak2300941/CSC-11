/* 
 * File:   main.cpp
 * Author: Andrew Kim
 * Created on December 11, 2015, 12:13 PM
 */

//System Libraries
#include <iostream>
#include <ctime>
#include <cmath>
#include <cstdlib>
using namespace std;

//Function Prototypes
void Menu();
int getN();
void def(int);
void problem1();
void problem2();
void problem3();
void problem4();

int main(int argv,char *argc[])
{
    int inN;
    do
    {
        Menu();
        inN=getN();
        switch(inN)
        {
            case 1:    problem1();break;
            case 2:    problem2();break;
            case 3:    problem3();break;
            case 4:    problem4();break;
            default:   def(inN);}
    }
    while(inN>=1&&inN<=4);
    return 0;
}

void Menu()
{
    cout<<"Menu for the Final"<<endl;
    cout<<"Type 1 for problem 1"<<endl;
    cout<<"Type 2 for problem 2"<<endl;
    cout<<"Type 3 for problem 3"<<endl;
    cout<<"Type 4 for problem 4"<<endl;
    cout<<"Type anything else to exit \n"<<endl;
}

int getN()
{
    int inN;
    cin>>inN;
    return inN;
}

void problem1()
{
    cout << "Guess the Number" << endl;
    cout << "I have a number between 1 and 1000 can you guess my number?" << endl;
    cout << "You will be given a maximum of 10 guesses. Please type your first guess." << endl;
    //Declare Variables
    int guess = 10;
    int player;
    //Set timer seed
    srand(static_cast<unsigned int>(time(0)));
    //srand(time(NULL));
    int number = rand() % 1000 + 1;
    cout << "Number: " << number << endl;
    do
    {
        //Choose a number
        cout << "Guess: ";
        cin >> player;
        //Check winning condition
        if(player == number)
        {
            cout << "Congratulations, You guessed the number!" << endl;
            break;
        }
        if(player > number)
        {
            cout << "Too High. Try again." << endl;
        }
        if(player < number)
        {
            cout << "Too Low. Try again." << endl;
        }
        guess--;
    }while(guess>0);
    cout << endl;
}

void problem2()
{
    //Compound Interest Problem
    float PV, Interest, percent;
    float array[20];
    int Year;
    cout << "PV: ";
    cin >> PV;
    cout << "Year: ";
    cin >> Year;
    cout << "Interest: ";
    cin >> Interest;
    percent = Interest/100;
    for(int i = 1; i <= Year; ++i)
    {
        array[i] = PV * (1 + percent);
        PV = array[i];
    }
    //Display
    for(int i = 1; i <= Year; ++i)
    {
        cout << "FV: "<< array[i] << endl;
    }
    cout << endl;
}

void problem3()
{
    //Declare Variables
    int a = 0x12b0;         //bp -16
    int b = 0xe041;         //bp -16
    int answer;
    //Calculate
    for(int i = 0; i <= 255; ++i)
    {
        answer = (a * (i * i)) + (b * i);
        answer>>=16;
        cout << " Answer for x = " << i << " is " << answer << endl;
    }
    cout << endl;
}

void problem4()
{
    //Declare Variables
    float a = 0.073;
    float b = 0.876;
    float answer;
    //Calculate
    for(int i = 0; i <= 255; ++i)
    {
        answer = (a * (i * i)) + (b * i);
        cout << " Answer for x = " << i << " is " << answer << endl;
    }
    cout << endl;
}

void def(int inN)
{
        cout<<"You typed "<<inN<<" to exit the program"<<endl;
}