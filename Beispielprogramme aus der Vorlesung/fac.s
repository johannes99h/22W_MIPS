	.text
	
# int fac(int n) {
#   if (n < 1) return 1;
#   else return n * fac (n - 1);
# }
	
fac:
	addi	$sp, $sp, -8	# Kellerrahmen fuer 2 Eintraege
	sw	$ra, 4($sp)	# rette Ruecksprungadresse
	sw	$a0, 0($sp)	# speichere aktuellen Wert von n
	li	$t1, 1		# t1 = 1, Pseudoinstruktion
	slt	$t0, $a0, $t1	# t0=(n<1)
	beq	$t0, $0, L1	# springe zu L1, falls n>=1
	add	$v0, $0, $t1	# Rueckgabewert 1
	addi	$sp, $sp, 8	# gib Kellerrahmen frei
	jr	$ra		# Ruecksprung
L1:	sub	$a0,$a0,$t1	# n-1 als neues Argument
	jal	fac		# rekursiver Aufruf mit n-1
	lw	$a0, 0($sp)	# lade alten Wert von n in $a0
	lw	$ra, 4($sp)	# restauriere $ra
	addi	$sp, $sp, 8	# gib Kellerrahmen frei
	mul	$v0, $v0, $a0	# gibt n * fac(n-1) zurueck
	jr	$ra		# Ruecksprung


	.globl main
main:
	li	$a0,	3
	jal	fac
	li	$v0, 10
	syscall
