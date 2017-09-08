## Upload raw data to TAF file server

## Before: catch.csv, surveys_all.csv (user dir)
## After:  catch.csv, surveys_all.csv (TAF file server)

library(icesTAF)

owd <- setwd("d:/projects/ices-taf/ftp/wgef/2015/rjm-347d/db")
upload("2015_rjm-347d", "catch.csv")
upload("2015_rjm-347d", "surveys_all.csv")
setwd(owd)
