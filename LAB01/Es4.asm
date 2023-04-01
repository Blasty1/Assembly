.data
var: .word 0x3FFFFFF0
.text
.globl main
.ent main

#fa overflow perchè il valore massimo rappresentabile è 2^32 -1 
main:
    lw $t1, var
    sll $t3, $t1, 1

    move $a0, $t3
    li $v0, 1
    syscall
    
    addi $t2, $t3, 40

    move $a0, $t2
    li $v0, 1
    syscall

    li $v0,10
    syscall
.end main