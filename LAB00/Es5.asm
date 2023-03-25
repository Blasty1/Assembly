.data
vett: .word 5, 7, 3, 4
result: .space 4
.text
.globl main
.ent main

main:
    li $t0 0
    li $t4 0
    la $t1, vett

lab1: lw $t3, ($t1)
    add $t4 , $t4, $t3

    #to print 
    move $a0, $t4
    li $v0, 1
    syscall
    #out the sum updated of each step

    addi $t0, $t0, 1
    addi $t1, $t1, 4
    bne $t0, 4, lab1 
          
    sw $t4, result
        

    li $v0, 10
    syscall
.end main