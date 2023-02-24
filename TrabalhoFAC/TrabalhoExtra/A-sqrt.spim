.data
out1: .asciiz "A raiz quadrada de "
out2: .asciiz " eh "
out3: .asciiz ", calculada em "
out4: .asciiz " iteracoes.\n"
erro_inp: .asciiz "Entradas invalidas.\n"
erro: .asciiz "Nao foi possivel calcular sqrt("
erro1: .asciiz ").\n"

.text
main:
    li      $v0,        5                           # Carrega 5 em $v0 para ler um inteiro
    syscall                                         # Executa a chamada do sistema para ler um inteiro
    move    $s0,        $v0                         # Armazena o primeiro número em $s0

    li      $v0,        5                           # Carrega 5 em $v0 para ler um inteiro
    syscall                                         # Executa a chamada do sistema para ler um inteiro
    move    $s1,        $v0                         # Armazena o segundo número em $s1

    li      $t0,        1                           # Carrega 1 em $t0
    ble     $s0,        $t0,        print_erro      # Se $s0 <= 1 chama a função print_erro

    li      $t0,        16                          # Carrega 16 em $t0
    ble     $s1,        $0,         print_erro      # Se $s1 <= 0 chama a função print_erro
    bgt     $s1,        $t0,        print_erro      # Se $s1 > 16 chama a função print_erro

    jal     find                                    # Chama função find
    move    $a0,        $v0                         # Copia $v0 para $a0
    move    $a1,        $v1                         # Copia $v1 para $a1

    jal     sqrt                                    # Chama função sqrt
    jal     print_out                               # Chama função print_out
    j       encerra                                 # Pula para o final do programa

find:
    multu   $a0,        $a0                         # Multiplica $a0 por ele mesmo
    mflo    $t0                                     # Move o resultado para $t0

    bgt     $t0,        $s0,        end             # Se $t0 > $s0 pula para end
    beq     $t0,        $s0,        exact_sqrt      # Se $t0 == $s0 pula para exact_sqrt

    addi    $a0,        $a0,        1               # Soma 1 em $a0
    j       find
end:
    move    $v1,        $a0                         # Move $a0 para $v1
    addi    $a0,        $a0,        -1              # Subtrai 1 de $a0
    move    $v0,        $a0                         # Move $a0 para $v0
    jr      $ra,        #,          Retorna,        para,o,chamador# Jump para proxima instrução da main

exact_sqrt:
    addi    $a0,        $a0,        -1              # Subtrai o imediato 1 do registrador $a0
    move    $v0,        $a0                         # Copia o inteiro $a0 em $v0 (retorno da função)
    addi    $a0,        $a0,        2               # Subtrai o imediato 1 do registrador $a0
    move    $v1,        $a0                         # Copia o inteiro $a0 em $v1 (retorno da função)

    jr      $ra

sqrt:
    mtc1.d  $s0,        $f20
    cvt.d.w $f20,       $f20                        # Converte para double o valor em $f20

    li      $t0,        1                           # Carrega o reg $t0 com o imediato 1
    li      $t1,        10                          # Carrega o reg $t1 com o imediato 10

    mtc1.d  $t0,        $f8
    cvt.d.w $f8,        $f8                         # Converte para double o valor em $f8

    mtc1.d  $t1,        $f10
    cvt.d.w $f10,       $f10                        # Converte para double o valor em $f10

error:
    addi    $s1,        $s1,        -1              # Subtrai 1 do reg $s1

    div.d   $f8,        $f8,        $f10            # $f8 = $f8 / $f10

    bne     $s1,        $0,         error           # Se $s1 != 0, jump para error

    mtc1.d  $a0,        $f4
    cvt.d.w $f4,        $f4                         # Converte para double o valor em $f4

    mtc1.d  $a1,        $f6
    cvt.d.w $f6,        $f6                         # Converte para double o valor em $f6

    sub.d   $f10,       $f6,        $f4             # $f10 = $f6 - $f4

    abs.d   $f10,       $f10                        # Valor absoluto de $f10

    c.le.d  $f10,       $f8                         # Se $f10 <= $f8 cc = 1, cc = 0 caso contrario

    bc1t    end_calc                                # Se flag = 1, jump para end_calc

    div.d   $f6,        $f20,       $f4             # $f6 = $f20 / $f4

    sub.d   $f10,       $f6,        $f4             # $f10 = $f6 - $f4

    abs.d   $f10,       $f10                        # Valor absoluto de $f10

    c.le.d  $f10,       $f8                         # Se $f10 <= $f8 cc = 1, cc = 0 caso contrario

    bc1t    end_calc                                # Se flag = 1, jump para end_calc

    li      $t1,        2                           # Carrega o reg $t1 com o imediato 2

    mtc1.d  $t1,        $f12
    cvt.d.w $f12,       $f12                        # Converte para double o valor em $f12

    li      $t1,        1                           # Carrega o reg $t1 com o imediato 0
    li      $t0,        101

