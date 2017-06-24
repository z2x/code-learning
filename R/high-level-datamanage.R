#高级数据管理
#均值和标准差的计算:

x <- c(1:8)
#方式一：
mean(x)
sd(x)
#方式二：
n <- length(x)
meanx <- sum(x) / n
meanx
css <- sum((x - meanx)^2)
sdx <- sqrt(css / (n - 1))
sdx

