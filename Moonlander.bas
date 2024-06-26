10 PRINT "Lunar Lander"
20 PRINT "---------------"
30 LET FUEL = 1000
40 LET ALT = 5000
50 LET VEL = 0
60 LET TIME = 0
70 LET G = 1.6
80 LET MAXTHRUST = 20
90 PRINT "Initial altitude: "; ALT
100 PRINT "Initial velocity: "; VEL
110 PRINT "Fuel: "; FUEL

120 PRINT "Enter thrust (0-20): ";
130 INPUT THRUST
140 IF THRUST < 0 THEN LET THRUST = 0
150 IF THRUST > MAXTHRUST THEN LET THRUST = MAXTHRUST
160 IF THRUST > FUEL THEN LET THRUST = FUEL

170 LET ACC = G - THRUST
180 LET VEL = VEL + ACC
190 LET ALT = ALT - VEL
200 LET FUEL = FUEL - THRUST
210 LET TIME = TIME + 1

220 PRINT "Time: "; TIME
230 PRINT "Altitude: "; INT(ALT)
240 PRINT "Velocity: "; INT(VEL)
250 PRINT "Fuel: "; FUEL

260 IF ALT <= 0 THEN GOTO 300
270 IF FUEL <= 0 THEN PRINT "Out of fuel! Free fall...": GOTO 300
280 GOTO 120

300 IF VEL > 10 THEN PRINT "Crashed!": STOP
310 PRINT "Safe landing!": STOP


360 GOTO 70
