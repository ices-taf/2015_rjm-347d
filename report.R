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
plot(survey$Year, survey$Index, type="b", lty=3, ylim=lim(survey$Index),
     yaxs="i", main="Survey", xlab="Year", ylab="Index",
     panel.first=grid(lwd=2))
dev.off()
