#向量
a <- c(1,2,4,6,-3,8)			#数值型向量
a
a[3]
a[c(1,3,5)]
a[2:5]
b <- c("one","two","three")		#字符型向量
b
c <- c(TRUE,FALSE,TRUE,FALSE)	#逻辑性向量
c

#矩阵
#矩阵是一个二维数组，只是每个元素都拥有相同的模式（数值型、字符型或逻辑性）。
#可以通过函数matrix()创建矩阵
# mymatrix <- matrix(vector,				包含了矩阵的元素
# 				nrow=number_of_rows,		指定行的维数
# 				ncol=number_of_columns,		指定列的维数
# 				byrow=logical_value,		表明矩阵是按行填充(byrow=TRUE)还是按列填充(byrow=FALSE)
# 				dimnames=list(char_vector_rownames,char_vector_colnames))	包含了可选的，以字符型向量表示的行名和列名

y <- matrix(1:20,nrow=5,ncol=4)
y

cell <- c(1,26,24,68)
rnames <- c("R1","R2")
cnames <- c("C1","C2")
mymatrix <- matrix(cell,nrow=2,ncol=2,byrow=TRUE,dimnames=list(rnames,cnames)) #按行填充
mymatrix
mymatrix <- matrix(cell,nrow=2,ncol=2,byrow=FALSE,dimnames=list(rnames,cnames))	#按列填充
mymatrix

#矩阵元素的选择
x <- matrix(1:20,nrow=2)
x
x[2,]
x[,2]
x[2,2]
x[1,c(4,5)]

#数组
#数组（array)与矩阵类似，但是维度可以大于2，数组可以通过函数array()来创建，形式如下：
#myarray <- array(
# 					vector,				包含了数组中的数据
# 					dimensions,			数值型向量，给出了各个维度下标的最大值
# 					dinames)			是可选的、各维度名称标签的列表
dim1 <- c("A1","A2")
dim2 <- c("B1","B2","B3")
dim3 <- c("C1","C2","C3","C4")
myarray <- array(1:24,c(2,3,4),dimnames=list(dim1,dim2,dim3))
myarray

#数据框
#不同的列可包含不同的数据类型
#可通过函数data.frame()创建数据框
patientID <- c(1,2,3,4)
age <- c(13,24,32,18)
diabetes <- c("TYPE1","TYPE2","TYPE3","TYPE4")
status <- c("poor","inproved","excellent","poor")
patientdata <- data.frame(patientID,age,diabetes,status)
patientdata

patientdata[1,2]
patientdata[c("age","status")]
patientdata$age    							#$用来选取一个给定数据框中的某个特定变量
table(patientdata$age,patientdata$status)	#生成所需变量集合的列联表

#因子
#类别（名义型）变量和有序类别（有序型）变量在R中称为因子，
#因子决定了数据分析方式以及如何进行视觉呈现
#函数factor()以一个整数向量的形式存储类别值，整数的取值范围为[1....k]
#（其中k是名义型变量中唯一值的个数，同时一个由字符串（原始值）组成的内部向量将映射到这些整数上
# 例如：假设有向量：
diabetes <- c("type1","type2","type1","type1")
diabetes <- factor(diabetes)
# 此时该向量存储为(1,2,1,1),并在内部将其关联为1=type1，2=type2。
# 针对diabetes进行的任何分析都会将其作为名义型变量对待，并自动选择适合这一测量尺度的统计方法，
# 包括定类尺度、定序尺度、定距尺度、定比尺度中的定类尺度。
# 要表示有序性变量，需要为函数factor()指定参数ordered=TRUE。
# 对于字符型向量，因子的水平默认依照字母顺序创建。
# 可以通过指定levels选项来覆盖默认排序，即：
status <- c("poor","inproved","excellent","poor")
status <- factor(status,
			ordered=TRUE,
			levels=c("poor","inproved","excellent"))

