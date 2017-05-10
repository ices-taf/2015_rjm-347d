## Write DLS results into output folder

## Before: dls.txt (local)
## After:  dls.txt (local)

dir.create("output", showWarnings=FALSE, recursive=TRUE)

# Copy DLS results to local FTP directory
invisible(file.copy("model/dls.txt", "output/dls.txt", overwrite=TRUE))
