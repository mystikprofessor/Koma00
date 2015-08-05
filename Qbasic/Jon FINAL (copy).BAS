DECLARE SUB AceConvert (thisScore AS INTEGER, aces AS INTEGER)
DECLARE SUB PlayerTurn (cardDeck() AS ANY, playerHand() AS INTEGER, playerScore AS INTEGER, dealerScore AS INTEGER, playerCardCount AS INTEGER, ply AS STRING, dlr AS STRING)
DECLARE SUB PrintCard (cardDeck() AS ANY, thisCard AS INTEGER)
DECLARE SUB AceCheck (cardDeck() AS ANY, thisHand() AS INTEGER, thisScore AS INTEGER, thisCardCount AS INTEGER)
DECLARE FUNCTION GetScore% (cardDeck() AS ANY, thisScore AS INTEGER, thisHand() AS INTEGER, thisCardCount AS INTEGER)
DECLARE SUB PrintHand (cardDeck() AS ANY, thisHand() AS INTEGER)
DECLARE SUB MainGame (cardDeck() AS ANY, dealerHand() AS INTEGER, playerHand() AS INTEGER, dealerScore AS INTEGER, playerScore AS INTEGER, dealerCardCount AS INTEGER, playerCardCount AS INTEGER)
DECLARE SUB ScoreCheck (thisScore AS INTEGER, thatScore AS INTEGER, name1 AS STRING, name2 AS STRING)
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
DATA Ace,Queen,King,Jack,Ten,Nine,Eight,Seven,Six,Five,Four,Three,Two
DATA 11,10,10,10,10,9,8,7,6,5,4,3,2

DIM cardDeck(1 TO 52) AS CARD
CALL BuildDeck(cardDeck())

DIM playerHand(11) AS INTEGER
DIM dealerHand(11) AS INTEGER
DIM playerCardCount AS INTEGER
DIM dealerCardCount AS INTEGER
DIM playerScore AS INTEGER
DIM dealerScore AS INTEGER

CALL EmptyHand(playerHand(), dealerHand())

playerHand(0) = DealCard%(cardDeck())
playerHand(1) = DealCard%(cardDeck())
dealerHand(0) = DealCard%(cardDeck())
dealerHand(1) = DealCard%(cardDeck())

dealerScore = FirstScore%(cardDeck(), dealerHand())
dealerCardCount = GetCardCount%(dealerHand())
playerScore = FirstScore%(cardDeck(), playerHand())
playerCardCount = GetCardCount%(playerHand())

CALL MainGame(cardDeck(), dealerHand(), playerHand(), dealerScore, playerScore, dealerCardCount, playerCardCount)

SUB AceCheck (cardDeck() AS CARD, thisHand() AS INTEGER, thisScore AS INTEGER, thisCardCount AS INTEGER)
DIM ctr%

DIM aces AS INTEGER
aces = 0

FOR ctr = 0 TO (thisCardCount - 1)
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

   FOR ctr = 1 TO 51
      cardIndex = (ctr0 MOD 13)
      suitIndex = (ctr0 MOD 4)

      cardDeck(ctr).suit = suits(suitIndex)
      cardDeck(ctr).faceName = face(cardIndex)
      cardDeck(ctr).cardValue = value(cardIndex)
      cardDeck(ctr).location = 1
      ctr0 = (ctr0 + 1)
   NEXT ctr

END SUB

FUNCTION DealCard% (cardDeck() AS CARD)
RANDOMIZE TIMER
DIM randCard AS INTEGER

randCard = INT(RND * 52 + 1)

DO WHILE (cardDeck(randCard).location <> 1)
   PRINT "Card # "; randCard; "Is not in the Deck"
   randCard = INT(RND * 52 + 1)
LOOP

cardDeck(randCard).location = 2
DealCard% = randCard
END FUNCTION

SUB EmptyHand (playerHand() AS INTEGER, dealerHand() AS INTEGER)
DIM ctr%

FOR ctr = 0 TO 10
   playerHand(ctr) = 0
   dealerHand(ctr) = 0
NEXT ctr

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
   GetCardCount% = count
