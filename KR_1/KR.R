# Step 3
options(device="windows")
cat("---------------------------------------------------")
setwd("C:/Users/202530/DataspellProjects/R_lessons/KR_1")
print(getwd(), quote = FALSE)
print("Заполнение и копирование исходных данных...", quote = FALSE)

# Список товаров в магазинах с характеристиками
# n - период (в днях), mi - мин. доставка, ma - макс. доставка
goods <- list(c(n=10, mi=20, ma=100, name="Сыр"), c(n=10, mi=20, ma=100, name="Молоко"), c(n=10, mi=50, ma=100, name="Масло"))
EXT_SUPPLY <- '.in'
EXT_SALE <- '.out'

write_data <- function (days, goods=list(c(n=10, mi=20, ma=100, name="Сыр")), loc_path, sep=.Platform$file.sep, k, filename, sale.level=100){
  EXT_SUPPLY <- '.in'
  EXT_SALE <- '.out'
  n <-  as.integer(goods[[1]][[1]][1])  # Количество дней
  days <- c(1:n)
  Data_sup <- data.frame('День недели' = days)
  Data_sal <- data.frame('День недели' = days)

  generate.sale <- function(value_sup, sale.level){
    value_sal <- c()
    for (elem in value_sup){
      if (sale.level == 100) {
        value_sal <- c(value_sal, round(as.integer(floor(runif(1, min=0, max=elem))), 0))
      } else if (sale.level >= 0){
        value_sal <- c(value_sal, round(as.integer(floor(runif(1, min=0, max=elem))), 0))
      } else {
        print('sale.level error')
      }
    }
    s <- max(value_sup)/sum(value_sal)
    print('s, sal, sup')
    print(s)
    # print(round(as.integer(value_sal*s), 0))
    # print(value_sup)
    # print(sum(value_sup*sale.level*0.01))
    # print(sum(value_sal))
    value_sal <- round(as.integer(value_sal*s), 0)
    return (value_sal)
  }
  # Для каждого товара определяем основные компоненты из вектора в списке goods
  for (vec in goods){
    n <-  as.integer(vec[1])
    mi <-  as.integer(vec[2])
    ma <-  as.integer(vec[3])
    name <- as.character(vec[length(vec)])

    # Создание двух векторов - доставки и продажи товара соотв. за n дней
    value_sup <- (sample(x = mi:ma, size = n, replace=TRUE))
    value_sal <- c()
    # Генерация проданных товаров по дням


    for (elem in value_sup){
      if (sale.level >= 0 && sale.level <= 100){
        value_sal <- c(value_sal, round(as.integer(floor(runif(1, min=0, max=elem))), 2))
      } else {
        print('sale.level error')
      }
    }
    s <- (sum(value_sup)*sale.level/100)/sum(value_sal)
    value_sal <- round(as.integer(value_sal*s), 0)
    if (length(value_sal[value_sal>100])){
      lish <- (value_sal[value_sal>100]) - (100*length(value_sal[value_sal>100]))
      value_sal[match(min(value_sal), value_sal)] <- value_sal[match(min(value_sal), value_sal)] + lish
    }

    # print('s, sal, sup')
    # print(s)
    # print(value_sal)
    # print(sum(value_sal))
    # print(value_sup)
    # print(sum(value_sup))

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

days <-  as.integer(goods[[1]][[1]][1])
generate.data <- function(goods, filename = "Глад", loc_path = 'Гладушенко_Даниил_ПИ20-1/Магазин'){
  for (k in 1:10){
    # Создание таблиц
    write_data(days, goods, loc_path, sep=.Platform$file.sep, k, filename, sale.level=50)
    }
}

# Заполнение пустых csv файлов данными о поставках и продажах
generate.data(goods)

print("Переход в папку Analysis", quote = FALSE)
setwd("C:/Users/202530/DataspellProjects/R_lessons/KR_1/Analysis")
print(getwd(), quote = FALSE)
print("В текущей директории найдены следующие файлы:", quote = FALSE)
dir()

shop_name <- "Глад"
# Заполнение переменных данными из только что созданных таблиц
in1 <- read.table(paste0('Магазин1', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out1 <- read.table(paste0('Магазин1', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')
in2 <- read.table(paste0('Магазин2', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out2 <- read.table(paste0('Магазин2', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')
in3 <- read.table(paste0('Магазин3', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out3 <- read.table(paste0('Магазин3', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')
in4 <- read.table(paste0('Магазин4', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out4 <- read.table(paste0('Магазин4', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')
in5 <- read.table(paste0('Магазин5', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out5 <- read.table(paste0('Магазин5', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')
in6 <- read.table(paste0('Магазин6', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out6 <- read.table(paste0('Магазин6', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')
in7 <- read.table(paste0('Магазин7', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out7 <- read.table(paste0('Магазин7', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')
in8 <- read.table(paste0('Магазин8', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out8 <- read.table(paste0('Магазин8', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')
in9 <- read.table(paste0('Магазин9', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out9 <- read.table(paste0('Магазин9', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')
in10 <- read.table(paste0('Магазин10', '_', shop_name, EXT_SUPPLY, '.csv'), head = TRUE, sep = ';')
out10 <- read.table(paste0('Магазин10', '_', shop_name, EXT_SALE, '.csv'), head = TRUE, sep = ';')

# TEST NOT RUN
# typeof(in1)
# in5
# out5

print("All is OK")
# TEST NOT RUN
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

# in5[1]
# out5[2]

# Step 4
# Generating a Table template
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
colnames(res.tab)[6] <- goods[[1]][4]

shops <- c("Магазин1", "Магазин2", "Магазин3", "Магазин4", "Магазин5", "Магазин6", "Магазин7", "Магазин8", "Магазин9", "Магазин10", "Итого", "Среднее")

res.tab <- cbind(shops, res.tab)

res.tab <- rbind((c(" ", rep("За неделю", 5), rep("За день", 6))), res.tab)

# TEST NOT RUN
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

# Включение переменных в списки для удобства итерации по ним
VARS_in <- list(in1, in2, in3, in4, in5, in6, in7, in8, in9, in10)
VARS_out <- list(out1, out2, out3, out4, out5, out6, out7, out8, out9, out10)

P_supply <- 5500
P_sale <- 8000
P_util <- 400

# TEST NOT RUN
# dev.new(); par(mfrow = c(strings, columns)); f <- factor(x = flex, levels = day.week);

exes<- c()
realiz2 <- c()
for (n in 1:10){
  for (col in 2:(length(goods)+1)){
    v.prod.in <- VARS_in[[n]][, col]
    v.prod.out <- VARS_out[[n]][, col]

    gain <- c(gain, sum(v.prod.out) * P_sale)  # Сумма выручки за все проданные товары во всех магазинах
    realiz <- c(realiz, sum(v.prod.out))  # Количество проданных товаров во всех магазинах
    srd <- c(srd, sd(v.prod.out))  # Равномерность продаж по всем магазинам

    Q_util <- sum(v.prod.in) - sum(v.prod.out)  # Количество списанных товаров
    util <- c(util, Q_util)  # Вектор списанных товаров
    exes <- c(exes, (P_util * Q_util + P_supply * sum(v.prod.in)))  # Вектор расходов на покупку товаров и утилизации непроданных
  }
  v.prod.in <- VARS_in[[n]][, 2]
  v.prod.out <- VARS_out[[n]][, 2]
  realiz2 <- c(realiz2, sum(realiz2))
}


profit <- c(profit, (gain - exes))  # Вектор прибыли по всем магазинам и товарам
# Последовательность для группировки собранных данных в векторах gain, realiz и т.д. по товарно
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
  # Если товаров более 1, то группируем, агрегируя данные векторов, иначе они готовы к вставке в итоговую таблицу
  gain <- result.week(gain)
  profit <- result.week(profit)
  realiz <- result.week(realiz)
  util <- result.week(util)
  srd <- result.week(srd)
  realiz2 <- result.week(realiz2)
}

# Контроль результатов
print(c("gain ", gain), quote = FALSE)
print(c("profit ", profit), quote = FALSE)
print(c("realiz ", realiz), quote = FALSE)
print(c("util ", util), quote = FALSE)
print(c("sd ", srd), quote = FALSE)

# Создание векторов для получения макс и мин значений проданных и утилизированных товаров
s_ma <- c()
s_mi <- c()
u_ma <- c()

# Сохранение индексов (№ дня)
days1 <- c()
days2 <- c()
days3 <- c()

# Запрос названия продукта из списка, по которому будет проведен анализ
# UNCOMMENT для самостоятельного выбора продукта
# selected.prod <- readline(prompt="Enter product: ")
selected.prod <- "Сыр"

# Получение вектора всех имеющихся названий товаров, продающихся в магазинах
name.goods <- c()
for (good in goods){
  name.goods <- c(name.goods, good[length(good)])
}


while (!(selected.prod %in% name.goods)){
  print("Товар не найден! Попробуйте снова")
  selected.prod <- readline(prompt="Enter product: ")
}

print("Товар найден!")

# Находим номер колонки для последующего обращения к значениям продажи и поставкам по выбранному товару
ind_col <- as.integer(which(name.goods == selected.prod)+1)

# Для каждого магазина n
for (n in 1:10){
  # Создаются векторы со значениями поставок и продаж по дням
  v.prod.in <- VARS_in[[n]][, ind_col]
  v.prod.out <- VARS_out[[n]][, ind_col]

  # Формирование векторов и запоминание индексов значений (№ дня)
  s_ma <- c(s_ma, max(v.prod.out))
  day1 <- which.max(v.prod.out)
  s_mi <- c(s_mi, min(v.prod.out))
  day2 <- which.min(v.prod.out)
  u_ma <- c(u_ma, max(v.prod.in-v.prod.out))
  day3 <- which.max(v.prod.in-v.prod.out)

  # Сохранение полученных номеров дней
  days1 <- c(days1, day1)
  days2 <- c(days2, day2)
  days3 <- c(days3, day3)

}

# Заполнение итоговой таблицы полученными данными
res.tab[2] <- c('За нед', gain, sum(gain), mean(gain))
res.tab[3] <- c('За нед', profit, sum(profit), mean(profit))
res.tab[4] <- c('За нед', realiz, sum(realiz),  mean(realiz))
res.tab[5] <- c('За нед', util, sum(util), mean(util))
res.tab[6] <- c('За нед', srd, sum(srd), mean(srd))

res.tab[7] <- c('За день', s_ma, rep(NA, 2))
res.tab[8] <- c('№ Дня', days1, rep(NA, 2))
res.tab[9] <- c('За день', s_mi, rep(NA, 2))
res.tab[10] <- c('№ Дня', days2, rep(NA, 2))
res.tab[11] <- c('За день', u_ma, rep(NA, 2))
res.tab[12] <- c('№ Дня', days3, rep(NA, 2))

print(res.tab)
# getwd() "C:/Users/202530/DataspellProjects/R_lessons/KR_1/Analysis"
write.table(res.tab, 'Результаты.csv', row.names = FALSE, sep = ';')

if (file.exists("Результаты.csv")){
  print("Таблица создана!", quote = FALSE)
}


# GRAPHS

# №1, 5

# 1. По одному магазину подготовить графики с различными
# вариантами оформления. Каждый график строится по одному
# товару и должен отображать динамику по дням периода (неделя
# или месяц) следующих показателей:
# • объем продаж
# • выручка
# • прибыль
# • списание
# • рентабельность
# На графиках по прибыли и рентабельности рассмотреть случай
# отрицательных значений в некоторые дни (нужно подготовить
# соответствующие данные), объяснить причину появления
# отрицательных значений.

# 5. Написать скрипт, в котором спрашивать Пользователя, какие
# номера магазинов его интересуют. По указанным номерам нужно
# построить графики, аналогичные п.1, для этих магазинов. На одном
# графике отображать данные указанных магазинов. Реализовать
# алгоритм, чтобы данные по всем магазинам корректно
# отображались на графике и были видны. На график поместить
# легенду с расшифровкой.

shops <- c()  # Вектор интересующих магазинов
while (TRUE){
  shop <- as.integer(readline(prompt="Input shop numb: "))
  if (shop != 0){
    shops <- c(shops, shop)
  } else {
    break
  }
}

colors_help <- c("blue", "pink", 'brown', 'black', 'red', 'yellow', 'orange', 'grey', "purple", "forestgreen", "lightblue")
colors_legend <- c()


# • О_Б_Ъ_Е_М___П_Р_О_Д_А_Ж
mi_y <- Inf
ma_y <- -Inf
for (shop in shops){
  if (max(VARS_out[[shop]][, 2]) > ma_y){
    ma_y <- max(VARS_out[[shop]][, 2])
  }
  if (min(VARS_out[[shop]][, 2]) < mi_y){
    mi_y <- min(VARS_out[[shop]][, 2])
  }
}
dev.new()
plot(VARS_out[[shops[1]]][, 2],
     lwd = 2,
     type = "b",
     col = "green",
     main="Статистика продаж по магазинам",
     xlab = "Дни",
     ylab = "Объем продаж, конт.",
     ylim = c(mi_y, ma_y),
     xlim = c(1, 10))
colors_legend <- c(colors_legend, "green")

for (shop in shops[2:length(shops)]){
  lines(VARS_out[[shop]][, 2],
        lwd = 2,
        col = colors_help[shop])
  colors_legend <- c(colors_legend, colors_help[shop])
}

legend("topright", legend=paste("Магазин №",shops),
       col=colors_legend, lty=1, cex=0.7, lwd = 2,
       title="Поставщики", text.font=3, bg='lightcyan')

# • В_Ы_Р_У_Ч_К_А
dev.new()

mi_y <- Inf
ma_y <- -Inf
for (shop in shops){
  if (max(VARS_out[[shop]][, 2]) > ma_y){
    ma_y <- max(VARS_out[[shop]][, 2])
  }
  if (min(VARS_out[[shop]][, 2]) < mi_y){
    mi_y <- min(VARS_out[[shop]][, 2])
  }
}

mi_y <- mi_y*P_sale
ma_y <- ma_y*P_sale

plot(((VARS_out[[shops[1]]][, 2]*P_sale)/1000),
     lwd = 2,
     type = "b",
     col = "green",
     main="Статистика доходов магазинов",
     xlab = "Дни",
     ylab = "Доходы от продаж всех товаров, тыс. руб.",
     ylim = c(mi_y/1000, ma_y/1000),
     xlim = c(1, 10))

colors_legend <- c(colors_legend, "green")

if (length(shops) > 1){
  for (shop in shops[2:length(shops)]){
    lines((VARS_out[[shop]][, 2]*P_sale/1000),
          lwd = 2,
          col = colors_help[shop])
    colors_legend <- c(colors_legend, colors_help[shop])
  }
}

legend("topright", legend=paste("Магазин №",shops),
       col=colors_legend, lty=1, cex=0.7, lwd = 2,
       title="Поставщики", text.font=3, bg='lightcyan')

# • П_Р_И_Б_Ы_ЛЬ
dev.new()

mi_y <- Inf
ma_y <- -Inf
for (shop in shops){
  if (max(VARS_out[[shop]][, 2]*P_sale -
            (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util)) > ma_y){
    ma_y <- max(VARS_out[[shop]][, 2]*P_sale -
                  (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util))
  }
  if (min(VARS_out[[shop]][, 2]*P_sale -
            (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util)) < mi_y){
    mi_y <- min(VARS_out[[shop]][, 2]*P_sale -
                  (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util))
  }
}


plot(((VARS_out[[shops[1]]][, 2]*P_sale -
       (VARS_in[[shops[1]]][, 2]*P_supply + (VARS_in[[shops[1]]][, 2]-VARS_out[[shops[1]]][, 2])*P_util))/1000),
     lwd = 2,
     type = "b",
     col = "green",
     main="Статистика прибыли по магазинам",
     xlab = "Дни",
     ylab = "Прибыль от продаж всех товаров, тыс. руб.",
     ylim = c(mi_y/1000, ma_y/1000),
     xlim = c(1, 10))
colors_legend <- c(colors_legend, "green")

if (length(shops) > 1){
  for (shop in shops[2:length(shops)]){
    lines(((VARS_out[[shop]][, 2]*P_sale -
      (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util))/1000),
          lwd = 2,
          col = colors_help[shop])
    colors_legend <- c(colors_legend, colors_help[shop])
  }
}

legend("topright", legend=paste("Магазин №",shops),
       col=colors_legend, lty=1, cex=0.7, lwd = 2,
       title="Поставщики", text.font=3, bg='lightcyan')

# • С_П_И_С_А_Н_И_Е
dev.new()

mi_y <- Inf
ma_y <- -Inf
for (shop in shops){
  if (max(VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2]) > ma_y){
    ma_y <- max(VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])
  }
  if (min(VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2]) < mi_y){
    mi_y <- min(VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])
  }
}

plot((VARS_in[[shops[1]]][, 2]-VARS_out[[shops[1]]][, 2]),
     lwd = 2,
     type = "b",
     col = "green",
     main="Статистика утилизации по магазинам",
     xlab = "Дни",
     ylab = "Объем утилизации, конт.",
     ylim = c(mi_y, ma_y),
     xlim = c(1, 10))

colors_legend <- c(colors_legend, "green")

if (length(shops) > 1){
  for (shop in shops[2:length(shops)]){
    lines((VARS_out[[shop]][, 2]),
    lwd = 2,
    col = colors_help[shop])
    colors_legend <- c(colors_legend, colors_help[shop])
  }
}


legend("topright", legend=paste("Магазин №",shops),
       col=colors_legend, lty=1, cex=0.7, lwd = 2,
       title="Поставщики", text.font=3, bg='lightcyan')

# • Р_Е_Н_Т_А_Б_Е_Л_Ь_Н_О_С_ТЬ
dev.new()

mi_y <- Inf
ma_y <- -Inf
for (shop in shops){
  if (max(((VARS_out[[shop]][, 2]*P_sale -
            (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util))
            / (VARS_out[[shop]][, 2]*P_sale))*100) > ma_y){
    ma_y <- max(((VARS_out[[shop]][, 2]*P_sale -
      (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util))
      / (VARS_out[[shop]][, 2]*P_sale))*100)
  }
  if (min(((VARS_out[[shop]][, 2]*P_sale -
            (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util))
            / (VARS_out[[shop]][, 2]*P_sale))*100) < mi_y){
    mi_y <- min(((VARS_out[[shop]][, 2]*P_sale -
      (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util))
      / (VARS_out[[shop]][, 2]*P_sale))*100)
  }
}

plot((((VARS_out[[shops[1]]][, 2]*P_sale -
       (VARS_in[[shops[1]]][, 2]*P_supply + (VARS_in[[shops[1]]][, 2]-VARS_out[[shops[1]]][, 2])*P_util))
       / (VARS_out[[shops[1]]][, 2]*P_sale)))*100,
     lwd = 2,
     type = "b",
     col = "green",
     main="Статистика рентабельности магазинов",
     xlab = "Дни",
     ylab = "Рентабельность, %",
     ylim = c(mi_y, ma_y),
     xlim = c(1, 10))
colors_legend <- c(colors_legend, "green")

if (length(shops) > 1){
  for (shop in shops[2:length(shops)]){
    lines(((VARS_out[[shop]][, 2]*P_sale -
      (VARS_in[[shop]][, 2]*P_supply + (VARS_in[[shop]][, 2]-VARS_out[[shop]][, 2])*P_util))
      / (VARS_out[[shop]][, 2]*P_sale))*100,
          lwd = 2,
          col = colors_help[shop])
    colors_legend <- c(colors_legend, colors_help[shop])
  }
}

legend("topright", legend=paste("Магазин №",shops),
       col=colors_legend, lty=1, cex=0.7, lwd = 2,
       title="Поставщики", text.font=3, bg='lightcyan')


# 2. Подготовить графики по одному из магазинов, на каждом графике
# представить один из показателей для всех товаров, продающихся в
# магазине:
# • прибыль
# • списание
# • рентабельность
# Каждый товар выделять своим цветом, расшифровку цветов вынести
# в легенду.
# dev.off()
# dev.off()
# dev.off()
# dev.off()
# dev.off()

numbs <- name.goods
shop <- 1  # Для первого магазина

mi_rev_y <- Inf
ma_rev_y <- -Inf

plot_lines <- function (type, unit, mi_y, ma_y, vec){
  dev.new()
  plot(vec[[1]],
       fg = "red",
       col=colors_help[1],
       type="b",
       lwd=2,
       pch='C',
       main=paste0(type, " всех продуктов Магазина №", shop),
       xlab = "Дни",
       ylab = paste0(type, ", ", unit),
       xlim = c(1, 10),
       ylim = c(mi_y, ma_y),
       sub = "Из секретных источников")
  for (vind in 2:length(vec)){
    lines(vec[[vind]],
          col=colors_help[vind],
          type="b",
          pch="M",
          lwd=2)
  }
  legend("topright", paste("Продукт ", numbs), cex = 0.8,
         fill = colors_help)
}
# Create plots
vec.profit <- c()
vec.util <- c()
vec.rentab <- c()
list.profit <- list()
list.util <- list()
list.rentab <- list()
for (good in 2:(length(name.goods)+1)){
  profit <- (VARS_out[[shop]][, good] * P_sale -
     (P_util * (VARS_in[[shop]][, good] - VARS_out[[shop]][, good])) -
     (P_supply * VARS_in[[shop]][, good]))/1000
  util <- (VARS_in[[shop]][, good] - VARS_out[[shop]][, good])
  rentab <- ((profit)/(VARS_out[[shop]][, good] * P_sale))*1000
  list.profit <- append(list.profit, list(profit))
  list.util <- append(list.util, list(util))
  list.rentab <- c(list.rentab, list(rentab))

  vec.profit <- c(vec.profit, profit)
  vec.util <- c(vec.util, util)
  vec.rentab <- c(vec.rentab, rentab)
}
print(min(vec.util))
plot_lines(type = "Прибыль", unit = "тыс. руб.", mi_y = min(vec.profit), ma_y = max(vec.profit), list.profit)
plot_lines(type = "Утилизация", unit = "конт.", mi_y = min(vec.util), ma_y = max(vec.util), list.util)
plot_lines(type = "Рентабельность", unit = "%", mi_y = min(vec.rentab), ma_y = max(vec.rentab), list.rentab)



# 3. Подготовить круговую диаграмму, на которой представить объемы
# продаж одного товара за весь период сразу по всем магазинам.
# Каждый магазин выделять своим цветом. Расшифровку цветов
# дать в легенде.
# dev.off()
# dev.off()
# dev.off()
# dev.off()
# dev.off()



dev.new()
vec <- c()
piepercent <- c()
numbs <- c(1:10)
for (shop in numbs){
  vec <- c(vec, sum(VARS_out[[shop]][, 2]))
}
summ <- sum(vec)
for (shop in numbs){
  piepercent <- c(piepercent, round(100*(sum(VARS_out[[shop]][, 2])/sum(summ)), 1))
}

pie(vec, labels=paste(piepercent, "%"), radius=1, main='Объемы продаж по всем магазинам', col=colors_help)
legend("topright", paste("Магазин №", numbs), cex = 0.8,
       fill = colors_help)



# 4. Подготовить график, на котором будет представлена динамика
# объема продаж двух товаров по всем магазинам. Каждый
# магазин выделять своим цветом. Каждый товар выделять своим
# значком. На график поместить легенду с расшифровкой
# dev.off()
# dev.off()
# dev.off()
# dev.off()
dev.new()
mi_y <- Inf
ma_y <- -Inf
for (shop in shops){
  if (max(VARS_out[[shop]]) > ma_y){
    ma_y <- max(VARS_out[[shop]])
  }
  if (min(VARS_out[[shop]]) < mi_y){
    mi_y <- min(VARS_out[[shop]])
  }
}
# TEST NOT RUN
# print(mi_y)
# print(ma_y)

plot(VARS_out[[1]][, 2],
     fg = "red",
     col=colors_help[1],
     type="b",
     lwd=2,
     pch='C',
     main="Продажи двух продуктов во всех магазинах",
     xlab = "Дни",
     ylab = "Продажи двух продуктов, конт.",
     xlim = c(1, 10),
     ylim = c(mi_y, ma_y),
     sub = "Из секретных источников")

for (i in 1:10){
  lines(VARS_out[[i]][, 3],
        col=colors_help[i],
        type="b",
        pch="M",
        lwd=2)
}
for (i in 2:10){
  lines(VARS_out[[i]][, 2],
        col=colors_help[i],
        type="b",
        pch="C",
        lwd=2)
}

legend("topright", legend=paste("Магазин №", c(1:10)),
       col=colors_help, lty=1, cex=0.7,
       title="Поставщики", text.font=3, bg='lightblue')


# 6. Построить столбиковую диаграмму эффективности продаж по
# всем магазинам сети. Если магазинов в сети 10, то должно быть 10
# столбиков. Каждый столбик должен состоять из нескольких
# столбиков, поставленных друг на друга, где каждый маленький
# столбик отражает объем продаж по одному товару, а итоговая
# высота столбика по магазину состоит из суммы продаж по всем
# товарам за весь период. Каждый товар выделять своим цветом,
# расшифровку дать в легенде.
dev.new()
numbs <- c(1:10)
sales <- c()
for (tabl in VARS_out){
  sales <- cbind(sales, cbind(tabl$'Сыр'))
}

# print(sales)

barplot(sales, beside = FALSE,
    col = colors_help,
    main="Статистика продаж по всем магазинам",
    xlab = "Дни",
    ylab = "Продажи Сыра, конт.",
    sub = "Из секретных источников",
    width = 0.8)

axis(side=1, at=c(1:10))

legend("topright", legend=paste("Магазин №", numbs),
       col=colors_help, lty=1, cex=0.9, lwd = 2,
       title="Поставщики", text.font=3, bg='lightcyan')





# par(mfrow = c(1, 3)) ??????