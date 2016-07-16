
R version 3.2.4 (2016-03-10) -- "Very Secure Dishes"
Copyright (C) 2016 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.4.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.67 (7152) x86_64-apple-darwin13.4.0]

[Workspace restored from /Users/katarzynarachuta/.RData]
[History restored from /Users/katarzynarachuta/.Rapp.history]

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
Error in +geom_bar(stat = "identity") : 
  invalid argument to unary operator
> 