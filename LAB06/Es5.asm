.data

.text
.globl main
.ent main
main:

    li $a0,12
    li $a1,2

    jal combina

    move $a0,$v0
    li $v0,1
    syscall

    li $v0,10
    syscall
.end main

#a0 --> N
#a1 --> K
combina:
    #Numeratore
    move $t0,$a0
    move $s0,$a0

    sub $t1,$a0,$a1
    addi $t1,$t1,1
    FOR1:
        addi $t0,$t0,-1
        mul $s0,$s0,$t0

        bne $t0,$t1,FOR1
    
    move $t0,$a1
    move $s1,$a1
    FOR2:
        addi $t0,$t0,-1
        mul $s1,$s1,$t0

        bne $t0,1, FOR2
    
    div $v0,$s0,$s1

    j $ra
.end combina