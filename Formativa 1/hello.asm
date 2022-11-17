.data
    ola: .asciiz "Ola Mundo\n"

.text
main:

    #Imprime a string 'ola'
    
    li $v0, 4
    la $a0, ola
    syscall

    #Encerrar
    li $v0, 10
    syscall
    
# Para rodar no terminal  
# Abrir local do arquivo
# spim -f nome_do_arquivo.spim
