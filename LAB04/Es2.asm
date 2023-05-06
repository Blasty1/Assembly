.data
opa: .word 2043
opb: .word 5
input: .asciiz "Menu\n 0 --> somma\n 1 --> sottrazione\n 2 --> moltiplicazione\n 3 --> divisone intera\n Inserisci:"
res: .word 0
labelSwitchCase: .word L0,L1,L2,L3
err_output: .asciiz "Errore, input non valido"
.text
.globl main
.ent main
main:
    la $a0, input
    li $v0,4
    syscall

    li $v0,5
    syscall


    bgt $v0, 3, ERRORE

    blt $v0,0,ERRORE

    sll $t1, $v0,2

    la $t0,labelSwitchCase

    add $t1,$t0,$t1

    lw $t2,($t1)

    lw $t3,opa 
    lw $t4,opb
    
    j $t2

L0:
    add $t5, $t3,$t4
    sw $t5,res
    j FINE
L1:
    sub $t5, $t3,$t4
    sw $t5,res
    j FINE
L2:
    mul $t5, $t3,$t4
    sw $t5,res
    j FINE
L3:
    div $t5,$t3,$t4
    sw $t5,res
    j FINE

ERRORE:
    li $v0,4
    la $a0,err_output
    syscall
    

FINE:
    li $v0,10
    syscall
.end main