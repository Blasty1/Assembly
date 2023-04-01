.data
op1: .byte 150
op3: .word 150
op2: .byte 100
.text
.globl main
.ent main
main:
    lb $t1,op1
    lb $t2,op2
    lw $t5,op3

    add $t3,$t1,$t2

    move $a0,$t3
    li $v0, 1
    syscall  

    li $v0,10
    syscall
.end main