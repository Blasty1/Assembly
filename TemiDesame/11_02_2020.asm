.data
vettore: .byte 14, 16, 18, 134, 24, 22, 23, 149, 140, 141, 145, 146
vettoreCompresso: .space 12
INTERVALLO_QUANT = 10
.text
.globl main
.ent main
main:
 subu $sp, $sp, 4
 sw $ra, ($sp)
 la $a0, vettore
 li $a1, 12
 la $a2, vettoreCompresso
 jal comprimi

 move $s5,$v0

 lw $ra, ($sp)
 addu $sp, $sp, 4

 jr $ra
 .end main

comprimi:
subu $sp,$sp,20
sw $ra,16($sp)
sw $s0,($sp)
sw $s1,4($sp)
sw $s2,8($sp)
sw $s3,12($sp)


move $s0,$a0 #a0 indirizzo vettore iniziale
move $s1,$a1 #a1 DIM
move $s2,$a2 #a2 indirizzo vettore valori compressi
and $s3,$0,$0
and $t0,$0,$0
li $t1,-1

FOR:
lb $t2,($s0)

move $a0,$t2

subu $sp,$sp,4
sb $t0,($sp)

jal quantizza

lb $t0,($sp)
addi $sp,$sp,4

move $t2,$v0

beq $t2,$t1,SALTA
sb $t2,($s2)
addi $s2,$s2,1
move $t1,$t2
addi $s3,$s3,1


SALTA:
addi $t0,$t0,1
addi $s0,$s0,1
bne $t0,$s1,FOR
move $v0,$s3


lw $ra,16($sp)
lw $s0,($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
addi $sp,$sp,20

jr $ra
.end comprimi

quantizza:
 divu $t0, $a0, INTERVALLO_QUANT
 mulou $v0, $t0, INTERVALLO_QUANT
 jr $ra 
 .end quantizza