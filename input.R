## Convert input data to model format

## Before: catch.csv, survey.csv
## After:  input.RData

ftp <- "../ftp/wgef/2015/rjm-347d/"

dir.create("input", showWarnings=FALSE)

## Get catch and survey data
catch <- read.csv(paste0(ftp, "input/catch.csv"))
survey <- read.csv(paste0(ftp, "input/survey.csv"))

save(catch, survey, file="input/input.RData")
