> setwd("~/Downloads/exdata-data-NEI_data")
> NEI <- readRDS("summarySCC_PM25.rds")
> SCC <- readRDS("Source_Classification_Code.rds")
> library(ggplot2)
> library(dply2)
Error in library(dply2) : there is no package called ‘dply2’
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> baltimore.emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
> baltimore.emissions.byyear <- summarise(group_by(baltimore.emissions, year), Emissions=sum(Emissions))
> ggplot(baltimore.emissions.byyear, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2))) +
+ +     geom_bar(stat="identity") +
+ +     xlab("year") +
+ +     ylab(expression("total PM"[2.5]*" Emissions in tons")) +
+ +     ggtitle("Emissions from motor vehicle sources in Baltimore City, Maryland")
