.data
.text
.ent main
.globl main
.main

.end main

#$a0 --> indirizzo della prima cella dell'array
#$a1 --> lunghezza array
.calcolaPolaccaInversa:
subu $sp,$sp,4
sw $ra,($sp)

and $s0,$0,$0
li $s4,0
move $s1,$a0
move $s2,$a1
LOOP:
    lw $s3,($s1)
    blt $s3,0,VALORE
    
    subu $sp,$sp,4
    sw $s3,($sp)

    j FINE
    VALORE:
    move $a0,$s3
    lw $a1,($sp)
    lw $a2,4($sp)
    addi $sp,$sp,8
    jal eseguiOperazione

    lw $t0,($sp)
    addi $sp,$sp,4
    addi $s4,$s4,$t0
    FINE:

    addi $s1,$s1,4
    addi $s0,$s0,1
    bne $s0,$s1,LOOP
lw $ra,($sp)
addi $sp,$sp,4
jr $ra
.end calcolaPolaccaInversa