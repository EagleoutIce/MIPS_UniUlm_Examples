.data
    str1: .asciiz "Gebe n für n! ein: "
    
.text
    la $a0, str1        # Lade str1
    li $v0, 4           # sys: print String
    syscall
    
    li $v0, 5           # sys: read int
    syscall
    
    move $a0, $v0       # Argument 1 fact(n)
    jal fact            # fact(a0)
    
    move $a0, $v0       # Ergebnis laden
    li $v0, 1           # sys: print int
    syscall
    
    li $v0, 10          # sys: exit
    syscall
    
## 8 * 8 Byte = 64 byte = 2 Register
fact: ## fact(a0:n)
    addi $sp, $sp, -8   # vorbereiten 2 items auf stack 
    sw   $ra, 4($sp)    # rücksprungpunkt sichern
    sw   $a0, 0($sp)    # 'n' sichern
    bge  $a0, 1, f_re   # Ist n > 1 => rekursiv
    li   $v0, 1         # sonst ist fact(n) = 1
    addi $sp, $sp, 8    # Items vom Stack werfen
    jr   $ra            # return
    
f_re:  ## fact_rekursiv
    addi $a0, $a0, -1   # n--
    jal fact            # fact(n-1) auf Stack
    lw $a0, 0($sp)      # get n
    lw $ra, 4($sp)      # get Address 
    addi $sp, $sp, 8    # Items vom Stack werfen
    mult $a0, $v0       # fact(n) * fact(n-1)
    mflo $v0            # Ergebnis Laden 
    jr $ra              # zurückgeben