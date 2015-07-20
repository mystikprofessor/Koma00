CLS

'********Dimensions********

TYPE CAR
   stockNo AS INTEGER
   year AS INTEGER
   make AS STRING * 10
   model AS STRING * 10
   miles AS DOUBLE
   price AS SINGLE
END TYPE

DIM invetory(3) AS CAR
DIM carNumber AS INTEGER


'*******Input*************

INPUT "How Many Cars are on the Lot?"; carNumber
carNumber = (carNumber - 1)

FOR ctr1 = 0 TO carNumber
   PRINT
   PRINT "Car #"; (ctr1 + 1)
   INPUT "Enter the Stock No.: "; invetory(ctr1).stockNo
   INPUT "Enter the Year: "; invetory(ctr1).year
   INPUT "Enter the Make: "; invetory(ctr1).make
   INPUT "Enter the Model: "; invetory(ctr1).model
   INPUT "Enter the Miles: "; invetory(ctr1).miles
   INPUT "Enter the Price: "; invetory(ctr1).price
   PRINT
NEXT ctr1


'********Output**********
CLS
PRINT
PRINT " Stock No ."; TAB(20); " Year "; TAB(30); " Make "; TAB(40); " Model "; TAB(50); " Miles "; TAB(60); " Price "
PRINT "-------------------------------------------------------------------"

FOR ctr = 0 TO carNumber
   PRINT invetory(ctr).stockNo; TAB(20); invetory(ctr).year; TAB(30); invetory(ctr).make; TAB(40); invetory(ctr).model; TAB(50); USING "###,###"; invetory(ctr).miles; TAB(59);
   PRINT USING "$$##,###.##"; invetory(ctr).price
NEXT ctr