END FUNCTION

FUNCTION GetScore% (cardDeck() AS CARD, thisScore AS INTEGER, thisHand() AS INTEGER, thisCardCount AS INTEGER)
DIM ctr%

IF thisScore > 0 THEN
   thisScore = (thisScore + cardDeck(thisHand(thisCardCount)).cardValue)
END IF

GetScore% = thisScore

END FUNCTION

SUB MainGame (cardDeck() AS CARD, dealerHand() AS INTEGER, playerHand() AS INTEGER, dealerScore AS INTEGER, playerScore AS INTEGER, dealerCardCount AS INTEGER, playerCardCount AS INTEGER)
   DIM ctr AS INTEGER
   DIM cAces AS INTEGER
   DIM pAns AS STRING
   DIM dAns AS STRING
   DIM dlr AS STRING
   DIM ply AS STRING
   dlr = "DEALER"
   ply = "PLAYER"

   PRINT TAB(35); " ****BLACKJACK**** "
   PRINT "DEALER'S HAND:"
   CALL PrintHand(cardDeck(), dealerHand())
   CALL ScoreCheck(dealerScore, playerScore, dlr, ply)
   CALL AceCheck(cardDeck(), dealerHand(), dealerScore, dealerCardCount)
   PRINT
   PRINT "PLAYER'S HAND:"; playerScore
   CALL PrintHand(cardDeck(), playerHand())
   CALL ScoreCheck(playerScore, dealerScore, ply, dlr)
   CALL AceCheck(cardDeck(), playerHand(), playerScore, playerCardCount)
   CALL PlayerTurn(cardDeck(), playerHand(), playerScore, dealerScore, playerCardCount, ply, dlr)

   




END SUB

SUB PlayerTurn (cardDeck() AS CARD, playerHand() AS INTEGER, playerScore AS INTEGER, dealerScore AS INTEGER, playerCardCount AS INTEGER, ply AS STRING, dlr AS STRING)
DIM ctr AS INTEGER
DIM pAns AS STRING

DO
   playerCardCount = GetCardCount%(playerHand())

   INPUT "(H)IT or (S)TAY "; pAns
   pAns = LEFT$(UCASE$(pAns), 1)

   IF pAns = "H" THEN
      playerCardCount = GetCardCount%(playerHand())
      playerHand(playerCardCount) = DealCard(cardDeck())
      CALL PrintCard(cardDeck(), playerHand(playerCardCount))
   END IF
   playerCardCount = GetCardCount%(playerHand())
   playerScore = GetScore(cardDeck(), playerScore, playerHand(), playerCardCount)
   CALL AceCheck(cardDeck(), playerHand(), playerScore, playerCardCount)
   CALL ScoreCheck(playerScore, dealerScore, ply, dlr)
   PRINT playerScore
LOOP WHILE pAns = "H"

END SUB

SUB PrintCard (cardDeck() AS CARD, thisCard AS INTEGER)

PRINT "("; cardDeck(thisCard).cardValue; ")"; cardDeck(thisCard).faceName; " of "; cardDeck(thisCard).suit

END SUB

SUB PrintHand (cardDeck() AS CARD, thisHand() AS INTEGER)
DIM ctr%

FOR ctr = 0 TO 10
   IF thisHand(ctr) <> 0 THEN
      PRINT TAB(5); "("; cardDeck(thisHand(ctr)).cardValue; ")"; cardDeck(thisHand(ctr)).faceName; " of "; cardDeck(thisHand(ctr)).suit
   END IF
NEXT ctr

END SUB

SUB ScoreCheck (thisScore AS INTEGER, thatScore AS INTEGER, name1 AS STRING, name2 AS STRING)
   IF thisScore = 21 THEN
      PRINT
      PRINT name1; "'S SCORE!: "; thisScore
      PRINT name2; "'S SCORE!: "; thatScore
      PRINT
      PRINT name1; " WINS WITH!: "; thisScore
   ELSEIF thisScore > 21 THEN
      PRINT name1; "'S SCORE!: "; thisScore
      PRINT name1; " LOOSES (BUST!!) "
   END IF
END SUB

