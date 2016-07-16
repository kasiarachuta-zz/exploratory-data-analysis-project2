> setwd("~/Downloads/exdata-data-NEI_data")
> NEI <- readRDS("summarySCC_PM25.rds")
> 
> # Subsetting the data just for Baltimore
> 
> baltimore <- subset(NEI, fips == "24510")
> # Again, aggregating by year to get the total value
> AggregatedBaltimore <- aggregate(Emissions ~ year, baltimore, sum)
> png('plot2.png')
> barplot(height=AggregatedBaltimore$Emissions, names.arg=AggregatedBaltimore$year, xlab = "Year", ylab ="PM2.5 Emissions", main = "Baltimore PM2.5 Emissions")
