# include <iostream>
# include <string>
# include <math.h>
# include <iomanip>


using namespace std;

struct ACCT{
		int accountBalance;
		int accountNumber;
		char accountType;
		string accountHolder;
};


// function prototypes
int MainMenu();
void CreateAccount(ACCT, ACCT, ACCT, ACCT);

// Lets get this puppy going
int main()
{
int answer;
string username;
ACCT accountBalance[3] = {0};
ACCT accountNumber[3]  = {0};
ACCT accountType[3];
ACCT accountHolder[3];

	cout << "ENTER USERNAME: ";
	cin  >> username;

	answer = MainMenu();
	//cout << answer;
	
	CreateAccount(accountNumber[0], accountBalance[0], accountType[0], accountHolder[0]);







return 0;
}
void CreateAccount(ACCT thisNumber, ACCT thisBalance, ACCT thisType, ACCT thisHolder)
{
	int num =0;
	cout << "ENTER USERNAME" << endl;
	cin  >> thisHolder;
	cout << "CHOOSE ACCOUNT TYPE (C/S): " << endl;
	cin  >> thisType;
	thisNumber = num + 1;
	num++;
	cout << "YOUR ACCOUNT NUMBER IS: " << thisNumber << endl;
	cout << "ENTER INTINAL BALANCE " << endl;
	cin  >> thisBalance;
	
}

int MainMenu()
{
	cout << setw(45) << " WELCOME TO R & D BANKING " << endl;

	cout << "WHAT WOULD YOU LIKE TO DO? " << endl
		 << "1) CREATE ACCOUNT " << endl
		 << "2) DELETE ACCOUNT " << endl
		 << "3) DEPOSIT MONEY "  << endl
		 << "4) WITHDRAW MONEY " << endl << " : ";
	int   ans;
	cin >> ans;
	return ans;
}

