# Ergänzung: lese Wert ins $v0-Register
	li 	$v0,5			# v0-Modus -> Integer einlesen
	syscall

# vorgegebener Programmcode
	move 	$a0 , $v0		
	addi 	$t0 , $zero , 0		
	addi 	$t1 , $zero , 1		
loop : 	bgt 	$t1 , $a0 , finish	# 1 bzw. 3 CPI
	div 	$t2 , $t1 , 2		# 10 CPI
	mul 	$t2 , $t2 , 2		# 5 CPI
	beq 	$t2 , $t1 , even	# 1 bzw. 3 CPI
	neg 	$t1 , $t1		# 1 CPI
even : 	add 	$t0 , $t0 , $t1		# 1 CPI
	abs 	$t1 , $t1		# 2 CPI
	addi 	$t1 , $t1 , 1		# 2 CPI
	j 	loop			# 3 CPI (konditionslos)

# eigene Ergänzung, für MARS-Compiler notw.
finish: li 	$v0, 10			# Programm beenden
