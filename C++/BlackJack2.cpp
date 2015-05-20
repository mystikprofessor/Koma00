#include <iostream>
#include <cstdlib>
#include <string>
#include <ctime>
 
using namespace std;
 
// #1: define what a card is
struct MY_CARD { string cardName;   // Ace, King, One, Seven, etc
                string cardSuit;    // Heart, Club, Spade, Diamond
                int faceValue;      // 11, 10, 9, 8, etc
                int myLocation;     // 1 = deck, 2 = hand, 3 = discard
};

// pass the card deck array by refrence,  Returns index of card in deck.
int DealCard(MY_CARD*);

// will look up the faceValue of each card in thisHand,  Returns the sum.
int GetScore(MY_CARD*, int*);
int GetCardCount(int*);

// The Dealers AI
void DealersChoice(int&, int&, char&);

// checks for and handles Ace swap.
void AceChecker(int&, int&);

// print functions
void PrintHand(MY_CARD*, int*);
void PrintCard(MY_CARD*, int);

// discard and reshuffle cards
void DiscardCard(MY_CARD*);

int main()
{
    // seed the rand()
    srand(time(NULL));

    // #2 array of MyCards
    // zero-fill hands for empty-checking later!
    MY_CARD cardDeck[52];
    int dealerHand[5] = {0};
    int playerHand[5] = {0};

    string cardLocs[3]  =  { "Deck", "Play", "Discard" };
    string cardSuits[4] =  { "Diamonds", "Clubs", "Hearts", "Spades" };
    string cardNames[13] = { "Ace", "King", "Queen", "Jack", "Ten", "Nine", "Eight", "Seven", "Six", "Five", "Four", "Three", "Two" };
    int    cardVals[13]  = {    11,     10,      10,     10,    10,      9,       8,       7,     6,      5,      4,       3,     2 };
 
  
    // #3: build the deck
    for (int i = 0; i < 52; i++) {
        int cardIndex = i % 13;
        int thisSuit  = i %  4;
        //cout << "Card " << i << "; Suit " << thisSuit << "; Index " << cardIndex << endl;
       
        cardDeck[i].cardName  = cardNames[cardIndex];
        cardDeck[i].faceValue = cardVals[cardIndex];
        cardDeck[i].cardSuit  = cardSuits[thisSuit];
        cardDeck[i].myLocation = 1;
    }
	
    // deal the first cards
    playerHand[0] = DealCard(cardDeck);
    playerHand[1] = DealCard(cardDeck);
    dealerHand[0] = DealCard(cardDeck);
    dealerHand[1] = DealCard(cardDeck);

  	int playerScore=GetScore(cardDeck, playerHand);
	int dealerScore=GetScore(cardDeck, dealerHand);
	

    cout << endl << "DEALER HAND:" << endl;
    PrintHand(cardDeck, dealerHand);
    cout << "DEALER SCORE: " << GetScore(cardDeck, dealerHand) << endl << endl;

		if  (dealerScore == 21){
			cout << "Dealers Score: " << dealerScore << endl
				 << "Players Score: " << playerScore << endl; 
			cout << "DEALER WINS!" << endl;
			return 0;
		}
        else if(dealerScore > 21){
			cout << "Dealers Score: " << dealerScore << endl
				 << "Players Score: " << playerScore << endl;
			cout << "DEALER LOSES (BUST!)" << endl;
        	return 0;
		}
		
 	cout << "PLAYER HAND:" << endl;
    PrintHand(cardDeck, playerHand);
    cout << "PLAYER SCORE: " << GetScore(cardDeck, playerHand) << endl << endl;

		if  (playerScore == 21){
			cout << "Dealers Score: " << dealerScore << endl
				 << "Players Score: " << playerScore << endl;
			cout << "PLAYER WINS!" << endl;
			return 0;
		}
        else if (playerScore > 21){
			cout << "Dealers Score: " << dealerScore << endl
				 << "Players Score: " << playerScore << endl;
			cout << "PLAYER LOSES (BUST!)" << endl;
        	return 0;
		}
		
    // infinite loop with conditional control breaks
    char pAns = (char) 0;
	char dAns = (char) 0;
    while (1) {
       
        // see how many cards in each hand
        int playerCardCount = GetCardCount(playerHand);
        int dealerCardCount = GetCardCount(dealerHand);

       	// players turn
		int cAces;
        pAns = 'H';
        while (pAns == 'H' || pAns == 'h') {
            playerCardCount = GetCardCount(playerHand);
            playerScore = GetScore(cardDeck, playerHand);
            cout << "====== PLAYER'S TURN. " << playerCardCount << " cards, " << playerScore << " points." << endl;
            PrintHand(cardDeck, playerHand);

			for(int i = 0; i < 5; i++)
				{if (cardDeck[i].faceValue == 11 && cardDeck[i].myLocation == 2 ){cAces++;}}

			if(cAces > 0){
				AceChecker(playerScore, cAces);}

            cout << "====== (H)IT or (S)TAY? ";
            cin  >> pAns;
           
            if (pAns == 'H' || pAns == 'h')
            {
                playerHand[playerCardCount] = DealCard(cardDeck);
                PrintCard(cardDeck, playerHand[playerCardCount]);
            }

			for(int i = 0; i < 5; i++)
				{if (cardDeck[i].faceValue == 11 && cardDeck[i].myLocation == 2 ){cAces++;}}

			if(cAces > 0){
				AceChecker(playerScore, cAces);}

			playerScore = GetScore(cardDeck, playerHand);

            cout << "PLAYER SCORE: " << GetScore(cardDeck, playerHand) << endl << endl;
	           
            if (playerScore >= 21)
            {
                if (playerScore == 21){

					 cout << "Dealers Score: " << dealerScore << endl
					 	  << "Players Score: " << playerScore << endl;
					 cout << "PLAYER WINS!"    << endl;
					return 0;
				}
                else
					 cout << "Dealers Score: " << dealerScore << endl
					 	  << "Players Score: " << playerScore << endl;
					 cout << "PLAYER LOSES (BUST!)" << endl;
                return 0;
            }
        }
       
		// dealers turn
		cAces =0;
        dAns = 'H';
        while (dAns == 'H' || dAns == 'h') {
            dealerCardCount = GetCardCount(dealerHand);
            dealerScore = GetScore(cardDeck, dealerHand);
            cout << "====== DEALER'S TURN. " << dealerCardCount << " cards, " << dealerScore << " points." << endl;
            PrintHand(cardDeck, dealerHand);
			for(int i = 0; i < 5; i++)
			{	if (cardDeck[i].faceValue == 11 && cardDeck[i].myLocation == 2){
					cAces++;}}
	       	if (cAces > 0){
					AceChecker(dealerScore, cAces);}
            cout << "====== (H)IT or (S)TAY? ";
			DealersChoice(dealerScore, playerScore, dAns); cout << endl;
            if (dAns == 'H' || dAns == 'h')
            {
                dealerHand[dealerCardCount] = DealCard(cardDeck);
                PrintCard(cardDeck, dealerHand[dealerCardCount]);
            }
			for(int i = 0; i < 5; i++)
			{	if (cardDeck[i].faceValue == 11 && cardDeck[i].myLocation == 2){
					cAces++;}}
	       	if (cAces > 0){
					AceChecker(dealerScore, cAces);}

			dealerScore = GetScore(cardDeck, dealerHand);			

            cout << "DEALER SCORE: " << GetScore(cardDeck, dealerHand) << endl << endl;
           
            if (dealerScore >= 21){
                if (dealerScore == 21){
					
					cout << "Dealers Score: " << dealerScore << endl
					 	 << "Players Score: " << playerScore << endl;
					cout << "DEALER WINS!" << endl;

				}
                else
					cout << "Dealers Score: " << dealerScore << endl
					 	 << "Players Score: " << playerScore << endl; 
					cout << "DEALER LOSES (BUST!)" << endl;
                return 0;
            }
        }
   	
		if (pAns == 's' || pAns == 'S' && dAns == 's' || dAns == 'S'){
			if (dealerScore == playerScore){
				cout << "Dealers Score: " << dealerScore << endl
					 << "Players Score: " << playerScore << endl;
				cout << "DEALER WINS!" << endl;
				return 0;
			}
			else if (playerScore > dealerScore){
				cout << "Dealers Score: " << dealerScore << endl
					 << "Players Score: " << playerScore << endl;
				cout << "PLAYER WINS!" << endl;
				return 0;
			}
			else{
				cout << "Dealers Score: " << dealerScore << endl
					 << "Players Score: " << dealerScore << endl;
				cout << "DEALER WINS!" << endl;
				return 0;
			}
		}
	
	}

    return 0;
}

