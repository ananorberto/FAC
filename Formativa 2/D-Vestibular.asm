# $s1 e $t3 => respostas corretas
# $s2 e $t4 => resposta do usuario
# $s0 => qtd de questoes
# $t1 => qtd de acertos
# $t2 => contador 

.data
    ql:  .asciiz "\n"
    gabarito: .space 100
    resposta: .space 100
.text
main:
    move $s3, $zero   #iniciar nota em 0
    move $t2, $zero   #iniciar contador em 0
    li $v0, 5   #ler n, codigo de input int
    syscall
    move $s0, $v0   #s0 = n 
    #ler string de gabarito
    la $a0, gabarito   #endereco da string gabarito
    li $v0, 8   #codigo de input string
    la $s1, gabarito    #coloca o endereco da string desejada de t0 para a0
    li $a1, 99  #tam da string = n
    syscall

    #ler string de resposta
    la $a0, resposta  #endereco da string resposta
    li $v0, 8   #codigo de input string
    la $s2, resposta   #coloca o endereco da string desejada de t0 para a0
    li $a1, 99   #tam da string = n
    syscall

compare:
    beq		$t2, $s0, fim  # verifica se qtd de questões e igual a 0, se for para o loop

    lb      $t3, 0($s1)  # pega o prox char de $s1
    lb      $t4, 0($s2)   # pega o prox char de $s2
    bne     $t3, $t4, sum   # nao sao iguais vai para sum
    addi	$t1, $t1, 1	 # $t1 ++   
           
sum:
    addi    $t2, $t2, 1
    addi	$s1, $s1, 1  # $s1 ++   
    addi	$s2, $s2, 1  # $s2 ++ 
    j compare

fim:    
    li		$v0, 1	# print acertos
    move    $a0, $t1
    syscall
    li		$v0,4 		    
    la		$a0, ql	# print \n 
    syscall
    li	$v0, 10 # sai do programa
    syscall
