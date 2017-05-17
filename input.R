## Convert data to model format, write model input file

## Before: catch.csv, survey.csv (db)
## After:  input.RData (input)

dir.create("input", showWarnings=FALSE)

## Get catch and survey data
catch <- read.csv("db/catch.csv")
survey <- read.csv("db/survey.csv")

save(catch, survey, file="input/input.RData")
