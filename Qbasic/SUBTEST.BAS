DECLARE SUB InputValues (thisNum1 AS INTEGER, thisNum2 AS INTEGER, thisAns AS INTEGER, thisNumbers AS INTEGER)
DECLARE SUB Math (thisNum1 AS INTEGER, thisNum2 AS INTEGER, thisNum3 AS INTEGER)

CLS

'****Independent*Variables****

DIM num1 AS INTEGER
DIM num2 AS INTEGER
DIM num3 AS INTEGER
DIM ans AS INTEGER
DIM ctr AS INTEGER

'*****INPUT*****

INPUT "How Many Problems do You want to solve"; ans
ans = (ans - 1)
DIM numbers(ans * 2)

CALL InputValues(num1, num2, ans, numbers)

CALL Math(num1, num2, num3, ans, numbers)

FOR ctr = 0 TO ans
PRINT num1; " * "; num2; " = "; num3
NEXT ctr


SUB InputValues (thisNum1 AS INTEGER, thisNum2 AS INTEGER, thisAns AS INTEGER, thisNumbers AS INTEGER)
DIM ctr1 AS INTEGER

FOR ctr1 = 0 TO thisAns
   INPUT "Enter a number "; thisNum1
   INPUT "Enter a number "; thisNum2

NEXT ctr1

END SUB

SUB Math (thisNum1 AS INTEGER, thisNum2 AS INTEGER, thisNum3 AS INTEGER, thisAns AS INTEGER)
for ctr = 0 to
thisNum3 = (thisNum1 * thisNum2)

END SUB

