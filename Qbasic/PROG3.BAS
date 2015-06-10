CLS
DIM monthlyPayment AS SINGLE
DIM purchasePrice AS SINGLE
DIM downPayment AS SINGLE
DIM interestRate AS SINGLE
DIM month AS INTEGER
DIM operation AS SINGLE
DIM years AS INTEGER
DIM again AS INTEGER

again = 0
WHILE again <= 1
   INPUT " ENTER THE PURCHASE PRICE: $", purchasePrice
   INPUT " THE % DOWN PAYMENT IS? ", downPayment
   downPayment = (downPayment * .01) * purchasePrice
   PRINT " YOUR DOWN PAYMENT IS: ";
   PRINT USING "$$#,###.##"; downPayment
   INPUT " THE % APR RATE IS ? ", interestRate
   INPUT " HOW MANY YEARS WILL YOU FINANCE? ", years

   interestRate = (interestRate / 12 / 100)
   m = (years * 12)
     
   monthlyPayment = (interestRate * (purchasePrice - downPayment)) * ((interestRate + 1) ^ m / ((interestRate + 1) ^ m - 1))
   PRINT
   PRINT " THE MONTHLY PAYMENT IS ";
   PRINT USING "$$#,###.##"; monthlyPayment
   PRINT
   INPUT " CALCULATE ANOTHER ONE ? (Y=1/N=2) ", again
   IF again <= 1 THEN
      CLS
   END IF
WEND

