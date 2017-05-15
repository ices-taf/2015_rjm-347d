## Plot DLS results

## Before: survey.csv, dls.txt
## After:  [plot]

require(icesTAF, quietly=TRUE)

## Download DLS input and output from local FTP server
ftp <- "../ftp/wgef/2015/rjm-347d/"

survey <- read.csv(paste0(ftp, "input/survey.csv"))
dls <- read.dls("output/dls.txt")

## Plot
xlim <- c(1990, 2016)
ylim <- c(0, max(pretty(survey$Index)))
plot(Index~Year, survey, type="b", lty=3, xlim=xlim, ylim=ylim, yaxs="i", las=1)
segments(2008, dls$i1bar, 2012, lwd=2)
segments(2013, dls$i2bar, 2014, lwd=2)
title(main="rjm-347d (2015 DLS advice)")
grid()
box()
