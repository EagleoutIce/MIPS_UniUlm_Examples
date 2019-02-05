## Autor: Florian Sihler
## Dienstag 05.02.2019
.data
    ziel: .asciiz "Lila\n" ## Einzig wahre Farbe
    msg1: .asciiz "Gib deine Lieblingsfarbe ein: "
    nocol:.asciiz "Bitte gib mindestens ein Zeichen ein!\n"
    succ: .asciiz "Du hast einen guten Geschmack\n"
    fail: .asciiz "Bäh! Wir suchen eine tolle Farbe\n"
    

    
    input: .space 50      # Farbe länger als 48 Zeichen?
.text
main:
    la $a0, msg1          # Startfrage ausgeben
    li $v0, 4             # sys: String ausgeben
    syscall

    la $a0, input         # Eingabe vorbereiten
    li $a1, 50            # 50 lang
    li $v0, 8             # sys: String einlesen 
    syscall
    
    lb $t0, 0($a0)        # Erstes Zeichen der Eingabe
    
    bne $t0, 10, str_cmp  # Erstes Zeichen ist nicht '\n'
    la $a0, nocol         # Leerer String eingegebn
    li $v0, 4             # sys: String ausgeben
    syscall
    j main
 
str_cmp:                  ## input == ziel ?
    la $s0, input         # string laden
    la $s1, ziel          # ziel laden
    
rekursiv:
    lb $t0, 0($s0)        # Zeichen aus input
    lb $t1, 0($s1)        # Zeichen aus Ziel
    beq $t0, 0, test      # Letztes Zeichen?
    beq $t1, 0, scheit    # Eingabe zu lang
    bne $t0, $t1, scheit  # Zeichen nicht gleich
    addi $s0,$s0,1        # Gehe ein Zeichen weiter
    addi $s1,$s1,1        # - "" -
    j rekursiv

test: 
    beq $t1, 0, erfolg    # Ist auch Ziel am Ende?

scheit:
    la $a0, fail          # Fehlertext
    li $v0, 4             # sys: String ausgeben
    syscall
    j ende

erfolg:
    la $a0, succ          # Erfolgstext
    li $v0, 4             # sys: String ausgeben
    syscall

ende:
   li $v0, 10             # sys: ende
   syscall
