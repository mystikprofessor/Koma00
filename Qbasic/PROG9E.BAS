DECLARE SUB CostCalc (thisChoice AS INTEGER, thisTopping AS INTEGER, thisNewCheese AS INTEGER)
DECLARE SUB pizzaCheese (thisChoice AS INTEGER, thisCheese AS STRING, thisNewCheese AS INTEGER)
DECLARE SUB pizzaMenu (thisChoice AS INTEGER, thisTopping AS INTEGER, thisCheese AS STRING, thisNewCheese AS INTEGER)
DECLARE SUB pizzaToppings (thisChoice AS INTEGER)
CLS
'*********DECS**********
TYPE ORDER
   pizzaCost AS SINGLE
   toppings AS SINGLE
   cheese AS SINGLE
   tax AS SINGLE
   subtotal AS SINGLE
   total AS SINGLE
END TYPE

DIM pizzaChoice AS INTEGER
DIM toppings AS INTEGER
DIM cheese  AS STRING
'DIM tax AS SINGLE
DIM NewCheese AS INTEGER


'*********INPUT*********

CALL pizzaMenu(pizzaChoice, toppings, cheese, NewCheese)

SUB CostCalc (thisChoice AS INTEGER, thisTopping AS INTEGER, thisNewCheese AS INTEGER)

DIM customer AS ORDER

SELECT CASE thisChoice
   CASE 0
      customer.pizzaCost = 5
      customer.toppings = (thisTopping * .5)
      IF thisNewCheese = 1 AND thisChoice <= 1 THEN
         customer.cheese = 1
      ELSEIF thisNewCheese = 1 AND thisChoice > 1 THEN
         customer.cheese = 2
      ELSE
         customer.cheese = 0
      END IF
      customer.subtotal = (customer.pizzaCost + customer.toppings + customer.cheese)
      customer.tax = (customer.subtotal * .09)
      customer.total = (customer.tax + customer.subtotal)
      PRINT USING "$$##.##"; customer.total
END SELECT

'CALL OrderOutput(customer)

END SUB

SUB OrderOutput (customer)
DIM format1 AS STRING
format1 = "$$##.##"

PRINT USING "$$##.##"; "Your Subtotal is: "; TAB(40); customer.subtotal
PRINT USING "$$##.##"; "Tax:"; customer.tax; TAB(40);
PRINT USING "$$##.##"; "Your Total is: "; TAB(40); customer.total

END SUB

SUB pizzaCheese (thisChoice AS INTEGER, thisCheese AS STRING, thisNewCheese AS INTEGER)
   PRINT "Would you like extra cheese (Y/N) ";
   IF thisChoice <= 1 THEN PRINT " ($1.00 extra) ";
   IF thisChoice > 1 THEN PRINT " ($2.00 extra) ";
   INPUT ; thisCheese
   IF thisCheese = LEFT$(UCASE$("Y"), 1) THEN
     thisNewCheese = 1
   ELSEIF thisCheese = UCASE$("N") THEN
      thisNewCheese = 0
   ELSE
      PRINT "Invalid Entry"
   END IF
END SUB

SUB pizzaMenu (thisChoice AS INTEGER, thisTopping AS INTEGER, thisCheese AS STRING, thisNewCheese AS INTEGER)
   PRINT TAB(20); "Welcome to Smiley's Pizza Parlor"
   PRINT
   PRINT TAB(10); "1) 6-inch Personal Pizza"; TAB(40); "$5.00"
   PRINT TAB(10); "2) 10-inch small pizza"; TAB(40); "$8.50"
   PRINT TAB(10); "3) 12-inch regular pizza"; TAB(40); "$10.25"
   PRINT TAB(10); "4) 16-inch large pizza"; TAB(40); "$14.50"
   PRINT
   PRINT
   INPUT "Enter the number (1-4) corresponding to the pizza size"; thisChoice
   thisChoice = (thisChoice - 1)
   PRINT "Enter the number of toppings";
   CALL pizzaToppings(thisChoice)
   INPUT ; thisTopping
   PRINT
   CALL pizzaCheese(thisChoice, thisCheese, thisNewCheese)
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
CALL CostCalc(thisChoice, thisTopping, thisNewCheese)
END SUB

SUB pizzaToppings (thisChoice AS INTEGER)
   IF thisChoice = 0 THEN PRINT " ($0.50 each) ";
   IF thisChoice = 1 THEN PRINT " ($0.75 each) ";
   IF thisChoice = 2 THEN PRINT " ($1.00 each) ";
   IF thisChoice = 3 THEN PRINT " ($1.50 each) ";
END SUB

