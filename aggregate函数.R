#aggregate函数#
x=data.frame(name=c("张三","李四","王五","赵六"),sex=c("M","M","F","F"),age=c(20,40,22,30),height=c(166,170,150,155))
aggregate(x[,3:4],by=list(sex=x$sex),FUN=mean)
