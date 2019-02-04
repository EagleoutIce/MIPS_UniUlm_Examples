## Autor: Florian Sihler
## Montag 04.02.2019
.text
    li $v0, 5      # sys: Einlesen einer Zahl
    syscall        # Einlesen
    
    move $a0, $v0  # Zahl für Ausgabe vorbereiten
    li $v0, 1      # sys: Ausgeben einer Zahl
    syscall        # Ausgeben
