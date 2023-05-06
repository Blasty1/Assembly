.data 
giorni: .byte 3
minuti: .byte 5
ore: .byte 4
risultato: .word 0
.text
.globl main 
.ent main
main:
    lb $t0, minuti

    lb $t1,giorni
    mulou $t1,$t1,24
    mulou $t1,$t1,60
    
    lb $t2, ore
    mulou $t2,$t2,60

    add $t3,$t2,$t1

    add $t3,$t3,$t0

    sw $t3,risultato
    

    li $v0, 10
    syscall
.end main