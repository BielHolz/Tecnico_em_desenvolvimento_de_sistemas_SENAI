Algoritmo "6"

Var
     parcelas: inteiro
    valorProduto, valorFinal, desconto: real


Inicio
    escreva("Digite o valor do produto: R$ ")
    leia(valorProduto)
    escreva("Digite em quantas vezes deseja pagar: ")
    leia(parcelas)
    escolha parcelas
        caso 1
            desconto := valorProduto * 0.10
            valorFinal := valorProduto - desconto
            escreval("Pagamento à vista com 10% de desconto.")
            escreval("Valor final: R$ ", valorFinal:0:2)
        caso 2
            desconto := valorProduto * 0.05
            valorFinal := valorProduto - desconto
            escreval("Pagamento em 2 vezes com 5% de desconto.")
            escreval("Valor final: R$ ", valorFinal:0:2)
        outrocaso
            valorFinal := valorProduto
            escreval("Pagamento em ", parcelas, " vezes sem desconto.")
            escreval("Valor final: R$ ", valorFinal:0:2)
    fimescolha


Fimalgoritmo