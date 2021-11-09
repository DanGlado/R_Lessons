options(device="windows")
generate.supply <- function(n=30, min=20, max=100){
  return (sample(x = min:max, size = n, replace=TRUE))
}

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

plot(generate.supply(),
     fg = "black",
     col="red",
     pch=23,
     type="h",
     lwd=3,
     main="Supply_graph_3",
     xlab = "Days",
     ylab = "Products",
     sub = "from official source")
