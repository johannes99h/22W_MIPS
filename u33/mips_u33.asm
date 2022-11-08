.text
	main:
		# Frage nach Integer
		li $v0,4			# v0-Modus -> String ausgeben
		la $a0,Aufforderung		# Ausgabe der Nachricht
		syscall
	
		# Einlesen des Integers n
		li $v0,5			# v0-Modus -> Integer einlesen
		syscall
		move $s0,$v0			# RetVal in "längerlebiges" Register
	
		# weiteren String ausgeben
		li $v0,4			# v0-Modus -> String ausgeben
		la $a0,Ueberpruefung		# Ausgabe der Nachricht
		syscall
		
		# Ausgabe des Integers n
		li $v0,1			# v0-Modus -> Integer ausgeben
		move $a0,$s0
		syscall
		li $v0,4
		la $a0,newline
		syscall
		
		# Überprüfung: eingegebener Integer größer Null (über MSB definiert - Big Endian Format)
		li $s1,0
		
		# notw. Bitshift
		srl $v0,$s0,31
		move $a0,$v0
		li $v0,1			# Ausgabe des vorzeichenbestimmenden Integers
		syscall		

		# if-else-Statement
			bne $a0,$s1,else		# Vergleich von n mit Null
			# hier while-Schleife einbauen!
			li $v0,4			# Frage nach weiterem Integer
			la $a0,weitereAufforderung	# Ausgabe des Strings 
			syscall
			li $v0,5			# weiteren Integer einlesen
			syscall
			move $s0,$v0			# RetVal in "längerlebiges" Register
		else: 
		li $v0,10				# Programm beenden
		syscall

.data
	n:			.word 		0
	newline:		.asciiz		"\n"
	Aufforderung:		.asciiz		"Ganzzahl: "
	Ueberpruefung: 		.asciiz		"eingegebene Ganzzahl: "
	weitereAufforderung: 	.asciiz		"weitere Ganzzahl eingeben: "