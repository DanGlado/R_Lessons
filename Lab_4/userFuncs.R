setwd("C:\\Users\\202530\\DataspellProjects\\R_works\\R_lessons_new\\Lab_4")
source("test.R")
Sys.setlocale(category = "LC_ALL", locale = "Russian")
# № 1
TRUe <- "Hi"
# pow(10L, FALSE, TRUe) # "Some numbers is not numeric"
# pow(10L, 5, FALSE) # "You cannot divide by zero! z = 0 (Error)"
# pow(10L, 2, 10) # 10

# № 2-5
N <- c(1, 2, 3, 0, 2, -1, 1.5, 2.9)

DEBUG_OFF <- FALSE
DEBUG_ON <- TRUE

func_week <- function (N, is_debug){
  ru <- c('ру', 'рус', 'RU', 'ru', 'rus')
  en <- c('Eng', 'eng', 'English', 'english', 'англ', 'Англ', 'анг', 'en')
  lang <- readline("Input lang: ")
  abbr <- readline("Input abbr: ")
  week_ru <- c("Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье")
  week_en <- c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
  we_ru <- c("Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс")
  we_en <- c("Mon","Tue","Wed","Thu","Fri","Sat","Sun")
  N <- as.integer(N)
  if (is_debug){ # Дебаг ко второму заданию (на русском)
    print("Полученный вектор: ", , quote=FALSE)
    print(paste(N), quote=FALSE)
    for (n in N){
      if (n>0){
        cat("\nСоотв. параметр и день недели \n", n, week_ru[n])
      } else {
        cat(" ")
      }
    }
  } else {
    if (abbr == TRUE){
      if (lang %in% en){
        for (n in N){
          if (n>0){
            cat(we_en[n], "")
          } else {
            cat(" ")
          }
        }
      } else {
        for (n in N){
          if (n>0){
            cat(we_ru[n], "")
          } else {
            cat(" ")
          }
        }
      }

    } else {
      if (lang %in% en){
        for (n in N){
          if (n>0){
            cat(week_en[n], "")
          } else {
            cat(" ")
          }
        }
      } else {
        for (n in N){
          if (n>0){
            cat(week_ru[n], "")
          } else {
            cat(" ")
          }
        }
      }
    }
  }
}
func_week(N, DEBUG_OFF)