int DealCard(MY_CARD* thisDeck)
{   
    // make a random choice
    int RandCard = rand() % 52;
   
    // keep going until we find a card still in the deck. 
    // 1 = card is in the deck; pick again if the card is NOT there
    while (thisDeck[RandCard].myLocation != 1 ) {
        cout << "Card " << RandCard << " is not in the deck: " << thisDeck[RandCard].myLocation << ". Going again." << endl;
        RandCard = rand() % 52;
    }
 	// found one, mark its location as In Play
    thisDeck[RandCard].myLocation = 2;
    return RandCard;
}

int GetCardCount(int* thisHand)
{
    int CardCount = 0;
        for (int i = 0; i < 5; i++)
            if (thisHand[i] > 0) CardCount++;
    return CardCount;
}

int GetScore(MY_CARD* thisDeck, int* thisHand)
{
    int thisSum = 0;
   
    // look at each card in the hand (dont check empty spots)
    for (int i = 0; i < 5; i++)
        if (thisHand[i] != 0) thisSum += thisDeck[thisHand[i]].faceValue;
    return thisSum;
}

void AceChecker(int& thisScore, int& aces)
{
	int ans;
	if (thisScore > 21 && aces > 0 ){
		while (thisScore > 21 && aces >0 ){
			thisScore = (thisScore -10 );
			aces--;
			
		}
		cout << "ACE CONVERTED TO 1";
	}
	else if (thisScore < 21 && aces > 0 ){
			thisScore = thisScore;
	}
}
void PrintHand(MY_CARD* thisDeck, int *thisHand)
{
    for (int i = 0; i < 5; i++) {
        if (thisHand[i] != 0)
            cout << "(" << thisDeck[thisHand[i]].faceValue << ") " << thisDeck[thisHand[i]].cardName << " of " << thisDeck[thisHand[i]].cardSuit << ". " << endl;
    }
}

void PrintCard(MY_CARD* thisDeck, int thisCard)
{
    cout << "(" << thisDeck[thisCard].faceValue << ") " << thisDeck[thisCard].cardName << " of " << thisDeck[thisCard].cardSuit << ". " << endl;
}

void DealersChoice (int& dScore, int& pScore, char& ans)
{
	if (dScore < 16){
		ans = 'h';
	}
	else if (dScore > 16 && dScore < pScore){
		ans = 'h';
	}
	else if (dScore > 16 && dScore > pScore){
		ans = 's';
	}
	else if (dScore == pScore){
		ans = 's';
	}
}

void DiscardCard(MY_CARD* thisDeck)
{
	for (int i=0; i < 52; i++)
		{
			if (thisDeck[i].myLocation == 2 ){
				thisDeck[i].myLocation == 3;
			}
		}
}
