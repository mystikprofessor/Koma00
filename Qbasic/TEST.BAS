CLS

DIM word1 AS STRING
DIM space AS INTEGER

INPUT "Enter Your Word"; word1
space = INSTR(1, word1, " ")
'PRINT space
PRINT LEFT$(UCASE$(word1), 1); ". "; UCASE$(MID$(word1, space, 2)); LCASE$(MID$(word1, space + 2, 20))

                                                                  

