##read the data file
datasets<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
##extract the needed data from the whole data
dataset<-subset(datasets,Date=="1/2/2007"|Date=="2/2/2007")
##change the Date and Time to regular format
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")
x<-paste(dataset$Date,dataset$Time)
x<-strptime(x,"%Y-%m-%d %H:%M:%S")
##transform all the needed data into numerics
dataset$Sub_metering_1<-as.numeric(as.character(dataset$Sub_metering_1))
dataset$Sub_metering_2<-as.numeric(as.character(dataset$Sub_metering_2))
dataset$Sub_metering_3<-as.numeric(as.character(dataset$Sub_metering_3))
##clear local settings to avoid mistakes
Sys.setlocale("LC_ALL", "C")##clear local setting,turn Chinese to English
png(filename = "plot3.png",width = 480,height = 480)
plot(x,dataset$Sub_metering_1,type = "l",col="black",xlab="",ylab = "Energy sub metering")
lines(x,dataset$Sub_metering_2,type = "l",col="red")
lines(x,dataset$Sub_metering_3,type = "l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
