DIM = 11
.data
veta: .word 2, 14, 8, 54, 0, 42, 9, 24, 0, 91, 23
vetb: .space 4*DIM
.text
.globl main
.ent main

main:
 la $a0, veta
 la $a1, vetb
 li $a2, DIM
 jal Trasformazione

 li $v0,10
 syscall
.end main 

Trasformazione:
addi $sp,$sp,-20
sw $s0,($sp)
sw $s1,4($sp)
sw $s2,8($sp)
sw $s3,12($sp)
sw $s4,16($sp)

move $s0,$a0 #veta
move $s1,$a1 #vetb
move $s3,$a2 #DIM
subu $s4,$s3,1

lw $t1,($s0)
beq $s3,1, FINE
addi $s0,$s0,4
lw $t2,($s0)
addi $s0,$s0,4

sw $t1,($s1)
addi $s1,$s1,4
sw $t2,($s1)
addi $s1,$s1,4

beq $s3,2,FINE
beq $s3,3,ULTIMO_VALORE

and $t0,$0,$0
FOR:
    lw $t3,($s0)
    lw $t4,4($s0)

    add $t5 ,$t1,$t2
    add $t5,$t5,$t3
    add $t5,$t5,$t4

    div $t5,$t5,4

    sw $t5,($s1)

    move $t1, $t2
    move $t2,$t3

    addi $s0,$s0,4
    addi $s1,$s1,4
    addi $t0,$t0,1
bne $t0,$s4,FOR

ULTIMO_VALORE:
lw $t4,($s0)
sw $t4,($s1)

FINE: 
lw $s0,($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
lw $s4,16($sp)
addi $sp,$sp,20
jr $ra

.end Trasformazione
