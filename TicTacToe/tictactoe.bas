Check 07A5355A
Auto 8224

# Run-time Variables

Var c: Num = 6.619995
Var totalmoves: Num = 9
Var landed: Num = 0
Var cc: Num = 6
Var j: NumFOR = 8, 6, 2, 390, 2
Var i: NumFOR = 13, 9, 4, 390, 3
Var n: NumFOR = 9, 8, 1, 500, 2
Var a$: Str = "9"
Var m$: Str = "X"
Var c$: Str = "789"
Var s$: StrArray(8, 3) = "123147159258357369456789"

# End Run-time Variables

  10 REM grid position matrix
  20 DATA 2,1,1
  30 DATA 2,5,2
  40 DATA 2,9,3
  50 DATA 4,1,4
  60 DATA 4,5,5
  70 DATA 4,9,6
  80 DATA 6,1,7
  90 DATA 6,5,8
 100 DATA 6,9,9
 110 REM Success strings
 120 DIM s$(8,3)
 130 LET s$(1)="123": LET s$(2)="147": LET s$(3)="159"
 140 LET s$(4)="258"
 150 LET s$(5)="357": LET s$(6)="369"
 160 LET s$(7)="456"
 170 LET s$(8)="789"
 180 BORDER 5: PAPER 7: INK 0: CLS
 190 PRINT "TIC-TAC-TOE"
 200 PRINT "-------------"
 210 PRINT " 1 | 2 | 3 "
 220 PRINT "---+---+---"
 230 PRINT " 4 | 5 | 6 "
 240 PRINT "---+---+---"
 250 PRINT " 7 | 8 | 9 "
 260 LET totalmoves=0
 270 REM Your Move
 280 PRINT AT 10,0;"PLAYER 1, ENTER YOUR MOVE? "
 290 INPUT a$
 300 FOR j=2 TO 6 STEP 2: FOR i=1 TO 9 STEP 4
 310 PRINT AT j,i; PAPER 4;
 320 IF  SCREEN$ (j,i)=a$ THEN PRINT AT j,i;"X": LET totalmoves=totalmoves+1: GO TO 350
 330 NEXT i: NEXT j
 340 REM Computers Move
 350 PRINT AT 10,0;"Computer's move            "
 360 LET landed=0
 370 RANDOMIZE
 380 LET c=RND*8+1: LET cc=INT c: PRINT AT 21,0;cc
 390 FOR j=2 TO 6 STEP 2: FOR i=1 TO 9 STEP 4
 400 LET m$= SCREEN$ (j,i)
 410 IF m$="X" THEN GO TO 440
 420 IF m$="O" THEN GO TO 440
 430 IF VAL m$=cc THEN PRINT AT j,i;"O": LET landed=1: LET totalmoves=totalmoves+1
 440 NEXT i: NEXT j
 450 IF totalmoves>8 THEN GO TO 480
 460 IF landed=0 THEN GO TO 380
 470 GO TO 280
 480 REM STOP
 490 REM Cehck for success
 500 FOR n=1 TO 8
 510 LET c$=s$(n): PRINT AT 20,0;c$(1)
 520 NEXT n
