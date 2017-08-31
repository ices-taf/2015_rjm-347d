## Gather TAF input and output tables to be uploaded

## Before: catch.csv, survey.csv, summary.csv, dls.txt (db, output)
## After:  catch.csv, survey.csv, summary.csv, dls.txt (upload)

library(icesTAF)

mkdir("upload/input")
mkdir("upload/output")

cp("db/catch.csv", "upload/input/catch_tbl.csv")
cp("db/survey.csv", "upload/input/survey_tbl.csv")
cp("db/summary.csv", "upload/input/summary_tbl.csv")
cp("output/dls.txt", "upload/output")
