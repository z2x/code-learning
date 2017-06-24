# 1.下载中国地图GIS数据，并保存进入工作目录

# 2.安装相关扩展包
# install.packages()
# 加载所需扩展包
# library()

# 画一下全国范围的区域，可以用如下代码：
pdf("1.pdf")
library("maps")
library("mapdata")
mydat <- readShapePoly("bou2_4p.shp")
plot(mydat)
dev.off()