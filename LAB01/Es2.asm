.data
var1: .byte 'm'
var2: .byte 'i'
var3: .byte 'p'
var4: .byte 's'
var5: .byte 0
.text
.globl main
.ent main
# $t0 --> differenza
# $t2 --> registro temporaneo per le maiuscole
# $t1 --> il valore della variabile
main:
    li $t1, 'A'
    li $t2, 'a'
    sub $t0, $t1, $t2
    
    lb $t1,var1
    add $t2,$t1,$t0
    sb $t2, var1 

    move $a0, $t2 
    li $v0, 11
    syscall

    lb $t1,var2
    add $t2,$t1,$t0
    sb $t2, var2

    move $a0, $t2 
    li $v0, 11
    syscall

    lb $t1,var3
    add $t2,$t1,$t0
    sb $t2, var3

    move $a0, $t2 
    li $v0, 11
    syscall

    lb $t1,var4
    add $t2,$t1,$t0
    sb $t2, var4

    move $a0, $t2 
    li $v0, 11
    syscall

    la $a0, var1
    li $v0, 4
    syscall

    li $v0, 10
    syscall
    

.end main