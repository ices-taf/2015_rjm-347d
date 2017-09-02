## Get and upload raw input data to the TAF database

## Before: empty
## After:  catch.csv, surveys_all.csv (data-raw)

upload.dataraw.taf <- function(filename, analysisName) {
  file <- httr::upload_file(filename)
  url <- sprintf("http://localhost:1234/fs/%s/data-raw/%s", analysisName, basename(file$path))
  httr::POST(url, body = file)
}

# upload files to data-raw folder in TAF DB
upload.dataraw.taf("d:/projects/ices-taf/ftp/wgef/2015/rjm-347d/db/catch.csv", "2015_rjm-347d")
upload.dataraw.taf("d:/projects/ices-taf/ftp/wgef/2015/rjm-347d/db/surveys_all.csv", "2015_rjm-347d")

# done
