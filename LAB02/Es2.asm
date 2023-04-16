.data
input: .asciiz "Inserisci un valore positivo: "
errore: .asciiz "Errore, il numero positivo non è rappresetabile su 1 byte"
.text
.globl main
.ent main
main:
    #primo numero
    li $v0, 4
    la $a0, input
    syscall
    
    li $v0, 5
    syscall
    move $t0,$v0

    # secondo numero
    li $v0, 4
    la $a0, input
    syscall
    
    li $v0, 5
    syscall
    move $t1,$v0
   

    #numero 1: $t0, numero 2 : $t1, il risultato in $t2
    
    bge $t0,256,ERRORE
    bge $t1,256,ERRORE

    not $t3, $t1
    and $t3, $t0, $t3
    not $t3,$t3

    xor $t4, $t0, $t1

    or $t2,$t3, $t4
    
    li $v0, 1
    move $a0,$t2
    syscall

    j FINE



    ERRORE:
    li $v0, 4
    la $a0, errore
    syscall
 
    FINE:
    li $v0, 10
    syscall
.end main