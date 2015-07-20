CLS

'********Declerations*********

TYPE STUDENT
   studentName AS STRING * 20
   studentId AS INTEGER
END TYPE

TYPE GRADE
   studentGrade AS INTEGER
END TYPE

DIM continue AS STRING
DIM classSize AS INTEGER
DIM ctr0 AS INTEGER
DIM space AS INTEGER
ctr0 = 0

'********Input************

INPUT "Enter the number of students to add"; classSize

classSize = (classSize - 1)

DIM class(classSize) AS STUDENT
DIM grd(3) AS GRADE
DIM studentAvg(classSize) AS SINGLE

FOR ctr = 0 TO classSize
   INPUT "Enter the student's first and last name: "; class(ctr).studentName
   INPUT "Enter the student's ID: "; class(ctr).studentId
   FOR ctr1 = 0 TO 2
      PRINT "Enter Grade"; (ctr1 + 1); ":";
      INPUT ; grd(ctr1).studentGrade
      PRINT
   NEXT ctr1
   studentAvg(ctr0) = ((grd(0).studentGrade + grd(1).studentGrade + grd(2).studentGrade) / 3)
   ctr0 = (ctr0 + 1)
NEXT ctr

'*******Output********

FOR ctr = 0 TO classSize
   PRINT class(ctr).studentName, "'s average is"; studentAvg(ctr)
NEXT ctr
PRINT
INPUT "Press any key to see modified output ", continue
FOR ctr = 0 TO classSize
   space = INSTR(1, class(ctr).studentName, " ")
   PRINT LEFT$(UCASE$(class(ctr).studentName), 1); ". ";
   PRINT UCASE$(MID$(class(ctr).studentName, space, 2));
   PRINT LCASE$(MID$(RTRIM$(class(ctr).studentName), space + 2, 20));
   PRINT "'s Average is "; USING "##.#%"; CINT(studentAvg(ctr))
NEXT ctr






