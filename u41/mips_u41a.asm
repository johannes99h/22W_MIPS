# Ergänzung: lese Wert ins $v0-Register
	li 	$v0,5			# v0-Modus -> Integer einlesen
	syscall

# vorgegebener Programmcode
	move 	$a0 , $v0		# schreibe Integer n ins Register $a0 (Vergleich)
	addi 	$t0 , $zero , 0		# schreibe 0 ins Register $t0
	addi 	$t1 , $zero , 1		# schreibe 1 ins Register $t1

loop : 	bgt 	$t1 , $a0 , finish	# wenn $t1 größer $a0, springe zum finish-Label
	div 	$t2 , $t1 , 2		# dividiere $t1 durch 2, speichere in $t2 (Problem: keine Gleitkommazahlen!)
	mul 	$t2 , $t2 , 2		# multipliziere $t2 mit 2, speichere in $t2
	beq 	$t2 , $t1 , even	# wenn $t1 gleich $t2, springe zum even-Label
	neg 	$t1 , $t1		# negiere den Wert $t1 (1 -> 0xFFFFFFFF)		Erklärung: Folie 143

even : 	add 	$t0 , $t0 , $t1		# addiere $t0 mit $t1, speichere in $t0
	abs 	$t1 , $t1		# ermittle den Betrag von $t1
	addi 	$t1 , $t1 , 1		# addiere 1 zum Wert in $t1 und speichere in $t1
	j 	loop			# unkonditionierter Sprung zum loop-Label

# eigene Ergänzung, für MARS-Compiler notw.
finish: li 	$v0, 10			# Programm beenden
	syscall

# Sinn des Programms
#  -> Zählen bis Wert im Register $t1 = n + 1 ($t0 = n - 1)
#  -> was genau soll der Schritt mit abs & neg?! wenn einfacher Zähler, dann doch nicht notw.?
#  -> t1 wird in Einerschritten hochgezählt, t2 in Zweierschritten (also nur gerade Zahlen!)
