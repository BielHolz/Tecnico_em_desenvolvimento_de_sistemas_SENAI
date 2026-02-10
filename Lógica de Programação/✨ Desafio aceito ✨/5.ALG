Algoritmo "atividade_05"

var
   numero: inteiro

inicio
    escreval("escreva um numero poor gentileza: ")
    leia(numero)
    se (numero % 7 = 0) E (numero % 11 = 0) entao
    escreval("O número ", numero, " é divisível por 7 e 11.")
    senao
    se (numero % 7 = 0) Então
    escreval("o numero ", numero, " e divisivel por 7.")
    senao
    se (numero % 11 = 0) Então
    escreval("o numero ", numero, " e divisivel por 11.")
    senao
    escreval("o numero ", numero, " nao e divisivel nem por 7 nem por 11.")
    fimSe
    fimSe
    fimSe
FimAlgoritmo
