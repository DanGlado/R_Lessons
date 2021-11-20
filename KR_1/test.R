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

    Data <- data.frame('Дни' = days, 'Поставки' = value_sup)
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

    Data <- data.frame('Дни' = days, 'Продажи' = value_sal)
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

in5
out5
