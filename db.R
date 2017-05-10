## Combine survey data into one index

## Before: surveys_raw.csv, catch.csv (ftp/db)
## After:  survey.csv, catch.csv (ftp/input)

ftp.remote <- "https://raw.githubusercontent.com/ices-taf/ftp/master/wgef/2015/rjm-347d/"
ftp.local <- "../../../ftp/wgef/2015/rjm-347d/"

dir.create(paste0(ftp.local,"input"), showWarnings=FALSE, recursive=TRUE)

## Download raw survey data, select years and surveys of interest
survey <- read.csv(paste0(ftp.remote, "db/surveys_raw.csv"))
survey <- survey[survey$Year %in% 1993:2014, names(survey) != "Unknown"]

## Scale each survey to average 1, combine index as average of three surveys
survey[-1] <- sapply(survey[-1], function(x) x/mean(x, na.rm=TRUE))
survey$Index <- rowMeans(survey[-1])

## Finalize tables
survey <- survey[c("Year","Index")]
row.names(survey) <- NULL
catch <- read.csv(paste0(ftp.remote, "db/catch.csv"))

## Write tables to local FTP directory
write.csv(survey, paste0(ftp.local,"input/survey.csv"), quote=FALSE, row.names=FALSE)
write.csv(catch, paste0(ftp.local,"input/catch.csv"), quote=FALSE, row.names=FALSE)
