.data
spazio: .asciiz " "
.text
.globl main
.ent main
main:
    li $a0,19

    jal sequenzaDiCollatz
    
    
    li $a0,0
    move $a0,$v0
    li $v0,1
    syscall

    li $v0,10
    syscall
.end main

sequenzaDiCollatz:
    addi $sp,$sp,-4
    sw $ra,($sp)

    and $t1,$0,$0
    move $t2,$a0
    WHILE:
        move $a0,$t2
        addi $t1,$t1,1
        jal procedura

        move $t2,$v0


        li $v0,4
        la $a0,spazio
        syscall
        

        bne $t2,1,WHILE

    move $v0,$t1
    
    lw $ra,($sp)
    addi $ra,$ra,4
    jr $ra


.end sequenzaDiCollatz

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