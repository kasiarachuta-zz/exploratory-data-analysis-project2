> setwd("~/Downloads/exdata-data-NEI_data")
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")
> library(ggplot2)
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> combustion.coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
> combustion.coal.sources <- SCC[combustion.coal,]
> emissions.coal.combustion <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC), ]
> emissions.coal.related <- summarise(group_by(emissions.coal.combustion, year), Emissions=sum(Emissions))
> png("Plot4.png")
> ggplot(emissions.coal.related, aes(x=factor(year), y=Emissions/1000,fill=year, label = round(Emissions/1000,2))) +
+ +     geom_bar(stat="identity") +   xlab("year") +
+ +     ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
+ +     ggtitle("Emissions from coal combustion-related sources in kilotons"
