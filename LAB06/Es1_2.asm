.data
input: .asciiz "inserisci il lato: "
acapo: .asciiz "\n"
.text
.ent main
.globl main

main:
    li $v0,4
    la $a0, input
    syscall

    li $v0,5
    syscall

    move $s0,$v0

    move $a0,$s0
    jal		stampaTriangolo				# jump to stampaTriangolo and save position to $ra
    move $a0,$s0
    jal stampaQuadrato
    li $v0,10
    syscall
.end main

stampaTriangolo:
    and $t0,$0,$0
    move $t3,$a0
    LOOP1:
        addi $t0,$t0,1
        and $t1,$0,$0
        LOOP2:
            li $v0,11    
            li $a0,'*'
            syscall
            addi $t1,$t1,1
        bne $t1,$t0,LOOP2
        li $v0,4
        la $a0,acapo
        syscall
    bne $t0,$t3,LOOP1
jr $ra
.end stampaTriangolo

stampaQuadrato:
    and $t0,$0,$0
    move $t3,$a0
    FOR1:
        addi $t0,$t0,1
        and $t2,$0,$0
        FOR2:
            li $v0,11
            li $a0,'*'
            syscall
            addi $t2,$t2,1
        bne $t2,$t3,FOR2
        
        li $v0,4
        la $a0,acapo
        syscall
    bne $t0,$t3,FOR1
jr $ra
.end stampaQuadrato