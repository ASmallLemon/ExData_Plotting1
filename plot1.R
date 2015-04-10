##read the data file
datasets<-read.table("household_power_consumption.txt",sep = ";",header = TRUE)
##extract the needed data from the whole data
dataset<-subset(datasets,Date=="1/2/2007"|Date=="2/2/2007")
##create and open a png file
png(filename = "plot1.png",width = 480,height = 480)
##draw the needed histogram and set needed labels
hist(as.numeric(as.character(dataset$Global_active_power)),col="Red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")
##close png device
dev.off()
