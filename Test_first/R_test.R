setwd("C:/Users/202530/OneDrive - ФГОБУ ВО Финансовый университет при Правительстве РФ/УЧЕБА/Course_2/Sem_3/R")
Swiss.01 <- read.table("banknotes.csv", header=TRUE, sep=";")
# Swiss.01

origin <- c(rep(1, 100), rep(0, 100))

Swiss.02 <- data.frame(Swiss.01, origin)
Swiss.02

# rm(Swiss.01, Swiss.02, origin)

# source("script_1")

dim(Swiss.02)

# Vector length(vector)

#nrow(Swiss.02)
#ncol(Swiss.02)
#str(Swiss.02)
#summary(Swiss.02)

hist(Swiss.02$Diag, breaks = 120)