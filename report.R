## Prepare plots and tables for report

## Before: summary.csv (data)
## After:  summary.csv, survey.png (report)

library(icesTAF)

mkdir("report")

summary <- read.taf("data/summary.csv")

## Plot
taf.png("survey")
plot(summary$Year, summary$Index, type="b", lty=3, lwd=2,
     ylim=lim(summary$Index), yaxs="i", main="Survey",
     xlab="Year", ylab="Index", panel.first=grid(lwd=2))
dev.off()

## Table
summary <- rnd(summary, "Catch")
summary <- rnd(summary, "Index", 3)
write.taf(summary, dir="report")
