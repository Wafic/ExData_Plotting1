data <- read.csv(file = "hh_power_con.csv", sep=",", na.strings="?")

png(filename = "plot3.png", width = 480, height = 480, units = "px")

date <- as.Date(data$Date, format = "%d/%m/%Y")

data["coerce"] <- NA

data$coerce <- paste(data$Date, data$Time, sep=" ")
data$coerce <- strptime(data$coerce, format = "%d/%m/%Y %H:%M:%S")
x <- as.POSIXct(data$coerce)

y1 <- as.numeric(as.character(data$Sub_metering_1))
y2 <- as.numeric(as.character(data$Sub_metering_2))
y3 <- as.numeric(as.character(data$Sub_metering_3))


plot(x, y1, type="l", ylab = "Energy sub metering", xlab="", col = "black")
lines(x, y2, type="l", col="red")
lines(x, y3, type="l", col="blue")
legend("topright",col=c("black","red","blue" ),pch="-",lty=1, lwd=2, bty="y", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
