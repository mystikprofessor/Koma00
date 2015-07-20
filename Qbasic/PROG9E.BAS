DECLARE SUB pizzaCheese (thisChoice AS INTEGER, thisCheese AS INTEGER)
DECLARE SUB pizzaMenu (thisChoice AS INTEGER, thisTopping AS INTEGER, thisCheese AS INTEGER)
DECLARE SUB pizzaToppings (thisChoice AS INTEGER)
CLS
'*********DECS**********

DIM pizzaChoice AS INTEGER
DIM toppings AS INTEGER
DIM cheese  AS STRING
DIM tax AS INTEGER

'*********INPUT*********

CALL pizzaMenu(pizzaChoice, toppings, cheese)

SUB pizzaCheese (thisChoice AS INTEGER, thisCheese AS INTEGER)
   DIM newCheese AS INTEGER
   PRINT "Would you like extra cheese (Y/N) ";
   IF thisChoice <= 1 THEN PRINT " ($1.00) ";
   IF thisChoice > 1 THEN PRINT " ($2.00) ";
   INPUT ; thisCheese
   IF thisCheese = UCASE$("y") THEN
      newCheese = 1
   ELSEIF thisCheese = UCASE$("n") THEN
      newCheese = 0
   ELSE
      PRINT "Invalid Entry"
   END IF
END SUB

SUB pizzaMenu (thisChoice AS INTEGER, thisTopping AS INTEGER, thisCheese AS INTEGER)
   PRINT TAB(20); "Welcome to Smiley's Pizza Parlor"
   PRINT
   PRINT TAB(10); "1) 6-inch Personal Pizza"
   PRINT TAB(10); "2) 10-inch small pizza"
   PRINT TAB(10); "3) 12-inch regular pizza"
   PRINT TAB(10); "4) 16-inch large pizza"
   PRINT
   PRINT
   INPUT "Enter the number (1-4) corresponding to the size pizza"; thisChoice
   thisChoice = (thisChoice - 1)
   PRINT "Enter the number of toppings";
   CALL pizzaToppings(thisChoice, thisCheese)
   INPUT ; thisTopping
   PRINT
   CALL pizzaCheese(thisChoice)
'   PRINT "Would you like extra cheese (Y/N) ";
'   IF thisChoice <= 1 THEN PRINT " ($1.00) ";
'   IF thisChoice > 1 THEN PRINT " ($2.00) ";
'   INPUT ; thisCheese
'   IF thisCheese = UCASE$("y") THEN
'      newCheese = 1
'   ELSEIF thisCheese = UCASE$("n") THEN
'      newCheese = 0
'   ELSE
'   PRINT
END SUB

SUB pizzaToppings (thisChoice AS INTEGER)
   IF thisChoice = 0 THEN PRINT " ($0.50 each) ";
   IF thisChoice = 1 THEN PRINT " ($0.75 each) ";
   IF thisChoice = 2 THEN PRINT " ($1.00 each) ";
   IF thisChoice = 3 THEN PRINT " ($1.50 each) ";
END SUB

