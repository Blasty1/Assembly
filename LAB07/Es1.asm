N = 5
.data
c0: .word 4
c1: .word 2
c2: .word -5
c3: .word 3
.text
.globl main
.ent main
main:
    lw $t0,c0
    lw $t1,c1
    lw $t2,c2
    lw $t3,c3

    #inizializzazioni
    mul $s1, $t1, $t1
    mul $s0, $s1, $t1
    mul $s3, $t3, $t3
    mul $s2, $s3, $t3
    mul $s5, $t0, $t0
    mul $s4, $s5, $t0

    li $s6,N

    #Calcolo $a0
    add $a0,$t0,$t1
    add $a0,$a0,$t2
    add $a0,$a0,$t3

    #Calcolo $a1
    mul $t4,$t0,$s0
    mul $t5,$t1,$s1
    mul $t6,$t2,2
    add $a1,$t4,$t5
    add $a1,$a1,$t6
    add $a1,$a1,$t3

    #Calcolo $a2
    mul $t4,$t0,$s2
    mul $t5,$t1,$s3
    mul $t6,$t2,3
    add $a2,$t4,$t5
    add $a2,$a1,$t6
    add $a2,$a1,$t3

    #Calcolo $a3
    mul $t4,$t0,$s4
    mul $t5,$t1,$s5
    mul $t6,$t2,4
    add $a3,$t4,$t5
    add $a3,$a1,$t6
    add $a3,$a1,$t3

    #Salvo $ra
    subu $sp,$sp,-4
    sw $ra,($sp)

    #Salviamo i registri da t0 a t3
    subu $sp,$sp,-20
    sw $t0,16($sp)
    sw $t1,12($sp)
    sw $t2,8($sp)
    sw $t3,4($sp)

    sw $s6,($sp) #Salvo il parametro N da passare alla funzione

    jal polinomio

    #ripristino i registri
    lw $t0,16($sp)
    lw $t1,12($sp)
    lw $t2,8($sp)
    lw $t3,4($sp)

    addi $sp, $sp,20 #ripristino lo stack 

    lw $ra,($sp)
    addi $sp,$sp,4 
    jr $ra

    li $v0,10
    syscall
.end main

polinomio:
    #prendo il parametro N
    lw $t3,($sp)
    subu $t3,$t3,4

    subu $sp,$sp,16
    sw $s0,8($sp)
    sw $s1,4($sp)
    sw $s2,($sp)

    #inizializzazioni
    sub $t0,$a1,$a0
    sub $t1,$a2,$a1
    sub $t2,$a3,$a2

    sub $s0,$t1,$t0
    sub $s1,$t2,$t1
    sub $s2,$s1,$s0
    
    move $v0,$a3

    and $t4,$0,$0
    FOR1:
        addi $t4,$t4,1

        add $s1,$s1,$s2
        add $t2,$t2,$s1
        add $v0,$v0,$t2

        bne $t4,$t3,FOR1

    #ripulisco lo stack
    lw $s0,8($sp)
    lw $s1,4($sp)
    lw $s2,($sp)
    addi $sp,$sp,16

    jr $ra
.end polinomio