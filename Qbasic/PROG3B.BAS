CLS

'*****************************DECLARATIONS***********************************

DIM leng, wid, dep AS INTEGER
DIM ftLeng, ftWid, ftDep, cubFt, cubYd AS SINGLE
DIM format1 AS STRING
DIM conCost, labCost, totCost AS DOUBLE
format1 = "$$#,###.##"

'*********************************INPUT**************************************

 INPUT "PLEASE ENTER THE LEGENTH: "; leng
 INPUT "PLEASE ENTER THE WIDTH: "; wid
 INPUT "PLEASE ENTER THE DEPTH: "; dep
                                     
'******************************CALCULATIONS**********************************

ftLeng = (leng / 12)
ftWid = (wid / 12)
ftDep = (dep / 12)
cubFt = (ftDep * ftWid * ftLeng)
cubYd = (cubFt / 27)
conCost = (cubYd * 64)
labCost = (cubYd * 40)
totCost = (conCost + labCost)
'***********************************OUTPUT**************************************
CLS

PRINT "CONCRETE COST:"
PRINT
PRINT "IN FEET:"; TAB(30); "CUBIC"; TAB(40); "CONCRETE AT"; TAB(55); "LABOR AT"; TAB(66); "TOTAL"
PRINT "LENGTH"; TAB(10); "WIDTH"; TAB(20); "DEPTH"; TAB(30); "YARDS"; TAB(40); " $64/CU.YD"; TAB(55); "$40/CU.YD"; TAB(66); "COST"
PRINT ftLeng; TAB(10); ftWid; TAB(20); ftDep; TAB(30); cubYd; USING "$$#,###.##"; TAB(40); conCost; TAB(54); labCost; TAB(65); totCost


