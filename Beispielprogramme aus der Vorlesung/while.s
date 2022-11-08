	.text

	.globl main
main:


	# Uebersetzung einer while-Schleife
	# while (a[i] == k) i = i + j;

	# Annahmen:
	#   Variablen i, j, k sind in Registern $s3, $s4, $s5
	li	$s3, 0
	li	$s4, 1
	li	$s5, 5
	#   Startadresse von Feld a ist in $s6
	la	$s6, a

loop:
	add	$t1, $s3, $s3	# t1=i+i
	add	$t1, $t1, $t1	# t1=4*i
	add	$t1, $t1, $s6	# t1 enthaelt Adresse von a[i]
	lw	$t0, 0($t1)	# t0=a[i]
	bne	$t0, $s5, exit 
	add	$s3, $s3, $s4	# i=i+j
	j	loop

exit:
	li	$v0, 10
	syscall

	.data
a:	.word 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1
	.space 352
