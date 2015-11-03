/* 
 * File:   main.cpp
 * Author: Andrew Kim
 * Created on October 31, 2015, 5:23 PM
 * Midterm
 */

//System Libraries
#include <iostream>
#include <cstdlib>
using namespace std;

//User-Defined Libraries

//No Global Constants

//Function Prototypes
void Menu();
int getN();
void def(int);
void problem1();
void problem2();
void problem3();

//Execution
int main(int argc, char** argv)
{
    int inN;
    do{
        Menu();
        inN=getN();
        switch(inN){
        case 1:    problem1();break;
        case 2:    problem2();break;
        case 3:    problem3();break;
        default:   def(inN);}
    }while(inN>=1&&inN<=3);
    return 0;
}

void Menu()
{
    cout<<endl;
    cout<<"Menu for the Midterm"<<endl;
    cout<<"Type 1 for Problem 1"<<endl;
    cout<<"Type 2 for Problem 2"<<endl;
    cout<<"Type 3 for Problem 3"<<endl;
    cout<<"Type anything else to exit \n"<<endl;
}

int getN()
{
        int inN;
        cin>>inN;
        return inN;
}

void def(int inN)
{
        cout<<"You typed "<<inN<<" to exit the program"<<endl;
}

void problem1()
{
    //Variables
    int hours, rateofpay, salary = 0;
    //Input hours worked and rate of pay
    cout << "How many hours worked in a week? :";
    cin >> hours;
    if(hours>60)
    {
        cout << "How many hours worked in a week? :";
        cin >> hours;
    }
    cout << "What is the rate of pay? : ";
    cin >> rateofpay;
    cout<<endl;
    //Calculate so assembly can be easily coded
    if(hours<=40)
    {
        salary = hours * rateofpay;
        cout<<salary<<endl;
    }
    if(hours>40&&hours<50)
    {
        salary = 40 * rateofpay;
        cout<<salary<<endl;
        salary = salary + ((hours - 40) * (2 * rateofpay));
        cout<<salary<<endl;
    }
    if(hours>=50)
    {
        salary = 40 * rateofpay;
        cout<<salary<<endl;
        salary = salary + (16*rateofpay);
        cout<<salary<<endl;
        salary = salary + ((hours - 49) * (3 * rateofpay));
        cout<<salary<<endl;
    }
    //Output
    cout<<"Hours: "<<hours<<endl;
    cout<<"Rate of Pay: "<<rateofpay<<endl;
    cout<<"Salary: "<<salary<<endl;
}

void problem2()
{
    char choice;
    int hours, cost = 0;
    cout << "Choose between package a, b or c: ";
    cin >> choice;
    //Package 1
    if(choice == 'a')
    {
        cout << "Enter # of hours: ";
        cin >> hours;
        //Calculation
        if(hours<=11)
        {
            cost = 30;
            cout << "Monthly cost: "<<cost<<endl;
        }
        if(hours>11)
        {
            if(hours>22)
            {
                cost = 30;
                cost = cost + 33 + (6*(hours-22));
                cout << "Monthly cost: "<<cost<<endl;
                return;
            }
            cost = 30;
            cost = cost + 3*(hours-11);
            cout << "Monthly cost: "<<cost<<endl;
        }
    }
    if(choice == 'b')
    {
        cout << "Enter # of hours: ";
        cin >> hours;
        //Calculation
        if(hours<=22)
        {
            cost = 35;
            cout << "Monthly cost: "<<cost<<endl;
        }
        if(hours>22)
        {
            if(hours>44)
            {
                cost = 35;
                cost = cost + 44 + (4*(hours-44));
                cout << "Monthly cost: "<<cost<<endl;
                return;
            }
            cost = 35;
            cost = cost + 2*(hours-22);
            cout << "Monthly cost: "<<cost<<endl;
        }
    }
    if(choice == 'c')
    {
        cout << "Enter # of hours: ";
        cin >> hours;
        //Calculation
        if(hours<=33)
        {
            cost = 40;
            cout << "Monthly cost: "<<cost<<endl;
        }
        if(hours>33)
        {
            if(hours>66)
            {
                cost = 40;
                cost = cost + 33 + (2*(hours-66));
                cout << "Monthly cost: "<<cost<<endl;
                return;
            }
            cost = 40;
            cost = cost + 1*(hours-33);
            cout << "Monthly cost: "<<cost<<endl;
        }
    }
}

void problem3()
{
    int input, output = 0;
    cout << "Type in the number you want to output from: ";
    cin >> input;
    if(input <= 2)
    {
        output = 1;
    }
    if(input>2)
    {
        int f2 = 1;
        int f1 = 1;
        for(int i=2;i<input;++i)
        {
            int temp = f2;
            f2 = f2 + f1;
            f1 = temp;
        }
        output = f2;
        
    }
    cout << "Output: "<<output<<endl;
}
