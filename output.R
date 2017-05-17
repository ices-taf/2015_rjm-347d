## Extract model results of interest, write TAF output tables

## Before: dls.txt (model)
## After:  dls.txt (output)

dir.create("output", showWarnings=FALSE)

## Copy DLS results to output directory
invisible(file.copy("model/dls.txt", "output/dls.txt", overwrite=TRUE))
