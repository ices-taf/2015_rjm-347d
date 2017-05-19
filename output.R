## Extract model results of interest, write TAF output tables

## Before: dls.txt (model)
## After:  dls.txt (output)

require(icesTAF, quietly=TRUE)

mkdir("output")

## Copy DLS results to output directory
cp("model/dls.txt", "output")
