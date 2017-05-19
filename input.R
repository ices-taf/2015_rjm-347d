## Convert data to model format, write model input file

## Before: catch.csv, survey.csv (db)
## After:  input.RData (input)

require(icesTAF, quietly=TRUE)

mkdir("input")

## Get catch and survey data
catch <- read.taf("db/catch.csv")
survey <- read.taf("db/survey.csv")

save(catch, survey, file="input/input.RData")
