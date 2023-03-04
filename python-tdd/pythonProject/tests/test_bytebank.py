import pytest
from codigo.bytebank import Funcionario
from pytest import mark

# boa prática criar uma classe para cada parte do código que quer testar
class TestClass:
    # nome do método para o teste: nome precisa ter test_nome_verboso_descritivo
    def test_quando_idade_recebe_21_02_2000_deve_retornar_23(self):
        # metodologia Given-when-then(desfecho - resultado)
        # Given (contexto): inserir data nascimento funcionario
        entrada = '21/02/2000'
        esperado = 23
        #instanciar funcionario teste
        funcionario_teste = Funcionario("Teste", entrada, 1111)

        # When - ação
        resultado = funcionario_teste.idade()

        # Then - desfecho
# método do Pytest que verifica se afirmação é verdade ou não
        assert resultado == esperado # then - desfecho, resolução
        # retorna se o teste passa ou não, com porcentagem

    def test_quando_sobrenome_recebe_Bruna_Tiburcio_deve_retornar_Tiburcio(self):
        entrada = ' Bruna Tiburcio ' #Given
        esperado = 'Tiburcio' # resultado esperado

        bruna = Funcionario(entrada, '18/07/1995', 5555)
        resultado = bruna.sobrenome() # When

        assert resultado == esperado

    def test_quando_decrescimo_salario_recebe_cem_mil_deve_retornar_noventa_mil(self):
        entrada_salario = 100000 # Given
        esperado = 90000

        entrada_nome = "Bruna Tiburcio"

        funcionario_teste = Funcionario(entrada_nome, '11/11/2000', entrada_salario) # When
        funcionario_teste.decrescimo_salario() # When
        resultado = funcionario_teste.salario

        assert resultado == esperado # then
    #@pytest.mark.calcular_bonus
    @mark.calcular_bonus
    #@mark.skip(reason="Não quero executar agora")
    def test_quando_calcular_bonus_1000_deve_retornar_100(self):
        entrada = 1000 # Given
        esperado = 100

        funcionario_teste = Funcionario('teste', '18/07/1995', entrada)
        resultado = funcionario_teste.calcular_bonus() # When

        assert resultado == esperado # Then

    #@mark.skipif(sys.version_info < (3, 10), reason="Requer Python na versão 3.10 ou superir")
    @mark.calcular_bonus
    # levantar exceção quando o salário é muito alto
    def test_quando_calcular_bonus_recebe_1000000_deve_retornar_exception(self):
        # com with pytest.raises(Exception) levanta exception com o código dentro da condicional
        with pytest.raises(Exception): # o esperado é exception
            entrada = 1000000  # Given
            # o esperado passa a ser exception esperado = 100

            funcionario_teste = Funcionario('teste', '18/07/1995', entrada)
            resultado = funcionario_teste.calcular_bonus()  # When

            assert resultado # só precisa conferir valor do bonus - integra com o método da classeoytest

# não seria necessário testar a saída string, pois não é um teste de lógica.
# Está mais relacionado ao
    def test_quando_retorna_str(self):
        nome, data_nascimento, salario = "Teste", "12/01/2000", 1000  # Given
        esperado = "Funcionario(Teste, 12/01/2000, 1000)" #saida em string do objeto

        funcionario_teste = Funcionario(nome, data_nascimento, salario)
        resultado = funcionario_teste.__str__() # When

        assert resultado == esperado # Then