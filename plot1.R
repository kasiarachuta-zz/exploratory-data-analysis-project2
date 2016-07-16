
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
> 
> # First, I need to aggregate by year to calculate the total emissions
> AgggregatedByYr <- aggregate(Emissions ~ year, NEI, sum)
> barplot(height = AgggregatedByYr$Emissions, names.arg=AgggregatedByYr$year, xlab = "Year", ylab = "Total PM2.5 Emission", main = "Total PM2.5 Emissions from All Sources")
> dev.off()
Error in dev.off() : cannot shut down device 1 (the null device)
> 