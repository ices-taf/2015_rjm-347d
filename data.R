# Prepare data, write CSV data tables

# Before: catch.csv, surveys_all.csv (boot/data)
# After:  catch.csv, summary.csv, survey.csv (data)

library(icesTAF)

mkdir("data")

# Read data, select years and surveys of interest
catch <- read.taf("boot/data/catch.csv")
survey <- read.taf("boot/data/surveys_all.csv")
survey <- survey[survey$Year %in% 1993:2014, names(survey) != "Unknown"]

# Scale each survey to average 1, combine index as average of three surveys
survey[-1] <- sapply(survey[-1], function(x) x / mean(x, na.rm=TRUE))
survey$Index <- rowMeans(survey[-1])

# Finalize tables
row.names(survey) <- NULL
summary <- merge(catch, survey[c("Year", "Index")], all=TRUE)

# Write tables to data directory
write.taf(catch, dir="data")
write.taf(survey, dir="data")
write.taf(summary, dir="data")
