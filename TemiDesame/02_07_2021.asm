DIM = 8
.data
matrice: .byte 3, 1, 41, 5, 9, 26, 5, 35
.byte 89, 79, 32, 3, 8, 46, 26, 4
.byte 33, 8, 32, 79, 50, 28, 8, 4
.byte 19, 71, 69, 39, 9, 37, 5, 10
.byte 58, 20, 9, 74, 9, 44, 59, 2
.byte 30, 7, 8, 16, 40, 6, 28, 6
.byte 20, 8, 9, 98, 62, 80, 3, 48
.byte 25, 34, 21, 1, 70, 6, 7, 9
.text
.globl main
.ent main
main:
subu $sp, $sp, 4
sw $ra, ($sp)
la $a0, matrice
li $a1, 5
li $a2, DIM
jal maxInTriangolo
lw $ra, ($sp)
addiu $sp, $sp, 4
jr $ra
.end main 

maxInTriangolo:
move $s0,$a0 #indirizzo matrice quadrata
move $s1,$a1 #indice triangolo isoscele
move $s2,$a2 #dimensione matrice


add $t1,$s1,$s0
and $t0,$0,$0
li $s3,-129
addi $t7,$s1,1
COLONNA:
lb $t2,($t1)

ble $t2,$s3,SALTA
move $s3,$t2 #aggiorno nuovo valore massimo

SALTA:

addi $t0,$t0,1
add $t1,$t1,$s2
bne $t0,$t7,COLONNA

#RIGA
subu $t1,$t1,$s2
and $t0,$0,$0

RIGA:
lb $t2,($t1)

ble $t2,$s3,SALTA2
move $s3,$t2 #aggiorno nuovo valore massimo

SALTA2:


addi $t0,$t0,1
addi $t1,$t1,-1
bne $t0,$t7,RIGA


#diagonale
addi $t1,$t1,1
li $t0,0
DIAGONALE:
lb $t2,($t1)

ble $t2,$s3,SALTA3
move $s3,$t2 #aggiorno nuovo valore massimo

SALTA3:

addi $t0,$t0,1
subu $t1,$t1,$s2
addi $t1,$t1,1
bne $t0,$t7,DIAGONALE

jr $ra
.end maxInTriangolo