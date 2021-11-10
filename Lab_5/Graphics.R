# № 1
options(device="windows")
generate.supply <- function(n=30, min=20, max=100){
  return (sample(x = min:max, size = n, replace=TRUE))
}
# № 2
# plot(generate.supply(),
#      fg = "yellow",
#      col="blue",
#      cex=2,
#      pch=23,
#      bg="grey",
#      type="b",
#      lwd=2,
#      main="Supply_graph_1",
#      xlab = "Days",
#      ylab = "Products"
#      sub = "from official source")

# plot(generate.supply(),
#      fg = "pink",
#      col="green",
#      pch=8,
#      type="h",
#      lwd=5,
#      main="Supply_graph_2",
#      xlab = "Days",
#      ylab = "Products",
#      sub = "from official source")

# № 3

# shop1 <- generate.supply(n=20)
# shop2 <- generate.supply(n=20)

# plot(shop1,
#      fg = "pink",
#      col="red",
#      pch=8,
#      type="b",
#      lwd=2,
#      main="Supply_graph_2shops",
#      xlab = "Days",
#      ylab = "Products",
#      sub = "from official source")
#
# lines(shop2, pch=17, col="forestgreen", type="b", lwd=2, cex=1.5)
#
# legend(1, 95, legend=c("shop1", "shop2"),
#        col=c("red", "forestgreen"), lty=1:1, cex=0.8,
#        title="Lines_supply", text.font=4, bg='lightblue')

# shop1 <- generate.supply(n=20)
# shop2 <- generate.supply(n=20)

# plot(shop1,
#      fg = "black",
#      col="blue",
#      type="S",
#      lwd=2,
#      main="Supply_graph_2shops",
#      xlab = "Days",
#      ylab = "Products",
#      sub = "from official source")
#
# lines(shop2, col="grey", type="S", lwd=2)
#
# legend("top", legend=c("shop1", "shop2"),
#        col=c("blue", "grey"), lty=1:1, cex=0.8,
#        title="Lines_supply", text.font=4, bg='lightblue')

# № 4
# shop1 <- generate.supply(n=10)
# shop2 <- generate.supply(n=10)
# shop3 <- generate.supply(n=10)
# shop4 <- generate.supply(n=10)
# shop5 <- generate.supply(n=10)
#
# plot(shop1,
#      fg = "black",
#      col="yellow",
#      type="b",
#      lwd=2,
#      pch=15,
#      main="Supply_graph_5shops",
#      xlab = "Days",
#      ylab = "Products",
#      sub = "from official source")
#
# lines(shop2,
#       col="red",
#       type="b",
#       pch="*",
#       lwd=1.5)
#
# lines(shop3,
#       col="blue2",
#       type="b",
#       pch="$",
#       lwd=1.5)
#
# lines(shop4,
#       col="forestgreen",
#       type="b",
#       pch=23,
#       lwd=1.5)
#
# lines(shop5,
#       col="purple",
#       type="b",
#       lwd=1.5)
#
# legend("topright", legend=c("shop1", "shop2", "shop3", "shop4", "shop5"),
#        col=c("yellow", "red", "blue2", "forestgreen", "purple"), lty=1, cex=0.7,
#        title="Lines_supply", text.font=3, bg='lightgrey')



# shop1 <- generate.supply(n=10)
# shop2 <- generate.supply(n=10)
# shop3 <- generate.supply(n=10)
# shop4 <- generate.supply(n=10)
# shop5 <- generate.supply(n=10)
#
# plot(shop1,
#      fg = "red",
#      col="orange",
#      type="b",
#      lwd=2,
#      pch=15,
#      main="Supply_graph_5shops",
#      xlab = "Days",
#      ylab = "Products",
#      sub = "from official source")
#
# lines(shop2,
#       col="brown",
#       type="b",
#       pch="O",
#       lwd=1.5)
#
# lines(shop3,
#       col="blue2",
#       type="b",
#       pch="$",
#       lwd=1.5)
#
# lines(shop4,
#       col="green3",
#       type="b",
#       pch=22,
#       lwd=1.5)
#
# lines(shop5,
#       col="purple",
#       type="b",
#       lwd=1.5)
#
# legend("topright", legend=c("shop1", "shop2", "shop3", "shop4", "shop5"),
#        col=c("orange", "brown", "blue2", "green3", "purple"), lty=1, cex=0.7,
#        title="Lines_supply", text.font=3, bg='lightblue')

