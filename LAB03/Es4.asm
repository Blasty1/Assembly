.data
DIM: .word 5
input: .asciiz "Inserisci valore: "
.text
.globl main
.ent main
main:
    lw $t2,DIM
    li $t0,0
    START:
        addi $t0,$t0,1

        li $v0, 4
        la $a0,input
        syscall

        li $v0,5
        syscall

        add $t1,$t1,$v0

        bne $t0,$t2,START
    div $t1,$t1,$t2

    li $v0,1
    move $a0,$t1
    syscall

    #notiamo che arrotonda per difetto --> 2.7 diventa 2 

    li $v0,10
    syscall
.end main