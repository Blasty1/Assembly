.data
add1: .word 5
result: .space 0
.text
.globl main
.ent main
main:
	lw $t2, (add1)
	sw $t2 , (result)
	li $v0,10
	syscall
.end main