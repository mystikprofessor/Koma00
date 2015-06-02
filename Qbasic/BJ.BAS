DECLARE SUB OpenFile (handsPlayed AS INTEGER, playerWins AS INTEGER)
DECLARE SUB Winner (playerTotal AS INTEGER, playerWins AS INTEGER, dealerTotal AS INTEGER, handsPlayed AS INTEGER)
DECLARE SUB Populate (deck() AS ANY)
DECLARE FUNCTION Dealing$ (deck() AS ANY, cardNum AS INTEGER, cardsDealt AS INTEGER)
DECLARE SUB Shuffling (deck() AS ANY, cardsDealt AS INTEGER)
DECLARE SUB PlayerDraw (deck() AS ANY, cardNum AS INTEGER, cardsDealt AS INTEGER, playerTotal AS INTEGER, dealerTotal AS INTEGER)
DECLARE SUB DealerDraw (deck() AS ANY, cardNum AS INTEGER, cardsDealt AS INTEGER, playerTotal AS INTEGER, dealerTotal AS INTEGER)
CLS

// structure of cards

TYPE CARDS
	faceValue AS STRING * 5
	cardValue AS INTEGER
	suit AS STRING * 8
	status AS INTEGER
END TYPE

// declare functions

DIM save AS STRING
DIM deck(52) AS CARDS
DIM playerHand(11) AS STRING
DIM dealerHand(11) AS STRING
DIM playerTotal AS INTEGER
DIM dealerTotal AS INTEGER
DIM cardNum AS INTEGER
DIM cardsDealt AS INTEGER
DIM ans AS STRING
DIM dcount AS INTEGER
DIM playerWins AS INTEGER
DIM handsPlayed AS INTEGER


DATA 2,3,4,5,6,7,8,9,10,Jack,Queen,King,Ace

RANDOMIZE TIMER

PRINT "Would you like to play a game?"
PRINT "          1: Yes"
PRINT "          2: No"
PRINT "Input a letter will make you redo input."
INPUT "Insert Answer:", again

DO WHILE again = 1

CLS

FOR ctr = 1 TO 11
	dealerHand(ctr) = " "
	playerHand(ctr) = " "
NEXT ctr

playerTotal = 0
dealerTotal = 0
dcount = 0
CALL Populate(deck())

PRINT "Dealer's Hand: "
PRINT
	FOR ctr = 1 TO 2
		PRINT TAB(5); Dealing$(deck(), cardNum, cardsDealt)
			dealerTotal = deck(cardNum).cardValue + dealerTotal
			dealerHand(dcount) = Dealing$(deck(), cardNum, cardsDealt)
		dcount = dcount + 1
	NEXT ctr

LOCATE (3), (1)
PRINT " Dealer's hidden card                  "
PRINT

PRINT "Player's Hand: "
	FOR ctr = 1 TO 2
		PRINT TAB(5); Dealing$(deck(), cardNum, cardsDealt)
		playerTotal = deck(cardNum).cardValue + playerTotal
	NEXT ctr

PRINT "Players Total: ";
PRINT playerTotal
PRINT
	IF dealerTotal = 21 THEN
		PRINT "Dealer BLACKJACK!"
	ELSEIF playerTotal = 21 THEN
		PRINT "Player BLACKJACK!"
	ELSE
		CALL PlayerDraw(deck(), cardNum, cardsDealt, playerTotal, dealerTotal)
		CALL DealerDraw(deck(), cardNum, cardsDealt, playerTotal, dealerTotal)
	END IF

CALL Winner(playerTotal, playerWins, dealerTotal, handsPlayed)

PRINT
PRINT "Would you like to play again?"
PRINT "          1: Yes"
PRINT "          2: No"
PRINT "Input a letter will make you redo input."
INPUT "Insert Answer:", again

INPUT "Would you like to save the game?"; save
	IF UCASE$(LEFT$(save, 1)) = "Y" THEN
		CALL OpenFile(handsPlayed, playerWins)
	END IF

CLS

LOOP


END

SUB CardChecker

'Send the card that has been drawn here to check the value to see if they
'a Ace.
'if the player has a ace ask if they would like to change the ace value to 1
' if the dealer have a ace make it change the value to 1 if he is greater then
' 21

END SUB

SUB DealerDraw (deck() AS CARDS, cardNum AS INTEGER, cardsDealt AS INTEGER, playerTotal AS INTEGER, dealerTotal AS INTEGER)
IF playerTotal <= 21 THEN
	again = 1
		DO WHILE again = 1
			IF dealerTotal < 16 THEN
				PRINT
				PRINT TAB(5); Dealing$(deck(), cardNum, cardsDealt)
					dealerTotal = dealerTotal + deck(cardNum).cardValue
				PRINT "Dealers hand value: "; dealerTotal
				again = 1
			ELSEIF dealerTotal > 21 THEN
				PRINT "Dealer Busted"
				again = 0
			ELSE
				again = 0
			END IF
		LOOP
END IF

END SUB

FUNCTION Dealing$ (deck() AS CARDS, cardNum AS INTEGER, cardsDealt AS INTEGER)

