.data
input: .asciiz "Inserisci numero: "
errore: .asciiz "Errore, non è una cifra numerica"
overflow: .asciiz "Errore, overflow"
.text
.globl main
.ent main
main:
    li $v0,4
    la $a0, input
    syscall

    li $t0, 0
    li $t6, '0'
    SALTO: 
        li $v0,12
        syscall

        move $t3,$v0

        blt $t3,'0',ERRORE

        bgt $t3,'9',ERRORE    

        sub $t3, $t3, $t6
        mulou $t0, $t0, 10

        add $t0, $t0, $t3
        blt $t0, 0, OVERFLOW

        j CORRETTO
        
        ERRORE: 
        li $v0,4
        la $a0,errore
        syscall

        CORRETTO:
        bne $t3,'\n' SALTO

    OVERFLOW:
    li $v0,4
    la $a0,overflow
    syscall

    li $v0, 10
    syscall
.end main