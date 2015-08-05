DECLARE SUB EnterData ()
DECLARE SUB Menu (num1!, num2!)
DECLARE FUNCTION Addition! (num1!, num2!)
DECLARE SUB OutputSub (num1!, num2!, num3!, operation AS STRING)
DECLARE FUNCTION Subtraction! (num1!, num2!)
DECLARE FUNCTION Divisiion! (num1!, num2!)
DECLARE FUNCTION Multiplication! (num1!, num2!)

CLS
CALL EnterData
END



FUNCTION Addition! (num1!, num2!)

Addition! = num1 + num2

END FUNCTION

FUNCTION Divisiion! (num1!, num2!)

Division! = (num1 / num2)

END FUNCTION

SUB EnterData
DIM num1!
DIM num2!

INPUT "Enter the first number"; num1
INPUT "Enter the second number"; num2

CALL Menu(num1, num2)

END SUB

SUB Menu (num1!, num2!)

DIM operation AS STRING
DIM num3!

INPUT "Which Operation do you wish to preform: (+, -, *, /) "; operation

SELECT CASE operation
   CASE "+"
      num3 = Addition!(num1, num2)
   CASE "-"
      num3 = Subtraction!(num1, num2)
   CASE "*"
      num3 = Multiplication!(num1, num2)
   CASE "/"
      num3 = Divisiion!(num1, num2)
END SELECT

CALL OutputSub(num1, num2, num3, operation)

END SUB

FUNCTION Multiplication! (num1!, num2!)

Multiplication! = (num1 * num2)

END FUNCTION

SUB OutputSub (num1!, num2!, num3!, operation AS STRING)

PRINT num1; " "; operation; " "; num2; " = "; num3

END SUB

FUNCTION Subtraction! (num1!, num2!)

Subtraction! = (num1 - num2)

END FUNCTION

