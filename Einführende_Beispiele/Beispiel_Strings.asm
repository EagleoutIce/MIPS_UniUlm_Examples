.data
    inp1: .space 50  # 48 Zeichen
    str1: .asciiz "Lila Einhornland!: "
.text
    la $a0, inp1     # a0 zeigt auf inp1.start
    li $a1, 50       # Max 48 Zeichen
    li $v0, 8        # sys: String Einlesen
			 syscall
			 
    la $a0, str1     # a0 zeigt auf str1.start
    li $v0, 4        # sys: str1 Ausgeben
    syscall
    
    la $a0, inp1     # a0 zeigt auf inp1.start
    li $v0, 4        # sys: str1 Ausgeben
    syscall
    