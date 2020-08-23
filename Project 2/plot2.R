NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI1 <- subset(NEI,fips == "24510")
total <- sapply(split(NEI1$Emissions,NEI1$year),sum)
png("plot2.png")
barplot(total,main = "Baltimore City(Maryland) Emissions", xlab = "Years", ylab = "Total Emission (tons)",col="darkred")
dev.off()