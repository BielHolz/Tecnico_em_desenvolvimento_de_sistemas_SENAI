Algoritmo "1"

Var
 dia : inteiro


Inicio
escreval("Escolha o dia da semana")
escreval("1: segunda")
escreval("2: terça")
escreval("3: quarta")
escreval("4: quinta")
escreval("5: sexta")
escreval("6: sábado")
escreval("7: domingo")
leia(dia)

escolha dia
      caso 1, 2, 3, 4, 5
        escreval("Dia útil")
    caso 6, 7
        escreval("Fim de semana")
fimescolha

Fimalgoritmo