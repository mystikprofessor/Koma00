CLS

'************DECS**********

DIM agentName AS STRING
DIM encSold, encCost AS INTEGER
DIM comission, totSale, baseCommision, finalCommision AS DOUBLE

'**********INPUT************

INPUT "ENTER AGENT NAME ", agentName
INPUT "ENTER ENCYCLOPEDIAS SOLD: ", encSold

'********PROCESSING*******

 encCost = 200
 baseCommision = (encSold * encCost * .35)
' PRINT "BASE COMMISION: "; baseCommision
IF baseCommision > 1200 THEN
   finalCommision = (baseCommision + 50)
ELSEIF baseCommision < 500 THEN
   finalCommision = (baseCommision - 25)
END IF
totSale = (encSold * encCost)

'*******OUTPUT************

CLS

PRINT TAB(15); "DRAKE ENCYCLOPEDIA COMPANY "
PRINT "NAME"; TAB(20); "TOTAL SALES"; TAB(45); "COMMISSION"
PRINT "________________________________________________________"
PRINT
PRINT agentName; USING "$$#,###.##"; TAB(20); totSale; TAB(45); finalCommision



