.data 
input: .asciiz "inserisci un intero: "
solz_reale_out: .asciiz "Soluzioni reali"
solz_non_reale_out: .asciiz "Soluzioni complesse"
.text 

.globl main
.ent main
main:
    la $a0,input
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $s0,$v0 

    la $a0,input
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $s1,$v0 


    la $a0,input
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $s2,$v0 

    # s0 --> A
    # s1 --> B
    # s2 --> C

    mul $t0, $s1, $s1

    mul $t1,$s0,$s2
    sll $t1, $t1,2

    slt $s3, $t0,$t1 
    beq $s3,0, SOL_REALI

#soluzioni non reali
    la $a0,solz_non_reale_out
    j FINE
SOL_REALI:
    la $a0,solz_reale_out
FINE:
    li $v0,4
    syscall
    
    li $v0,10
    syscall
.end main