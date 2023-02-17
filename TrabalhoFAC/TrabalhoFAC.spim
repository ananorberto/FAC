.data
nl: .asciiz "\n"
.text
main:

multfac:

  li $v0, 5
  syscall
  move $a0, $v0
  li $v0, 5
  syscall
  move $a1, $v0

  addi $t4, $zero, 32 # para controlar as iterações

  ##slt $t8, $a0, $zero # se $a0 < 0 então $t8 = 1

  sub $t7, $a0, $zero # subtrai zero de $a0 e armazena em &t7
  slti $t8, $t7, 0 # se $t7  < 0 -> $t8 = 1

  sub $t6, $a1, $zero # subtrai zero de $a0 e armazena em &t6
  slti $t9, $t6, 0 # se $t7  < 0 -> $t8 = 1


  beq $t8, $zero, nega_a1 # se $t8 == 0 então desvia para verifica_a1

  nor $a0, $a0, $zero # nega $a0
  addi $a0, $a0, 1 # soma 1

nega_a1:
  beq $t9, $zero, inicia # se $t9 == 0 então desvia para passo1
  nor $a1, $a1, $zero # nega $a1
  addi $a1, $a1, 1 # soma 1

inicia:
  move $t0, $zero # $zero armazenado em $t0 (HI)
  move $t1, $a1 # $a1 armazenado em $t1 LO

verifica:
# verifica bit menos significativo de $t1 com o andi(LO)
  andi $t2, $t1, 1 # faz um 'and' bit a bit com um numero binario

# if (o bit menos significatico = 0 desvia)
  beq $t2, $zero, op_shift 

# else -> soma $a0 a $t0 (HI)
  add $t0, $t0, $a0

# OPERACOES DE SHIFT A ESQUERDA 
op_shift:
  andi $t3, $t0, 1 # pega o bit menos significativo de $t0 (HI)
  srl $t0, $t0, 1 # um shift à direita (HI)
  srl $t1, $t1, 1 # um shift à direita (LO)

  sll $t3, $t3, 31 # 31 shifts à esquerda (HI) (filtro para passar o último bit da esquerda p/ direita)

  add $t1, $t1, $t3 # passar o bit mais significativo da HI para LO

  sub $t4, $t4, 1 # iteração
  bne $t4, $zero, verifica # se $t4 != 0 desvia para op_shift

  beq $t8, $t9, exch_sin # entradas tem o mesmo sinal ? Y : desvia para exch_sin
  nor $t1, $t1, $zero # nega $t1
  addi $t1, $t1, 1 # soma 1

exch_sin:
  beq $t8, $zero, next # o multiplicando é negativo? não => próximo
  nor $t0, $t0, $zero

next: 
  beq $t9, $zero, end     #o multiplicador é negativo? não => fim
  nor $t0, $t0, $zero     #nega
  j end 


end:

  mtlo $t1
  mthi $t0

  move $a0, $t1
  li $v0, 1   #Syscall para imprimir HI
  syscall

  li $v0, 4
  la $a0, nl
  syscall

  move $a0, $t0
  li $v0, 1   #Syscall para imprimir LO
  syscall

  li $v0, 4
  la $a0, nl
  syscall

  li $v0, 10
  syscall

  jr $ra




	
