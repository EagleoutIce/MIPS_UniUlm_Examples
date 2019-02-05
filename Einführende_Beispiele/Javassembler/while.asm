## Autor: Florian Sihler
## Dienstag 05.02.2019
.text
main:
    li $t0, 0   # Unsere Laufvariable
    li $t1, 42  # Die "Endbedingung"
while:
     bge $t0, $t1, exit # Ist t0 >= t1? 
     addi $t0, $t0, 1   # i++
     j while            # und wieder ausführen

exit: 
    li $v0, 10          # sys: exit
    syscall