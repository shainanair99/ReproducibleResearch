library(ggplot2)
Q2<-data.frame(tapply(activity$steps,activity$date,sum,na.rm=TRUE))
Q2$date<-rownames(Q2)
rownames(Q2)<-NULL
names(Q2)[[1]]<-"Total Steps taken per day"
png("plot1.png")
#Total Steps by date bar chart
ggplot(Q2,aes(y=Q2$`Total Steps`,x=Q2$date))+geom_bar(stat="identity") + ylab("Frequency")+xlab("Total Steps")+ggtitle("Total Steps by date")
dev.off()

##next step is to calculate the mean and median 
mean(dailysum)
## [1] 10766

median(dailysum)
## [1] 10765
