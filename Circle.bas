10 REM A CIRCLE PROGRAM
20 LET X=127: LET Y=87: LET Z=87
30 REM How many arcs?
40 LET Arcs=4*INT (INT (ABS (PI*SQR Z)+0.5)/4)+4
50 REM Set up memory area; M0-M5
60 LET M0=X+Z
70 LET M1=0
80 LET M2=2*Z*SIN (PI/Arcs)
90 LET M3=1-2*(SIN (PI/Arcs))^2
100 LET M4=SIN (2*PI/Arcs)
110 LET M5=2*PI
120 REM Set up stack; Sa-Sd
130 LET Sa=X+Z
140 LET Sb=Y-Z*SIN (PI/Arcs)
150 LET Sc=Sa
160 LET Sd=Sb
170 REM Initialise COORDS
180 POKE 23677,Sa: POKE 23678,Sb
190 LET M0=Sd
200 REM 'DRAW THE ARCS'
210 LET M0=M0+M2
220 LET Sc=Sc+M1
230 LET X=Sc-PEEK 23677
240 LET Y=M0-PEEK 23678
250 GO SUB 510
260 LET Arcs=Arcs-1: IF Arcs=0 THEN STOP 
270 LET MM1=M1
280 LET M1=M1*M3-M2*M4
290 LET M2=MM1*M4+M2*M3
300 GO TO 210
500 REM 'DRAW A LINE' from last position to X,Y
510 LET PLOTx=PEEK 23677: LET PLOTy=PEEK 23678
520 LET dx=SGN X: LET dy=SGN Y
530 LET X=ABS X: LET Y=ABS Y
540 IF X>=Y THEN GO TO 580
550 LET L=X: LET B=Y
560 LET ddx=0: LET ddy=dy
570 GO TO 610
580 IF X+Y=0 THEN STOP 
590 LET L=Y: LET B=X
600 LET ddx=dx: LET ddy=0
610 LET H=B
620 LET i=INT (B/2)
630 FOR N=B TO 1 STEP -1
640 LET i=i+L
650 IF i<H THEN GO TO 690
660 LET i=i-H
670 LET ix=dx: LET iy=dy
680 GO TO 700
690 LET ix=ddx: LET iy=ddy
700 LET PLOTy=PLOTy+iy
710 IF PLOTy<0 OR PLOTy>175 THEN STOP 
720 LET PLOTx=PLOTx+ix
730 IF PLOTx<0 OR PLOTx>255 THEN STOP 
740 PLOT PLOTx,PLOTy
750 NEXT N
760 RETURN 