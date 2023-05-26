.data
numeri: .word 15, 870, 1200, -21, -1000, 15003, -1039581 
.text
.globl main
.ent main
main:
    la $a0,numeri
    li $a1,5

    jal massimo

    move $a0,$v0
    li $v0,1
    syscall

    li $v0,10
    syscall
.end main

massimo:
    and $t0,$0,$0
    move $t1,$a0
    lw $s0,($a0)
    FOR1:
        addi $t0,$t0,1
        addi $t1,$t1,4
        lw $s1,($t1)

        blt $s1,$s0,ARRIVO

        move $s0,$s1

        ARRIVO: bne $t0,$a1,FOR1
    move $v0,$s0
    j $ra
.end massimo