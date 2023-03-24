.data
wOpd1: .word 5
wOpd2: .word 10
wResult: .space 4
.text
.globl main
.ent main
main:
	la $t0 , wOpd1
	la $t1, wOpd2
	la $t3 , wResult
	lw $t4, ($t0)
	lw $t5, ($t1)
	add $t6,$t4, $t5
	sw $t6, ($t3)
	move $a0, $t6
	li $v0,1
	syscall
	
	li $v0,10
	syscall
.end main