.data
ql: .asciiz  "\n"

.text

main:
# Lê um inteiro do usuário e armazena em $s0
    li      $v0,        5
    syscall 
    move    $s0,        $v0

# Inicializa os registradores e constantes necessários para o verifica de leitura
    move    $t0,        $zero
    li.s    $f1,        0.0
    li.s    $f2,        0.0

verifica:
# Checa se ainda faltam números a serem lidos
    bne     $t0,        $s0,    readNumber
# Caso já tenham sido lidos todos os números, calcula a média
    j       calcula

readNumber:

# Lê um float do usuário e armazena em $f3
    li      $v0,        6
    syscall 
    mov.s   $f3,        $f0

# Soma o número lido ao somatório $f1
    add.s   $f1,        $f1,    $f0

# Calcula o produto $f3 * $f0 e soma ao somatório $f2
    li      $v0,        6
    syscall 
    mul.s   $f4,        $f3,    $f0
    add.s   $f2,        $f2,    $f4

# Incrementa o contador $t0 e volta para o início do verifica
    addi    $t0,        $t0,    1
    j       verifica

calcula:
# Calcula a média dos números lidos
    div.s   $f5,        $f2,    $f1
    j       encerra

encerra:
# Imprime a média na tela
    li      $v0,        2
    mov.s   $f12,       $f5
    syscall 

# Imprime o caractere de nova linha na tela
    li      $v0,        4
    la      $a0,        ql
    syscall 

# Encerra o programa
    li      $v0,        10
    syscall 
