.data
input: .asciiz "Inserisci numero: "
errore: .asciiz "Errore, non è una cifra numerica"
.text
.globl main
.ent main
main:
    li $v0,4
    la $a0, input
    syscall


    SALTO: 
        li $v0,12
        syscall

        move $t3,$v0

        blt $t3,'0',ERRORE

        bgt $t3,'9',ERRORE    
            
        j CORRETTO
        
        ERRORE: 
        li $v0,4
        la $a0,errore
        syscall

        CORRETTO:
        bne $t3,'\n' SALTO


    li $v0, 10
    syscall
.end main