	.text

	.globl main
main:

	# Uebersetzung einer if-then-else-Anweisung
	# if (i == j) f = g + h;
	# else f = g - h;

	# Annahme: Variablen f, g, h, i, j sind in Registern $s0, ..., $s4
	li	$s0, 1
	li	$s1, 2
	li	$s2, 3
	li	$s3, 5
	li	$s4, 5
	
	bne	$s4, $s3, else	# if(i != j) goto else
	add	$s0, $s1, $s2	# f = g + h
	j	exit
else:
	sub	$s0, $s1, $s2	# f = g - h
	
exit:
	li	$v0, 10
	syscall