# 列表
# 列表就是一些对象（或成分）的有序集合。
# 列表允许你整合若干（可能无关的）对象到单个对象名下
# 创建一个列表
g <- "my first list"							#字符串
h <- c(25,26,18,39)								#数值型向量
j <- matrix(1:10,nrow=5)						#矩阵
k <- c("one","two","three")						#字符型向量
mylist <- list(title=g,ages=h,j,k)				#创建列表
mylist											#输出整个列表
mylist[[2]]
mylist[["ages"]]

#数据的输入

#使用键盘输入数据

#使用函数edit()函数调用一个允许手动输入数据的文本编辑器
#具体步骤为：
#1、创建一个空数据集，其中变量名和变量的模式需与理想中的最终数据集一致
#2、针对这个数据对象调用文本编辑器，输入你的数据，并将结果保存回此数据对象中
# mydata <- data.frame(age=numeric(0),		#numeric(0)创建一个指定模式但不包含实际数据的变量
# 					gender=numeric(0),
# 					weight=numeric(0))
# mydata <- edit(mydata)

#从带分隔符的文本文件中导入数据
#其语法格式为：
# mydata <- read.table(file,				#所需导入文件名
# 					 header=local_value,	#header表明首行是否包含了变量名的逻辑值
# 					 sep="delimiter",		#sep用来指定分隔数据的分隔符
# 					 row.names="name")		#指定一个或多个行标识符的变量

# grades <- read.table(grade.csv,header=TRUE,sep=",",rownames="student")

# library(RODBC)							#使用RODBC包访问excel文件
# channel <- odbcConnectExcel(grade.xls)	
# mydataframe <- sqlFetch(channel,"123")	
# odbClose(channel)


#图形初阶
#使用图形
pdf("pdf/mygraph.pdf")
attach(mtcars)							#载入数据框mtcars
plot(wt,mpg)							#打开一个图形窗口并生成散点图
abline(lm(mpg~wt))						#添加最优拟合曲线
title("Regression of MPG on weight")	#添加标题
detach(mtcars)							#为数据框解除绑定
dev.off()

#小例子
pdf("pdf/mygraph2.pdf")
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)
plot(dose,drugA,type="b")				#将dose置于X轴，将drugA置于Y轴，绘制点集(x,y)
dev.off()

#使用par()函数来修改图形参数
#par()函数的调用格式为par(optionname=value,optionname=name,.....)
#不加参数的执行par()将生成一个含有当前图形参数设置的列表
#添加参数no.readonly=TRUE可以生成一个可以修改的当前图形参数列表
pdf("pdf/par.pdf")
opar <- par(no.readonly=TRUE)
par(lty=2,pch=17,cex=1,lwd=1)			#修改线条类型为虚线，将默认的点符号改为实心三角
plot(dose,drugA,type="b")
dev.off()

#符号和线条
# pch——指定绘制时使用的符号
# cex——指定符号的大小，为一个数值，表示绘图符号
# lty——指定线条类型
# lwd——指定线条宽度，以默认值的相对大小来表示

# 颜色
# 用于指定颜色的参数
# col——默认的绘图颜色。某些函数（如lines和pie）可以接受一个含有颜色值的向量并自动循环使用。
# 例如，如果设定col=c("red","blue")并需要绘制三条线，则第一条为红色，第二条为蓝色，第三条为红色
# col.axis——坐标轴刻度文字的颜色
# col.lab——坐标抽标签（名称）的颜色
# col.main——标题颜色
# col.sub——副标题颜色
# fg——图形的前景色
# bg——图形的背景色

# R中用于创建连续型颜色向量的函数：rainbow()、heat.colors()、terrain.colors()、
# topo.colors()、cm.colors()
# rainbow(10)可以生成10种连续性的“彩虹线”颜色
# gray()函数可以生成多阶灰度色
pdf("pdf/color.pdf")
n <-10
mycolor1 <- rainbow(n)
pie(rep(1,n))					#pie()函数用于绘制饼图
dev.off()

