   1 BORDER 2
   2 PAPER 0
   3 INK 7
   4 CLS
   5 FOR i=0 TO 10000
   6 LET x=INT (RND*256)
   7 LET y=INT (RND*175)
   8 LET c=1+INT (RND*7)
   9 INK c
  10 PRINT AT 21,0;"x="+STR$ (x)+" y="+STR$ (y)+" c="+STR$ (c)+"   "
  19 PLOT x,y
  20 NEXT i
