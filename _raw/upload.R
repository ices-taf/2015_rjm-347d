## Upload raw data to TAF database

## Before: catch.csv, surveys_all.csv (user dir)
## After:  catch.csv, surveys_all.csv (TAF database)

library(icesTAF)

owd <- setwd("d:/projects/ices-taf/ftp/wgef/2015/rjm-347d/raw")
upload("2015_rjm-347d", "raw", "catch.csv")
upload("2015_rjm-347d", "raw", "surveys_all.csv")
setwd(owd)
