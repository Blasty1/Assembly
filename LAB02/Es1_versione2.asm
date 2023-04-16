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

    andi $t1, $t0, 1 #basta vedere se il bit meno importante , LSB ,  è 0 oppure a 1, se è a 1 allora è dispari altrimenti è pari

    bne $t1, $0, DISPARI 
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