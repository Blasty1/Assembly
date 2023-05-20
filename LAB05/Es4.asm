DIM = 5
NEXT_ROW = 4 * DIM
NEXT_COL = 4
NEXT_DIAG = 4 * ( DIM + 1 )
.data
mat: .word 1 0 0 0 0
     .word 0 1 0 0 5
     .word 0 0 1 0 0
     .word 0 0 0 1 0
     .word 0 5 0 0 1
.text
.ent main
.globl main
main:

#check se è diagonale
and $t0, $0,$0
la $t1,mat
move $s0,$t1
li $a0,2
li $t7, DIM
sub $t7,$t7,1
LOOP1:
    sub $t2, $t7, $t0
    move $t3,$s0 #lungo le colonne
    move $t4,$s0 #lungo le righe

    LOOP2:
        addi $t3, $t3,NEXT_COL
        addi $t4,$t4,NEXT_ROW

        lw $s1,($t3)
        lw $s2,($t4)

        beq $s1,$0,CORRETTO
        li $a0, 0
        CORRETTO: bne $s1,$s2,NONSIMM
        AFTER:
        addi $t2,$t2,-1
        bne $t2,$0,LOOP2
    addi $s0,$s0,NEXT_DIAG
    addi $t0,$t0,1
    bne $t0,$t7,LOOP1  
li $a1,1
j FINE
NONSIMM:
li $a1,0
j AFTER

FINE:
    li $v0,10
    syscall
.end main