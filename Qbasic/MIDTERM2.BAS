CLS

'********Declerations********
DIM classNo AS INTEGER
DIM studentNo AS INTEGER
DIM gradeNo AS INTEGER
DIM highAvg AS INTEGER

DIM ctr0 AS INTEGER
ctr0 = 0
'***********Menu************


'******Create A class*******

INPUT "How Many Classes do you wish to create"; classNo
classNo = (classNo - 1)

' Dependent Variables
DIM courseName(classNo) AS STRING

FOR ctr = 0 TO classNo
   PRINT "Enter the course name for class"; (ctr + 1);
   INPUT ; courseName(ctr)
   PRINT
NEXT ctr

PRINT "Enter the number of students for each class: ";
INPUT ; studentNo
   studentNo = (studentNo - 1)
PRINT
PRINT "Enter the number of student grades: ";
INPUT ; gradeNo
   gradeNo = (gradeNo - 1)
PRINT

'Dependent Variables
DIM studentName(studentNo + 1) AS STRING
DIM grd(classNo + 1, studentNo + 1, gradeNo + 1) AS INTEGER
DIM studentAvg(studentNo) AS INTEGER

'Input Information

FOR ctr = 0 TO classNo
   PRINT courseName(ctr)
   FOR ctr1 = 0 TO studentNo
      PRINT "Enter Student Name: ";
      INPUT ; studentName(ctr1)
      PRINT
         FOR ctr2 = 0 TO gradeNo
            PRINT "Enter Grade #:"; (ctr2 + 1); "for "; studentName(ctr0);
            INPUT ; grd(ctr2, ctr1, ctr)
            PRINT
         NEXT ctr2
         ctr0 = (ctr0 + 1)
   NEXT ctr1
NEXT ctr

