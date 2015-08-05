DECLARE SUB WinLose (playerScore AS INTEGER, dealerScore AS INTEGER)
DECLARE SUB ClearTable (cardDeck() AS ANY)
DECLARE SUB EndGame (cardDeck() AS ANY, playerScore AS INTEGER, dealerScore AS INTEGER, playerHand() AS INTEGER, dealerHand() AS INTEGER, newGame AS STRING)
DECLARE SUB DealerTurn (cardDeck() AS ANY, dealerHand() AS INTEGER, playerHand() AS INTEGER, dealerScore AS INTEGER, playerScore AS INTEGER, dealerCardCount AS INTEGER, dlr AS STRING, ply AS STRING, newGame AS STRING)
DECLARE FUNCTION DealerChoice$ (dealerScore AS INTEGER, playerScore AS INTEGER)
DECLARE SUB AceConvert (thisScore AS INTEGER, aces AS INTEGER)
DECLARE SUB PlayerTurn (cardDeck() AS ANY, playerHand() AS INTEGER, dealerHand() AS INTEGER, playerScore AS INTEGER, dealerScore AS INTEGER, playerCardCount AS INTEGER, ply AS STRING, dlr AS STRING, newGame AS STRING)
DECLARE SUB PrintCard (cardDeck() AS ANY, thisCard AS INTEGER)
DECLARE SUB AceCheck (cardDeck() AS ANY, thisHand() AS INTEGER, thisScore AS INTEGER, thisCardCount AS INTEGER)
DECLARE FUNCTION GetScore% (cardDeck() AS ANY, thisScore AS INTEGER, thisHand() AS INTEGER, thisCardCount AS INTEGER)
DECLARE SUB PrintHand (cardDeck() AS ANY, thisHand() AS INTEGER)
DECLARE SUB MainGame (cardDeck() AS ANY, dealerHand() AS INTEGER, playerHand() AS INTEGER, dealerScore AS INTEGER, playerScore AS INTEGER, dealerCardCount AS INTEGER, playerCardCount AS INTEGER, newGame AS STRING)
DECLARE SUB ScoreCheck (cardDeck() AS ANY, thisScore AS INTEGER, thatScore AS INTEGER, name1 AS STRING, name2 AS STRING, thisHand() AS INTEGER, thatHand() AS INTEGER, newGame AS STRING)
DECLARE FUNCTION FirstScore% (cardDeck() AS ANY, thisHand() AS INTEGER)
DECLARE FUNCTION GetCardCount% (thisHand() AS INTEGER)
DECLARE SUB EmptyHand (playerHand() AS INTEGER, dealerHand() AS INTEGER)
DECLARE FUNCTION DealCard% (cardDeck() AS ANY)
DECLARE SUB BuildDeck (cardDeck() AS ANY)
CLS
'*******Declerations******
TYPE CARD
   cardValue AS INTEGER
   faceName AS STRING * 5
   suit AS STRING * 8
   location AS INTEGER
END TYPE

DIM ctr AS INTEGER

DATA Diamonds,Clubs,Hearts,Spades
DATA Ace,King,Queen,Jack,Ten,Nine,Eight,Seven,Six,Five,Four,Three,Two
DATA 11,10,10,10,10,9,8,7,6,5,4,3,2

DIM cardDeck(52) AS CARD
CALL BuildDeck(cardDeck())

DIM playerHand(11) AS INTEGER
DIM dealerHand(11) AS INTEGER
DIM playerCardCount AS INTEGER
DIM dealerCardCount AS INTEGER
DIM playerScore AS INTEGER
DIM dealerScore AS INTEGER
DIM newGame AS STRING

CALL EmptyHand(playerHand(), dealerHand())

DO
   CLS
   newGame = "N"
   playerHand(0) = DealCard%(cardDeck())
   playerHand(1) = DealCard%(cardDeck())
   dealerHand(0) = DealCard%(cardDeck())
   dealerHand(1) = DealCard%(cardDeck())

   dealerScore = FirstScore%(cardDeck(), dealerHand())
   dealerCardCount = GetCardCount%(dealerHand())
   playerScore = FirstScore%(cardDeck(), playerHand())
   playerCardCount = GetCardCount%(playerHand())

   CALL MainGame(cardDeck(), dealerHand(), playerHand(), dealerScore, playerScore, dealerCardCount, playerCardCount, newGame)
LOOP WHILE newGame = "Y"

SUB AceCheck (cardDeck() AS CARD, thisHand() AS INTEGER, thisScore AS INTEGER, thisCardCount AS INTEGER)
DIM ctr%

DIM aces AS INTEGER
aces = 0

