	.data
		n: 	.word 	0		# Initialisierung der ganzzahl. Var. n
		msg:	.asciiz	"Zahl n"
	.text

	.globl main
main:
	li $v0,4
	la $v0,msg			# Ausgabe der Nachricht
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0			# RetVal in "längerlebiges" Register
	
	# Einlesen der Integer
	lw $t0,$s3			# Wert der Var. n auf den Stack
	read_int			# eingelesener Wert steckt in $v0 (nicht-volatil?)
	syscall 
	sw $v0,$s3			# RetVal -> Speicher (Var. n)
	
	# Überprüfung: n > 0
	
	
	# if(n > 0) { n weitere Zahlen einlesen }
	bne $s4,$s3,else		# stellt if-Bed. dar
	add $s0,$s1,$s2
	j exit
else: 	sub $s0,$s1,$s2			# stellt else-Bed. dar
exit:
	
	
	# Ausgabe der Integer
	
	
	syscall


