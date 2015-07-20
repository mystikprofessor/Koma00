CLS

'***********Decs***********
DIM numbers(20) AS INTEGER


'**********Input***********
FOR ctr = 0 TO 19 STEP 1
PRINT "Enter a Number"; (ctr + 1); " : ";
INPUT numbers(ctr)
NEXT ctr

'********Output************
PRINT "Your Array Contains the Even Numbers :"
PRINT
FOR ctr = 1 TO 20 STEP 2
'IF number(ctr) MOD 2 = 0 THEN
   PRINT numbers(ctr);
'END IF
NEXT ctr



