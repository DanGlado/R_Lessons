# 1
print("№1")
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

# Функция str() показывает внутреннюю структуру объекта (например, вектора или списка)
# R program to display
# structure of a list

# Creating a list
gfg <- list(2, 4, 5, 6, 7, 9, 13, 15, 3, 1)

# Calling str() function
str(gfg)

# 2
print("№2")
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
# 3
print("№3")
w1 <- rep(c(0, -1, 1:3), times = 3) # 3 раза повторяет вектор последовательно
w2 <- rep(c(0, -1, 1:3), each = 3) # Kаждый элемент повторяется 3 раза последовательно
w3 <- rep(c(0, -1, 1:3), each = 3, times = 2) # Повторяется каждый элемент 3 раза и так 2 вектора
w4 <- rep(c(0, -1, 1:3), times = 2, each = 3)
w1
w2
w3
w4
# 4
print("№4")
se <- seq(by = 1, length.out = 5) # По умолчанию from = 1
se # шаг = 1, количество выводимых элементов = 5
# 5
print("№5")
seq_len(length(se)) # seq()=seq_len() 1:5
se <- c(-5:5)
seq_len(length(se)) # 1:11
# seq_len() выводит последовательность от 1 до длины вектора

# 6
print("№6")
# sc <- scan(what = logical())
# sc
# 7
print("№7")
# sc <- scan(what = character())
# sc
# 8
print("№8")
# vec <- c(1:5)
# vec
# edit(vec)
# fix(vec)
# Фактически при своем вызове функция fix() вызывает функцию edit()
# для редактирования переданного в качестве параметра вектора, и можно
# было бы заменить вызов fix(имя_вектора) вызовом edit(имя_вектора), так
# как редактор используется один и тот же
# 9
print("№9")
a<- c(7:4, 0)
b<-c(8, 10.5, 0, -2, 9)
a
b
print(paste(a+b, a*b, a/b), quote = FALSE)
print(paste(sum(a), sum(b), mean(a), mean(b)), quote = FALSE)

# 10
print("№10")
# 11
print("№11")
# 12
print("№12")
# 13
print("№13")
# 14
print("№14")
# 15
print("№15")
# 16
print("№16")
# 17
print("№17")
# 18
print("№18")
# 19
print("№19")
# 20
print("№20")