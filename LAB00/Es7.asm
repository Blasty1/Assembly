.data
DIM : .space 4
prompt: .asciiz "Inserisci numero di elementi: "
promptValore: .asciiz "Inserisci elemento: "
promptFinale: .asciiz "Valore minimo: "
.text
.globl main
.ent main

main:
    la $a0, prompt
    li $v0, 4
    syscall 

    li $v0, 5
    syscall

    addi $t0, $v0, 1

    #DIM = $t0

    li $t1,0 
    li $t2, 'z'
lab1: la $a0, promptValore
    li $v0, 4
    syscall

    li $v0, 12
    syscall

    sll $t3 , $v0, $t2
    
    addi $t1, $t1, 1

    bne $t3, 1, lab2
    move $t3 , $v0

lab2: bne $t1, $t0, lab1

    la $a0, promptValore
    li $v0, 4
    syscall

    move $a0, $t3
    li $v0,11
    syscall
    li $v0, 10
    syscall
.end main