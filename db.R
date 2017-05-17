## Download and preprocess data, write TAF input tables

## Before: surveys_all.csv, catch.csv (ftp)
## After:  survey.csv, catch.csv (db)

require(icesTAF, quietly=TRUE)

ftp <- "https://raw.githubusercontent.com/ices-taf/ftp/master/wgef/2015/rjm-347d/"

dir.create("db", showWarnings=FALSE)

## Download full survey data, select years and surveys of interest
survey <- read.csv(paste0(ftp, "db/surveys_all.csv"))
survey <- survey[survey$Year %in% 1993:2014, names(survey) != "Unknown"]

## Scale each survey to average 1, combine index as average of three surveys
survey[-1] <- sapply(survey[-1], function(x) x/mean(x, na.rm=TRUE))
survey$Index <- rowMeans(survey[-1])

## Finalize tables
survey <- survey[c("Year","Index")]
row.names(survey) <- NULL
catch <- read.csv(paste0(ftp, "db/catch.csv"))

## Write TAF tables to db directory
write.taf(survey, "db/survey.csv")
write.taf(catch, "db/catch.csv")
