.data

C:     .byte 'C'
F:     .byte 'F'
K:     .byte 'K'
constF:  .float 5.0, 9.0, 32.0
constC:  .float 273.15
ql:     .asciiz "\n"

.text

main:

# le entradas
    li      $v0,        12
    syscall 
    move    $t0,        $v0

    li      $v0,        12
    syscall 

    li      $v0,        12
    syscall 
    move    $t1,        $v0

    li      $v0,        12
    syscall 

    li      $v0,        6
    syscall 

# converte temperatura
    lb      $s0,        C                   # carrega o valor do caractere 'C' no registrador $s0
    beq     $t0,        $s0,    Celcius     # compara o valor de $t0 com $s0 e salta para Celcius se forem iguais

    lb      $s0,        F                   # carrega o valor do caractere 'F' no registrador $s0
    beq     $t0,        $s0,    Fahrenheit  # compara o valor de $t0 com $s0 e salta para Fahrenheit se forem iguais


Kevin:

    lb      $s0,        C
    beq     $t1,        $s0,    K_C

K_F:

    lwc1    $f2,        constC              # Carrega a constante da fórmula de conversão de Kevin para Fahrenheit
    sub.s   $f0,        $f0,    $f2         # Realiza os cálculos da conversão

    j       C_F

K_C:

    lwc1    $f2,        constC              # Carrega a constante da fórmula de conversão de Kevin para Celsius
    sub.s   $f0,        $f0,    $f2         # Realiza os cálculos da conversão de Kevin para Celsius

    j       encerra

Celcius:

    lb      $s0,        F                   # carrega o valor do caractere 'F' no registrador $s0
    beq     $t1,        $s0,    C_F         # compara o valor de $t1 com o valor de $s0 e salta para C_F se forem iguais


C_K:

    lwc1    $f2,        constC              # carrega a constante C no registrador de ponto flutuante $f2
    add.s   $f0,        $f0,    $f2         # Soma o valor de entrada no registrador $f0 com a constante C

    j       encerra


C_F:

    la      $t3,        constF              # carrega o endereço da constante F em $t3
    lwc1    $f2,        0($t3)              # carrega o valor do primeiro elemento de F em $f2
    lwc1    $f3,        4($t3)              # carrega o valor do segundo elemento de F em $f3
    lwc1    $f4,        8($t3)              # carrega o valor do terceiro elemento de F em $f4

    div.s   $f1,        $f3,    $f2         # Divide o valor de $f3 por $f2 e armazena em $f1
    mul.s   $f1,        $f1,    $f0         # Multiplica o valor de $f1 por $f0 e armazena em $f1
    add.s   $f0,        $f1,    $f4         # Soma o valor de $f1 e $f4 e armazena em $f0

    j       encerra


Fahrenheit:

    lb      $s0,        C                   # Carrega o caractere 'C' na variável $s0
    beq     $t1,        $s0,    F_C         # Compara se o valor de entrada $t1 é igual ao valor de $s0

F_K:

    la      $t3,        constF              # Carrega o endereço da constante F no registrador $t3

# Carrega os valores de F1, F2 e F3 nos registradores de ponto flutuante $f2 $f3 e $f4
    lwc1    $f2,        0($t3)
    lwc1    $f3,        4($t3)
    lwc1    $f4,        8($t3)

    div.s   $f1,        $f2,    $f3         # Divide o valor de F2 pelo valor de F3 e armazena em F1
    sub.s   $f0,        $f0,    $f4         # Subtrai o valor de F4 do valor de entrada e armazena em F0
    mul.s   $f0,        $f0,    $f1         # Multiplica o valor atual de F0 pelo valor de F1 e armazena em F0

    lwc1    $f2,        constC              # Carrega a constante C no registrador $f2
    add.s   $f0,        $f0,    $f2         # Soma o valor de entrada no registrador $f0 com a constante C

    j       encerra


F_C:

# Carrega as constantes da fórmula de conversão de Fahrenheit para Celsius
    la      $t3,        constF
    lwc1    $f2,        0($t3)
    lwc1    $f3,        4($t3)
    lwc1    $f4,        8($t3)

# Realiza os cálculos da conversão de Fahrenheit para Celsius
    div.s   $f1,        $f2,    $f3
    sub.s   $f0,        $f0,    $f4
    mul.s   $f0,        $f0,    $f1

    j       encerra


encerra:

# Encerra o programa
    li      $v0,        2
    mov.s   $f12,       $f0
    syscall 

    li      $v0,        4
    la      $a0,        ql
    syscall 

    li      $v0,        10
    syscall 