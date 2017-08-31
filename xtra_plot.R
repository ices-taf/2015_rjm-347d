## Plot data and results

## Before: survey.csv, dls.txt (upload)
## After:  dls.png (upload)

library(icesTAF)

mkdir("upload/plot")

## Get DLS data and results
survey <- read.taf("upload/input/survey_tbl.csv")
dls <- read.dls("upload/output/dls.txt")

## Plot
png("upload/plot/dls.png", width=1200, height=1200, pointsize=24)
xlim <- c(1990, 2016)
ylim <- c(0, max(pretty(survey$Index)))
plot(Index~Year, survey, type="b", lty=3, xlim=xlim, ylim=ylim, yaxs="i", las=1)
segments(2008, dls$i1bar, 2012, lwd=2)
segments(2013, dls$i2bar, 2014, lwd=2)
title(main="rjm-347d (2015 DLS advice)")
grid()
box()
invisible(dev.off())
