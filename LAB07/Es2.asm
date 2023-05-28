.data

.text
.globl main
.ent main
main:
    li $a0,9
    jal procedura

    li $v0,10
    syscall

.end main

procedura:
    andi $t0,$a0,1

    beq $t0,0,PARI

    #altrimenti è dispari

    mul $a0,$a0,3
    addi $a0,$a0,1
    j FINE

    PARI:
        srl $a0,$a0,1

    FINE:    
        li $v0,1
        syscall

        move $v0,$a0
        jr $ra

.end procedura