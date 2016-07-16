> setwd("~/Downloads/exdata-data-NEI_data")
> 
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")
> library(ggplot2)
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> baltimofd.emissions<-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
> baltimore.emissions<-summarise(group_by(filter(NEI, fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
> losangeles.emissions<-summarise(group_by(filter(NEI, fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
> baltimore.emissions$County <- "Baltimore City, MD"
> losangeles.emissions$County <- "Los Angeles County, CA"
> both.emissions <- rbind(baltimore.emissions, losangeles.emissions)
> ggplot(both.emissions, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
+     geom_bar(stat="identity") + 
+     facet_grid(County~., scales="free") +
+     ylab(expression("total PM"[2.5]*" emissions in tons")) + 
+     xlab("year") +
+     ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))
