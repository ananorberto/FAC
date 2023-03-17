.data
.text
main:
# digitar quantidade de numeros
    li      $v0,    5;
# imprimir
    syscall 

# atribuir n1 a $t0
    move    $t0,    $v0

# digitar primeiro numero
    li      $v0,    5;
    syscall 
# atribuir primeiro numero a $t1
    move    $t1,    $v0

cmp:
# soma 1 em t4 | contador
    addi    $t4,    $t4,    1

# o 'beq' desvia o fluxo se uma condição for satisfeita
# nesse caso, se t4 = n1 vai para o 'encerra'
    beq     $t4,    $t0,    encerra

# digitar n2
    li      $v0,    5
    syscall 

# atribuir n2 a $t2
    move    $t2,    $v0

# o slt e uma instrução de <
# neste caso, se t1 < t2 -> t3 = 1
    slt     $t3,    $t1,    $t2

# se t3 = 0 return
    beq     $t3,    $zero,  cmp

# atribui $t2 a $t1
    move    $t1,    $t2

# volta p/ cmp
    j       cmp

encerra:
# imprime o maior numero
    li      $v0,    1
    move    $a0,    $t1
    syscall 
# chama exit
    li      $v0,    10
# encerra
    syscall 
