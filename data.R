## Preprocess data, write TAF data tables

## Before: catch.csv, surveys_all.csv (bootstrap/data)
## After:  catch.csv, summary.csv, survey.csv (data)

library(icesTAF)

mkdir("data")

## Read data, select years and surveys of interest
catch <- read.taf("bootstrap/data/catch.csv")
survey <- read.taf("bootstrap/data/surveys_all.csv")
survey <- survey[survey$Year %in% 1993:2014, names(survey) != "Unknown"]

## Scale each survey to average 1, combine index as average of three surveys
survey[-1] <- sapply(survey[-1], function(x) x/mean(x, na.rm=TRUE))
survey$Index <- rowMeans(survey[-1])

## Finalize tables
row.names(survey) <- NULL
summary <- data.frame(Year=survey$Year, Catch=NA, Index=survey$Index)
summary$Catch[summary$Year %in% catch$Year] <- catch$Catch

## Write tables to data directory
write.taf(catch, dir="data")
write.taf(survey, dir="data")
write.taf(summary, dir="data")
