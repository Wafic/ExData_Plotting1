data <- read.csv(file = "hh_power_con.csv", sep=",", na.strings="?")
View(data)

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(data$Global_active_power, col="red", breaks = 11, main = "Global Active Power", 
xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))

dev.off()