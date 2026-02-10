Algoritmo "7"

Var
  votos1, votos2: inteiro


Inicio
escreval("Digite o número de votos do Candidato 1:")
   leia(votos1)

   escreval("Digite o número de votos do Candidato 2:")
   leia(votos2)

   se votos1 > votos2 entao
      escreval("Candidato 1 venceu!")
   senao
      se votos2 > votos1 entao
         escreval("Candidato 2 venceu!")
      senao
         escreval("Houve um empate!")
      fimse
   fimse


Fimalgoritmo