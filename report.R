## Prepare plots and tables for report

## Before: survey.csv (data), dls.txt (output)
## After:  dls.png (report)

library(icesTAF)

mkdir("report")

## Get DLS data and results
summary <- read.taf("data/summary.csv")
dls <- read.dls("output/dls.txt")

## Plot
tafpng("dls")
plot(summary$Year, summary$Index, type="b", lty=3, ylim=lim(summary$Index),
     yaxs="i", main="Survey", xlab="Year", ylab="Index",
     panel.first=grid(lwd=2))
dev.off()

## Table
summary <- rnd(summary, "Catch")
summary <- rnd(summary, "Index", 3)
write.taf(summary, "report/summary.csv")
