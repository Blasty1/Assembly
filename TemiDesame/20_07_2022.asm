DIM = 5
.data
costante: .word 12
intervalli: .byte 0 2 4 7 10
.text
.globl main
.ent main
main: 
li $a0,31
li $a1,25
la $a2,intervalli
la $a3,costante
jal clima
move $s0,$v0

li $v0,10
syscall
.end main
clima:
subu $sp,$sp,8
sw $s0,($sp)
sw $s1,4($sp)

sub $s0,$a0,$a1
move $t5, $a3

blt $s0,0,ERRORE

and $t0,$0,$0
move $s1,$a2
FOR:
lb $t1,($s1)
bge $t1, $s0 ,TROVATO
addi $t0,$t0,1
addi $s1,$s1,1
bne $t0,DIM,FOR

TROVATO:
beq $t0,DIM,FINE

lw $t2,($t5)
mul $v0,$t2,$t0 
j FINE

ERRORE:
li $v0,-1

FINE:

lw $s0,($sp)
lw $s1,4($sp)
addi $sp,$sp,8
jr $ra
.end clima