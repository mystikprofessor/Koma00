DECLARE SUB Addition (array() AS INTEGER)
CLS

DIM array(2) AS INTEGER
DIM ctr AS INTEGER

FOR ctr = 0 TO 1
   array(ctr) = (ctr + 1)
NEXT ctr

CALL Addition(array())

FOR ctr = 0 TO 1
   PRINT array(ctr)
NEXT ctr

DATA 1 , 3,

FOR ctr = 0 TO 1
   READ array(ctr)
NEXT ctr

FOR ctr = 0 TO 1
   PRINT array(ctr)
NEXT ctr


SUB Addition (array() AS INTEGER)
DIM ctr%

FOR ctr = 0 TO 1
   array(ctr) = (array(ctr) + (ctr + 2))
NEXT ctr

END SUB

