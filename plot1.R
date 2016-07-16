

> setwd("~/Downloads/exdata-data-NEI_data")
> NEI <- readRDS("summarySCC_PM25.rds")
> 
> # First, I need to aggregate by year to calculate the total emissions
> AgggregatedByYr <- aggregate(Emissions ~ year, NEI, sum)
> barplot(height = AgggregatedByYr$Emissions, names.arg=AgggregatedByYr$year, xlab = "Year", ylab = "Total PM2.5 Emission", main = "Total PM2.5 Emissions from All Sources")
> dev.off()
