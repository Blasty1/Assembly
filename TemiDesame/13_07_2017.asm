NRIGHE = 4
NCOLONNE = 6
.data
matrice: .byte 0, 0, 0, 0, 0, 0
        .byte 0, 0, 0, 0, 0, 0
        .byte 0, 0, 0, 1, 0, 0
        .byte 0, 0, 0, 1, 0, 0 
.text
.globl main
.ent main

main:

la $a0,matrice
li $a1,1
li $a2,0

jal seguiPercorso

li $v0,10
syscall
.end main


seguiPercorso:
move $s0,$a0 #indirizzo
move $s1,$a1 #indice riga
move $s2,$a2 #indice colonna

li $s3,0

add $s0,$s0,$s2
mul $t0,$s1,NCOLONNE
add $s0,$s0,$t0

lb $t0,($s0)
syscall
beq $t0,0,FINE
addi $s3,$s3,1

and $t0,$0,$0
FOR:
lb $t1,1($s0)
beq $t1,1,CONTINUADX

lb $t1,NCOLONNE($s0)
beq $t1,1,CONTINUASOTTO

j FINE


CONTINUADX:
addi $s0,$s0,1
addi $s3,$s3,1
j FOR


CONTINUASOTTO:
addi $s0,$s0,NCOLONNE
addi $s3,$s3,1

j FOR


FINE:
subu $sp,$sp,4
sw $s3,($sp)

jr $ra
.end seguiPercorso