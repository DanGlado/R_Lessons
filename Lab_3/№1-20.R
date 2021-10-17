cat("№1\n")
# typeof() - функция, определяющая тип данных (более узкий, чем mode()),
# Так, если дано целое число, то typeof() даст ответ integer, тогда как
# mode() выдаст ответ более глобальный - numeric, включающий в себя также действительные числа
a<- 5L
b<- 5
c<- 2i
typeof(a) # int
mode(a) # numeric

typeof(b) # double
mode(b) # numeric

typeof(c) # complex
mode(c) # complex

# Функция str() показывает внутреннюю структуру объекта (например, вектора или списка)
# R program to display
# structure of a list

# Creating a list
gfg <- list(2, 4, 5, 6, 7, 9, 13, 15, 3, 1)

# Calling str() function
str(gfg)


cat("№2\n")
w1 <- c(-12L, 4, "Level 2", 8.2, TRUE) # character
w2 <- c(0, 56/6, FALSE, FALSE, 18) # double
w3 <- c(Inf, NULL, NA, FALSE, 18, NaN) # double
w4 <- c(Inf, NULL, NA, FALSE, 18L, NaN) # double
w5 <- c(Inf, NULL, NA, FALSE, "18", NaN) # character
w6 <- c(NULL) # NULL

cat("Vectors w: ",
            typeof(w1),
    length(w1),
            typeof(w2),
    length(w2),
            typeof(w3),
    length(w3),
            typeof(w4),
    length(w4),
            typeof(w5),
    length(w5),
            typeof(w6),
    length(w6),
    quote=FALSE, sep='\n')
# NULL - не элемент (пустое значение), не считается
# w3, w4 - double, так как присутствует элемент Inf, который относится к double
w7 <- c(Inf) # typeof(w7) -> double

cat("№3\n")
w1 <- rep(c(0, -1, 1:3), times = 3) # 3 раза повторяет вектор последовательно
w2 <- rep(c(0, -1, 1:3), each = 3) # Kаждый элемент повторяется 3 раза последовательно
w3 <- rep(c(0, -1, 1:3), each = 3, times = 2) # Повторяется каждый элемент 3 раза и так 2 вектора
w4 <- rep(c(0, -1, 1:3), times = 2, each = 3)
w1
w2
w3
w4

cat("№4\n")
se <- seq(by = 1, length.out = 5) # По умолчанию from = 1
se # шаг = 1, количество выводимых элементов = 5

cat("№5\n")
seq_len(length(se)) # seq()=seq_len() 1:5
se <- c(-5:5)
seq_len(length(se)) # 1:11
# seq_len() выводит последовательность от 1 до длины вектора


cat("№6\n")
# sc <- scan(what = logical())
# sc

cat("№7\n")
# sc <- scan(what = character())
# sc

cat("№8\n")
# vec <- c(1:5)
# vec
# edit(vec)
# fix(vec)
# Фактически при своем вызове функция fix() вызывает функцию edit()
# для редактирования переданного в качестве параметра вектора, и можно
# было бы заменить вызов fix(имя_вектора) вызовом edit(имя_вектора), так
# как редактор используется один и тот же
# 9
cat("№9\n")
a<- c(7:4, 0)
b<-c(8, 10.5, 0, -2, 9)
a
b
print(paste(a+b, a*b, a/b), quote = FALSE)
print(paste(sum(a), sum(b), mean(a), mean(b)), quote = FALSE)




cat("№10\n")
w <- c(1, 5L, "C", "Varchar", TRUE, 2i) # character
typeof(w)
w <- c(1, 5L, TRUE, 2i) # complex
typeof(w)
w <- c(1, 5L, TRUE) # double
typeof(w)
w <- c(1L, FALSE, TRUE) # integer
typeof(w)
w <- c(5L, 2i, "C") # character
typeof(w)
w <- c(5L, 2i) # complex
typeof(w)
w <- c(FALSE, 0) # double
typeof(w)
# Правило поглощения (от сильного к слабому) - character -> complex -> double -> integer -> logical

