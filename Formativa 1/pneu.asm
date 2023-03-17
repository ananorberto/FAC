.data
n: .asciiz "\n"
.text

main:

    li      $v0,    5
    syscall 
    move    $t1,    $v0

    li      $v0,    5
    syscall 
    move    $t2,    $v0

    li      $v0,    1
    sub     $a0,    $t1,    $t2
    syscall 

    la      $a0,    n
    li      $v0,    4
    syscall                         # pula uma linha


    li      $v0,    10
    syscall                         # return 0