DIM=7
.data
vettore: .byte 11 5 1 4 6 2 12
.text
.globl main
.ent main
main: subu $sp, $sp, 4
 sw $ra, ($sp)
 la $a0, vettore
 li $a1, DIM
 jal EvenParity

 la $t1,vettore
 and $t0,$0,$0
 FOR:
 lb $a0,($t1)

 move $s0,$a0
 addi $t1,$t1,1 
 addi $t0,$t0,1
 bne $t0,DIM,FOR

 lw $ra, ($sp)
 addiu $sp, $sp, 4
 jr $ra
.end main 

#$a0 --> contiene indirizzo del vettore
#$a1 --> numero di elementi del vettore
EvenParity:
    subu $sp,$sp,16
    sw $s0,($sp)
    sw $s1,4($sp)
    sw $s2,8($sp)
    sw $s3,12($sp)

    and $s2, $0, $0
    and $s0,$0,$0
    move $s1,$a0
    VETTORE:
    lb $s3,($s1)

    move $t1,$s3

    and $t0,$0,$0
    li $t3,0
    li $t4,2
    CONTOVALORI:
    and $t2,$t1,1

    add $t3,$t3,$t2

    addi $t0,$t0,1
    srl $t1,$t1,1
    bne $t0,4,CONTOVALORI

    div $t3,$t4
    mfhi $t3

    andi $t1,$s3,0x7F

    beq $t3,1,DISPARI

    addi $s2,$s2,1 #Pari
    
    j SALTA

    DISPARI:
    ori $t1,$t1,0x80

    SALTA:
    sb $t1,($s1)
    addi $s1,$s1,1
    addi $s0,$s0,1
    bne $s0,$a1,VETTORE

    move $v0,$s2

    lw $s0,($sp)
    lw $s1,4($sp)
    lw $s2,8($sp)
    lw $s3,12($sp)
    addi $sp,$sp,16

    jr $ra
.end EvenParity