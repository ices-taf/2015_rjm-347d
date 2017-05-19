## Run analysis, write model results

## Before: input.RData (input)
## After:  dls.txt (model)

require(icesAdvice, quietly=TRUE)
require(icesTAF, quietly=TRUE)

mkdir("model")

## Get data
load("input/input.RData")

## Apply DLS method 3.2
i1 <- survey$Index[nrow(survey)-(6:2)] # five year period from n-6 to n-2
dls <- DLS3.2(mean(catch$Catch), survey$Index, i1=i1)

write.dls(dls, "model/dls.txt")
