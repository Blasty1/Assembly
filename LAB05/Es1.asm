.data
value: .word 3141592653
.text
.globl main
.ent main
main:
    lw $t2,value
    li $t1,10
    and $t3,$0,$0
loop1:
    divu $t2,$t1
    addi $sp, $sp,-4
    mfhi $t2
    sw $t2,($sp)
    addi $t3,$t3,1
    mflo $t2
    bne $t2,0,loop1

loop2:
    lw $t2,($sp)
    addi $sp,$sp,4
    addi $t2,$t2,'0'

    move $a0,$t2 
    li $v0,11
    syscall  
    addi $t3, $t3, -1
    bne $t3,0,loop2     


    li $v0,10
    syscall
.end main