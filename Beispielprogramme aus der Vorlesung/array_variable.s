	.text

	.globl main
main:
	# int a[100];
	# g = h+a[i];

	# Annahme:
	#   die Startadresse von a steht in $s3
	la	$s3, a
	#   h steht in $s2
	li	$s2, 32
	#   i steht in $s4
	li	$s4, 3
	#   g in $s1
	li	$s1, 1234

	add	$t1, $s4, $s4	# t1=i+i
	add	$t1, $t1, $t1	# t1=t1+t1
	add	$t1, $t1, $s3	# t1=4*i+Basisadresse von a
	lw	$t0, 0($t1)	# t0=a[i]
	add	$s1, $s2, $t0	# g=h+t0

	li	$v0, 10
	syscall

	.data

a:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
	.space 352
