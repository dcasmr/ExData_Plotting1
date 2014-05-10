d <- read.table( "household_power_consumption.txt", header=TRUE, sep = ";", na="?")
d$dataRange <- as.Date(d$Date,format="%d/%m/%Y")
d2 <- subset(d, d$dataRange == "2007-02-01" | d$dataRange == "2007-02-02")
x <- paste(d2$dataRange, d2$Time)
MyDT <- strptime(x, "%Y-%m-%d %H:%M:%S")


png(file="plot3.png",width=480,height=480)
plot(MyDT, d2$Sub_metering_1, type="l", col = "black", xlab=" ", ylab="Energy sub metering")
lines(MyDT, d2$Sub_metering_2, type="l", col = "red")
lines(MyDT, d2$Sub_metering_3, type="l", col = "blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       
       lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue")) 
dev.off()