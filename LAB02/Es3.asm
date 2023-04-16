.data
first: .word 10
second: .word 5
third: .word 1
spazio: .asciiz "\n"
.text
.globl main
.ent main
main:
    lw $t0,first
    lw $t1,second
    lw $t2,third

    ble $t0, $t1, SALTO1
    move $t5,$t0
    move $t0,$t1
    move $t1, $t5

    SALTO1: 
    ble $t0, $t2, SALTO2
    move $t5,$t0
    move $t0,$t2
    move $t2,$t5

    SALTO2:
    ble $t1,$t2, SALTO3
    move $t5,$t1
    move $t1,$t2
    move $t2,$t5

    SALTO3:
    #stampiamo in ordine

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, spazio
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, spazio
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 4
    la $a0, spazio
    syscall


    li $v0, 10
    syscall
.end main