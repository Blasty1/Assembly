DIM = 9
.data
vetRX: .byte 0x84, 0xFA, 0x09, 0x54, 0x20, 0x42, 0x19, 0x20, 0x41, 0xB1, 0x03
vetTX: .space DIM
spazio: .asciiz " "
.text
.globl main
.ent main
main:
 la $a0, vetRX
 la $a1, vetTX
 jal SpaceRemove
 

 la $t9, vetTX
 li $t8, 1
      
  loop22:
    lb  $a0, ($t9)  
    li  $v0, 1        # Print integer   
    syscall
      
    la $a0, spazio    
    li $v0, 4             
    syscall
      
      beq $t8,DIM, FINE
      addi $t8, $t8,1
      addi $t9,$t9,1
      j loop22

FINE:
li $v0,10
syscall
.end main 

#in $a0 vetRX
#in $a1 vetTX
SpaceRemove:
subu $sp,$sp,8

sw $s0,($sp)
sw $s1,4($sp)

la $s0,($a0)
la $s1,($a1)

lb $t0,($s0)
sb $t0,1($s1)

lb $t0,1($s0)
sb $t0,($s1)

addi $s1,$s1,2
addi $s0,$s0,2

and $t0,$0,$0
LOOP:
lb $t1,($s0)

beq $t1,0x20,SALTA
sb $t1,($s1)

addi $s1,$s1,1

SALTA:

addi $s0,$s0,1
addi $t0,$t0,1
bne $t0,11,LOOP


lw $s0,($sp)
lw $s1,4($sp)

addi $sp,$sp,8
jr $ra
.end SpaceRemove