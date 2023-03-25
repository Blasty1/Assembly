.data
.text
.globl main
.ent main
main:
	li $t0, 1
	li $s0, 0xE
	li $v0,10
	syscall
.end main