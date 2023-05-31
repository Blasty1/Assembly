.data
data_arrivo: .byte 12, 00
data_uscita: .byte 20, 15
.text
.globl main
.ent main
main:
    la $a0,data_arrivo
    la $a1,data_uscita
    li $a2,5
    li $a3,35
    jal costoParcheggio
    li $a0,0
    move $a0,$v0
    li $v0,1
    syscall

    li $v0,10
    syscall
.end main

# $a0 --> indirizzo vettore di arrivo ora - minuto su 2 byte
# $a1 --> indirizzo vettore di uscita ora - minuto su 2 byte
# $a2 --> costo per Y minuti
# $a3 --> Y minuti 
costoParcheggio:
    addi $sp,$sp,-16

    sw $s0,12($sp)
    sw $s1,8($sp)
    sw $s2,4($sp)
    sw $s3,($sp)


    lb $t0,($a0)
    mul $t0,$t0,60

    lb $t1,1($a0)
    add $s0,$t0,$t1 #minuto entrata


    lb $t0,($a1)
    mul $t0,$t0,60

    lb $t1,1($a1)
    add $s1,$t0,$t1 #minuto uscita

    sub $s2, $s1,$s0 #minuti trascorsi nel parcheggio

    div $s2,$a3
    mfhi $t0
    mflo $t1

    mul $s3, $t1, $a2

    beq $t0,0,FINE 

    add $s3,$s3,$a2

    FINE:
    move $v0,$s3


    lw $s0,12($sp)
    lw $s1,8($sp)
    lw $s2,4($sp)
    lw $s3,($sp)

    addi $sp,$sp,16

    jr $ra

.end costoParcheggio