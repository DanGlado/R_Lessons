# №1
print("№1")
a <- 5L
b <- "Hello"
c <- TRUE
d <- 0x20
e <- 3.1415926
f <- month.name
i <- as.complex(5+2i)
v <- (0:5)
print(paste(typeof(a), a,
            typeof(b), b,
            typeof(c), c,
            typeof(d), d,
            typeof(e), e,
            typeof(f), f,
            typeof(i), i,
            typeof(v), v), quote=FALSE, sep='\n')


typeof(29)  # double Действительное число по умолчанию
typeof(23i) # complex Комплексное (мнимая единица i)
typeof(-34L)  # integer L - в конце - целое число
typeof(2/3) # double Действительное число
typeof(4/2) # double Действительное число по умолчанию
typeof(0xA) # double Число 10 в 16-ричной сис. сч. - Действительное число по умолчанию
typeof(0XBL - 120L) # integer Разность целых чисел = целое число
typeof(0XBL - 120)  # double Одно из чисел действительное - результат действительное
typeof(0XBL * 17) # double Одно из чисел действительное - результат действительное

# №2
print("№2")
value <- readline("Input value: ")
print(paste("Полученные значения для 2 задания: ", value))

int1 <- as.integer(value)
doub1 <- as.double(value)
logi1 <- as.logical(value)
str1 <- as.character(value)
print("!=")
print(int1 != doub1)
print(int1 != logi1)
print(logi1 != str1)
print(doub1 != logi1)
print(doub1 != str1)
print("==")
print(int1 == doub1)
print(int1 == logi1)
print(logi1 == str1)
print(doub1 == logi1)
print(doub1 == str1)
print(">")
print(int1 > doub1)
print(int1 > logi1)
print(logi1 > str1)
print(doub1 > logi1)
print(doub1 > str1)
print("<")
print(int1 < doub1)
print(int1 < logi1)
print(logi1 < str1)
print(doub1 < logi1)
print(doub1 < str1)
# Если значение может приводиться к типам данных, которые могут сравниваться, тогда получаем TRUE or FALSE, иначе NA
# Получается, logical -> integer -> double -> character
# №3
print("№3")
val1 <- readline("Input val1: ")
val2 <- readline("Input val2: ")
print(paste("Полученные значения для 3 задания: ", val1, val2))

int1 <- as.integer(val1)
doub1 <- as.double(val1)
logi1 <- as.logical(val1)
str1 <- as.character(val1)

int2 <- as.integer(val2)
doub2 <- as.double(val2)
logi2 <- as.logical(val2)
str2 <- as.character(val2)

print("Operations on integer and double")
try(cat(int1 * doub2, int1 / doub2, int1 + doub2, int1 - doub2, int1 ^ doub2, int1 %% doub2, int1 %/% doub2, sep = "\n"))

print("Operations on integer and logical")
try(cat(int1 * logi2, int1 / logi2, int1 + logi2, int1 - logi2, int1 ^ logi2, int1 %% logi2, int1 %/% logi2, sep = "\n"))

print("Operations on logical and character")
try(cat(logi1 * str2, logi1 / str2, logi1 + str2, logi1 - str2, logi1 ^ str2, logi1 %% str2, logi1 %/% str2, sep = "\n"))

print("Operations on double and logical")
try(cat(doub1 * logi2, doub1 / logi2, doub1 + logi2, doub1 - logi2, doub1 ^ logi2, doub1 %% logi2, doub1 %/% logi2, sep = "\n"))

print("Operations on double and character")
try(cat(doub1 * str2, doub1 / str2, doub1 + str2, doub1 - str2, doub1 ^ str2, doub1 %% str2, doub1 %/% str2, sep = "\n"))
# Операции могут выполняться не со всеми типами данных, поэтому могут возникать ошибки
# Операции могут совершаться со всеми рассматриваемыми типами, кроме character
# Отличия print() от cat() в том, что с помощью cat() возможно указывать переменные и текст
# Закон: при сравнении элементов, один из которых character - другой элемент также преобразуется в character
# № 4
print("№4")
print("AND-------OR")
q1 <-2
q2 <-0
q3 <- (q1 == 2) & (q2 ==2)
print(paste("№1", q3))

q1 <-2
q2 <-0
q3 <- (q1 == 2) && (q2 ==2)
print(paste("№2", q3))

q1 <-(2:5) # вектор из элементов 2, 3, 4, 5
q2 <-(0:3) # вектор из элементов 0, 1, 2, 3
q3 <- (q1 == 2) & (q2 ==2)
print(paste("№3", q3))

q1 <-(2:4) # вектор из элементов 2, 3, 4
q2 <-(0:2) # вектор из элементов 0, 1, 2
q3 <- (q1 == 2) && (q2 ==2)
print(paste("№4", q3))

# № 5
print("№5")
3/7
3/7 - 0.4285714
# [1] 2.857143e-08
# Специальная запись для очень малых величин, т.е. так записывается оставшаяся дробная часть числа e-08 = 10^-8

# № 6
print("№6")
sqrt(2)*sqrt(2)  # 2
(sqrt(2)*sqrt(2))-2  # 4.440892e-16
# При работе с действительными числами возникают проблемы с записью такого числа
# Корень из 2 - иррациональное число, поэтому мы имеем дело с бесконечной дробной частью
# И из-за особенного представления чисел с плавающей точкой в компьютере при расчетах возникают неточности

# В примере №1 мы имеем дело с противоположными операциями - вычисление квадратного корня из числа и возведение его во вторую степень
# Эти операции компенсируют друг друга и остается просто число 2

# Во втором же примере сначала вычисляются корни (получаются числа с плавающей точкой), далее перемножаются и получают
# приблизительно тот же ответ, что в примере №1, затем вычитается двойка