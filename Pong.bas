1 BORDER 0: PAPER 0: INK 7: CLS
2 LET x=10: LET y=10: LET dx=1: LET dy=1
3 LET p1x=0: LET p1y=10: LET p2x=31: LET p2y=10
4 LET score1=0: LET score2=0
5 PRINT AT 0,15; "PONG"
6 PRINT AT 10,15; CHR$ 158
7 PRINT AT 20,15; CHR$ 157
8 PRINT AT 0,0; "SCORE: "; score1; " : "; score2
10 PRINT AT p1y,p1x; CHR$ 31
20 PRINT AT p2y,p2x; CHR$ 31
30 PRINT AT y,x; CHR$ 219
40 LET k$=INKEY$
50 IF k$="a" THEN IF p1y>0 THEN PRINT AT p1y,p1x; " ": LET p1y=p1y-1: PRINT AT p1y,p1x; CHR$ 31
60 IF k$="z" THEN IF p1y<21 THEN PRINT AT p1y,p1x; " ": LET p1y=p1y+1: PRINT AT p1y,p1x; CHR$ 31
70 IF k$="k" THEN IF p2y>0 THEN PRINT AT p2y,p2x; " ": LET p2y=p2y-1: PRINT AT p2y,p2x; CHR$ 31
80 IF k$="m" THEN IF p2y<21 THEN PRINT AT p2y,p2x; " ": LET p2y=p2y+1: PRINT AT p2y,p2x; CHR$ 31
90 PRINT AT y,x; " "
100 LET x=x+dx: LET y=y+dy
110 IF x=1 THEN LET dx=1: LET score2=score2+1: GO TO 120
120 IF x=30 THEN LET dx=-1: LET score1=score1+1: GO TO 110
130 IF y=0 OR y=23 THEN LET dy=-dy
140 IF x=2 AND y>=p1y AND y<=p1y+2 THEN LET dx=1
150 IF x=29 AND y>=p2y AND y<=p2y+2 THEN LET dx=-1
160 PRINT AT y,x; CHR$ 219
170 IF score1=9 OR score2=9 THEN PRINT AT 23,0; "FINAL SCORE: "; score1; " : "; score2;: PRINT AT 25,0; "PRESS ANY KEY TO EXIT"
180 IF score1=9 OR score2=9 THEN STOP
190 GO TO 40