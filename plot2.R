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
##clear local settings to avoid mistakes
Sys.setlocale("LC_ALL", "C")
png(filename = "plot2.png",width = 480,height = 480)
plot(x,dataset$Global_active_power,type="l",xlab="",ylab="Global Active Power(killowatts)")
dev.off()
