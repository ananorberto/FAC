# $t0 -> consumo
# $t1 -> 7 reais (caso base)
.data

.text

main:
                                            # digitar consumo de agua ($v0)
    li      $0,         5
    syscall 
                                            # atribuir
    move    $t0,        $v0

    li      $t1,        7

    bgt     $t0,        100,    ateCem
    bgt     $t0,        30,     ateTrinta
    bgt     $t0,        10,     ateDez

    j       encerra

ateDez:
# t2 = 10 - 30
    sub     $t2,        $t0,    10
# t1 = t2 + t1
    add     $t1,        $t2,    $t1

    j       encerra

ateTrinta:

# $t1 = $t1+20
    addi    $t1,        $t1,    20

    sub     $t2,        $t0,    30
    mul     $t2,        $t2,    2

    add     $t1,        $t2,    $t1

    j       encerra

ateCem:
# t1 = t1 + 20
    addi    $t1,        $t1,    160

    sub     $t2,        $t0,    100
    mul     $t2,        $t2,    5
# $t1 = $t2 + $t1
    add     $t1,        $t2,    $t1

    j       encerra

encerra:
    li      $v0,        1
    move    $a0,        $t1
    syscall 

    li      $v0,        10
    syscall 