FOR ctr = 0 TO (thisCardCount)
   IF cardDeck(thisHand(ctr)).cardValue = 11 AND cardDeck(thisHand(ctr)).location = 2 THEN
      aces = (aces + 1)
   END IF
NEXT ctr
IF aces > 0 THEN
   CALL AceConvert(thisScore, aces)
END IF
END SUB

SUB AceConvert (thisScore AS INTEGER, aces AS INTEGER)
   IF thisScore > 21 AND aces > 0 THEN
      DO WHILE thisScore > 21 AND aces > 0
         thisScore = (thisScore - 10)
         aces = (aces - 1)
      LOOP
'   ELSEIF thisScore < 21 AND aces > 0 THEN
'     thisScore = thisScore
   END IF
END SUB

SUB BuildDeck (cardDeck() AS CARD)
   DIM ctr AS INTEGER
   DIM ctr0 AS INTEGER
   DIM cardIndex, suitIndex AS INTEGER
   DIM suits(4) AS STRING
   DIM face(13) AS STRING
   DIM value(13) AS INTEGER
  
   ctr0 = 0

   FOR ctr = 0 TO 3
      READ suits(ctr)
   NEXT ctr
   FOR ctr = 0 TO 12
      READ face(ctr)
   NEXT ctr
   FOR ctr = 0 TO 12
      READ value(ctr)
   NEXT ctr

   FOR ctr = 0 TO 51
      cardIndex = (ctr0 MOD 13)
      suitIndex = (ctr0 MOD 4)

      cardDeck(ctr).suit = suits(suitIndex)
      cardDeck(ctr).faceName = face(cardIndex)
      cardDeck(ctr).cardValue = value(cardIndex)
      cardDeck(ctr).location = 1
      ctr0 = (ctr0 + 1)
   NEXT ctr

END SUB

SUB ClearTable (cardDeck() AS CARD)
DIM ctr%

FOR ctr = 0 TO 51
   IF cardDeck(ctr).location = 2 THEN
      cardDeck(ctr).location = 3
   END IF
NEXT ctr
END SUB

FUNCTION DealCard% (cardDeck() AS CARD)
RANDOMIZE TIMER
DIM randCard AS INTEGER

randCard = INT(RND * 52 + 1)

DO WHILE (cardDeck(randCard).location <> 1)
'  PRINT "Card # "; randCard; "Is not in the Deck"
   randCard = INT(RND * 52 + 1)
LOOP

cardDeck(randCard).location = 2
DealCard% = randCard
END FUNCTION

FUNCTION DealerChoice$ (dealerScore AS INTEGER, playerScore AS INTEGER)
   IF dealerScore < 16 THEN
      DealerChoice$ = "H"
   ELSEIF dealerScore >= 16 AND dealerScore < playerScore THEN
      DealerChoice$ = "H"
   ELSEIF dealerScore > 16 AND dealerScore > playerScore THEN
      DealerChoice$ = "S"
   ELSEIF dealerScore = playerScore THEN
      DealerChoice$ = "S"
   ELSEIF dealerScore > 21 THEN
      DealerChoice$ = "S"
   END IF
END FUNCTION

SUB DealerTurn (cardDeck() AS CARD, dealerHand() AS INTEGER, playerHand() AS INTEGER, dealerScore AS INTEGER, playerScore AS INTEGER, dealerCardCount AS INTEGER, dlr AS STRING, ply AS STRING, newGame AS STRING)
DIM ctr AS INTEGER
DIM dAns AS STRING
DO WHILE newGame <> "Y"
PRINT
PRINT "DEALERS TURN: ";
PRINT
DO
   dAns = DealerChoice$(dealerScore, playerScore)
   
   IF dAns = "H" THEN
      dealerHand(dealerCardCount) = DealCard%(cardDeck())
      CALL PrintCard(cardDeck(), dealerHand(dealerCardCount))
      dealerScore = GetScore(cardDeck(), dealerScore, dealerHand(), dealerCardCount)
   END IF
   CALL AceCheck(cardDeck(), dealerHand(), dealerScore, dealerCardCount)
   CALL ScoreCheck(cardDeck(), playerScore, dealerScore, dlr, ply, dealerHand(), playerHand(), newGame)
  LOOP WHILE dAns = "H"
LOOP
END SUB

SUB EmptyHand (playerHand() AS INTEGER, dealerHand() AS INTEGER)
DIM ctr%

FOR ctr = 0 TO 10
   playerHand(ctr) = 0
   dealerHand(ctr) = 0
NEXT ctr

END SUB

