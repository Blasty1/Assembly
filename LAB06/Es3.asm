.data
input: .asciiz "inserisci stringa: "
.text
.ent main
.globl main
main:
    li $v0,4
    la $a0,input
    syscall
    move $t0,$sp
    and $t3,$0,$0
    LOOP1:
        li $v0,12
        syscall
        move $a0,$v0

        jal SingleCharacterLowerToUpper

        sub $sp, $sp, 4
        sw $v0,($sp)
        addi $t3,$t3,1
    bne $v0,'\n',LOOP1

    addi $sp, $sp, 4 #eliminiamo \n dallo stack frame
    sub $t3,$t3,1
    move $t4,$t0
    LOOP2:
        addi $t4,$t4,-4
        lw $a0,($t4)
        li $v0,11
        syscall
        sub $t3,$t3,1
    bne $t3,$0,LOOP2
    
        
    move $sp,$t0
    li $v0,10
    syscall
.end main


SingleCharacterLowerToUpper:
    blt $a0,'a',FINE
    bgt $a0 , 'z' , FINE

    li $t1,'a'
    sub $t1, $t1, 'A'
    sub $a0,$a0,$t1

    FINE: 
        move $v0,$a0
        jr $ra
.end SingleCharacterLowerToUpper