calcula:

    addi    $t1,        $t1,        1               # Soma uma unidade em $t1 (contador do loop)
    beq     $t1,        $t0,        print_erro2     # Se $t1 = $t0, jump para print_erro2

    add.d   $f4,        $f4,        $f6             # $f4 = $f4 + $f6
    div.d   $f4,        $f4,        $f12            # $f4 = $f4 / $f12

    div.d   $f6,        $f20,       $f4             # $f6 = $f20 / $f4

    sub.d   $f10,       $f4,        $f6             # $f10 = $f6 - $f4

    abs.d   $f10,       $f10                        # Valor absoluto de $f10

    c.le.d  $f10,       $f8                         # Se $f10 <= $f8 cc = 1, cc = 0 caso contrario

    bc1t    end_calc                                # Se flag = 1, jump para end_calc

    j       calcula                                 # Jump para calcula

end_calc:
    move    $s3,        $t1                         # Copia o contador para o reg $s3
    jr      $ra

print_erro:
    li      $v0,        4                           # Carrega o valor imediato 4 no registrador $v0
    la      $a0,        erro_inp                    # Imprime a string erro_inp
    syscall                                         # Executa a chamada para imprimir uma string

    j       encerra                                 # Jump para encerra

print_erro2:
    li      $v0,        4                           # Carrega o valor imediato 4 no registrador $v0
    la      $a0,        erro                        # Imprime a string erro_2
    syscall                                         # Executa a chamada para imprimir uma string

    li      $v0,        1                           # Carrega o valor imediato 1 no registrador $v0
    move    $a0,        $s0                         # Imprime o inteiro que está em $s0
    syscall                                         # Executa a chamada para imprimir um inteiro

    li      $v0,        4                           # Carrega o valor imediato 4 no registrador $v0
    la      $a0,        erro1                       # Imprime a string erro_2-2
    syscall                                         # Executa a chamada para imprimir uma string

    j       encerra                                 # Jump para encerra

print_out:  ##                                      # $s3 = contador
    li      $v0,        4                           # Carrega o valor imediato 4 no registrador $v0
    la      $a0,        out1                        # Imprime a string out1
    syscall                                         # Executa a chamada para imprimir uma string

    li      $v0,        1                           # Carrega o valor imediato 1 no registrador $v0
    move    $a0,        $s0                         # Imprime o inteiro que está em $s0
    syscall                                         # Executa a chamada para imprimir um inteiro

    li      $v0,        4                           # Carrega o valor imediato 4 no registrador $v0
    la      $a0,        out2                        # Imprime a string out2
    syscall                                         # Executa a chamada para imprimir uma string

    li      $v0,        3
    mov.d   $f12,       $f6
    syscall 

    li      $v0,        4                           # Carrega o valor imediato 4 no registrador $v0
    la      $a0,        out3                        # Imprime a string out3
    syscall                                         # Executa a chamada para imprimir uma string

    li      $v0,        1                           # Carrega o valor imediato 1 no registrador $v0
    move    $a0,        $s3                         # Imprime o inteiro que está em s0
    syscall                                         # Executa a chamada para imprimir um inteiro

    li      $v0,        4                           # Carrega o valor imediato 4 no registrador $v0
    la      $a0,        out4                        # Imprime a string out4
    syscall                                         # Executa a chamada para imprimir uma string


encerra:
    li      $v0,        10                          # Carrega o valor imediato 10 no registrador $v0
    syscall                                         # Executa a chamada para finalizar o programa
