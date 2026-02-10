algoritmo "atividade_04"

Var
   fahrenheit, celsius: real
   
inicio
    escreval("digite a temperatura de agora em celsius por gentileza: ")
    leia(celsius)
    fahrenheit <- celsius * 9 / 5 + 32
    escreval("temperatura em fahrenheit: ", fahrenheit)
    escolha verdadeiro
    caso (celsius < 0)
    escreval("a agua esta em seu estado: solido")
    caso (celsius >= 0) e (celsius <= 100)
    escreval("a agua esta no seu estado: liquido")
    caso (celsius > 100)
    escreval("a agua esta em seu estado: gasoso")
    fimescolha
    
fimalgoritmo
