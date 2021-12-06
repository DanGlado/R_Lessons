# Step 3
options(device="windows")
cat("---------------------------------------------------")
setwd("C:/Users/202530/DataspellProjects/R_lessons/KR_1")
print(getwd(), quote = FALSE)
print("Заполнение и копирование исходных данных...", quote = FALSE)
generate.data <- function(n=10, mi=20, ma=100, filename = "Глад", loc_path = 'Гладушенко_Даниил_ПИ20-1/Магазин'){
  for (k in 1:10){
    value_sup <- (sample(x = mi:ma, size = n, replace=TRUE))

    value_sal <- c()
    for (elem in value_sup){
      value_sal <- c(value_sal, sample(0:elem, size=1))
    }
    days <- c(1:10)

    Data <- data.frame('Дни' = days, 'Поставки_сыра' = value_sup)
      write.table(Data,
                paste0(loc_path, as.character(k), '/', filename, '.in.csv'),
                row.names = FALSE,
                sep = ';',
                dec=',')


    task <- 'Скопировать файлы с данными из папок магазинов в папку Анализ.
При копировании файлов в папку Анализ имена файлов Микси.in, Микси.out
из папок Магазин 1, Магазин 2 и т.д. заменять на имена Магазин1_Микси.in,
Магазин1_Микси.out и т.д.'
    cp_path_sup <- paste0(loc_path, as.character(k), '/', 'Магазин', as.character(k), '_', filename, '.in.csv')
    write.table(Data,
                cp_path_sup,
                row.names = FALSE,
                sep = ';',
                dec=',')
      if (file.exists(paste0('Analysis', '/', 'Магазин', as.character(k), '_', filename, '.in.csv'))){
        file.remove(paste0('Analysis', '/', 'Магазин', as.character(k), '_', filename, '.in.csv'))
      }
      file.copy(cp_path_sup, 'Analysis')
      file.remove(cp_path_sup)

    Data <- data.frame('Дни' = days, 'Продажи_сыра' = value_sal)
    write.table(Data,
                paste0(loc_path, as.character(k), '/', filename, '.out.csv'),
                row.names = FALSE,
                sep = ';',
                dec=',')
    cp_path_sal <- paste0(loc_path, as.character(k), '/', 'Магазин', as.character(k), '_', filename, '.out.csv', sep = '')
    write.table(Data,
                cp_path_sal,
                row.names = FALSE,
                sep = ';',
                dec=',')
    if (file.exists(paste0('Analysis', '/', 'Магазин', as.character(k), '_', filename, '.out.csv'))){
      file.remove(paste0('Analysis', '/', 'Магазин', as.character(k), '_', filename, '.out.csv'))
    }

    file.copy(cp_path_sal, 'Analysis')
    file.remove(cp_path_sal)

    }
}

# Заполнение пустых csv файлов данными о поставках и продажах
generate.data()

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
colnames(in1)[colnames(in1) == "Дни"] <- "День недели"
colnames(in2)[colnames(in2) == "Дни"] <- "День недели"
colnames(in3)[colnames(in3) == "Дни"] <- "День недели"
colnames(in4)[colnames(in4) == "Дни"] <- "День недели"
colnames(in5)[colnames(in5) == "Дни"] <- "День недели"
colnames(in6)[colnames(in6) == "Дни"] <- "День недели"
colnames(in7)[colnames(in7) == "Дни"] <- "День недели"
colnames(in8)[colnames(in8) == "Дни"] <- "День недели"
colnames(in9)[colnames(in9) == "Дни"] <- "День недели"
colnames(in10)[colnames(in10) == "Дни"] <- "День недели"

colnames(out1)[colnames(out1) == "Дни"] <- "День недели"
colnames(out2)[colnames(out2) == "Дни"] <- "День недели"
colnames(out3)[colnames(out3) == "Дни"] <- "День недели"
colnames(out4)[colnames(out4) == "Дни"] <- "День недели"
colnames(out5)[colnames(out5) == "Дни"] <- "День недели"
colnames(out6)[colnames(out6) == "Дни"] <- "День недели"
colnames(out7)[colnames(out7) == "Дни"] <- "День недели"
colnames(out8)[colnames(out8) == "Дни"] <- "День недели"
colnames(out9)[colnames(out9) == "Дни"] <- "День недели"
colnames(out10)[colnames(out10) == "Дни"] <- "День недели"


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

VARS_in <- list(in1[, 2], in2[, 2], in3[, 2], in4[, 2], in5[, 2], in6[, 2], in7[, 2], in8[, 2], in9[, 2], in10[, 2])
VARS_out <- list(out1[, 2], out2[, 2], out3[, 2], out4[, 2], out5[, 2], out6[, 2], out7[, 2], out8[, 2], out9[, 2], out10[, 2])

P_supply <- 5500
P_sale <- 8000
P_util <- 400


VARS_in[[1]]
# test <- VARS_in[1] - VARS_out[1]
# test
# dev.new(); par(mfrow = c(strings, columns)); f <- factor(x = flex, levels = day.week);
for (n in 1:10){
  Q_util <- sum(VARS_in[[n]]) - sum(VARS_out[[n]])
  gain <- c(gain, sum(VARS_out[[n]]) * P_sale)
  profit <- c(profit, gain[n] - (sum(VARS_in[[n]]) + P_util * Q_util))
  realiz <- c(realiz, sum(VARS_out[[n]]))
  util <- c(util, Q_util)
  srd <- c(srd, sd(VARS_out[[n]]))

}

print(c("gain ", gain), quote = FALSE)
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

for (n in 1:10){
  s_ma <- max(VARS_out[[n]])
  day1 <- which.max(VARS_out[[n]])
  s_mi <- min(VARS_out[[n]])
  day2 <- which.min(VARS_out[[n]])
  u_ma <- max(VARS_in[[n]]-VARS_out[[n]])
  day3 <- which.max(VARS_in[[n]]-VARS_out[[n]])

  sale_max <- c(sale_max, s_ma)
  sale_min <- c(sale_min, s_mi)
  util_max <- c(util_max, u_ma)

  days1 <- c(days1, day1)
  days2 <- c(days2, day2)
  days3 <- c(days3, day3)
}
print(VARS_out)
print(c(sale_max, days1))
print(c(sale_min, days2))
print(c(util_max, days3))


res.tab[2] <- c('За нед', gain, sum(gain), mean(gain))
res.tab[3] <- c('За нед', profit, sum(profit), mean(profit))
res.tab[4] <- c('За нед', realiz, sum(realiz),  mean(realiz))
res.tab[5] <- c('За нед', util, sum(util), mean(util))
res.tab[6] <- c('За нед', srd, sum(srd), mean(srd))

res.tab[7] <- c('За день', sale_max, NA, NA)
res.tab[8] <- c('№ Дня', days1, NA, NA)
res.tab[9] <- c('За день', sale_min, NA, NA)
res.tab[10] <- c('№ Дня', days2, NA, NA)
res.tab[11] <- c('За день', util_max, NA, NA)
res.tab[12] <- c('№ Дня', days3, NA, NA)

print(res.tab)
# getwd() "C:/Users/202530/DataspellProjects/R_lessons/KR_1/Analysis"
write.table(res.tab, 'Результаты.csv', row.names = FALSE, sep = ';')

if (file.exists("Результаты.csv")){
  print("Таблица создана!", quote = FALSE)
}
werter