Algoritmo "atividade_09"

var
   letra:caractere
   n:real


Inicio
   escreval("digite uma letra por gentileza")
   leia(letra)
   escolha(verdadeiro)
   caso (letra = "a") ou (letra ="e") ou (letra = "i") ou (letra = "o") ou (letra = "u")
      escreval("vogal")
   caso (n >= 0) ou (n <= 0)
    escreval("Numeros nao sao permitidos")
   caso (letra  <> "a") ou  (letra  <> "e") ou (letra  <> "i") ou (letra  <> "o") ou (letra  <> "u")
      escreval("consoante")
   outrocaso
      escreval("invalido")
   fimescolha


Fimalgoritmo
