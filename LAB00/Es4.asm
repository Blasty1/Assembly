.data
wVett: .word 5, 7, 3, 4
wResult: .space 4
.text
.globl main 
.ent main
main :
    li $t3, 0
    la $t1 , wVett

    lw $t2 , ($t1)
    add $t3, $t3, $t2

    addi $t1, $t1, 4
    lw $t2 , ($t1)
    add $t3, $t3, $t2

    addi $t1,$t1, 4
    lw $t2 , ($t1)
    add $t3, $t3, $t2

    addi $t1, $t1, 4
    lw $t2 , ($t1)
    add $t3, $t3, $t2

    move $a0 , $t3 # move the value contained in $t3 to $a0 
    li $v0, 1 #code to print out the value in $a0
    syscall 


    sw $t3, wResult #without the  () if we don't use the la command on the variable

    li $v0, 10
    syscall
.end main