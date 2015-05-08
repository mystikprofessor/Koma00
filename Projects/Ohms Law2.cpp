# include <iostream>
# include <string>
# include <math.h>
# include <iomanip>

using namespace std;
 
float  CalcPower(float, float, float);
float  CalcCurrent(float, float, float);
float  CalcVoltage(float, float, float);
float  CalcResistance(float, float, float);
bool   ValueChecker(float, float, float);

int main ()
{
cout << fixed;
cout.precision(2);

char   ans;
char   nsf;
char   opt;
float  current, voltage, power, resistance;
float  input[2];
bool   value;
bool   chk1;
string powerTitle[3]      = { "CURRENT", "VOLTAGE", "RESISTANCE" };
string currentTitle[3]    = { "VOLTAGE", "RESISTANCE", "POWER" };
string voltageTitle[3]    = { "CURRENT", "POWER", "RESISTANCE" };
string resistanceTitle[3] = { "VOLTAGE", "POWER", "CURRENT" };

do
{
cout << setw(45) << " ***OHM'S LAW***  " << endl << endl;

cout << "WHAT DO YOU WANT TO CALCULATE? " << endl
	 << " A)Power? "   	  << endl
	 << " B)Current? "    << endl
	 << " C)Voltage? "    << endl 
	 << " D)Resistance? " << endl << " :";

	 cin >> ans;

switch (ans)
{
	case 'a':
	case 'A':
		cout << "***CALCULATING POWER*** " << endl;
		for (int ctr = 0; ctr <=2; ctr++){
			cout <<"If the "<< powerTitle[ctr] << " is not avaliable press 'x' or hit 'any key then enter' to input " << powerTitle[ctr] << endl;
			cin  >> nsf;
			do{
			if(nsf == 'x' || nsf == 'X'){
				input[ctr] = 0;
			}
			else{
				cout << "The " << powerTitle[ctr] << " is? : ";
				cin  >> input[ctr];
				if(cin.fail()){
					cin.clear();
					cin.ignore();
					cout << endl << "Insert a Numerical Value" << endl; 
					chk1 = false;
				}
				else{
					chk1 = true;
				}
			}
			}while (!chk1);
			nsf = 'y';
		}
		current    = input[0];
		voltage    = input[1];
		resistance = input[2];

		value = ValueChecker(voltage, current, resistance);
			if (value == false){
				cout << "CANNOT CALCULATE POWER " << endl;
				cout << "DO YOU WANT TO CALCULATE ANOTHER (Y/N)? ";
				cin  >> opt;
				break;
			}		
		power = CalcPower(voltage, current, resistance);
		cout << "The POWER is : " << power << " WATTS " << endl;
		cout << "DO YOU WANT TO CALCULATE ANOTHER (Y/N)? ";
		cin  >> opt;
		break;


	case 'b':
	case 'B':
		cout << "***CALCULATING CURRENT*** " << endl;
		for (int ctr =0; ctr <=2; ctr++){
			cout << "If the " << currentTitle[ctr] << " is not avaliable press 'x' or hit 'any key then enter' to input " << currentTitle[ctr] << endl;
			cin >> nsf;
			do{
			if (nsf == 'x' || nsf == 'X'){
				input[ctr] = 0;
			}
			else{
				cout << "The " << currentTitle[ctr] << " is? : ";
				cin >> input[ctr];
				if(cin.fail()){
					cin.clear();
					cin.ignore();
					cout << endl << "Insert a Numerical Value" << endl; 
					chk1 = false;
				}
				else{
					chk1 = true;
				}
			}
			}while (!chk1);
			nsf = 'y';	
		}
		voltage    = input[0];
		resistance = input[1];
		power      = input[2];
		
		value = ValueChecker(voltage, resistance, power);
			if (value == false){
				cout << "CANNOT CALCULATE CURRENT " << endl;
				cout << "DO YOU WANT TO CALCULATE ANOTHER (Y/N)? ";
				cin  >> opt;
				break;
			}
		current = CalcCurrent(voltage, resistance, power);
		cout << "The CURRENT is : " << current << " AMPS " << endl;
		cout << "DO YOU WANT TO CALCULATE ANOTHER (Y/N)? ";
		cin  >> opt;
		break;

	case 'c':
	case 'C':
		cout << "***CALCULATING VOLTAGE*** " << endl;
		for (int ctr = 0; ctr  <=2; ctr++){
			cout << "If the " << voltageTitle[ctr] << " is not avaliable press 'x' or hit any key then 'enter' to input " << voltageTitle[ctr] << endl;
			cin  >> nsf;
			do{
			if (nsf == 'x' || nsf == 'X'){
				input[ctr] = 0;
			}
			else{
				cout << "The " << voltageTitle[ctr] << " is? : ";
				cin  >> input[ctr];
				if(cin.fail()){
					cin.clear();
					cin.ignore();
					cout << endl << "Insert a Numerical Value" << endl; 
					chk1 = false;
				}
				else{
					chk1 = true;
				}
			}
			}while(!chk1);
			nsf = 'y';
		}
		current    = input[0];
		power      = input[1];
		resistance = input[2];

		value = ValueChecker(current, power, resistance);
			if (value == false){
				cout << "CANNOT CALCULATE VOLTAGE " << endl;
				cout << "DO YOU WANT TO CALCULATE ANOTHER (Y/N)? ";
				cin  >> opt;
				break;
			}
		voltage = CalcVoltage(current, power, resistance);
		cout << "The VOLTAGE is : " << voltage << " VOLTS " << endl;
		cout << "DO YOU WANT TO CALCULATE ANOTHER (Y/N)? ";
		cin  >> opt;
		break;

	case 'd':
	case 'D':
		cout << "***CALCULATING RESISTANCE***" << endl;
		for (int ctr =0; ctr <=2; ctr++){
			cout << "If the " << resistanceTitle[ctr] << " is not avaliable press 'x' or hit any key then 'enter' to input " << resistanceTitle[ctr] << endl;
			cin  >> nsf;
			do{
			if (nsf == 'x' || nsf == 'X'){
				input[ctr] = 0;
			}
			else{
				cout << "The " << resistanceTitle[ctr] << " is? : ";
				cin  >> input[ctr];
				if(cin.fail()){
					cin.clear();
					cin.ignore();
					cout << endl << "Insert a Numerical Value" << endl; 
					chk1 = false;
				}
				else{
					chk1 = true;
				}
			}
			}while(!chk1);
			nsf = 'y';
		}
		voltage = input[0];
		power 	= input[1];
		current = input[2];
		
		value = ValueChecker(voltage, power, current);
			if (value == false){
				cout << "CANNOT CALCULATE RESISTANCE " << endl
					 << "DO YOU WANT TO CALCULATE ANOTHER (Y/N)? ";
				cin  >> opt;
				break;
			}
		resistance = CalcResistance(voltage, power, current);
		cout << "The RESISTANCE is : " << resistance << " OHMS " << endl
			 << "DO YOU WANT TO CALCULATE ANOTHER (Y/N)? ";
		cin  >> opt;
		break;


		default: 
		cout <<  " INVALID ANSWER ";
		opt = 'y';
		break;
}		
}while (opt == 'y' || opt == 'Y');
return 0;
}

