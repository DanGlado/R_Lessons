# options(device="windows")
dev.new(quartz_off_screen)
dev.list()
# plot(x=res, fg = "black", col="green", cex=3, pch=23, bg="yellow", type="b", lwd=3)

# рисуем вертикальные линии от 1 до 30 зеленым цветом
# рисуем горизонтальные линии синим цветом
# abline(v = seq(1,30,1), h = seq(-5,21,1), col = "blue", lty=3, lwd=0.5)

# ?plot.default

x2 <- seq(-2,25,length.out = 37)
y2 <- 2+x2/3*sin(x2^0.9)
# points(y=y2, x=x2, pch=17, col="forestgreen", type="b", lwd=2, cex=1.5)
# ?legend
# colors()
