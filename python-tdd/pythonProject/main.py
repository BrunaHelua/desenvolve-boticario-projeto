from codigo.bytebank import Funcionario


# regra de negócio - colocar a data de nascimento, não o ano de nascimento

bruna = Funcionario('Bruna', "18/07/1995", 1000000)
print(bruna.calcular_bonus())

# print(bruna.idade())

# teste unitário - testando um método da classe Funcionario
#def teste_idade():
    # testando vários cenário diferentes sobre a data
#    funcionario_teste = Funcionario('Teste', '13/03/2020', 1111)
#    print(f'teste = {funcionario_teste.idade()}')

    #funcionario_teste = Funcionario('Teste', '12/12/2020', 1111)
    #print(f'teste = {funcionario_teste.idade()}')


# teste_idade()