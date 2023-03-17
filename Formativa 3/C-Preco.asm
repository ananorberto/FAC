.data
ql: .asciiz "\n"

.text

main:
# Ler três números de ponto flutuante
    li      $v0,    7
    syscall 
    mov.d   $f2,    $f0             # armazenar o 1º num em f2

    li      $v0,    7
    syscall 
    mov.d   $f4,    $f0             # armazenar o 2º num em f4

    li      $v0,    7
    syscall 
    mov.d   $f6,    $f0             # armazenar o 3º num em f6

# Dividir os números lidos por 100.0
    li.d    $f10,   100.0
    div.d   $f4,    $f4,    $f10    # dividir o 2º num por 100.0
    div.d   $f6,    $f6,    $f10    # dividir o 3º num por 100.0

# Calcular a média ponderada dos três números lidos
    mul.d   $f8,    $f2,    $f4     # multiplica o 1º num pelo 2º dividido por 100.0
    add.d   $f0,    $f2,    $f8     # adicionar o resultado da multiplicação ao 1º num
    mul.d   $f8,    $f2,    $f6     # multiplicar o 1º num pelo 3º num dividido por 100.0
    add.d   $f0,    $f0,    $f8     # armazena o resultado em f0

encerra:

# Imprimir o resultado da média ponderada
    li      $v0,    3
    mov.d   $f12,   $f0             # carregar o valor da média ponderada em f12
    syscall 

    li      $v0,    4
    la      $a0,    ql
    syscall 

# Encerrar o programa
    li      $v0,    10
    syscall 