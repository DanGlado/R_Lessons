is.null(list())     # FALSE
is.null(pairlist()) # TRUE
is.null(integer(0)) # FALSE
is.null(logical(0)) # FALSE
Nu.01 <- list(a = 1, b = "c")
as.null(Nu.01) # as Null
Nu.01
typeof(Nu.01) # list

100000^10^10^10^10^10^100000000 # Inf
1/0 # Inf

NaN + NaN # NaN
0/0 # NaN
0*(1/0) # NaN

z <- 5
z[2] # NA
z[10] <- -9
z # Появлись NA
x <- c(1, 2, 3, NA)
mean(x) # NA


