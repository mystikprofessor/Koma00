CLS

'******Vars******
DIM names(12) AS STRING
DIM ans AS STRING
'****Process*****
DATA Fred Flintstone, Wilma Flintstone, Pebbles Flintstone, Dino Flintstone, Barney Rubble, Betty Rubble, Bam-Bam Rubble, Hoppy Rubble, Slyvester Slate, Joe Rockhead, Sam Slagheap, Pearl Slaghoople

FOR ctr = 0 TO 11
   READ names(ctr)
NEXT ctr

'****Output*****
DO
   RANDOMIZE TIMER
   PRINT names(RND * 12 + 1)
   PRINT
   INPUT "Press Enter to select another name or Y to exit "; ans
LOOP UNTIL ans = LCASE$("y")


