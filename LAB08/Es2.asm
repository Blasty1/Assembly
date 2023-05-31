LEN = 6
LENCOUNTER = 24
.data
anni: .word 1945, 2008, 1800, 2006, 1748, 1600
risultato: .space LEN
spazio: .asciiz " "
capo: .asciiz "\n"
.text
.globl main
.ent main
main:
    la $a0,anni
    la $a1,risultato
    li $a2,LEN

    jal bisestile

    la $t1,risultato
    addi $t0,$t1,LEN
    LOOP:
        li $v0,1
        lb $a0,($t1)
        syscall
                
        li $v0,4
        la $a0,spazio
        syscall

        addi $t1,$t1,1
        bne $t1,$t0,LOOP

    li $v0,10
    syscall
.end main

bisestile:
    and $t0,$0,$0
    move $s0,$a0
    move $s2,$a1

    li $t5,100
    li $t6,4
    li $t7,400
    LOOP1:
        lw $s1,($s0)

        div $s1,$t5
        mfhi $t1

        beq $t1,0,ANNO_SECOLARE

        #anni non secolari, normali
        div $s1,$t6

        j FINE

        ANNO_SECOLARE:
            div $s1,$t7
    
        FINE:
            mfhi $t1
            beq $t1,0,TRUE
            li $t1,0
            j SCRIVI
            TRUE:
                li $t1,1
            SCRIVI: 
                sb $t1,($s2)
            
        
        addi $t0,$t0,1
        addi $s0,$s0,4
        addi $s2,$s2,1
        bne $t0,$a2,LOOP1

        jr $ra
.end bisestile