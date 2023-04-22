.data
input: .asciiz "Inserisci numero: "
.text
.globl main
.ent main
main:
    li $v0,4
    la $a0, input
    syscall

    li $t0, 0
    SALTO: 
        li $v0,12
        syscall

        beq $v0, '\n',FINE
        li $t1,'a'
        sub $t1,$v0,$t1

        mulou $t0, $t0,10 #moltiplicazione per 10 del numero
        add $t0,$t0,$t1
        j SALTO
        


    FINE: 
    li $v0,1
    move $a0,$t0
    syscall

    li $v0, 10
    syscall
.end main