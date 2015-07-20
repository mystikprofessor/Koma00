CLS

'******Vars*****
DIM courseName(3) AS STRING
DIM studentName(4) AS STRING
DIM grades(4, 3, 3) AS SINGLE
DIM average(4) AS SINGLE
DIM highAverage AS SINGLE
DIM ctr0 AS INTEGER
DIM ctr00 AS INTEGER
DIM ctr000 AS INTEGER
DIM ctr0000 AS INTEGER

ctr0 = 0
ctr00 = 0
ctr000 = 0
ctr0000 = 0

'***********************************Input*********************************************************

FOR ctr1 = 0 TO 1
   INPUT "ENTER THE COURSE NAME: "; courseName(ctr1)
      FOR ctr2 = 0 TO 1
         INPUT "ENTER THE STUDENT NAME: "; studentName(ctr0)
            FOR ctr3 = 0 TO 2
               PRINT "ENTER GRADE #"; (ctr3 + 1); " FOR "; studentName(ctr0);
               INPUT ; grades(ctr3, ctr2, ctr1)
               PRINT
            NEXT ctr3
          average(ctr00) = ((grades(0, ctr2, ctr1) + grades(1, ctr2, ctr1) + grades(2, ctr2, ctr1)) / 3)
          ctr00 = (ctr00 + 1)
          ctr0 = (ctr0 + 1)
      NEXT ctr2
NEXT ctr1

CLS

'*******************************Output**********************************************************

PRINT
PRINT " Class "; TAB(15); "Name"; TAB(30); "Grade 1 "; TAB(40); " Grade 2 "; TAB(50); " Grade 3 "; TAB(65); "Average "
PRINT "------------------------------------------------------------------------"

FOR ctr4 = 0 TO 1
   PRINT courseName(ctr4);
      FOR ctr5 = 0 TO 1
         PRINT TAB(12); studentName(ctr000);
           FOR ctr6 = 0 TO 0
               PRINT TAB(32); grades(0, ctr5, ctr4); TAB(42); grades(1, ctr5, ctr4); TAB(52); grades(2, ctr5, ctr6);
            NEXT ctr6
         PRINT USING "##.##"; TAB(65); CINT(average(ctr000))
         ctr000 = (ctr000 + 1)
     NEXT ctr5
  PRINT "------------------------------------------------------------------------"
NEXT ctr4

ctr0 = 0
PRINT
PRINT
PRINT
FOR ctr7 = 0 TO 3
   PRINT studentName(ctr7); "'s average grade in ";
      FOR ctr8 = 0 TO 0
         IF ctr7 > 1 THEN
            PRINT courseName(1); " is: ";
         ELSE
            PRINT courseName(0); " is: ";
         END IF
            FOR ctr9 = 0 TO 0
               PRINT USING "##.##"; CINT(average(ctr0))
               ctr0 = (ctr0 + 1)
            NEXT ctr9
      NEXT ctr8
NEXT ctr7

highAverage = average(0)

FOR ctrA = 0 TO 3
   IF average(ctrA) > highAverage THEN
      highAverage = average(ctrA)
   END IF
NEXT ctrA
PRINT
PRINT
FOR ctrB = 0 TO 3
      IF highAverage = average(ctrB) THEN
         PRINT studentName(ctrB); "'s ";
         PRINT USING "##.##"; CINT(average(ctrB));
         PRINT " in ";
         IF ctrB > 1 THEN
            PRINT courseName(1);
         ELSE
            PRINT courseName(0);
         END IF
      PRINT " is the highest grade average!"
      END IF
NEXT ctrB





