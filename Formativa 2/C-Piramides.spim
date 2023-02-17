## $t0 = numero inserido
## t1 = i para o loop
## t2 = j para o loop
## s1 = m para a piramide 2
## s0 = 0 sempre
.data
    espaco: .asciiz " "
    quebraDeLinha:  .asciiz "\n"
.text

main:
    li	$s0, 0	# $s0 = 0 
    li	$v0,5 	# $v0 = primeiro numero
    syscall

    # atribuir primeiro numero a $t1
    move $t0, $v0 
    addi $t0, $t0, 1

p1:
    li	$t1, 0	# zera $t1 
    li	$t2, 0	# zera $t2

loop_p1:
    beq	$t1, $t0, exch	# se i == n // $t1 == $t0
    move $t2, $t1   # $t2 = $t1
    
loop:    
    beq	$t2, 0, adiciona	# se $t2 == 0 vai para loop_p1
    bge	$t1, 10, print1_p1     # se $t1 >= 10 vai para print2
    blt	$t1, 10, print2_p1	  # se $t1 < 10 vai para print2

adiciona:
    addi $t1, $t1, 1 # / i++
    li	$v0, 4  
    la	$a0, ql	# print \n 
    syscall
    j loop_p1

print1_p1:
    li	$v0, 1		## print resultado
    move $a0, $t1
    syscall

    li	$v0, 4 
    la	$a0, espaco	# print espaco
    syscall

    sub	$t2, $t2, 1	# $t2 = $21 - $t2
    j loop

print2_p1:
    li	$v0, 1		## print 0
    move  $a0, $s0
    syscall

    li	$v0, 1		## print resultado
    move  $a0, $t1
    syscall

    li	$v0, 4 		# $v0 4= 
    la	$a0, espaco		# print espaco
    syscall

    sub	$t2, $t2, 1		# $t2 = $21 - $t2
    j loop

p2:
    move $t1, $s0	# $t1 = s0
    move $t2, $s0	# $t2 = s0

loop_p2:
    li	$s1, 0		# $s1 =0 
    beq	$t1, $t0, encerra	# se i == n // $t1 == $t0
    move $t2, $t1		# $t2 = $t1

loop2:    
    beq	$t2, 0, adiciona2	# se $t2 == 0 vai para loop1

    addi $s1, $s1, 1    # $s1++
    bge	$s1, 10, print1_p2    # se $t1 >= 10 vai para print1
    blt	$s1, 10, print2_p2 	# se $t1 < 10 vai para print2

adiciona2:
    addi  $t1, $t1, 1	# $t1 = $t1 + 1 / i++

    li	$v0, 4 	
    la	$a0, ql	# print \n 
    syscall

    j loop_p2

print1_p2:
    li	$v0, 1	# print resultado
    move   $a0, $s1
    syscall

    li	$v0,4 	
    la	$a0, espaco	# print espaco
    syscall

    sub	$t2, $t2, 1	# $t2 = $21 - $t2
    j loop2

print2_p2:
    li	$v0, 1	# print 0
    move  $a0, $s0
    syscall

    li	$v0, 1	# print resultado
    move   $a0, $s1
    syscall

    li	$v0, 4 	
    la	$a0, espaco	# print espaco
    syscall

    sub	$t2, $t2, 1	# $t2 = $21 - $t2
    j loop2

exch:
    li	$v0,4 		   
    la	$a0, quebraDeLinha		# print \n 
    syscall

    j p2

encerra:    
    li	$v0,4 
    la	$a0, quebraDeLinha	# print \n 
    syscall

    li	$v0, 10 # sai do programa
    syscall
