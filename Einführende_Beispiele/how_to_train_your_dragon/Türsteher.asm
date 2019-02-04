.data
    str1: .asciiz  "Wie alt bist du?: "
    succ: .asciiz  "Du darfst reinkommen!\n"
    fail: .asciiz  "Du darfst nicht reinkommen!\n"
.text
main:
    la $a0, str1            # Frage Laden
    la $v0, 4               # Frage ausgeben
    syscall
    
    li $v0, 5               # Alter eingeben
    syscall
    blt $v0, 18, scheitern  # Minderjährig
                            # j erfolg
    
erfolg:
    la $a0, succ            # Erfolg Laden
    la $v0, 4               # Erfolg ausgeben
    syscall
    j ende

scheitern:
    la $a0, fail            # Scheitern Laden
    la $v0, 4               # Scheitern ausgeben
    syscall
                            # j erfolg
ende:
    li $v0, 10     # Programm beenden
    syscall
    