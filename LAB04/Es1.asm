.data
vett: .space 80
spazio: .asciiz "\n"
.text
.globl main
.ent main
main:
    li $t0,20
    li $t1, 2 #i primi due elementi sono già settati a 1

    li $t2,1
    li $t3,1

    la $t5,vett 

    sw $t2,($t5)

    addi $t5,$t5,4

    sw $t3,($t5)
    #scrivo i due elementi in memoria

    Loop1:
        addi $t1, $t1, 1
        add $t4, $t2,$t3

        move $t2,$t3
        move $t3,$t4

        addi $t5, $t5,4 
        sw $t3,($t5)

        lw $a0,($t5)
        li $v0,1
        syscall

        li $v0, 4
        la $a0,spazio
        syscall

        
        bne $t1,$t0,Loop1

    li $v0,10
    syscall
.end main