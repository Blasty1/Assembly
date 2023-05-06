.data
n: .word 10
z: .space 400  # nxn = 10*10 = 100 * 4 = 400 dove 4 perchè ogni intero occupa 4 byte
acapo: .asciiz "\n"
spazio: .asciiz " "
.text
.globl main
.ent main
main:
    lw $t3,n
    #t0 --> nuova matrice
    #t1 --> per la riga
    #t2 --> per la colonna
    and $t1, $0, $0
    la $t0,z
    RIGHE:
        addi $t1,$t1, 1
        and $t2, $0, $0

        COLONNE:
            addi $t2,$t2,1
            
            mul $s1,$t1,$t2
            sw $s1,($t0)

            lw $a0,($t0)
            li $v0,1
            syscall

            li $v0,4
            la $a0,spazio
            syscall

            addi $t0,$t0,4
            addi $t5,$t5,4

            bne $t2,$t3,COLONNE

        li $v0,4
        la $a0,acapo
        syscall

        addi $t4, $t4, 4
        bne $t1,$t3,RIGHE

    li $v0,10
    syscall
.end main