// Function Declarations

float CalcPower(float thisVoltage, float thisCurrent, float thisResistance)
{
	float pwr;

	if (thisVoltage == 0){
		pwr = ((thisCurrent * thisCurrent) * thisResistance);
	}
	else if (thisCurrent == 0){
		pwr = ((thisVoltage * thisVoltage) / thisResistance);
	}
	else if (thisResistance == 0){
		pwr = (thisCurrent * thisVoltage);
	}
	else{
		pwr = (thisCurrent * thisVoltage);
	} 
	return pwr;

}

float CalcCurrent(float thisVoltage, float thisResistance, float thisPower)
{
	float cur;
	
	if (thisResistance == 0){
		cur = (thisPower / thisVoltage);
	}
	else if (thisPower == 0){
		cur = (thisResistance / thisVoltage);
	}
	else if (thisVoltage == 0){
		cur = (sqrt((thisPower / thisResistance)));
	}
	else {
		cur = (thisPower / thisVoltage);
	}
	return cur;

}

float CalcVoltage(float thisCurrent, float thisPower, float thisResistance)
{
	float vol;
	
	if (thisPower == 0){
		vol = (thisCurrent * thisResistance);
	}
	else if (thisResistance == 0){
		vol = (thisPower / thisCurrent);
	}
	else if (thisCurrent == 0){
		vol = (sqrt(thisPower * thisResistance));
	}
	else{
		vol = (thisCurrent * thisResistance);
	}
	return vol;

}

float CalcResistance(float thisVoltage, float thisPower, float thisCurrent)
{
	float res;
	
	if (thisVoltage == 0){
		res = (thisPower / pow(thisCurrent,2));
	}
	else if (thisPower == 0){
		res = (thisVoltage / thisCurrent);
	}
	else if (thisCurrent == 0){
		res = (pow(thisVoltage,2) / thisPower);
	}
	else{
		res = (thisVoltage / thisCurrent);
	}
	return res;
}

bool ValueChecker(float a, float b, float c)
{
	if (a == 0 && b == 0){
		return false;
	}
	else if (a == 0 && c == 0){
		return false;
	}
	else if (b == 0 && c == 0){
		return false;
	}
	else{
		return true;
	}
}

