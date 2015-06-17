CLS

'********DECLERATIONS***********

DIM carType AS INTEGER
DIM daysRented AS INTEGER
DIM insurance AS INTEGER
DIM carChoice AS INTEGER
DIM dailyCost AS INTEGER
DIM inChoice AS INTEGER
DIM tax AS SINGLE
DIM compact, minivan, fullsize AS DOUBLE
DIM finComp, finMini, finFull AS DOUBLE
DIM inComp, inMini, inFull AS DOUBLE
DIM format1 AS STRING

format1 = "$#,###.##"

'**********INPUT****************

PRINT "MENU SELECTION "
PRINT
PRINT
PRINT "1 - COMPACT AT $25.00 PER DAY"
PRINT "2 - FULL-SIZE AT $30.00 PER DAY"
PRINT "3 - MINIVAN AT $40.00 PER DAY"
PRINT
PRINT
INPUT "PLEASE ENTER THE NUMBER CORRESPONDING TO YOUR CHOICE: ", carChoice
INPUT "PLEASE ENTER THE NUMBER OF DAYS YOU WISH TO RENT FOR: ", daysRented
INPUT "WOULD YOU LIKE TO ADD INSURANCE FOR $6.00 PER DAY (Y=1/N=2)? ", inChoice

'**********PROCESSING***********
tax = (.06 * daysRented * 200)

IF inChoice = 1 THEN
   insurance = (6 * daysRented)
ELSE
   insurance = 0
END IF

compact = (25 * daysRented)
fullsize = (30 * daysRented)
minivan = (40 * daysRented)

IF inChoice = 1 THEN
   inComp = (compact + insurance)
   inFull = (fullsize + insurance)
   inMini = (minivan + insurance)
END IF

finComp = (compact + tax)
finMini = (minivan + tax)
finFull = (fullsize + tax)

IF inChoice = 1 THEN
   finComp = (inComp + tax)
   finMini = (inMini + tax)
   finFull = (inFull + tax)
END IF

'*********OUTPUT***************
CLS

PRINT TAB(25); "ACME CAR RENTAL COMPANY"
PRINT
PRINT
SELECT CASE carChoice
   CASE 1
     PRINT "Daily Rental for a Compact at $25.00 for "; daysRented; "days: "; USING format1; TAB(55); compact
     PRINT "Insurance at $6.00 per day:"; USING format1; TAB(55); insurance
     IF inChoice = 1 THEN
         PRINT "Subtotal:"; USING format1; TAB(55); inComp
     ELSE
         PRINT "Subtotal:"; USING format1; TAB(55); compact
     END IF
      PRINT
      PRINT "6.0% Rental Tax:"; USING format1; TAB(55); tax
      PRINT
      PRINT "TOTAL DUE:"; USING format1; TAB(55); finComp
   CASE 2
     PRINT "Daily Rental for a Full-Size at $30.00 for "; daysRented; "days: "; USING format1; TAB(55); fullsize
     PRINT "Insurance at $6.00 per day:"; USING format1; TAB(55); insurance
     IF inChoice = 1 THEN
         PRINT "Subtotal:"; USING format1; TAB(55); inFull
     ELSE
         PRINT "Subtotal:"; USING format1; TAB(55); fullsize
     END IF
      PRINT
      PRINT "6.0% Rental Tax:"; USING format1; TAB(55); tax
      PRINT
      PRINT "TOTAL DUE:"; USING format1; TAB(55); finFull
   CASE 3
     PRINT "Daily Rental for a Minivan at $40.00 for "; daysRented; "days: "; USING format1; TAB(55); minivan
     PRINT "Insurance at $6.00 per day:"; USING format1; TAB(55); insurance
     IF inChoice = 1 THEN
         PRINT "Subtotal:"; USING format1; TAB(55); inMini
     ELSE
         PRINT "Subtotal:"; USING format1; TAB(55); minivan
     END IF
      PRINT
      PRINT "6.0% Rental Tax:"; USING format1; TAB(55); tax
      PRINT
      PRINT "TOTAL DUE:"; USING format1; TAB(55); finMini
   CASE ELSE
      PRINT "INVALID SELECTION"
END SELECT





