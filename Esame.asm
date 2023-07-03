.data

biglietto:    .word 0, 170, 390, 580, 700, 960, 985, 1095, 1245

        .word 170, 0, 390, 580, 700, 960, 985, 1095, 1245

        .word 390, 390, 0, 420, 510, 700, 855, 960, 1075

        .word 580, 580, 420, 0, 300, 480, 640, 750, 900

        .word 700, 700, 510, 300, 0, 340, 495, 635, 755

        .word 960, 960, 700, 480, 340, 0, 300, 420, 580

        .word 985, 985, 855, 640, 495, 300, 0, 250, 360

        .word 1095, 1095, 960, 750, 635, 420, 250, 0, 250

        .word 1245, 1245, 1075, 900, 755, 580, 360, 250, 0

stazioni:    .ascii "Torino Porta Nuova;Torino Porta Susa;Chivasso;Santhia;Vercelli;Novara;Magenta;Rho-Fiera Milano;Milano Centrale;"

partenza:    .asciiz "Chivasso"

arrivo:        .asciiz "Magenta"

msg1 :      .asciiz "Risultato : "



.text

.globl main

.ent main



main:    subu $sp, $sp, 4

        sw $ra, ($sp)



        la $a0, stazioni

        la $a1, biglietto

        la $a2, partenza

        la $a3, arrivo

        subu $sp, $sp, 4

        li $s0, 9

        sw $s0, ($sp)

        jal prezzoBiglietto



        move $s2,$v0



        # Print RISULTATO

        la $a0, msg1

        li $v0, 4

        syscall



        move $a0, $s2

        li  $v0, 1

        syscall



        addiu $sp, $sp, 4

        lw $ra, ($sp)

        addiu $sp, $sp, 4

        jr $ra

.end main











#  INSERIRE IL CODICE DELLO STUDENTE >>>>>>>>>>>>>>>>>>> ++



prezzoBiglietto:

subu $sp,$sp,32

sw $ra,($sp)

sw $s0,4($sp)

sw $s1,8($sp)

sw $s2,12($sp)

sw $s3, 16($sp)

sw $s4,20($sp)

sw $s5,24($sp)

sw $s6,28($sp)



move $s0,$a0 #vettore stazioni N

move $s1,$a1 #matrice biglietti N x N

move $s2,$a2 #nome partenza

move $s3,$a3 #nome arrivo

lw $s4,32($sp) # N ( dimensioni vettori ) # perchè 32 ? Guardare sotto ( Disclaimer )








#posizione partenza

move $a0,$s0

move $a1,$s2

move $a2,$s4

jal posizioneVettore

move $s5,$v0

#posizione arrivo

move $a0,$s0

move $a1,$s3

move $a2,$s4

jal posizioneVettore

move $s6,$v0



#4 perchè lavoriamo con le word

# Formula mat[i][j] = indirizzo_base + NColonne x i x 4 + j x 4

mul $t1, $s5,4

mul $t2,$s6,4

mul $t2,$t2,$s4     #  ERRORE S4 non c'è nulla

add $t0,$s1,$t1

add $t0, $t0,$t2

lw $v0,($t0)


lw $ra,($sp)

lw $s0,4($sp)

lw $s1,8($sp)

lw $s2,12($sp)

lw $s3,16($sp)

lw $s4,20($sp)

lw $s5,24($sp)

lw $s6,28($sp)

addi $sp,$sp,32

jr $ra

.end prezzoBiglietto





#in $a0 abbiamo , vettore stazioni

#in $a1 abbiamo nome da cercare

#in $a2 N

posizioneVettore:

subu $sp,$sp,4

sw $s0,($sp)

and $t0,$0,$0

move $t3, $a1

li $s0,0 #va a 1 se le parole sono diverse

VETTORE:

lb $t1,($a0) #lettera disponibile

lb $t2,($t3) #lettera da cercare

beq $t1, ';',FINE_NOME

bne $t2,$t1,DIVERSE

addi $t3,$t3,1

j SALTA

DIVERSE:

li $s0,1

j SALTA



FINE_NOME:

beq $s0,0,FINE

addi $t0,$t0,1 # una parola è finita

move $t3,$a1 #resetto la parola da cercare

li $s0,0

SALTA:

addi $a0,$a0,1

bne $t0,$a2,VETTORE

FINE:

move $v0,$t0

lw $s0,($sp)

addi $sp,$sp,4

jr $ra

.end posizioneVettore

