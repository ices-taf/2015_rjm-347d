## Gather TAF input and output tables to be uploaded

## Before: catch.csv, survey.csv, dls.txt (db, output)
## After:  catch.csv, survey.csv, dls.txt (upload)

require("icesTAF", quietly=TRUE)

mkdir("upload/input")
mkdir("upload/output")

cp("db/catch.csv", "upload/input/catch.csv")
cp("db/survey.csv", "upload/input/survey.csv")
cp("output/dls.txt", "upload/output/dls.txt")
