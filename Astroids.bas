1 BORDER 0: PAPER 0: INK 7: CLS

10 LET shipx = 15: LET shipy = 20
20 LET dx = 0: LET dy = 0
30 LET score = 0
40 LET bullets = 0
50 DIM bulletx(5): DIM bullety(5)
60 LET bulletdx = 0: LET bulletdy = 0
70 LET asteroidx = RND * 32: LET asteroidy = RND * 10 + 3
80 LET asteroiddx = RND - 0.5: LET asteroiddy = RND - 0.5
90 LET asteroidsize = 3

100 PRINT AT shipy, shipx; "*"

110 LET k$ = INKEY$
120 IF k$ = "q" THEN STOP
130 IF k$ = "a" THEN LET dx = -1: LET dy = 0
140 IF k$ = "o" THEN LET dx = 1: LET dy = 0
150 IF k$ = " " THEN IF bullets < 5 THEN LET bullets = bullets + 1: LET bulletx(bullets) = shipx: LET bullety(bullets) = shipy - 1

160 LET shipx = shipx + dx
170 LET shipy = shipy + dy
180 IF shipx < 0 THEN LET shipx = 31
190 IF shipx > 31 THEN LET shipx = 0
200 IF shipy < 0 THEN LET shipy = 23
210 IF shipy > 23 THEN LET shipy = 0

220 FOR i = 1 TO bullets
230   PRINT AT bullety(i), bulletx(i); " "
240   LET bullety(i) = bullety(i) - 1
250   PRINT AT bullety(i), bulletx(i); "*"
260   IF bullety(i) < 0 THEN LET bullets = bullets - 1: LET bulletx(i) = bulletx(bullets + 1): LET bullety(i) = bullety(bullets + 1)
270 NEXT i

280 CIRCLE asteroidx, asteroidy, asteroidsize

290 LET asteroidx = asteroidx + asteroiddx
300 LET asteroidy = asteroidy + asteroiddy

310 IF asteroidx < 0 OR asteroidx > 31 THEN LET asteroiddx = -asteroiddx
320 IF asteroidy < 0 OR asteroidy > 23 THEN LET asteroiddy = -asteroiddy

330 IF ABS(asteroidx - shipx) < 3 AND ABS(asteroidy - shipy) < 3 THEN PRINT AT 12, 10; "GAME OVER!";: STOP

340 FOR i = 1 TO bullets
350   IF ABS(asteroidx - bulletx(i)) < 3 AND ABS(asteroidy - bullety(i)) < 3 THEN
360     LET bullets = bullets - 1
370     LET bulletx(i) = bulletx(bullets + 1)
380     LET bullety(i) = bullety(bullets + 1)
390     LET asteroidsize = asteroidsize - 1
400     IF asteroidsize = 0 THEN LET score = score + 10: PRINT AT 2, 10; "SCORE: "; score
410     IF asteroidsize = 0 THEN LET asteroidx = RND * 32: LET asteroidy = RND * 10 + 3: LET asteroiddx = RND - 0.5: LET asteroiddy = RND - 0.5: LET asteroidsize = 3
420   END IF
430 NEXT i

440 GOTO 110
