CLS

'**********VARIABLES*******

DIM stdName AS STRING
DIM stdNumber AS STRING
DIM grd(4) AS SINGLE
DIM avgGrd AS SINGLE
DIM ctr, grdNum AS INTEGER
ctr = 0

'**********INPUT***********

INPUT "ENTER STUDENT NAME: ", stdName
INPUT "ENTER STUDENT NUMBER: ", stdNumber
'INPUT "ENTER NUMBER OF GRADES: ", grdNum
grdNum = 4
grdNum = (grdNum - 1)

FOR ctr = 0 TO grdNum
   INPUT "ENTER STUDENT GRADE: ", grd(ctr)
NEXT ctr

avgGrd = ((grd(0) + grd(1) + grd(2) + grd(3)) / 4)

'********OUTPUT************
CLS
'***Headers***
PRINT "STUDENT"; TAB(20); "STUDENT"; TAB(40); "GRADE"; TAB(55); "LETTER"
PRINT "NAME"; TAB(20); "NUMBER"; TAB(40); "AVERAGE"; TAB(55); "GRADE"
PRINT "--------------------------------------------------------------"

SELECT CASE avgGrd
CASE 89.5 TO 100
   PRINT stdName; TAB(20); stdNumber; TAB(40); avgGrd; TAB(56); "A"
CASE 79.5 TO 89.4
   PRINT stdName; TAB(20); stdNumber; TAB(40); avgGrd; TAB(56); "B"
CASE 69.5 TO 79.4
   PRINT stdName; TAB(20); stdNumber; TAB(40); avgGrd; TAB(56); "C"
CASE 59.5 TO 69.4
   PRINT stdName; TAB(20); stdNumber; TAB(40); avgGrd; TAB(56); "D"
CASE 0 TO 59.5
   PRINT stdName; TAB(20); stdNumber; TAB(40); avgGrd; TAB(56); "F"
CASE ELSE
   PRINT "INVALID GRADES"
END SELECT












