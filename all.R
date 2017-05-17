## Run core scripts: db, input, model, output

attach(NULL, name="TAF")
assign("taf.root", getwd(), pos="TAF")

setwd(taf.root); rm(list=ls()); cat("* Running db.R ...\n");     source("db.R");     cat("Done\n")
setwd(taf.root); rm(list=ls()); cat("* Running input.R ...\n");  source("input.R");  cat("Done\n")
setwd(taf.root); rm(list=ls()); cat("* Running model.R ...\n");  source("model.R");  cat("Done\n")
setwd(taf.root); rm(list=ls()); cat("* Running output.R ...\n"); source("output.R"); cat("Done\n")
setwd(taf.root); rm(list=ls()); cat("* Running upload.R ...\n"); source("upload.R"); cat("Done\n")
