## Autor: Florian Sihler
## Mittwoch 06.02.2019
.data
    msg1: .asciiz "Gib ein, die wievielte Fibonaccizahl du möchtest: " 
    err1: .asciiz "Die Zahl sollte positiv sein!\n"
    suc1: .asciiz "Die Fibonaccizahl lautet:"
    
.text
main:
    la $a0, msg1      # Lade begrüßung
    li $v0, 4         # sys: print String
    syscall
    
    li $v0, 5         # sys: read Int
    syscall
    
    blez $v0, negativ # input <= 0
				
				li $t0, 0         # n-1
				li $t1, 1         # n
				li $t2, 1	        # fib_zahl

fib:				
   beq $t2, $v0, fertig # Zahl erreicht
   add $t3, $t0, $t1    # Summe speichern
   move $t0, $t1        # t1 => t0
   move $t1, $t3        # Summe => t1
   addi $t2, $t2, 1     # Laufvariable++
   j fib

negativ:
		  la $a0, err1      # Fehler negativ
		  li $v0, 4         # sys: print String
		  syscall
				
				j main            # Nochmal fragen

fertig:
    move $a0, $t1     # n für Ausgabe
    li $v0, 1         # sys: print Int
    syscall
    
    li $v0, 10        # sys: Beenden
    syscall