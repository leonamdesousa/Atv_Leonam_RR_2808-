.data 
array: .word 10, 4, 20, 7, 15
size: .word 5

.text 
.globl main 

find_max: 
    lw $t0, size  
    lw $t1, array 
    lw $t2, ($t1)

loop:
    addi $t0, $t0, -1 
    beqz $t0, done

    lw $t3, ($t1)
    bgt $t3, $t2, update_max
    j loop 


update_max:
    move $t2, $t3
    j loop

done:
    move $v0, $t2
    jr $ra

main:
    jal find_max
    move $a0, $v0
    li $v0, 1 
    syscall 
    li $v0, 10 
    syscall
