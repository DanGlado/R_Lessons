# Step 3
options(device="windows")
cat("---------------------------------------------------")
setwd("C:/Users/202530/DataspellProjects/R_lessons/KR_1")
print(getwd(), quote = FALSE)
print("Заполнение и копирование исходных данных...", quote = FALSE)

goods <- list(c(n=10, mi=20, ma=100, name="Сыр"), c(n=10, mi=20, ma=100, name="Молоко"))

write_data <- function (days, goods=list(c(n=10, mi=20, ma=100, name="Сыр")), loc_path, sep=.Platform$file.sep, k, filename){
  EXT_SUPPLY <- '.in'
  EXT_SALE <- '.out'
  n <-  as.integer(goods[[1]][[1]][1])
  days <- c(1:n)
  Data_sup <- data.frame('День недели' = days)
  Data_sal <- data.frame('День недели' = days)
  for (vec in goods){
    n <-  as.integer(vec[1])
    mi <-  as.integer(vec[2])
    ma <-  as.integer(vec[3])
    name <- as.character(vec[length(vec)])

    # Создание двух векторов - доставки и продажи товара соотв. за n дней
    value_sup <- (sample(x = mi:ma, size = n, replace=TRUE))

    value_sal <- c()
    for (elem in value_sup){
      value_sal <- c(value_sal, sample(0:elem, size=1))
    }
    Data_sup[name] <- value_sup
    Data_sal[name] <- value_sal
  }
  # Creating sources files
  write.table(Data_sup,
              paste0(loc_path, as.character(k), sep, filename, EXT_SUPPLY, '.csv'),
              row.names = FALSE,
              sep = ';',
              dec=',')
  write.table(Data_sal,
              paste0(loc_path, as.character(k), sep, filename, EXT_SALE, '.csv'),
              row.names = FALSE,
              sep = ';',
              dec=',')
  # Copy to Analysis supply
  cp_path_sup <- paste0(loc_path, as.character(k), sep, 'Магазин', as.character(k), '_', filename, EXT_SUPPLY, '.csv')
  write.table(Data_sup,
              cp_path_sup,
              row.names = FALSE,
              sep = ';',
              dec=',')
  # Check
  if (file.exists(paste0('Analysis', sep, 'Магазин', as.character(k), '_', filename, EXT_SUPPLY, '.csv'))){
    file.remove(paste0('Analysis', sep, 'Магазин', as.character(k), '_', filename, EXT_SUPPLY, '.csv'))
  }
  # Delete unused files
  file.copy(cp_path_sup, 'Analysis')
  file.remove(cp_path_sup)

  # Copy to Analysis sales
  cp_path_sal <- paste0(loc_path, as.character(k), sep, 'Магазин', as.character(k), '_', filename, EXT_SALE, '.csv')
  write.table(Data_sal,
              cp_path_sal,
              row.names = FALSE,
              sep = ';',
              dec=',')
  # Check
  if (file.exists(paste0('Analysis', sep, 'Магазин', as.character(k), '_', filename, EXT_SALE, '.csv'))){
    file.remove(paste0('Analysis', sep, 'Магазин', as.character(k), '_', filename, EXT_SALE, '.csv'))
  }
  # Delete unused files
  file.copy(cp_path_sal, 'Analysis')
  file.remove(cp_path_sal)
}

generate.data <- function(goods, filename = "Глад", loc_path = 'Гладушенко_Даниил_ПИ20-1/Магазин'){
  for (k in 1:10){
    # Создание таблиц
    write_data(days, goods, loc_path, sep=.Platform$file.sep, k, filename)
    }
}

# Заполнение пустых csv файлов данными о поставках и продажах
generate.data(goods)

print("Переход в папку Analysis", quote = FALSE)
setwd("C:/Users/202530/DataspellProjects/R_lessons/KR_1/Analysis")
print(getwd(), quote = FALSE)
print("В текущей директории найдены следующие файлы:", quote = FALSE)
dir()

