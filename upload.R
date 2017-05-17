## Gather TAF input and output tables to be uploaded

## Before: catch.csv, survey.csv, dls.txt (db, output)
## After:  catch.csv, survey.csv, dls.txt (upload)

dir.create("upload/input", showWarnings=FALSE, recursive=TRUE)
dir.create("upload/output", showWarnings=FALSE)

invisible(file.copy("db/catch.csv", "upload/input/catch.csv", overwrite=TRUE))
invisible(file.copy("db/survey.csv", "upload/input/survey.csv", overwrite=TRUE))
invisible(file.copy("output/dls.txt", "upload/output/dls.txt", overwrite=TRUE))
