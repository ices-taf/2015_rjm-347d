## Run core scripts: db, input, model, output, upload

library(icesTAF)

options(taf.root=getwd())

sourceTAF("db.R", rm=TRUE)
sourceTAF("input.R", rm=TRUE)
sourceTAF("model.R", rm=TRUE)
sourceTAF("output.R", rm=TRUE)
sourceTAF("upload.R", rm=TRUE)
