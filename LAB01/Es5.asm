.data
prompt: .asciiz "Inserisci un intero: "
.text
.globl main
.ent main
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    move $t1,$v0 

    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall

    move $t2,$v0 

    add $t1, $t1, $t2

    sub $t2, $t1, $t2

    sub $t1, $t1, $t2
    
    li $v0, 1
    move $a0, $t1
    syscall

    move $a0, $t2
    syscall


    li $v0, 10
    syscall
.end main