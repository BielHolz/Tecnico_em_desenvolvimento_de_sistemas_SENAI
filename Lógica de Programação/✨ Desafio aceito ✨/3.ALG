Algoritmo "3"

Var
     tipoTriangulo: inteiro
    lado1, lado2, lado3: real


Inicio
    escreva("Digite o primeiro lado do triângulo: ")
    leia(lado1)
    escreva("Digite o segundo lado do triângulo: ")
    leia(lado2)
    escreva("Digite o terceiro lado do triângulo: ")
    leia(lado3)
    se (lado1 + lado2 > lado3) e (lado1 + lado3 > lado2) e (lado2 + lado3 > lado1) então
        se (lado1 = lado2) e (lado2 = lado3) então
            tipoTriangulo := 1
        senão se (lado1 = lado2) ou (lado1 = lado3) ou (lado2 = lado3) então
            tipoTriangulo := 2
        senão
            tipoTriangulo := 3
        fimse
        escolha tipoTriangulo
            caso 1
                escreval("Triângulo Equilátero: todos os lados são iguais.")
            caso 2
                escreval("Triângulo Isósceles: dois lados são iguais.")
            caso 3
                escreval("Triângulo Escaleno: todos os lados são diferentes.")
            outrocaso
                escreval("Tipo de triângulo indefinido.")
        fimescolha
    senão
        escreval("Os lados informados não formam um triângulo válido.")
    fimse


Fimalgoritmo