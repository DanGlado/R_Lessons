print(typeof(345L))
print(month.name)
as.numeric("Hello") # Warning: NAs introduced by coercion, NA



a <- 29
b <- "29"
c <- a==b
print(paste("№1", c)) # TRUE

a <- 28
b <- "30-2"
c <- a<b
print(paste("№2", c)) # TRUE
# Число переводится в строку 28 -> "28"
# При использовании кодировки UTF-8
# "28" = 50 = 50 bits
# "30-2" = 51 bits
# 50 bits < 51 bits

a <- 28
b <- "20+10"
c <- a<b
print(paste("№3", c)) # FALSE
# 28 -> "28" = 50 bits 56 bits
# "20+10" = 50 bits 48 bits
a <- 20+10
b <- "20+10"
c <- a==b
print(paste("№4", c)) # FALSE, так как a=30 -> "30"

# Переводит число в строку и сравнивает строки посимвольно по кодировке (UTF-8)
print("AND-------OR")
q1 <-2
q2 <-0
q3 <- (q1 == 2) | (q2 ==2)
print(paste("№1", q3))

q1 <-2
q2 <-0
q3 <- (q1 == 2) || (q2 ==2)
print(paste("№2", q3))

q1 <-(2:5) # вектор из элементов 2, 3, 4, 5
q2 <-(0:3) # вектор из элементов 0, 1, 2, 3
q3 <- (q1 == 2) | (q2 ==2)
print(paste("№3", q3))

q1 <-(2:4) # вектор из элементов 2, 3, 4
q2 <-(0:2) # вектор из элементов 0, 1, 2
q3 <- (q1 == 2) || (q2 ==2)
print(paste("№4", q3))

# lab3
v <- c(1:5, FALSE)

typeof(v)
mode(v)

null_v <- vector()
null_v

z2 <- vector(mode="numeric", length=129)
z3 <- vector(mode="logical", length=22)
z4 <- vector(mode="integer", length=34)
z5 <- vector(mode="character", length=0)
z6 <- vector(mode="double", length=19)

print(paste("Vectors z: ",
            typeof(z2),
            typeof(z3),
            typeof(z4),
            typeof(z5),
            typeof(z6)), quote=FALSE, sep='\n')


w1 <- c(-12L, 4, "Level 2", 8.2, TRUE)
w2 <- c(0, 56/6, FALSE, FALSE, 18)
w3 <- c(Inf, NULL, NA, FALSE, 18, NaN)
w4 <- c(Inf, NULL, NA, FALSE, 18L, NaN)
w5 <- c(Inf, NULL, NA, FALSE, "18", NaN)
w6 <- c(NULL)

print(paste("Vectors w: ",
            typeof(w1),
            typeof(w2),
            typeof(w3),
            typeof(w4),
            typeof(w5),
            typeof(w6)), quote=FALSE, sep='\n')

r1 <- c(4, -6.6, 0, 1:4)
r2 <- c(3, -1)
r1*r2

z7 <- vector(length=19, mode="double")
z8 <-vector(length=19) # тип данных задается по умолчанию
z9 <- vector(mode="double") # длина вектора задается по умолчанию
print(paste("Vectors z: ",
            typeof(z7),
            typeof(z8),
            typeof(z9)), quote=FALSE, sep='\n')

t <- -4.5:10.49
t

1:10-1 # 0-9
1:(10-1) # 1-9
10:5 # 10-5

w<-rep(TRUE, 5)
w
w2 <- rep(3:-2, 3)
w2

se1 <- seq() # from 1 to 1 by 1
se1
se2 <- seq(from = -5, by = 1) # to = 1
se2
se3 <- seq(by = 1, to = 5) # from = 1
se3
se4 <- seq(from = 1, to = 5) # by = 1
se4

w <- seq(4, from=12, length.out = 10)
w

sca <- scan()
sca
fix(sca)
sca

ran <- runif(10, min = 5, max = 25)
ran

ran_int <- sample(x = 41:400, size = 10)
ran_int

x <- c(1:8) # 1:8
x[4:6] # 4:6
x <- append(x=x, values=x[4:6], after=length(x)-2) # 1 2 3 4 5 6 4 5 6 7 8
x

x <- c(-8:1)
x[4:6]

mas <- c(55, 71, 84, 90, 77, 60, 58, 94, 49, 53, 81)
m100 <- mas >= 100
m90 <- mas >= 90
m100
m90

m90 <- mas[mas>=90]
m90

mas <- c(55, 71, 84, 90, 77, 60, 58, 94, 49, 53, 81)
height <- c(162,183, 174, 181, 169, 166,173,191,159, 170, 180)
res<- any(mas<50, mas>100, height >=200) # even if one
res
res<- all(mas == 55, height > 190)
res
res<- all(mas >= 49, height < 200) # all elems
res