CALL Shuffling(deck(), cardsDealt)

again = 1
DO WHILE again = 1
	cardNum = INT(RND * (52 - 1) + 1)
		IF deck(cardNum).status = 1 THEN
			again = 1
		ELSEIF deck(cardNum).status = 2 THEN
			again = 1
		ELSE
			deck(cardNum).status = 1
			deck(cardNum).status = 2
			again = 0
		END IF
LOOP

cardsDealt = cardsDealt + 1

Dealing$ = RTRIM$(deck(cardNum).faceValue) + " of " + RTRIM$(deck(cardNum).suit)

END FUNCTION

SUB OpenFile (handsPlayed AS INTEGER, playerWins AS INTEGER)

'open your file here
'have it write the variables playerWins, and handsplayed to it
'have it open the file and put the values in the file to the variables that are
'handsplayed and playerwins if user choose to resume.

END SUB

SUB PlayerDraw (deck() AS CARDS, cardNum AS INTEGER, cardsDealt AS INTEGER, playerTotal AS INTEGER, dealerTotal AS INTEGER)

DIM ans AS STRING
again = 1
	DO WHILE again = 1
		IF playerTotal <= 21 THEN
			INPUT "Would you like to draw a card?"; ans
				IF LEFT$(LCASE$(ans), 1) = "y" THEN
					PRINT TAB(5); Dealing$(deck(), cardNum, cardsDealt)
					playerTotal = playerTotal + deck(cardNum).cardValue
					PRINT "New Player Total: "; playerTotal
					again = 1
				ELSE
					PRINT "Dealers turn."
					again = 0
				END IF
		ELSEIF playerTotal > 21 THEN
			PRINT "Player Busted!"
				again = 0
		END IF
	LOOP

END SUB

SUB Populate (deck() AS CARDS)

	FOR ctr = 1 TO 52
		READ deck(ctr).faceValue
		IF ctr MOD 13 = 0 THEN RESTORE
	NEXT ctr
		PRINT
	FOR ctr = 1 TO 52
		SELECT CASE ctr MOD 4
		   CASE 0
			 deck(ctr).suit = "Spades"
		   CASE 1
			 deck(ctr).suit = "Diamonds"
		   CASE 2
			 deck(ctr).suit = "Clubs"
		   CASE 3
			 deck(ctr).suit = "Hearts"
	  END SELECT
	NEXT ctr

	FOR ctr = 1 TO 52
		IF LEFT$(deck(ctr).faceValue, 1) = "A" THEN
			deck(ctr).cardValue = 11
		ELSEIF LEFT$(deck(ctr).faceValue, 1) = "J" OR LEFT$(deck(ctr).faceValue, 1) = "Q" OR LEFT$(deck(ctr).faceValue, 1) = "K" THEN
			deck(ctr).cardValue = 10
		ELSE
			deck(ctr).cardValue = VAL(deck(ctr).faceValue)
		END IF
	NEXT ctr


																						 
END SUB

SUB Shuffling (deck() AS CARDS, cardsDealt AS INTEGER)
	IF cardsDealt = 52 THEN
		FOR ctr = 1 TO 52
			deck(ctr).status = deck(ctr).status
			cardsDealt = 0
		NEXT ctr
	END IF
END SUB

SUB Winner (playerTotal AS INTEGER, playerWins AS INTEGER, dealerTotal AS INTEGER, handsPlayed AS INTEGER)
IF playerTotal > 21 THEN
		PRINT
		PRINT "Your hand value is "; playerTotal
		PRINT "My hand value is "; dealerTotal
		handsPlayed = handsPlayed + 1
		PRINT "You have won,"; playerWins; " out of "; handsPlayed; " games."
		
	ELSEIF dealerTotal > 21 THEN
		PRINT
		PRINT "Your hand value is "; playerTotal
		PRINT "My hand value is "; dealerTotal
		handsPlayed = handsPlayed + 1
		playerWins = playerWins + 1
		PRINT "You have won,"; playerWins; " out of "; handsPlayed; " games."
	ELSEIF playerTotal > dealerTotal THEN
		PRINT
		PRINT "Your hand value is "; playerTotal
		PRINT "My hand value is "; dealerTotal
		handsPlayed = handsPlayed + 1
		playerWins = playerWins + 1
		PRINT "You have won,"; playerWins; " out of "; handsPlayed; " games."
	ELSEIF playerTotal < dealerTotal THEN
		PRINT
		PRINT "Your hand value is "; playerTotal
		PRINT "My hand value is "; dealerTotal
		handsPlayed = handsPlayed + 1
		PRINT "You have won,"; playerWins; " out of "; handsPlayed; " games."
	ELSEIF playerTotal = dealerTotal THEN
		PRINT
		PRINT "Your hand value is "; playerTotal
		PRINT "My hand value is "; dealerTotal
		handsPlayed = handsPlayed + 1
		PRINT "You have won,"; playerWins; " out of "; handsPlayed; " games."
	ELSE
		END
	END IF
END SUB

