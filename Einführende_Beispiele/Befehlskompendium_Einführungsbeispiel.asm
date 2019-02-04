## Autor: Florian Sihler
## Montag 04.02.2019
.text
	li $t2, 21		# Lade 21 in Register $t2
	add $t3, $t2, $t2 	# Schreibe 42 in t3
	move $a0, $t3		# Schreibt 42 in a0 für die Ausgabe
	li $v0, 1		# Lädt code für syscall -- print_int
	syscall
	li $v0, 10		# Lädt den Exit-Code
	syscall
