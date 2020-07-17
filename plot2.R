f <- read.delim("household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?")
f$Date <- as.Date(f$Date, format="%d/%m/%Y")
data <- subset(f,Date == "2007-02-01" | Date == "2007-02-02")
rm(f)
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)
plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")