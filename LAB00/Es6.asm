.data
vett : .space 20
promptInt : .asciiz "Inserisci Valore: "
outputInt : .asciiz "Valore Array: "
.text
.globl main
.ent main
main:
la $t1 , vett
and $t0 , $0, $0 
LAB1: li $v0, 4

    la $a0, promptInt
    syscall

    li $v0, 5
    syscall

    sw $v0,($t1)
    addi $t1,$t1,4
    addi $t0,$t0,1

    bne $t0 , 5 , LAB1 

    li $t0 0
    la $t1 vett 
LAB2: lw $t2 , ($t1)
    move $a0, $t2
    li $v0, 1
    syscall

    addi $t0, $t0, 1
    addi $t1, $t1, 4

    bne $t0,5,LAB2


    li $v0, 10
    syscall
.end main