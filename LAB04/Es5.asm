.data
mat: .word 154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0
acapo: .asciiz "\n"
spazio: .asciiz " "
.text
.globl main
.ent main
main:
    #calcolo somma righe
    and $t0,$0,$0
    la $t1,mat
    RIGHE1:
        addi $t0,$t0,1
        and $t2,$0,$0
        and $s0,$0,$0
        COLONNE1:
            addi $t2,$t2,1
            lw $s1,($t1)
            add $s0,$s0,$s1
            addi $t1,$t1,4
            bne $t2,5,COLONNE1
    sw $s0,($t1)
    addi $t1,$t1,4
    bne $t0,3,RIGHE1
    
    
    #calcolo somma colonne
    and $t0,$0,$0
    la $t1,mat
    COLONNE2:
        addi $t0,$t0,1
        and $t2,$0,$0
        and $s0,$0,$0

        RIGHE2:
            addi $t2,$t2,1
            lw $s1,($t1)
            add $s0,$s0,$s1
            addi $t1,$t1,24
            bne $t2,3,RIGHE2

    sw $s0,($t1)
    addi $t1,$t1,-68
    bne $t0,6,COLONNE2


        
    #stampo la matrice per verificarne il contenuto
    and $t0,$0,$0
    la $t1,mat
    RIGHE:
        addi $t0,$t0,1
        and $t2,$0,$0
        COLONNE:
            addi $t2,$t2,1

            lw $a0,($t1)
            addi $t1,$t1,4

            li $v0,1
            syscall 

            li $v0,4
            la $a0,spazio
            syscall

            bne $t2,6,COLONNE
        li $v0,4
        la $a0,acapo
        syscall
    bne $t0,4,RIGHE



    li $v0,10
    syscall

    
.end main