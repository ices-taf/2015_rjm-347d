## Plot data and results

## Before: survey.csv (data), dls.txt (output)
## After:  dls.png (report)

library(icesTAF)

mkdir("report")

## Get DLS data and results
survey <- read.taf("data/survey.csv")
dls <- read.dls("output/dls.txt")

## Plot
tafpng("dls")
xlim <- c(1990, 2016)
plot(Index~Year, survey, type="b", lty=3, xlim=xlim, ylim=lim(survey$Index),
     yaxs="i", las=1)
segments(2008, dls$i1bar, 2012, lwd=2)
segments(2013, dls$i2bar, 2014, lwd=2)
title(main="rjm-347d (2015 DLS advice)")
grid()
box()
dev.off()
