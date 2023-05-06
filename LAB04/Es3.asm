.data
x: .word 1, 3, 2, 5
y: .word 2, 4, 1, 3
n: .word 4
z: .space 64
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
    la $t4,x
    la $t0,z
    RIGHE:
        addi $t1,$t1, 1

        lw $s0,($t4)
        
        la $t5,y

        and $t2, $0, $0

        COLONNE:
            addi $t2,$t2,1
            lw $s1,($t5)

            mul $s3,$s0,$s1
            sw $s3,($t0)

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