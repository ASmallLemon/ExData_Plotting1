##read the data file
datasets<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
##extract the needed data from the whole data
dataset<-subset(datasets,Date=="1/2/2007"|Date=="2/2/2007")
##change the Date and Time to regular format
dataset$Date<-as.Date(dataset$Date,"%d/%m/%Y")
x<-paste(dataset$Date,dataset$Time)
x<-strptime(x,"%Y-%m-%d %H:%M:%S")
##transform all the needed data into numerics
dataset$Global_active_power<-as.numeric(as.character(dataset$Global_active_power))
dataset$Global_reactive_power<-as.numeric(as.character(dataset$Global_reactive_power))
dataset$Voltage<-as.numeric(as.character(dataset$Voltage))
dataset$Sub_metering_1<-as.numeric(as.character(dataset$Sub_metering_1))
dataset$Sub_metering_2<-as.numeric(as.character(dataset$Sub_metering_2))
dataset$Sub_metering_3<-as.numeric(as.character(dataset$Sub_metering_3))
##open png device and create needed png file
png(filename = "plot4.png",width = 480,height = 480)
##set the position for four plots
par(mfrow = c(2,2),margin=c(1,1,1,1))
##set four plots in order
plot(x,dataset$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(x,dataset$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(x,dataset$Sub_metering_1,type = "l",col="black",xlab="",ylab = "Energy sub metering")
lines(x,dataset$Sub_metering_2,type = "l",col="red")
lines(x,dataset$Sub_metering_3,type = "l",col="blue")
legend("topright",lty=1,bty="n",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(x,dataset$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power")
##turn off png device
dev.off()
                                        
