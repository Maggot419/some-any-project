A = [4, -1, 8, -3, 2, -7, 5]

# Находим минимальный и максимальный элементы
min_element = A[0]
max_element = A[0]
min_pos = 0
max_pos = 0

for i in range(len(A)):
    if A[i] < min_element:
        min_element = A[i]
        min_pos = i
    if A[i] > max_element:
        max_element = A[i]
        max_pos = i

# Теперь считаем сумму отрицательных между ними
summa = 0

# Определяем, где начинается и где заканчивается участок
if min_pos < max_pos:
    for i in range(min_pos + 1, max_pos):
        if A[i] < 0:
            summa += A[i]
else:
    for i in range(max_pos + 1, min_pos):
        if A[i] < 0:
            summa += A[i]

print("Сумма отрицательных между мин и макс:", summa)