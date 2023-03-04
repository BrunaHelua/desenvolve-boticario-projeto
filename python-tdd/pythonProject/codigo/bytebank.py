from datetime import date

class Funcionario:
    def __init__(self, nome, data_nascimento, salario):
        self._nome = nome
        self._data_nascimento = data_nascimento
        self._salario = salario

    @property
    def nome(self):
        return self._nome

    @property
    def salario(self):
        return self._salario

    def idade(self):
        # split cria uma lista com os valores separados
        data_nascimento_split = self._data_nascimento.split("/")
        # pegar o último valor, corresponde ao ano de nascimento
        ano_nascimento = data_nascimento_split[-1]
        ano_atual = date.today().year
        return ano_atual - int(ano_nascimento)

    def sobrenome(self):
        # strip tira espaços em branco antes e depois do nome
        nome_completo = self.nome.strip()
        nome_quebrado = nome_completo.split(" ")
        return nome_quebrado[-1]  # retorna último item da lista

    def _eh_socio(self):
        sobrenomes = ['Tiburcio', 'Machado', 'Costa', 'Duzi', 'Cabalin']
        return (self._salario >= 100000 and (self.sobrenome() in sobrenomes))
        # usar o método sobrenome da própria classe usando self._
        # desenvolvido aqui para pegar o sobrenome do funcionário
        #   return True
        # else:
        #    return False

    def decrescimo_salario(self):
        if self._eh_socio():
            decrescimo = self._salario * 0.1
            self._salario = self._salario - decrescimo

# método privado
    def calcular_bonus(self):
        valor = self._salario * 0.1
        if valor > 1000:
            #valor = 0
            raise Exception("O salário é muito alto para receber um bônus")
        return valor

    def __str__(self):
        return f'Funcionario({self._nome}, {self._data_nascimento}, {self._salario})'
