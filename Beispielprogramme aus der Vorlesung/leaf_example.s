	.text
	
# MIPS-Assembler ~ Unterstuetzung fuer Prozeduraufrufe

# Funktion: f=(g+h)-(i+j) / $v0 <- ($a0+$a1)-($a2+$a3)

leaf_example:			# Einsprungadresse (sym. Label) der Funkt.

# Register zur temporaeren Verwendung sichern

	addi	$sp, $sp, -4	# Platz auf Stack fuer einen INT schaffen
	sw	$s0, 0($sp)	# sichere $s0 zur temporaeren Verwendung

# Berechnung des Ergebnisses

	add	$t0, $a0, $a1	# Zwischenergebnis $t0 <- $a0+$a1 (=g+h)
	add	$t1, $a2, $a3	# Zwischenergebnis $t1 <- $a2+$a3 (=i+j)
	sub	$s0, $t0, $t1	# Endergebnis $s0 <- $t0-$t1

# Funktionsrueckgabewert zuweisen

	add	$v0, $s0, $zero	# nach Konvention Rueckgabe in $v0 ~ $s0

# Restauration der temporaer gesicherten Register + Stackfreigabe


	lw	$s0, 0($sp)	# restauriere den Wert $s0
	add	$sp, $sp, 4	# Freigabe des reservierten Stackbereichs
	
# Funktion beenden

	jr	$ra		# setze Programm an Adresse $ra (PC) fort

# Aufrufstelle
	
	.globl main
main:
	li	$a0, 1
	li	$a1, 2
	li	$a2, 3
	li	$a3, 4

	li	$s0, 98765
	
	jal	leaf_example

	li	$v0, 10
	syscall
