### Aufgabe: Produkt zweier ganzer Zahlen
## Einlesen der zu multiplizierenden Operanden
	li	$v0, 4					# Stringausgabe
	la	$a0, OperandA	
	syscall
	li 	$v0, 5					# Operand a
	syscall
	move 	$s0, $v0				# Verschiebung in stabiles Register $s0
	li	$v0, 4					# Stringausgabe
	la	$a0, OperandB		
	syscall
	li 	$v0, 5					# Operand b
	syscall
	move 	$s1, $v0				# Verschiebung in stabiles Register $s1

## C-Code zur Orientierung
# int mult(int a, int b)
# {
# int p = 0;
# for (int i = 1; i <= |b|; i++) {
# p = p + a;
# }
# if (b < 0) p = -p;
# return p;
# }

## Ermittlung des Vorzeichens von b 
	srl 	$v0, $s1, 31				# Bitshift, um VZ-Bit zu ermitteln
	move 	$a1, $v0				# Speichern des VZ-Bits in $a1 -> wenn neg., dann gleich 1
	li	$v0, 4					# Stringausgabe
	la	$a0, Vorzeichen		
	syscall
	li 	$v0, 1					# Integerausgabe
	move	$a0, $a1
	syscall
	li	$v0, 4					# Stringausgabe
	la	$a0, newline		
	syscall

## Implementierung der Summierung (for-Schleife)
	li 	$s2, 1					# Startadresse i = 1
	move	$s3, $s0				# Laden des Werts von a in zweites Register
	abs	$s1, $s1				# Bildung des Betrags |b|
loop:	beq 	$s2, $s1, sgn
	add	$v0, $s3, $s0				# Summierung
	move	$s3, $v0
	add	$s2, $s2, 1				# Inkrementierung des Laufzeitindizes
	j 	loop					# unkonditionierter Sprung zum Loop-Label

## Vorzeichen überprüfen
sgn:	li	$s4, 1					# Wert 1 zum Vgl. ins Register laden
	beq	$a1, $s4, chgsgn			# Abfrage, ob Vorzeichen des Faktors b negativ ist
	j 	exit

## Vorzeichen hinzufügen
chgsgn:	neg	$s3, $s3				# Umdrehen des Vorzeichens
	j	exit

## RetVal & Beenden des Programms
exit: 	li	$v0, 4					# Stringausgabe
	la	$a0, Produkt		
	syscall
	li 	$v0, 1					# Integerausgabe
	move	$a0, $s3				# Verschiebung des Summenprodukts in $a0-Register
	addi 	$sp, $sp, 4		 		# Freigabe des allokierten Speichers
	syscall
	li 	$v0, 10					# Programm beenden

## Definitionen & Deklarationen
.data
	OperandA:	.asciiz		"Operand A: "
	OperandB:	.asciiz		"Operand B: "
	Vorzeichen: 	.asciiz		"(Debug) Vorzeichen-Bit: "	
	Produkt:	.asciiz		"Produkt aus A & B: "
	newline:	.asciiz		"\n"