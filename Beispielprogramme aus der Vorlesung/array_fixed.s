	.text

	.globl main
main:
	# int a[100];
	# a[12] = h + a[8];

	# Annahme:
	#   die Startadresse von a steht in $s3
	la	$s3, a
	#   h steht in $s2
	li	$s2, 32

	lw	$t0, 32($s3)    # t0=a[8]
	add	$t0, $s2, $t0   # t0=h+t0
	sw	$t0, 48($s3)    # a[12]=t0

	li	$v0, 10
	syscall

	.data

a:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
	.space 348
