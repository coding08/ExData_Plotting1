library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI1 <- subset(NEI, fips == "24510")
name <- sort(unique(NEI1$type))
splitdf <- split(NEI1,NEI1$type)
k <- numeric()
for(x in name) {
  y <- sapply(split(splitdf[[x]]$Emissions,splitdf[[x]]$year),sum)
  y <- as.numeric(y)
  k <- c(k,y)
}
df <- data.frame(source = rep(name,each=4), year = rep(c(1999,2002,2005,2008),length = 16))
df$sum <- k
textt <- data.frame(label=c("Decrease","Decrease","Decrease","Increase"), source = name)

g <- ggplot(df, aes(year, sum))+ geom_point() + facet_grid(. ~ source) + geom_smooth(method = "lm",se=FALSE) + labs(title = "PM2.5 Emissions from different types of sources", x= "Years", y = "Emission (tons)") + geom_text(data = textt,mapping = aes(x=2004, y=1000,label = label))
ggsave("plot3.png",plot = g,width=12, height=10,dpi=300)