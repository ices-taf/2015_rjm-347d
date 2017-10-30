## Extract results of interest, write TAF output tables

## Before: dls.txt (model)
## After:  dls.txt (output)

library(icesTAF)

mkdir("output")

## Copy DLS results to output directory
cp("model/dls.txt", "output")
