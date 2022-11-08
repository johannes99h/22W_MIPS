	.text
	
# void clear1 (int array[], int size)
# {
#   int i;
#   for (i = 0; i < size; i++) array[i] = 0;
# }


clear1:
	move	$t0, $0		# Pseudoinstr. fuer add $t0,$0,$0
	slt	$t3, $t0, $a1	# t3 = i<size
	beq	$t3, $0, exit	# if (i>=size) goto exit
loop1:	add	$t1, $t0, $t0	# t1 = 2  i
	add	$t1, $t1, $t1	# t1 = 4  i
	add	$t2, $a0, $t1	# t2 = Adresse von a[i]
	sw	$0, 0($t2)	# a[i] = 0
	addi	$t0, $t0, 1	# i++
	slt	$t3, $t0, $a1	# t3 = i<size
	bne	$t3, $0, loop1	# if (i<size) goto loop1
exit:	jr	$ra

	.globl main
main:
	la	$a0, a
	li	$a1, 12

	jal	clear1

	li	$v0, 10
	syscall

	.data

a:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
