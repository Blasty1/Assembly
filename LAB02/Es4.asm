.data
parola: .half 14
.text
.globl main
.ent main
main:
    lh $t0,parola

    li $t1,0
    li $t2,0
    # t1 è il contatore del ciclo, t2 è il contatore di bit a 1

    LAB:
    
    srl $t0, $t0,1

    and $t3,$t0,1

    add $t2,$t2,$t3

    addi $t1,$t1,1

    bne $t1,4,LAB 

    li $v0,1
    move $a0,$t2
    syscall

    li $v0, 10
    syscall
.end main