# 文本属性
# 用于控制文本大小的参数
# cex——表示相对于默认大小缩放倍数的数值
# cex.axis——坐标轴刻度文字的缩放倍数，类似于cex
# cex.lab——坐标抽标签（名称）的缩放倍数
# cex.main——标题的缩放倍数
# cex.sub——副标题的缩放倍数

# 用于指定字体族、字号和字样的参数
# font——整数。用于指定绘图使用的字体样式。
# font.axis——坐标抽刻度文字的字体样式
# font.lab——坐标抽标签（名称）的字体样式
# font.main——标题的字体样式
# font.sub——副标题的字体样式
# ps——字体磅值。文本的最终大小为ps*cex
# family——绘制文本时使用的字体族，标准的取值为：serif——衬线，sans——无衬线，mono——等宽
# 注：使用names(pdfFonts())来找出系统中的可用字体

# 图形尺寸与边界尺寸
# 用于控制图形尺寸和边界尺寸的参数
# pin——以英寸表示的图形尺寸（宽和高）
# mai——以数值向量表示的边界大小顺序为“下、左、上、右”，单位为英寸
# mar——以数值向量表示的边界大小顺序为“下、左、上、右”，单位为英分
pdf("pdf/color-and-size.pdf")
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)
opar <- par(no.readonly=TRUE)	#使用par()函数来修改图形参数，添加参数no.readonly=TRUE可以生成一个可以修改的当前图形参数列表
par(pin=c(2,3))		#设置图形尺寸
par(lwd=2,cex=1.5)	#设置线条宽度和符号大小
par(cex.axis=.75,font.axis=3)	#设置坐标轴刻度文字的缩放倍数和坐标轴刻度文字的字体样式
plot(dose,drugA,type="b",pch=19,lty=2,col="red",	#设置绘制时使用的符号，线条类型和颜色
	main="Clinical Trial for drugA",				#设置标题
	sub="This is hypothetical data",				#设置副标题
	xlab="Dosage",									#设置x轴标签
	ylab="Drug Response",							#设置y轴标签
	xlim=c(0,60),									#设置x轴范围
	ylim=c(0,70))									#设置y轴范围
plot(dose,drugB,type="b",pch=23,lty=6,col="blue",bg="green",
	main="Clinical Trial for drugB",
	sub="This is hypothetical data",
	xlab="Dosage",
	ylab="Drug Response",
	xlim=c(0,60),
	ylim=c(0,70))
par(opar)
dev.off()

#坐标轴
# 使用axis()函数来创建自定义坐标轴，其格式为：
# axis(side,at=,labels=,pos=,lty=,col=,las=,tck=,...)
# 坐标轴选项
# side——一个整数，表示在图形的哪边绘制坐标轴，（1-下，2-左，3-上，4-右）
# labels——一个数值型向量，表示需要绘制刻度线的位置
# pos——坐标轴线绘制位置的坐标（即与另一条坐标轴相交位置的值）
# lty——指定线条类型
# col——线条和刻度线颜色
# las——标签是否平行于（=0）或垂直于（=2）坐标轴
# tck——刻度线的长度，以相对于绘图区域大小的分数表示（负值表示在图形外侧，正值表示在图形内侧，
# 	 0表示禁用刻度，1表示绘制网格线）；默认值为-0.01

# 注：创建自定义坐标轴时，应当禁用高级绘图函数自动生成的坐标抽，参数axes=FALSE将禁用全部坐标轴，
# 包括坐标轴框架线，除非你添加了frame.plot=TRUE。
# 参数xaxt="n",和yaxt="n"将分别禁用x轴和y轴（会留下框架线，只是去除了刻度）。

pdf("pdf/axis.pdf")
x <- c(1:10)
y <- x
z <- 10/x
opar <- par(no.readonly=TRUE)
par(mar=c(5,4,4,8))	# mar——以数值向量表示的边界大小顺序为“下、左、上、右”，单位为英分
plot(x,y,type="b",
	pch=21,
	col="blue",
	lwd=2,
	yaxt="n",lty=3,ann=FALSE)
