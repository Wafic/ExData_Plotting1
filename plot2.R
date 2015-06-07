data <- read.csv(file = "hh_power_con.csv", sep=",", na.strings="?")

png(filename = "plot2.png", width = 480, height = 480, units = "px")

date <- as.Date(data$Date, format = "%d/%m/%Y")

data["coerce"] <- NA

data$coerce <- paste(data$Date, data$Time, sep=" ")
data$coerce <- strptime(data$coerce, format = "%d/%m/%Y %H:%M:%S")
x <- as.POSIXct(data$coerce)
View(x)

plot(x, data$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

dev.off()