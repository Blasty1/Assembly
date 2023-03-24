.data
add1: .word 5
result: .space 0
.text
.globl main
.ent main
main:
	la $t0, add1
	la $t1 , result
	lw $t2, ($t0)
	sw $t2 , ($t1)
	li $v0,10
	syscall
.end main