SUB EndGame (cardDeck() AS CARD, playerScore AS INTEGER, dealerScore AS INTEGER, playerHand() AS INTEGER, dealerHand() AS INTEGER, newGame AS STRING)
DO WHILE newGame = "N"
   DIM save AS STRING

   IF playerScore < 21 AND dealerScore < 21 THEN
      IF playerScore = dealerScore THEN
         PRINT "PLAYER SCORE = DEALER SCORE"
         PRINT "DEALER WINS! "; dealerScore
      END IF
   END IF

   CALL WinLose(playerScore, dealerScore)
   PRINT
   INPUT "DO YOU WANT TO PLAY AGAIN? (Y/N): "; newGame
   newGame = LEFT$(UCASE$(newGame), 1)

   IF newGame = "Y" THEN
      CALL ClearTable(cardDeck())
      CALL EmptyHand(playerHand(), dealerHand())
   ELSEIF newGame = "N" THEN
      INPUT "SAVE GAME (Y/N): "; save
      save = LEFT$(UCASE$(save), 1)
         IF save = "Y" THEN
         PRINT "Saved to file"
         END IF
   END IF
LOOP
END SUB

FUNCTION FirstScore% (cardDeck() AS CARD, thisHand() AS INTEGER)
   DIM score AS INTEGER
   score = (cardDeck(thisHand(0)).cardValue + cardDeck(thisHand(1)).cardValue)
FirstScore% = score
END FUNCTION

FUNCTION GetCardCount% (thisHand() AS INTEGER)
   DIM count AS INTEGER
   DIM ctr AS INTEGER
   
   count = 0

   FOR ctr = 0 TO 10
      IF thisHand(ctr) <> 0 THEN
         count = (count + 1)
      END IF
   NEXT ctr
   count = (count - 1)
   GetCardCount% = count
END FUNCTION

FUNCTION GetScore% (cardDeck() AS CARD, thisScore AS INTEGER, thisHand() AS INTEGER, thisCardCount AS INTEGER)
DIM ctr%

IF thisScore > 0 THEN
   thisScore = (thisScore + cardDeck(thisHand(thisCardCount)).cardValue)
END IF

GetScore% = thisScore

END FUNCTION

SUB MainGame (cardDeck() AS CARD, dealerHand() AS INTEGER, playerHand() AS INTEGER, dealerScore AS INTEGER, playerScore AS INTEGER, dealerCardCount AS INTEGER, playerCardCount AS INTEGER, newGame AS STRING)
   CLS
   DIM ctr AS INTEGER
   DIM dlr AS STRING
   DIM ply AS STRING
   DIM dAns AS STRING
   DIM pAns AS STRING
   dlr = "DEALER"
   ply = "PLAYER"

   PRINT TAB(35); " ****BLACKJACK**** "
   PRINT "DEALER'S HAND:"
   CALL PrintHand(cardDeck(), dealerHand())
   CALL ScoreCheck(cardDeck(), playerScore, dealerScore, dlr, ply, playerHand(), dealerHand(), newGame)
   CALL AceCheck(cardDeck(), dealerHand(), dealerScore, dealerCardCount)
   PRINT
   PRINT "PLAYER'S HAND:"; playerScore
   CALL PrintHand(cardDeck(), playerHand())
   CALL ScoreCheck(cardDeck(), playerScore, dealerScore, ply, dlr, playerHand(), dealerHand(), newGame)
   CALL AceCheck(cardDeck(), playerHand(), playerScore, playerCardCount)
   CALL PlayerTurn(cardDeck(), playerHand(), dealerHand(), playerScore, dealerScore, playerCardCount, ply, dlr, newGame)
   CALL DealerTurn(cardDeck(), dealerHand(), playerHand(), dealerScore, playerScore, dealerCardCount, dlr, ply, newGame)
   CALL EndGame(cardDeck(), playerScore, dealerScore, playerHand(), dealerHand(), newGame)
END SUB

SUB PlayerTurn (cardDeck() AS CARD, playerHand() AS INTEGER, dealerHand() AS INTEGER, playerScore AS INTEGER, dealerScore AS INTEGER, playerCardCount AS INTEGER, ply AS STRING, dlr AS STRING, newGame AS STRING)
DIM ctr AS INTEGER
DIM pAns AS STRING

PRINT
PRINT "PLAYERS TURN:"
PRINT

