NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 0
.data
prezzi: .word 39, 1880, 2394, 1000, 1590
scontati: .space DIM
spazio: .asciiz " "
.text
.globl main
.ent main
main:
    la $a0, prezzi
    la $a1, scontati
    li $a2, NUM
    li $a3, SCONTO
    li $t0, ARROTONDA
    subu $sp,$sp,4
    sw $t0, ($sp)
    li $s0,100
    jal calcola_sconto

    move $a0,$s0
    li $v0,1
    syscall

    la $a0,spazio
    li $v0,4
    syscall

    and $t0,$0,$0
    la $t1,scontati
    LOOP:
        lw $a0,($t1)
        li $v0,1
        syscall

        la $a0,spazio
        li $v0,4
        syscall

        addi $t1,$t1,4
        addi $t0,$t0,1
        bne $t0,NUM,LOOP

    li $v0,10
    syscall
.end main

calcola_sconto:
    lw $t2,($sp) #trattare l'arrotondamento

    subu $sp,$sp,16
    sw $s0,12($sp)
    sw $s1,8($sp)
    sw $s2,4($sp)
    sw $sp,($sp)




    li $t5,100
    and $t0,$0,$0

    move $t3,$a0 #prezzi
    move $t1,$a1 #sconti

    FOR:
        lw $s0,($t3)

        mul $s1,$s0,100 #valore iniziale
        mul $s2,$s0,$a3 #sconto applicato

        subu $s3,$s1,$s2 #valore scontato

        bne $t2,1,FINE
        #devo arrotondare
        div $s3,$t5 
        mfhi $t4 #prendo le ultime due cifre del numero

        blt $t4,50,FINE #arrotondo per difetto
        addi $s3,$s3,100 #sommo un unità 
        

        FINE: 
            div $s3,$s3,100 #riporto il valore sulle cifre corrette
            sw $s3,($t1) #scrivo in memoria
        

        addi $t3,$t3,4
        addi $t1,$t1,4
        addi $t0,$t0,1
        bne $t0,$a2,FOR
        
        lw $s0,12($sp)
        lw $s1,8($sp)
        lw $s2,4($sp)
        lw $sp,($sp)
        addi $sp,$sp,16

        jr $ra
        
.end calcola_sconto