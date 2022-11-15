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

			# while-Schleife
			li	$s3, 0
			li	$s4, 1
			li	$s5, 5
			la	$s6, n			# Startadresse von Feld a ist in $s6
			loop:
				add	$t1, $s3, $s3	# t1=i+i
				add	$t1, $t1, $t1	# t1=4*i
				add	$t1, $t1, $s6	# t1 enthält Adresse von a[i]
				lw	$t0, 0($t1)	# t0=a[i]
				bne	$t0, $s5, exit 
				add	$s3, $s3, $s4	# i=i+j
				j	loop
			exit:
				li	$v0, 10
				syscall
			
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