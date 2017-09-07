## Upload raw data to TAF database

## Before: catch.csv, surveys_all.csv (user dir)
## After:  catch.csv, surveys_all.csv (TAF database)

upload <- function(file, analysis)
{
  file <- httr::upload_file(file)
  url <- sprintf("http://localhost:1234/fs/%s/data-raw/%s",
                 analysis, basename(file$path))
  httr::POST(url, body=file)
}

owd <- setwd("d:/projects/ices-taf/ftp/wgef/2015/rjm-347d/db")
upload("catch.csv", "2015_rjm-347d")
upload("surveys_all.csv", "2015_rjm-347d")
setwd(owd)
