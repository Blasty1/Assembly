DIM = 8
.data
matrice: .byte 16, -41, 36, -5, 27, 62, 55, -18
 .byte -26, 63, -54, 19, 13, -44, 33, 8
 .byte -1, 40, 45, 12, 22, -51, -58, 31
 .byte 23, -50, 59, -30, 4, -37, 48, -9
 .byte 38, -3, 10, -47, 49, -24, 29, 60
 .byte 52, -21, -32, -57, 39, 2, 11, 46
 .byte -43, 14, -7, 34, 64, 25, 20, -53
 .byte 61, -28, 17, -56, 42, -15, 6, 35
 .text
 .globl main
 .ent main
main: subu $sp, $sp, 4
 sw $ra, ($sp)
 la $a0, matrice
 la $a1, DIM
 jal cornice
 lw $ra, ($sp)
 addiu $sp, $sp, 4
 jr $ra
 .end main


cornice:
addi $sp,$sp,-16
sw $s0,($sp)
sw $s1,4($sp)
sw $s2,8($sp)
sw $s3,12($sp)


move $s3,$a1 #DIM
addi $s0,$a1,-4 #DIM-4
and $s2,$0,$0 #numeri di valori positivi

mul $t0,$s3,2
addi $s1,$t0,2
add $s1,$s1,$a0

#$s1 punta al primo elemento della 3 cornice

and $t0,$0,$0
move $t1,$s1

COLONNA1:
lb $t2,($t1)

blt $t2,0,SALTA
addi $s2,$s2,1
SALTA:

add $t1,$t1,$s3
addi $t0,$t0,1
bne $t0,$s0,COLONNA1


and $t0,$0,$0
addi $t1,$s1,3
COLONNA2:
lb $t2,($t1)

blt $t2,0,SALTA2
addi $s2,$s2,1
SALTA2:

add $t1,$t1,$s3
addi $t0,$t0,1
bne $t0,$s0,COLONNA2


li $t0,1
move $t1,$s1
addi $t1,$t1,1
subu $t4,$s0,1
RIGA1:
lb $t2,($t1)

blt $t2,0,SALTA3
addi $s2,$s2,1
SALTA3:

add $t1,$t1,1
addi $t0,$t0,1
bne $t0,$t4,RIGA1


li $t0,1
mul $t1,$s0,3
add $t1,$t1,$s1
addi $t1,$t1,1
subu $t4,$s0,1
RIGA2:
lb $t2,($t1)

blt $t2,0,SALTA4
addi $s2,$s2,1
SALTA4:

add $t1,$t1,1
addi $t0,$t0,1
bne $t0,$t4,RIGA2

move $v0,$s2

li $v0,1
move $a0,$s2
syscall

lw $s0,($sp)
lw $s1,4($sp)
lw $s2,8($sp)
lw $s3,12($sp)
addi $sp,$sp,16
jr $ra
.end cornice