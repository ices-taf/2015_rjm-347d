## Convert data to model format, write model input files

## Before: catch.csv, survey.csv (data)
## After:  input.RData (input)

library(icesTAF)

mkdir("input")

## Get catch and survey data
catch <- read.taf("data/catch.csv")
survey <- read.taf("data/survey.csv")

save(catch, survey, file="input/input.RData")
