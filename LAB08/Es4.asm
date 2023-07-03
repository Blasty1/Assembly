DIM = 5
.data
vet1: .word 56, 12, 98, 129, 58
vet2: .word 1, 0, 245, 129, 12
risultato: .space DIM
spazio: .asciiz " "
.text
.globl main
.ent main
main:
    la $a0, vet1
    la $a1, vet2
    la $a2, risultato
    li $a3, DIM
    jal CalcolaDistanzaH

    and $t0,$0,$0
    la $t1,risultato
    FOR1:
        lb $a0,($t1)
        li $v0,1
        syscall

        la $a0,spazio
        li $v0,4
        syscall


        addi $t0,$t0,1
        addi $t1,$t1,1
        bne $t0,DIM,FOR1
    li $v0,10
    syscall
.end main

CalcolaDistanzaH:
    subu $sp,$sp,4
    sw $ra,($sp)

    and $t0,$0,$0 #indice

    move $t1,$a0 #vettore vet1
    move $t2,$a1 #vettore vet2
    move $t3,$a2
    FOR2:
        lw $s0,($t1)
        lw $s1,($t2)

        move $a0,$s0
        move $a1,$s1
        jal check_bit_per_bit

        sb $v0,($t3)

        addi $t0,$t0,1
        addi $t1,$t1,4
        addi $t2,$t2,4
        addi $t3,$t3,1
        bne $t0,$a3,FOR2
    lw $ra,($sp)
    addi $sp,$sp,4

    jr $ra
.end CalcolaDistanzaH


check_bit_per_bit:
    subu $sp,$sp,12
    sw $s0,8($sp)
    sw $s1,4($sp)
    sw $s2,($sp)

    move $s0,$a0
    move $s1,$a1

    li $s2,0
    and $t6,$0,$0
    FOR3:
        and $t7,$s0,0x1
        and $t8,$s1,0x1

        xor $t9,$t7,$t8 #ritorna vero se sono diversi
        
        add $s2,$s2,$t9
    
        srl $s0,$s0,1
        srl $s1,$s1,1
        addi $t6,$t6,1
    bne $t6,32,FOR3

    move $v0,$s2

    lw $s0,8($sp)
    lw $s1,4($sp)
    lw $s2,($sp)
    addi $sp,$sp,12
    jr $ra

.end check_bit_per_bit