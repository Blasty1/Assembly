.data
n1: .byte 10
n2: .byte 0x10
n3: .byte '1'
res: .space 1
.text
.globl main
.ent main
main:
    lb $t1, n1
    lb $t2, n2
    lb $t3, n3

    sub $t4, $t1, $t2

    li $v0,1
    move $a0, $t4
    syscall

    add $t4, $t4, $t3

    li $v0, 1
    move $a0, $t4
    syscall

    sb $t4, res

    li $v0, 10
    syscall
.end main
