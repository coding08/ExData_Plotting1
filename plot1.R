f <- read.delim("household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?")
f$Date <- as.Date(f$Date, format="%d/%m/%Y")
data <- subset(f,Date == "2007-02-01" | Date == "2007-02-02")
rm(f)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot1.png", width=480, height=480)
hist(data[,3],col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()