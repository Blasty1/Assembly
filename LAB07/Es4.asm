.data
MAT: .word 5, 10, 15, 5
inputString: .asciiz "Risultato determinante: "
.text
.globl main
.ent main
main:
    addi $sp, $sp,-4
    sw $ra,($sp)

    la $t0,MAT
    lw $a0,($t0)
    lw $a1,4($t0)
    lw $a2,8($t0)
    lw $a3,12($t0)

    jal determinante2x2

    move $t0,$v0

    li $v0,4
    la $a0,inputString
    syscall

    move $a0,$t0
    li $v0,1
    syscall

    lw $ra, ($sp)
    addi $sp,$sp,4
    jr $ra

.end main


determinante2x2:
    mul $t0,$a0,$a3
    mul $t1,$a1,$a2

    sub $v0,$t0,$t1
    jr $ra
.end determinante2x2