lines(x,z,type="b",		#添加一条直线
	pch=22,
	col="red",
	lty=2)
axis(2,				#在图形的左边绘制坐标轴
	at=x,			#需要绘制坐标轴的位置	
	labels=x,		#置于刻度线旁边的文字标签
	col.axis="red",	#颜色
	las=2)			#与坐标轴垂直
axis(4,
	at=z,
	labels=round(z,digits=2),	#round()函数：按指定的位数进对数值进行四舍五入
	col.axis="blue",
	las=2,
	cex.axis=0.7,
	tck=-.1)
mtext(
	"y=10/x",
	side=4,
	line=3,
	cex.lab=1,
	las=2,
	col="blue")
title("An Example of Creative Axis",
	xlab="X values",
	ylab="Y=X")
par(opar)
dev.off()

# 参考线
# 函数abline()可以用来为图形添加参考线，其使用格式为：
# abline(h=yvalues,x=xvalues)
# 函数abline()中也可以指定其他图形参数（如线条颜色、类型和宽度）.格式为：
# abline(h=c(1,5,7))

#图例
# 使用legent()函数来添加图例，其使用格式为：
# legend(location,title,legend,...)
# 图例选项
# location——指定图例的位置。
# title——图例标题的字符串，可选
# legend——图例标签组成的字符串向量
# bty——指定盒子样式
# bg——指定背景色
# cex——指定符号的大小
# text.col——指定文本颜色
# horiz=TRUE——水平放置图例

pdf("pdf/legend.pdf")
dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

opar <- par(no.readonly=TRUE)
par(lwd=2,cex=1.5,font.lab=2)
plot(dose,drugA,type="b",
	pch=15,
	lty=1,
	col="red",
	ylim=c(0,60),
	main="Drug A vs.Drug B",
	xlab="Drug Dosage",
	ylab="Drug Response")

lines(dose,drugB,type="b",
	pch=17,
	lty=2,
	col="blue")

abline(h=c(30),
	lwd=1.5,
	lty=2,
	col="gray")

# library(Hmisc)
# minor.tick(nx=3,
# 		ny=3,
# 		tick.ratio=0.5)

legend("topleft",
	inset=.05,
	title="Drug Type",
	c("A","B"),
	lty=c(1,2),
	pch=c(15,17),
	col=c("red","blue"))
par(opar)
dev.off()

# 文本标注
# 通过函数text()和mtext()函数将文本添加到图形上
# text()可向绘图区域内部添加文本
# text(location,"text to place",pos,...)
# mtext()则向图形的四个边角之一添加文本
# mtext("text to place",side,line=n,...)
# location——文本的位置参数
# pos——文本相对于位置参数的方位1下2左3上4右，
# 如果指定了pos，以就可以同时指定参数offset=作为偏移量，以相对于单个字符宽度的比例表示
# side——指定用来放置文本的边，1下2左3上4右。
# 可以指定参数line=来内移或外移文本，随着值的增加，文本将外移，
# 也可使用adj=0来将文本向左下对齐，或使用adj=1右上对齐

# 使用text()函数标示图形中的点

pdf("pdf/text-point.pdf")
attach(mtcars)
plot(wt,mpg,
	main="Mileage vs.Car weights",
	xlab="weight",
	ylab="Mileage",
	pch=18,
	col="blue")
text(wt,mpg,
	row.names(mtcars),
	cex=0.6,
	pos=4,
	col="red")
detach(mtcars)
dev.off()

# 图形的组合
# 使用函数par()和layout()函数组合多幅图形为一幅总括图形
# 可以在par()函数中使用图形参数mfrow=c(nrows,ncols)来创建按行填充的，行数为nrow，列数为ncols的图形矩阵
# 另外，可以使用nfcol=c(nrows,ncols)来按列填充矩阵

