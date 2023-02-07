bitparidade:
    move $t5, $zero     # count
    move $t9, $zero 
    move $s0, $a0       # move number to ra
    li $t0, 1           # move 1 to ra

loop:
    beq $t5, 7, encerra # if count = 7, encerra
    and $t1, $t0, $s0   
    add $t9, $t9, $t1   # t9 = t1 + t9
    srl $s0, $s0, 1     # desloca
    addi $t5, $t5, 1    # t5++

    j loop

encerra:
    andi $t9, $t9, 1    # less bit
    beq $t9, 1, odd     # if odd, jump to odd

pair: 
    move $v1, $a0       # move number to ra
    li $v0, 0           # move 0 to ra
    jr $ra              # return
    
odd:
    move $v1, $a0       # move to ra
    addi $v1, $v1, 128  # + 128 
    li $v0, 1           # move 1 to ra
    jr $ra              # return