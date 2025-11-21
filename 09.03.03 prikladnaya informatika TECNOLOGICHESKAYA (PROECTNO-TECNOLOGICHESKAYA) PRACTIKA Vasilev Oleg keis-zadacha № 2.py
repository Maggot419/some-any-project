class Animal:                               # Базовый класс
    def __init__(self, name, age):
        self.name = name                    # имя животного
        self.age = age                      # возраст

    def info(self):
        print("Это животное")
        print("Имя:", self.name)
        print("Возраст:", self.age, "лет")

    def make_sound(self):
        print(self.name, "издаёт какой-то звук...")

    def eat(self):
        print(self.name, "кушает")


class Dog(Animal):                          # Производный класс Собака
    def __init__(self, name, age, breed):
        super().__init__(name, age)         # вызываем конструктор родителя
        self.breed = breed                  # порода — новое поле

    # Переопределяем метод родителя
    def make_sound(self):
        print(self.name, "говорит: Гав-гав!")

    # Добавляем новый метод, которого нет у родителя
    def fetch(self):
        print(self.name, "приносит палку")


class Cat(Animal):                          # Производный класс Кошка
    def __init__(self, name, age, color):
        super().__init__(name, age)
        self.color = color

    def make_sound(self):
        print(self.name, "говорит: Мяу!")

    def sleep(self):
        print(self.name, "спит на подоконнике")


# ==================== ОСНОВНАЯ ЧАСТЬ ПРОГРАММЫ ====================

print("=== ДЕМОНСТРАЦИЯ НАСЛЕДОВАНИЯ ===\n")

# Создаём объект базового класса
print("1. Создаём обычное животное (базовый класс):")
animal1 = Animal("Неизвестное животное", 3)
animal1.info()
animal1.make_sound()
animal1.eat()
print("-" * 40)

# Создаём собаку
print("2. Создаём собаку (наследник 1):")
dog1 = Dog("Шарик", 5, "Дворняга")
dog1.info()                    # метод от родителя
dog1.make_sound()              # переопределённый метод
dog1.eat()                     # метод от родителя
dog1.fetch()                   # новый метод собаки
print("-" * 40)

# Создаём кота
print("3. Создаём кота (наследник 2):")
cat1 = Cat("Мурка", 2, "Рыжий")
cat1.info()
cat1.make_sound()              # свой звук
cat1.eat()
cat1.sleep()
print("-" * 40)

# Демонстрируем, что объекты разных классов можно хранить в одном списке
print("4. Полиморфизм — все животные в одном списке:")
animals = [animal1, dog1, cat1]

for pet in animals:
    pet.info()
    pet.make_sound()           # у каждого свой звук!
    print("---")

print("\nПрограмма завершена. Всё работает!")