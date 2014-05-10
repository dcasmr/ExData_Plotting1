d <- read.table( "household_power_consumption.txt", header=TRUE, sep = ";", na="?")
d$dataRange <- as.Date(d$Date,format="%d/%m/%Y")
d2 <- subset(d, d$dataRange == "2007-02-01" | d$dataRange == "2007-02-02")

png(file="plot2.png",width=480,height=480)
x <- paste(d2$dataRange, d2$Time)
MyDT <- strptime(x, "%Y-%m-%d %H:%M:%S")
plot(MyDT, d2$Global_active_power, type="l", xlab=" ", ylab="Global Active Power (Kilowatts)")
dev.off()



