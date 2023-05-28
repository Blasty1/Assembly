.data
MAT: .word 1, 41, 42, 13, 56, 23, 73, 9, 50
.text
.globl main
.ent main

main:
    la $t0,MAT

    lw $a0,($t0)
    lw $a1,4($t0)
    lw $a2,8($t0)
    lw $a3,12($t0)

    addi $sp,$sp,-20 

    addi $t0,$t0,16
    lw $t1,($t0)
    sw $t1,16($sp)

    addi $t0,$t0,4
    lw $t1,($t0)
    sw $t1,12($sp)

    addi $t0,$t0,4
    lw $t1,($t0)
    sw $t1,8($sp)

    addi $t0,$t0,4
    lw $t1,($t0)
    sw $t1,4($sp)

    addi $t0,$t0,4
    lw $t1,($t0)
    sw $t1,($sp)

    jal determinante3x3

    addi $sp,$sp,20

    move $a0,$v0
    li $v0,1
    syscall

    li $v0,10
    syscall
.end main

determinante3x3:
    addi $sp,$sp,-4
    sw $ra,($sp)

    move $s0,$a0
    move $s1,$a1
    move $s2,$a2
    move $s3,$a3

    lw $a0,20($sp)
    lw $a1,16($sp)
    lw $a2,8($sp)
    lw $a3,4($sp)

    jal determinante2x2  

    mul $s4,$s0,$v0

    move $a0,$s3
    lw $a1,16($sp)
    lw $a2,12($sp)
    lw $a3,4($sp)

    jal determinante2x2

    mul $t1,$s1,$v0
    sub $s4,$s4,$t1

    move $a0,$s3
    lw $a1,20($sp)
    lw $a2,12($sp)
    lw $a3,8($sp)

    jal determinante2x2
    mul $t1,$s2,$v0
    add $v0,$s4,$t1


    lw $ra,($sp)
    addi $sp,$sp,4
    jr $ra



.end determinante3x3


determinante2x2:
    mul $t0,$a0,$a3
    mul $t1,$a1,$a2

    sub $v0,$t0,$t1
    jr $ra
.end determinante2x2