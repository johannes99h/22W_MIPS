	.text

# void clear2(int *array, int size)
# {
#   int *p;
#   for (p = &array[0]; p < &array[size]; p++) *p=0;
# }


clear2:
	move	$t0, $a0	# lade Startadresse von array in $t0
	add	$t1, $a1, $a1
	add	$t1, $t1, $t1	# t1 = 4 * size
	add	$t2, $a0, $t1	# t2 = &array[size]
	slt	$t3, $t0, $t2	# t3 = (p < &array[size])
	beq	$t3, $0, exit	# if (p >= &array[size]) goto exit
loop:	sw	$0, 0($t0)	# *p=0
	addi	$t0, $t0, 4	# p++
	slt	$t3, $t0, $t2	# t3 = (p < &array[size])
	bne	$t3, $0, loop	# if (p < &array[size]) goto loop
exit:	jr	$ra

	.globl main
main:
	la	$a0, a
	li	$a1, 12

	jal	clear2

	li	$v0, 10
	syscall

	.data

a:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
