> setwd("~/Downloads/exdata-data-NEI_data")
> NEI <- readRDS("summarySCC_PM25.rds")
> library(ggplot2)
> # Subsetting the data for Baltimore City
> baltimore <- subset(NEI, fips == "24510")
>  # Aggregating by both year and type of emission
> Aggregated <- aggregate(Emissions ~ year + type, baltimore, sum)
> png("Plot3.png")
> qplot(year, Emissions, data = Aggregated, color = type, geom= "line")+ ggtitle("Total PM2.5 Emissions in Baltimore County by Source Type") + xlab("Year") + ylab("PM2.5 Emissions") 