cat("№11\n")
# 1 type 1 size
v1 <- c(1, 2, 3)
v2 <- c(10, 20, 30)
v1+v2
v1-v2
v1*v2
v1/v2
print("------------------", quote = FALSE)
# 1 type n sizes
v1 <- c(FALSE, TRUE, FALSE)
v2 <- c(TRUE, FALSE) # +TRUE
v1+v2
v1-v2
v1*v2
v1/v2
print("------------------", quote = FALSE)
# n types 1 size
v1 <- c(FALSE, 100, 5L)
v2 <- c(2i, TRUE, 0)
v1+v2
v1-v2
v1*v2
v1/v2
print("------------------", quote = FALSE)
# m types n sizes
v1 <- c(FALSE, 100, 5L)
v2 <- c(TRUE, 1)
v1+v2
v1-v2
v1*v2
v1/v2

# Правило: Если длины векторов различны, то к меньшему вектору добавляются элементы того же самого вектора,
# начиная с первого элемента, пока операнды не станут равны по размеру
cat("№12\n")

v1 <- c(TRUE, FALSE, TRUE, FALSE)
v2 <- c("Lorem", "Ipsum")
v3 <- c(4L, 2L, 0L, 10L, 10L)
v4 <- c(2i)
v5 <- c(100, 200, 300, 400)
v6 <- c("Hel", "lo", "world")
v7 <- c(3i)
cat("Vectors:\n1)", v1,"\n2)", v2,"\n3)", v3,"\n4)", v4,"\n5)", v5,"\n")
v1 & (v3 & v5)
v2 < v3
v4 == v7
v2 < v6
# Более короткие вектора увеличиваются, по правилу, рассмотренному ранее
# Векторы сравниваются поэлементно
# Операции происходят логически верные
# Результат сравнения векторов - вектор логического типа

cat("№13\n")
sample(-17:28, 10)  # 10 случайных целых числе из диапазона (-17:28)
cat("№14\n")
runif(20, -7, -2)  # 20 случ. действительных чисел в диапазоне (-7:-2)
cat("№15\n")
# ?scan - Функция для чтения данных векторов или списков из консоли или файла

# Чтение данных из файла:
# Предположим, что есть три вектора, первый символьного
# типа и оставшиеся два численного типа, а файл это input.dat.
# scan() используется для считывания трех векторов в виде списка следующим образом
# inp <- scan("input.dat", list("",0,0))
# Далее можем использовать данные, записав их в переменные:
# label <- inp[[1]]; x <- inp[[2]]; y <- inp[[3]]

# Также, с помощью scan() возможно прочитать ввод с клавиатуры
# Например, с помощью создания объекта, считывающего ЛОГИЧЕСКИЕ элементы вектора:
# sc <- scan(what = logical())
# Или СТРОКОВЫЕ:
# sc <- scan(what = character())
cat("№16\n")
w1 <- -3.3:4.67
cat(w1, "\n")
w2 <- rep(c(1:-2), 3)
cat(w2, "\n")
cat(w1^w2)
# Вектор w1 дополнен элементами справа - добавились элементы: с первого по четвертый включительно (этого же вектора),
# После дополнения до равного количества элементов, происходит операция возведения в степень поэлементно.
# Образуется третий вектор, элементы которого - результаты возведения в степень чисел векторов.
# Так, первое число = w1[1]^w2[1], второе = w1[2]^w2[2] и так далее...
cat("№17\n")

n <- as.integer(readline(prompt="Enter number elements of rus-alphabet: "))

al.ru <- c('а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т',
           'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю','я')
rusal <- c(al.ru[sample(1:33, n)])
rusal
cat("№18\n")
s <- c(3, 1, 5, 2)
cat("Init vector: \n", s, "\n")
sort(s)  # 1 2 3 5 - Сортирует вектор по значениям по возрастанию
order(s)  # 2 4 1 3 - Выдает вектор индексов элементов, если бы они были упорядочены по возрастанию

cat("№19\n")
# a <- scan(what = integer())
# b <- scan(what = integer())
# Examples:
a <- c(50, 10, 4, 7, 2, 27, 72, 91)
b <- c(25, 2,  2, 2, 3, 4,  36, 18)
z <- as.logical(c(a %% b))
z == 0

cat("№20\n")
h1 = vector(mode='double', length=20)
h2 <- vector(mode<-'double',length<-20)
h1
mode(h1)
typeof(h1)
length(h1)
h2
mode(h2)
typeof(h2)
length(h2)
# В IDE DataSpell разница при создании векторов с помощью vector() (с определением в них типа и размера)
# не обнаружена
# P.S. Предупреждение: It is recommended to use '<-' instead of '='