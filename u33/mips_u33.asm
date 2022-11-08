.text
	main:
		# Frage nach Integer ( NICHT GEFRAGT! )
		li $v0,4			# v0-Modus -> String ausgeben
		la $a0,Aufforderung		# Ausgabe der Nachricht
		syscall
	
		# Einlesen des Integers n
		li $v0,5			# v0-Modus -> String einlesen
		syscall
		move $s0,$v0			# RetVal in "längerlebiges" Register
	
		# weiteren String ausgeben ( NICHT GEFRAGT! ) 
		li $v0,4			# v0-Modus -> String ausgeben
		la $a0,Ueberpruefung		# Ausgabe der Nachricht
		syscall
		
		# Ausgabe des Integers n ( NICHT GEFRAGT! )
		li $v0,1			# v0-Modus -> Integer ausgeben
		move $a0,$s0
		syscall

		# Programm beenden
		li $v0,10
		syscall

.data
	Aufforderung:	.asciiz		"Zahl n: "
	Ueberpruefung: 	.asciiz		"eingegebene Zahl: "