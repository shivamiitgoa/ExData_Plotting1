powerCosumptionData <- read.delim("../exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",
                                  sep=";")
powerCosumptionData$Date <- as.Date(powerCosumptionData$Date,format = "%d/%m/%Y")
data1 <- subset(powerCosumptionData, Date >= as.Date("01/02/2007",format = "%d/%m/%Y"))
datafinal <- subset(data1, Date <= as.Date("02/02/2007",format = "%d/%m/%Y"))
datafinal$Global_active_power <- as.numeric(datafinal$Global_active_power)
datafinal$datetime <- strptime(paste(datafinal$Date,datafinal$Time),format = "%Y-%m-%d %H:%M:%S")
plot(x=datafinal$datetime,y=datafinal$Sub_metering_1,type = 'l',col="black",ylab = "Energy sub metering",xlab = "")
lines(x=datafinal$datetime,y=datafinal$Sub_metering_2,col="red")
lines(x=datafinal$datetime,y=datafinal$Sub_metering_3,col="blue")
legend("topright",lwd=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()