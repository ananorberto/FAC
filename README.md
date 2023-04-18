# FAC 
Repositório da matéria de Fundamentos e Arquitetura de Computadores (UnB - FGA)

Matéria ministrada pelo professor  John L. Gardenghi
#
## Tutorial de instalação Assembly (spim) - **Linux**
1. Abra o terminal e execute o seguinte comando:
~~~
sudo apt install spim 
~~~
2. Crie um arquivo `.spim` no VS Code e escreva o código

> *Exemplo* - Hello World:
~~~assembly
.data
    ola: .asciiz "Hello World\n"

.text
main:

    #Imprime a string 'ola'
    
    li $v0, 4
    la $a0, ola
    syscall

    #Encerrar
    li $v0, 10
    syscall
~~~
3. Por fim, abra a pasta local do arquivo no terminal e execute o comando:
~~~
spim -f nome_do_arquivo.spim
~~~
#
>### Table: System services. 

| Service         | System Call Code | Arguments                                        | Result                   |
|-----------------|------------------|--------------------------------------------------|--------------------------|
| print_int       | 1                | $a0 = integer                                    |                          |
| print_float     | 2                | $f12 = float                                     |                          |
| print_double    | 3                | $f12 = double                                    |                          |
| print_string    | 4                | $a0 = string                                     |                          |
| read_int        | 5                |                                                  | integer (in $v0)         |
| read_float      | 6                |                                                  | float (in $f0)           |
| read_double     | 7                |                                                  | double (in $f0)          |
| read_string     | 8                | $a0 = buffer, $a1 = length                       |                          |
| sbrk            | 9                | $a0 = amount                                     | address (in $v0)         |
| exit            | 10               |                                                  |                          |
| print_character | 11               | $a0 = character                                  |                          |
| read_character  | 12               |                                                  | character (in $v0)       |
| open            | 13               | $a0 = filename, $a1 = flags, $a2 = mode          | file descriptor (in $v0) |
| read            | 14               | $a0 = file descriptor, $a1 = buffer, $a2 = count | bytes read (in $v0)      |
| write           | 15               | $a0 = file descriptor, $a1 = buffer, $a2 = count | bytes written (in $v0)   |
| close           | 16               | $a0 = file descriptor                            | 0 (in $v0)               |
| exit2           | 17               | $a0 = value                                      |                          |

Para acessar as informações completas, clique [aqui](https://www.doc.ic.ac.uk/lab/secondyear/spim/node8.html).
#
>### Tabela Registradores de Inteiros
| Nome Lógico | Nome real | Uso                                                  |
|-------------|:---------:|------------------------------------------------------|
| $zero       |     0     | Contante 0                                           |
| $at         |     1     | Reservado pelo assembler                             |
| $v0 … $v1   |   2...3   | Cálculo de expressões e valor de retorno das funções |
| $a0 … $a3   |   4...7   | Primeiros 4 pâmetros das funções                     |
| $t0 … $t7   |   8...15  | Geral (Pode não ser reservado pelas funções          |
| $s0 … $s7   |  16...23  | Geral (Pode ser preservado pelas funções)            |
| $t8 … $t9   |  24...25  | Geral (Pode não ser reservado pelas funções          |
| $k0 … $k1   |  26...27  | Reservado pelo kernel do S.O                         |
| $gp         |     28    | Ponteiro para área global (Global Pointer)           |
| $sp         |     29    | Stack Pointer                                        |
| $fp         |     30    | Frame Pointer                                        |
| $ra         |     31    | Endereço de retornos das funções (Return Address)    |

#
### Formativa 1 - Fundamentos de assembly MIPS 1
ㅤ
* A - Olá Mundo [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f1_2022_2/olamundo.pdf)
* B - Soma de dois numeros [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f1_2022_2/soma2.pdf)
* C - Pneu [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f1_2022_2/pneu.pdf)

#### --> [Soluções](https://github.com/ananorberto/FAC/tree/main/Formativa%201)
#

#
### Formativa 2 - Fundamentos de assembly MIPS 2
ㅤ
* A - Maior Número [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f2_2022_2/maior_numero_2.pdf)
* B - Conta de Água [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f2_2022_2/conta_agua.pdf)
* C - Piramides [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f2_2022_2/piramides1.pdf)

* D - Vestibular [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f2_2022_2/vestibular.pdf)

* E - Bit de paridade [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f2_2022_2/bitparidade-funcao.pdf)

#### --> [Soluções](https://github.com/ananorberto/FAC/tree/main/Formativa%202)
#

### Formativa 3 - Ponto flutuante
ㅤ
* A - Conversão de temperatura [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f3_2022_2/conversao-temperatura.pdf)
* B - Média ponderada [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f3_2022_2/media-ponderada.pdf)
* C - Preço consumidor [[PDF]](https://moj.naquadah.com.br/contests/jl_fac_t01_f3_2022_2/preco_consumidor.pdf)

#### --> [Soluções](https://github.com/ananorberto/FAC/tree/main/Formativa%203)


