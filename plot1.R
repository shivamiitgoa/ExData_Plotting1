powerCosumptionData <- read.delim("../exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt",
                                  sep=";")
powerCosumptionData$Date <- as.Date(powerCosumptionData$Date,format = "%d/%m/%Y")
data1 <- subset(powerCosumptionData, Date >= as.Date("01/02/2007",format = "%d/%m/%Y"))
datafinal <- subset(data1, Date <= as.Date("02/02/2007",format = "%d/%m/%Y"))
datafinal$Global_active_power <- as.numeric(datafinal$Global_active_power)
hist(datafinal$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power")
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