pdf("pdf/group-of-image.pdf")
attach(mtcars)
opar <- par(no.readonly=TRUE)

#将四幅图形排列为两行两列
par(mfrow=c(2,2))				
plot(wt,mpg,
	main="Scatterplot wt vs.mpg")
plot(wt,disp,
	main="Scatterplot of wt vs.disp")
hist(wt,
	main="Histogram of wt")
boxplot(wt,
	main="Boxplot of wt")

#将四幅图形排列为三行一列
par(mfrow=c(3,1))	
hist(wt)
hist(mpg)
hist(disp)
#高级函数hist()包含了一个默认的标题，
#使用main=""可以禁用它，也可使用ann=FALSE来禁用所有标题和标签

#函数layout()的使用格式为layout(mat),其中的mat为一个矩阵，指定了所要组合的多个图形的所在位置
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
hist(wt)
hist(mpg)
hist(disp)

# 在layout()函数中使用widths=和heights=两个参数更加精确地控制图形大小

layout(matrix(c(1,1,2,3),2,2,byrow=TRUE),
	widths=c(3,1),
	heights=c(1,2))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)
dev.off()


# 图形布局的精细控制：使用图形参数fig=
pdf("pdf/fig.pdf")

# 添加散点图
attach(mtcars)
opar <- par(no.readonly=TRUE)
par(fig=c(0,0.8,0,0.8))			#fig=将散点图设定为占据横向范围0~0.8，纵向范围为0~0.8
plot(mtcars$wt,mtcars$mpg,
	xlab="Miles per Gallon",
	ylab="Car Weight")

# 在散点图上方添加箱线图
par(fig=c(0,0.8,0.55,1),new=TRUE)	#箱线图横向占据横向范围0~0.8，纵向范围为0.55~1
boxplot(mtcars$wt,horizontal=TRUE,axes=FALSE)  
# horizontal:设置放置方式，值为true时，水平放置
# axes：设置坐标轴

# 在散点图右侧添加箱线图
par(fig=c(0.65,1,0,0.8),new=TRUE)	#箱线图横向占据横向范围0。65~1，纵向范围为0~0.8
boxplot(mtcars$mpg,axes=FALSE)
detach(mtcars)
dev.off()
# 在本例中，试想完整的绘图区域，左下角坐标为(0,0)，右上角坐标为(1,1)
# 参数fig的取值是一个形如c(x1,x2,y1,y2)的数值向量
# fig=默认会新建一幅图形，所以在添加一幅图到现有图形时，需设定参数new=TRUE

#在区间[-3,3]上绘制正态曲线
pdf("pdf/pretty-3_3.pdf")
x <- pretty(c(-3,3),30)
y <- dnorm(x)
plot(x,y,
	type="l",
	xlab="NormalDevidate",
	ylab="Density",
	yaxs="i")
dev.off()

runif(5)
runif(5)
set.seed(12345)
runif(5)
set.seed(12345)
runif(5)

library(MASS)
options(digits=3)
set.seed(1234)

states <- data.frame(state.region,state.x77)
means <- aggregate(states$Illiteracy,by=list(state.region),FUN=mean)
means
means <- means[order(means$x),]
means
barplot(means$x,names.arg=means$Group.1)
title("Mean Illiteracy Rate")

library(vcd)
attach(Arthritis)
counts <- table(Treatment,Improved)
spine(counts,main="Spinogram Example")
detach(Arthritis)

par(mfrow=c(2,2))
a <- c(10,12.4,16,8)
labels <- c("China","UK","American","Japen")
pie(a,
	labels=labels,
	main="Simple pie Chart")

percent <- round(a/sum(a)*100)
labels <- paste(labels, percent) # add percents to labels
labels <- paste(labels,"%",sep="") # ad % to labels
pie(a,
	labels = labels,
	main="Pie Chart of Countries")

library(plotrix)
pie3D(a,
	labels=labels,
	main="Simple pie Chart")

