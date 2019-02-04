## Autor: Florian Sihler
## Montag 04.02.2019
.text
    li $a1, 43  # Weil 42 :D
    li $v0, 42  # sys: rand int range
    syscall
    
    li $v0, 1   # sys: print int
    syscall