# № 5

# plot(c(1:5),
#      c(sum(shop1),sum(shop2),sum(shop3),sum(shop4),sum(shop5)),
#      fg = "red",
#      col=c("orange", "brown", "blue2", "green3", "purple"),
#      type="h",
#      lwd=2,
#      pch=15,
#      main="Supply_graph_sum_5shops",
#      xlab = "Shops",
#      ylab = "Products",
#      sub = "from insider's source")
#
# legend("topright", legend=c("shop1", "shop2", "shop3", "shop4", "shop5"),
#        col=c("orange", "brown", "blue2", "green3", "purple"), lty=1, cex=0.7,
#        title="Lines_supply", text.font=3, bg='lightblue')

# № 6
generate.sale <- function(sup){
  sale <- c()
  for (elem in sup){
    sale <- c(sale, sample(0:elem, size=1))
  }
  return (sale)
}

# № 7
# shop <- generate.supply(n=10, max=60, min=25)
# sale <- generate.sale(shop)
#
# plot(sale,
#      type = "h",
#      lwd = 7,
#      col = "red",
#      main="Supply_graph_sum_5shops",
#      xlab = "Day",
#      ylab = "Products",
#      sub = "from insider's source")
#
# lines(shop,
#       lwd = 4,
#       type = "h",
#       col = "green",)
#
# legend("topright", legend=c("sales", "supply"),
#        col=c("red", "green"), lty=1, cex=0.7,
#        title="Lines_supply", text.font=3, bg='lightblue')


# № 8
shop1 <- generate.supply(n=15, max=80, min=20)
sale1 <- generate.sale(shop1)
shop2 <- generate.supply(n=15, max=80, min=20)
sale2 <- generate.sale(shop2)
shop3 <- generate.supply(n=15, max=80, min=20)
sale3 <- generate.sale(shop3)
#
# plot(sale1,
#      type = "b",
#      lwd = 2,
#      col = "green",
#      main="Statistic_supply_sales_3shops",
#      xlab = "Day",
#      ylab = "Products",
#      sub = "from insider's source")
#
# lines(shop1,
#       lwd = 2,
#       type = "b",
#       col = "lightgreen",)
#
# lines(sale2,
#       lwd = 2,
#       type = "b",
#       col = "red",)
# lines(shop2,
#       lwd = 2,
#       type = "b",
#       col = "pink",)
#
# lines(sale3,
#       lwd = 2,
#       type = "b",
#       col = "blue",)
#
# lines(shop3,
#       lwd = 2,
#       type = "b",
#       col = "lightblue",)
#
# legend("topright", legend=c("sale1", "supply1", "sale2", "supply2", "sale3", "supply3"),
#        col=c("green", "lightgreen", "red", "pink", "blue", "lightblue"), lty=1, cex=0.7, lwd = 2,
#        title="Lines_supply", text.font=3, bg='lightcyan')

# № 9
means <- cbind(shop1-sale1, shop2-sale2, shop3-sale3)
means
barplot(t(means), beside = FALSE,
        col = topo.colors(3),
        main="Statistic_supply_sales_3shops",
        xlab = "Day",
        ylab = "Products",
        sub = "from insider's source")

legend("topright", legend=c("n-sale1", "n-sale2", "n-sale3"),
       col= topo.colors(3), lty=1, cex=0.9, lwd = 2,
       title="Lines_supply", text.font=3, bg='lightcyan')
