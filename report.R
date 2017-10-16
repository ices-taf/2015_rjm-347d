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
plot(Index~Year, survey, type="b", lty=3, ylim=lim(survey$Index), yaxs="i")
segments(2008, dls$i1bar, 2012, lwd=3, col=taf.orange)
segments(2013, dls$i2bar, 2014, lwd=3, col=taf.orange)
title(main="DLS 3.2 advice")
grid(lwd=2)
box()
dev.off()
