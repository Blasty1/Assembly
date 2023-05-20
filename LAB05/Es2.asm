.data
errore: .asciiz "Non sono palindrome"
corretto: .asciiz "Sono palindrome"
.text
.globl main
.ent main
main:

and $t0,$0,$0
move $s2,$sp 
loop1:
    li $v0,12
    syscall
    
    subu $sp, $sp,4
    sw $v0,($sp)
    addi $t0,$t0,1
    bne $v0,'\n',loop1

addi $sp,$sp,4 #non salviamo \n
addi $t0,$t0,-1

and $t2,$0,$0 #indice del ciclo
loop2:
    addi $t0,$t0,-1
    mul $t6,$t0,4
    add $t3,$t6,$sp

    mul $t4,$t2,4
    add $t5,$sp, $t4

    lw $s0,($t3)
    lw $s1,($t5)

    addi $t2,$t2,1
    bne $s0,$s1,DIVERSE
    bne $0,$t0,loop2
CORRETTO:
    la $a0,corretto
    li $v0,4
    syscall

    j FINE
DIVERSE:
    la $a0,errore
    li $v0,4
    syscall

FINE:
    move $sp,$s2 #ripristino lo stack eliminando lo stack frame creato precedentemente
    li $v0,10
    syscall 


.end main

