NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total <- sapply(split(NEI$Emissions,NEI$year),sum)
png("plot1.png")
barplot(total,main = "Total PM2.5 Emission from all sources", xlab = "Years", ylab = "Emission (tons)",col="darkblue",)
dev.off()