par(mfrow=c(1,2))
hist(mtcars$mpg,
	main="简单直方图")

hist(mtcars$mpg,
	breaks=12,
	xlab="Miles Par Gallon",
	main="指定组数的直方图")

d <- density(mtcars$mpg)
plot(d)

par(lwd=4)
d <- density(mtcars$mpg)
plot(d,
	main="Kernel Density of Miles Par Gallon")
	polygon(d,col="turquoise3",border="khaki1")
	rug(mtcars$mpg,col="brown")

par(lwd=3)
library(sm)
attach(mtcars)

cyl.f <- factor(cyl,levels=c(4,6,8),
				labels=c("4 cylinder","6 cylinder","8 cylinder"))
				# 创建分组因子
sm.density.compare(mpg,cyl,
				xlab="Miles Par Gallon")
title("main=MPG Distribution by Car cylinders")
				# 绘制密度图并添加标题
colfill <- c(2:(1+length(levels(cyl.f))))
				# 创建颜色向量
legend(locator(1),
				# 表示用鼠标点击想让图例出现的位置来交互的放置这个图例
	levels(cyl.f),
	fill=colfill)
			 	# 使用向量colfill来指定颜色
detach(mtcars)

boxplot(mtcars$mpg,
	main="Box plot",
	ylab="Miles per Gallon")

boxplot(mpg~cyl,
				# 为变量cyl的每个值并列的生成变量mpg的箱线图
	data=mtcars,
	main="Car Mileage Data",
	xlab="Number of cylinders",
	ylab="Miles Per Gallon")

boxplot(mpg~cyl,
	data=mtcars,
	varwidth=TRUE,
	notch=TRUE,
	col="green",
	main="Car Mileage Data",
	xlab="Number of cylinders",
	ylab="Miles Per Gallon")

mtcars$syl.f <- factor(mtcars$cyl,
					levels=c(4,6,8),
					labels=c("4","6","8"))
mtcars$am.f <- factor(mtcars$am,
					levels=c(0,1),
					labels=c("auto","standard"))
boxplot(mpg ~ am.f *syl.f,
	data=mtcars,
	varwidth=TRUE,
	col=c("gold","darkgreen"),
	main="MPG Distribution by auto Type",
	xlab="Auto Type")

library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1,x2,x3,
	names=c("4 cyl","6 cyl","8 cyl"),
	col="gold")
title("Violin Plots of Miles Par Gallon")

dotchart(mtcars$mpg,
	labels=row.names(mtcars),
	cex=.7,
	main="Gas Mileage for Car Models",
	xlab="Miles Par Gallon")

x <- mtcars[order(mtcars$mpg),]
			# 根据参数mpg进行排序
x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,
	labels = row.names(x),
	groups = x$cyl,
	color = x$color,
	cex=.7,
	pch=19,
	main="Gas Mileage for Car Models\ ngroups by cylinder",
	xlab="Miles Par Gallon")

vars <- c("mpg","hp","wt")
summary(mtcars[vars])

library(Hmisc)
vars <- c("mpg","hp","wt")
describe(mtcars[vars])

library(pastecs)
vars <- c("mpg","hp","wt")
stat.desc(mtcars[vars],
		basic=TRUE,
		desc=TRUE,
		norm=TRUE,
		p=0.95)

vars <- c("mpg","hp","wt")
dstats <- function(x)(c(mean=mean(x),sd=sd(x)))
by(mtcars[vars],mtcars$am,dstats)

library(doBy)
vars <- c("mpg","hp","wt")
summaryBy(mpg,hp,wt~am,data=mtcars,FUN=mean)

library(reshape)
vars <- c("mpg","hp","wt")
dstats <- function(x)(c(n=length(x),mean=mean(x),sd=sd(x)))
dfm <- melt(mtcars,measure.vars=c("mpg","hp","wt"),
			id.vars=c("am","cyl"))
cast(dfm,am + cyl + variable ~ .,dstats)