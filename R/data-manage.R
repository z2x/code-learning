#csv文件的导入
pdf("pdf/leadership.pdf")
leadership <- read.csv("leadership.csv")
leadership
leadership$age[leadership$age == 99] <- NA 	#重编码某些值为缺失值
leadership

#变量的重编码
leadership <- within(leadership,{
	agecat <- NA 					#类别型变量agecat(Elder,Middle Aged,Young)
	agecat[age > 75]				<- "Elder"
	agecat[age >= 55 & age < 75]	<- "Middle Aged"
	agecat[age < 55]				<- "Young" 
})
leadership

# 变量的重命名
# 使用reshape包中的rename函数进行变量的重命名
library(reshape)
leadership <- rename(leadership,
					c(manage="manage ID",data="test date"))
leadership
names(leadership)
names(leadership)[2] <- "testdate"
leadership

#缺失值
#使用函数is.na()来检测缺失值是否存在
is.na(leadership)
is.na(leadership[,6:10])				#将数据框限定到第六列至第十列

a <- sum(leadership$age,na.rm=TRUE)		#使用na.rm=TRUE，在计算之前移除缺失值并利用剩余值进行计算
a

newdata <- na.omit(leadership)			#通过na.omit()移除所有含有缺失值的观测
newdata

#日期值
#日期值通常以字符串的方式输入到R中，然后转化为以数值形式存储的日期变量。
#函数as.date()用于执行这种转化，其语法格式为：
#as.date(x,"input_format")
#x是字符型数据
#input_format则给出了用于读入日期的适当格式
myformat <- "%m/%d/%Y"
leadership$testdate <- as.Date(leadership$testdate,myformat)
leadership$testdate

Sys.Date()						#返回当天的日期
date()							#返回当前的日期和时间

# 使用函数format（x,format="out_format")来输出指定格式的日期值，并且可以提取日期值中的某些部分
today <- Sys.Date()
format(today,"%B %d %Y")

# 日期值的算术运算
date1 <- as.Date("1993-11-02")
date2 <- Sys.Date()
old <- date2 - date1
old

#使用difftime()来计算时间间隔，并以星期，天，时，分，秒来表示。
today <- Sys.Date()
dob <- as.Date("1993-11-02")
difftime(today,dob,units="weeks")

# 将日期转换为字符型变量
# 函数为：as.character(),格式为：
# strDate <- as.character(dates)

#转换数据类型
is.numeric(leadership$q1)
as.character(leadership$q1)

#数据排序
#使用order()函数对一个数据框进行排序
#默认的排序方式是升序，在排序变量前边加一个减号即可得到降序的排序结果
newsdata <- leadership[order(leadership$age)]
newsdata
attach(leadership)
newdata <- leadership[order(gender,age)]
newdata
detach(leadership)

# 数据集的合并
# 
# 使用merge()函数横向合并两个数据框
# 在多数情况下，两个数据框是通过一个或多个共有变量进行联结的
# total <- merge(dataframeA,dataframeB,by="ID")
# total <- merge(dataframeA,dataframeB,by=c("ID","country"))
# 如果要直接横向合并两个矩阵或数据框，并且不需要指定一个公共索引，那么可以直接使用函数cbind():
# total <- cbind(a,b)
# 使用cbind()函数时每个对象必须拥有相同的函数，且要以相同的顺序排序
#
#使用rbind()函数纵向合并两个数据框（数据集）：
#tatal <- rbind(dataframeA,dataframeB)
#两个数据框必须拥有相同的变量，顺序不一定相同
#
#
# 选入、保留变量
# 数据框中的元素通过dataframe[row indices,clumn indices]这样的记号来访问，也可沿用这种方式来选择变量。
newdata <- leadership[,c(6:10)]
newdata
# (,)表示默认选择所有行
myvar <- c("q1","q2","q3","q4","q5")
newdata <- leadership[myvar]
newdata

myvar <- paste("q",1:5,sep="")
newdata <- leadership[myvar]
newdata

# 剔除（丢弃）变量
# 如果某个变量中有若干个缺失值，在分析前就需要将其丢弃
myvar <- names(leadership) %in% c("q3","q4")
newsdata <- leadership[!myvar]
newsdata
# names(leadership)生成了一个包含所有变量名的字符型向量：
# c("manageID","testdate","country","gender","age","q1","q2","q3","q4","q5")。
# names(leadership) %in% c("q3","q4")返回了一个逻辑型向量，
# names(leadership)中每个匹配q3或q4的元素的值为TRUE,反之为FALSE,即：
# c(FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,FALSE)。
# 运算符(!)将逻辑值反转，即：
# c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE)。
# leadership[c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,FALSE,TRUE)]
# 选择了逻辑值为TRUE的列，于是q3和q4被剔除了。

# 在知道变量位置的时候，也可使用以下语句进行变量剔除
newdata <- leadership[c(-8,-9)]
newdata

# 选入观测
newdata <- leadership[1:3,]		#选择前三行进行数据观测
newdata <- leadership[which(leadership$gender == "M" & leadership$age > 30),]
newdata

attach(leadership)
newdata <- leadership[which(gender =='M' & age > 30),]
newdata
detach(leadership)

attach(leadership)
newdate <- as.Date(testdate,"%m/%d/%y")
startdate <- as.Date("2009-01-01")
enddate <- as.Date("2009-12-31")
date <- leadership[which(testdate >= startdate & testdate <= enddate),]
date
detach(leadership)

# 使用subset函数进行选择变量和观测
attach(leadership)
newdata <- subset(leadership,age >= 35 & country == 'UK',select=c(q1,q2,q3,q4,q5))
newdata
detach(leadership)

# 随机抽样
# sample()函数能够从数据中（有放回或无放回的）抽取大小为n的一个随机样本

attach(leadership)
mysample <- leadership[sample(1:nrow(leadership),3,replace=FALSE),]
mysample
detach(leadership)

#