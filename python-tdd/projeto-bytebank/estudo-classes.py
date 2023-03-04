"""
---------------INHERITANCE---------------
"""


# demonstração de parent constructors
class Person(object):
    def __init__(self, name, idnumber):
        self.name = name
        self.idnumber = idnumber

    def display(self):
        print(self.name)
        print(self.idnumber)

    def details(self):
        print("My name is {}".format(self.name))
        print("Idnumber: {}".format(self.idnumber))


# child class - recebe a classe mãe,
# para herdar atributos e métos
class Employee(Person):
    def __init__(self, name, idnumber, salary, post):
        self.salary = salary
        self.post = post

        # precisa invocar o init da classe mãe
        # dentro do método __init__ filho
        Person.__init__(self, name, idnumber)

    def details(self):
        print("My name is {} HEHE".format(self.name))
        print("Id number: {}".format(self.idnumber))
        print("Post: {}".format(self.post))


# testando

a = Employee("Bruna", 123456, 5000072.5, "Superintendente")

a.display()
a.details()

"""
---------------POLYMORPHISM---------------
"""


# Exemplo: determinar se dada espécie de pássaro voa ou não

class Bird:
    def intro(self):
        print("There are many types of birds.")

    def flight(self):
        print("Most birds fly, but some don't")


class Sparrow(Bird):
    def flight(self):
        print("Sparrows can fly")


class Ostrich(Bird):
    def flight(self):
        print("Ostriches cannot fly")


obj_bird = Bird()
obj_sparrow = Sparrow()
obj_ostrich = Ostrich()

obj_bird.intro()
obj_bird.flight()

obj_sparrow.intro()
obj_sparrow.flight()

obj_ostrich.intro()
obj_ostrich.flight()


# Outro exemplo de polimorfismo - classes com métodos de nomes iguais

class India():
    def capital(self):
        print("New Delhi is the capital of India.")

    def language(self):
        print("Hindi is the most widely spoken language of India.")

    def type(self):
        print("India is a developing country.")


class USA():
    def capital(self):
        print("Washington, D.C. is the capital of USA.")

    def language(self):
        print("English is the primary language of USA.")

# pode até mesmo reescrever o tipo de algum objeto para algo específico
    def type(self):
        print("USA is a developed country.")

# útil para criação de listas, etc
obj_ind = India()
obj_usa = USA()
for country in (obj_ind, obj_usa):
    country.capital()
    country.language()
    country.type()

# polimorfismo com uma função livre que recebe objetos de tipos diferentes
def func(obj):
    obj.capital()
    obj.language()
    obj.type()

obj_ind = India()
obj_usa = USA()

func(obj_ind)
func(obj_usa)