DO
   pAns = "S"

   INPUT "(H)IT or (S)TAY "; pAns
   pAns = LEFT$(UCASE$(pAns), 1)

   IF pAns = "H" THEN
      playerHand(playerCardCount) = DealCard(cardDeck())
      CALL PrintCard(cardDeck(), playerHand(playerCardCount))
      playerScore = GetScore(cardDeck(), playerScore, playerHand(), playerCardCount)
   END IF
   CALL AceCheck(cardDeck(), playerHand(), playerScore, playerCardCount)
   PRINT "PLAYER SCORE: "; playerScore
   CALL ScoreCheck(cardDeck(), playerScore, dealerScore, ply, dlr, playerHand(), dealerHand(), newGame)
   IF newGame = "Y" THEN
      pAns = "S"
   END IF
   LOOP WHILE pAns = "H"
END SUB

SUB PrintCard (cardDeck() AS CARD, thisCard AS INTEGER)

PRINT TAB(5); "("; cardDeck(thisCard).cardValue; ")"; cardDeck(thisCard).faceName; " of "; cardDeck(thisCard).suit

END SUB

SUB PrintHand (cardDeck() AS CARD, thisHand() AS INTEGER)
DIM ctr%

FOR ctr = 0 TO 10
   IF thisHand(ctr) <> 0 THEN
      PRINT TAB(5); "("; cardDeck(thisHand(ctr)).cardValue; ")"; cardDeck(thisHand(ctr)).faceName; " of "; cardDeck(thisHand(ctr)).suit
   END IF
NEXT ctr

END SUB

SUB ScoreCheck (cardDeck() AS CARD, playerScore AS INTEGER, dealerScore AS INTEGER, name1 AS STRING, name2 AS STRING, thisHand() AS INTEGER, thatHand() AS INTEGER, newGame AS STRING)
   IF playerScore = 21 THEN
      PRINT
      PRINT "PLAYER'S SCORE!: "; playersScore
      PRINT "DEALER'S SCORE!: "; dealerScore
      PRINT
      PRINT "PLAYER WINS WITH!: "; playerScore
      CALL EndGame(cardDeck(), playerScore, dealerScore, thisHand(), thatHand(), newGame)
   ELSEIF playerScore > 21 THEN
      PRINT
      PRINT "PLAYER'S SCORE!: "; playerScore
      PRINT "DEALERS'S SCORE!: "; dealerScore
      PRINT "PLAYER LOOSES (BUST!!) "
      PRINT
      CALL EndGame(cardDeck(), playerScore, dealerScore, thisHand(), thatHand(), newGame)
   ELSEIF dealerScore = 21 THEN
      PRINT
      PRINT "DEALER'S SCORE!: "; dealerScore
      PRINT "PLAYER'S SCORE!: "; playerScore
      PRINT
      PRINT "DEALER WINS WITH!: "; dealerScore
      CALL EndGame(cardDeck(), playerScore, dealerScore, thisHand(), thatHand(), newGame)
   ELSEIF playerScore > 21 THEN
      PRINT
      PRINT "DEALER'S SCORE!: "; dealerScore
      PRINT "PLAYER'S SCORE!: "; playerScore
      PRINT "DEALER LOOSES (BUST!!) "
      PRINT
      CALL EndGame(cardDeck(), playerScore, dealerScore, thisHand(), thatHand(), newGame)
   END IF
END SUB

SUB ShuffleDeck (cardDeck() AS CARD)
DIM ctr%
DIM CardCount%

FOR ctr = 0 TO 51
   IF cardDeck(ctr).location <> 1 THEN
      CardCount = (CardCount + 1)
   END IF
NEXT ctr

IF CardCount = 52 THEN
   FOR ctr = 0 TO 51
      IF cardDeck(ctr).location = 3 THEN
         cardDeck(ctr).location = 1
      END IF
   NEXT ctr
END IF
END SUB

SUB WinLose (playerScore AS INTEGER, dealerScore AS INTEGER)

DIM dealerWins%
DIM playerWins%
DIM totalWins%

PRINT
PRINT "******END RESULT*******"
IF dealerScore <= 21 AND playerScore <= 21 THEN
   IF dealerScore > playerScore OR dealerScore = playerScore THEN
      dealerWins = (dealerWins + 1)
   ELSEIF playerScore > dealerScore THEN
      playerWins = (playerWins + 1)
   END IF
END IF
IF dealerScore > 21 THEN
   playerWins = (playerWins + 1)
END IF
IF playerScore > 21 THEN
   dealerWins = (dealerWins + 1)
END IF

totalWins = (dealerWins + playerWins)

IF dealerScore > playerScore AND dealerScore < 21 OR dealerScore = playerScore THEN
   PRINT "THE DEALER HAS WON "; dealerWins; " of "; totalWins; " Games"
END IF
IF playerScore > dealerScore AND playerScore < 21 THEN
   PRINT "THE PLAYER HAS WON "; playerWins; " of "; totalWins; " Games"
END IF
END SUB

