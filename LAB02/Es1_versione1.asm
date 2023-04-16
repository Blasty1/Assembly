.data
p_input: .asciiz "Inserisci un intero positivo: "
d_output: .asciiz "E' dispari"
p_output: .asciiz "E' pari"
.text
.globl main
.ent main
main:
    li $v0, 4
    la $a0, p_input
    syscall

    li $v0, 5
    syscall
    move $t0,$v0

    li $t3, 2

    div $t0, $t3 #salva la divisione nel registro speciale lo mentre il resto nel registro hi
    mfhi $t1 #prendo il resto della divisione

    bne $t1, $0, DISPARI # resto == 0 allora è pari altrimenti è dispari
    la $a0, p_output
    j FINE
DISPARI:
    la $a0, d_output
FINE:
    li $v0, 4
    syscall

    li $v0, 10
    syscall
.end main