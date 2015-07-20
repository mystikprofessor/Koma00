CLS

'********Decs**********

DIM evenNumbers(20) AS INTEGER
DIM oddNumbers(20) AS INTEGER
DIM numbers AS INTEGER
numbers = 0

'********Process*******

FOR ctr = 0 TO 19 STEP 1
   IF numbers MOD 2 = 0 THEN
      evenNumbers(ctr) = numbers
   ELSE
      oddNumbers(ctr) = numbers
   END IF
   numbers = numbers + 1
NEXT ctr

'*********Output*********

FOR ctr = 0 TO 19 STEP 1
   PRINT "Even"; evenNumbers(ctr);
   PRINT "     Odd"; oddNumbers(ctr)
NEXT ctr