in1 <- read.table(paste0('Магазин1', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out1 <- read.table(paste0('Магазин1', '_Глад.out', '.csv'), head = TRUE, sep = ';')
in2 <- read.table(paste0('Магазин2', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out2 <- read.table(paste0('Магазин2', '_Глад.out', '.csv'), head = TRUE, sep = ';')
in3 <- read.table(paste0('Магазин3', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out3 <- read.table(paste0('Магазин3', '_Глад.out', '.csv'), head = TRUE, sep = ';')
in4 <- read.table(paste0('Магазин4', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out4 <- read.table(paste0('Магазин4', '_Глад.out', '.csv'), head = TRUE, sep = ';')
in5 <- read.table(paste0('Магазин5', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out5 <- read.table(paste0('Магазин5', '_Глад.out', '.csv'), head = TRUE, sep = ';')
in6 <- read.table(paste0('Магазин6', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out6 <- read.table(paste0('Магазин6', '_Глад.out', '.csv'), head = TRUE, sep = ';')
in7 <- read.table(paste0('Магазин7', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out7 <- read.table(paste0('Магазин7', '_Глад.out', '.csv'), head = TRUE, sep = ';')
in8 <- read.table(paste0('Магазин8', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out8 <- read.table(paste0('Магазин8', '_Глад.out', '.csv'), head = TRUE, sep = ';')
in9 <- read.table(paste0('Магазин9', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out9 <- read.table(paste0('Магазин9', '_Глад.out', '.csv'), head = TRUE, sep = ';')
in10 <- read.table(paste0('Магазин10', '_Глад.in', '.csv'), head = TRUE, sep = ';')
out10 <- read.table(paste0('Магазин10', '_Глад.out', '.csv'), head = TRUE, sep = ';')

typeof(in1)
in5
out5

print("All is OK")
# colnames(in1)[colnames(in1) == "Дни"] <- "День недели"
# colnames(in2)[colnames(in2) == "Дни"] <- "День недели"
# colnames(in3)[colnames(in3) == "Дни"] <- "День недели"
# colnames(in4)[colnames(in4) == "Дни"] <- "День недели"
# colnames(in5)[colnames(in5) == "Дни"] <- "День недели"
# colnames(in6)[colnames(in6) == "Дни"] <- "День недели"
# colnames(in7)[colnames(in7) == "Дни"] <- "День недели"
# colnames(in8)[colnames(in8) == "Дни"] <- "День недели"
# colnames(in9)[colnames(in9) == "Дни"] <- "День недели"
# colnames(in10)[colnames(in10) == "Дни"] <- "День недели"
#
# colnames(out1)[colnames(out1) == "Дни"] <- "День недели"
# colnames(out2)[colnames(out2) == "Дни"] <- "День недели"
# colnames(out3)[colnames(out3) == "Дни"] <- "День недели"
# colnames(out4)[colnames(out4) == "Дни"] <- "День недели"
# colnames(out5)[colnames(out5) == "Дни"] <- "День недели"
# colnames(out6)[colnames(out6) == "Дни"] <- "День недели"
# colnames(out7)[colnames(out7) == "Дни"] <- "День недели"
# colnames(out8)[colnames(out8) == "Дни"] <- "День недели"
# colnames(out9)[colnames(out9) == "Дни"] <- "День недели"
# colnames(out10)[colnames(out10) == "Дни"] <- "День недели"


in5[1]
out5[2]

# Step 4
rev <- rep(0,12)
profit <- rep(0, length(rev))


res.tab <- data.frame("Выручка, руб" = rev, "Прибыль, руб"=profit)
sale <- rep(0, nrow(res.tab))
res.tab$"Реализация, конт." <- sale
res.tab$"Списание, конт." <- sale
res.tab$"Равномерность продаж" <- sale

res.tab$"Продажи макс." <- sale
res.tab$"День_ПМа" <- sale
res.tab$"Продажи мин." <- sale
res.tab$"День_ПМи" <- sale
res.tab$"Списание макс." <- sale
res.tab$"День_Спис" <- sale

shops <- c("Магазин1", "Магазин2", "Магазин3", "Магазин4", "Магазин5", "Магазин6", "Магазин7", "Магазин8", "Магазин9", "Магазин10", "Итого", "Среднее")

res.tab <- cbind(shops, res.tab)

res.tab <- rbind((c(" ", rep("За неделю", 5), rep("За день", 6))), res.tab)
# res.tab[2] <- NULL  # Удаление второго столбца
# res.tab <- res.tab[-c(1), ] # Удаление первой строки

# Шаблон итоговой таблицы готов
res.tab

# Step 5
gain <- c()
profit <- c()
realiz <- c()
util <- c()
srd <- c()

VARS_in <- list(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10)
VARS_out <- list(out1, out2, out3, out4, out5, out6, out7, out8, out9, out10)

P_supply <- 5500
P_sale <- 8000
P_util <- 400


# VARS_in[[1]]
# test <- VARS_in[1] - VARS_out[1]
# test
# dev.new(); par(mfrow = c(strings, columns)); f <- factor(x = flex, levels = day.week);
sum(VARS_in[[1]][, 2])
# print(VARS_in)
Q_util <- c()
exes <- c()


for (n in 1:10){
  for (col in 2:(length(goods)+1)){
    v.prod.in <- VARS_in[[n]][, col]
    v.prod.out <- VARS_out[[n]][, col]

    gain <- c(gain, sum(v.prod.out) * P_sale)
    realiz <- c(realiz, sum(v.prod.out))
    srd <- c(srd, sd(v.prod.out))

    Q_util <- sum(v.prod.in) - sum(v.prod.out)
    util <- c(util, Q_util)
    exes <- c(exes, (P_util * Q_util + P_supply * sum(v.prod.in)))
  }
}
gain_test <- gain
exes_test <- exes
util_test <- util
profit <- c(profit, (gain - exes))
steps <- seq(from = 1, to = length(goods)*n, by = length(goods))
print(steps)
result.week <- function(vector){
  final.vec <- c()
  for (st in steps){
    final.vec <- c(final.vec, sum(c(vector[st], vector[st+1])))
  }
  return (final.vec)
}

if (length(goods) > 1){
  gain <- result.week(gain)
  profit <- result.week(profit)
  realiz <- result.week(realiz)
  util <- result.week(util)
  srd <- result.week(srd)
}

print(c("profit ", gain), quote = FALSE)
print(c("profit ", profit), quote = FALSE)
print(c("realiz ", realiz), quote = FALSE)
print(c("util ", util), quote = FALSE)
print(c("sd ", srd), quote = FALSE)

sale_max <- c()
sale_min <- c()
util_max <- c()
days1 <- c()
days2 <- c()
days3 <- c()

s_ma <- c()
s_mi <- c()
u_ma <- c()

selected.prod <- readline(prompt="Enter product: ")

name.goods <- c()
for (good in goods){
  name.goods <- c(name.goods, good[length(good)])
}


while (!(selected.prod %in% name.goods)){
  print("Товар не найден! Попробуйте снова")
  selected.prod <- readline(prompt="Enter product: ")
}

print("Товар найден!")
ind_col <- as.integer(which(name.goods == selected.prod)+1)
for (n in 1:10){
  v.prod.in <- VARS_in[[n]][, ind_col]
  v.prod.out <- VARS_out[[n]][, ind_col]

  s_ma <- c(s_ma, max(v.prod.out))
  day1 <- which.max(v.prod.out)
  s_mi <- c(s_mi, min(v.prod.out))
  day2 <- which.min(v.prod.out)
  u_ma <- c(u_ma, max(v.prod.in-v.prod.out))
  day3 <- which.max(v.prod.in-v.prod.out)

  days1 <- c(days1, day1)
  days2 <- c(days2, day2)
  days3 <- c(days3, day3)

}
  print(s_ma, day1)
  # sale_max <- c(sale_max, s_ma)
  # sale_min <- c(sale_min, s_mi)
  # util_max <- c(util_max, u_ma)

# print(VARS_out)
# print(c(sale_max, days1))
# print(c(sale_min, days2))
# print(c(util_max, days3))


res.tab[2] <- c('За нед', gain, sum(gain), mean(gain))
res.tab[3] <- c('За нед', profit, sum(profit), mean(profit))
res.tab[4] <- c('За нед', realiz, sum(realiz),  mean(realiz))
res.tab[5] <- c('За нед', util, sum(util), mean(util))
res.tab[6] <- c('За нед', srd, sum(srd), mean(srd))

res.tab[7] <- c('За день', s_ma, rep(NA, 2))
res.tab[8] <- c('№ Дня', days1, NA, NA)
res.tab[9] <- c('За день', s_mi, NA, NA)
res.tab[10] <- c('№ Дня', days2, NA, NA)
res.tab[11] <- c('За день', u_ma, NA, NA)
res.tab[12] <- c('№ Дня', days3, NA, NA)

print(res.tab)
# getwd() "C:/Users/202530/DataspellProjects/R_lessons/KR_1/Analysis"
write.table(res.tab, 'Результаты.csv', row.names = FALSE, sep = ';')

if (file.exists("Результаты.csv")){
  print("Таблица создана!", quote = FALSE)
}