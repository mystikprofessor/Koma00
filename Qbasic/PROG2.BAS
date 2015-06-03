CLS
DIM monthlyPayment AS SINGLE
DIM purchasePrice AS SINGLE
DIM downPayment AS SINGLE
DIM interestRate AS SINGLE
DIM month AS INTEGER
DIM operation AS SINGLE

purchasePrice = 22000
downPayment = (purchasePrice * .1)
interestRate = (6.5 / 12 / 100)
m = 60

'PRINT "Purchase Price"
'PRINT purchasePrice
'PRINT "Down Payment"
'PRINT downPayment
'PRINT "Interest Rate"
'PRINT interestRate
'PRINT "Months"
'PRINT m

monthlyPayment = (interestRate * (purchasePrice - downPayment)) * ((interestRate + 1) ^ m / ((interestRate + 1) ^ m - 1))

PRINT "Monthly Payment"
PRINT monthlyPayment

