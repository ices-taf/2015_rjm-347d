## Run DLS analysis

## Before: input.RData
## After:  dls.txt

require(icesAdvice, quietly=TRUE)
require(icesTAF, quietly=TRUE)

dir.create("model", showWarnings=FALSE)

## Get data
load("input/input.RData")

## Apply DLS method 3.2
i1 <- head(tail(survey$Index, 7), 5)
names(i1) <- 2008:2012
dls <- DLS3.2(mean(catch$Catch), survey$Index, i1=i1)
write.dls(dls, "model/dls.txt")
