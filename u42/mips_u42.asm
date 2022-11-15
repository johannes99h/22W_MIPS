.text
.globl main

# int main ()
# {
# print_int ( procA (2 , 3));
# exit ();
# }

main :
	li 	$a0 , 2
	li 	$a1 , 3
	jal 	procA
	move 	$a0 , $v0
	li 	$v0 , 1
	syscall	
	li 	$v0 , 10
	syscall

# int procA ( int a , int b )
# {
# return a * procB (a , b );
# }

procA :
	addi 	$sp , $sp , -12
	sw 	$ra , 8( $sp )
	sw 	$a1 , 4( $sp )
	sw 	$a0 , 0( $sp )
	jal 	procB
	lw 	$a0 , 0( $sp )
	lw 	$a1 , 4( $sp )
	lw 	$ra , 8( $sp )
	mul 	$v0 , $a0 , $v0
	addi 	$sp , $sp , 12
	jr 	$ra

	# int procB ( int a , int b )
	# {
	# int c = 0;
	# c = a + b ;
	# return c ;
	# }

procB :
	addi 	$sp , $sp , -8
	sw 	$ra , 4( $sp )
	sw 	$zero , 0( $sp )
	add 	$t0 , $a0 , $a1
	sw 	$t0 , 0( $sp )
	lw 	$v0 , 0( $sp )
	lw 	$ra , 4( $sp )
	addi 	$sp , $sp , 8
	jr 	$ra
