## Run analysis, write model results

## Before: input.RData (input)
## After:  dls.txt (model)

library(icesAdvice)
library(icesTAF)

mkdir("model")

## Get data
load("input/input.RData")

## Apply DLS method 3.2
dls <- DLS3.2(mean(catch$Catch), survey$Index, len=c(5,2))

write.dls(dls, "model/dls.txt")
