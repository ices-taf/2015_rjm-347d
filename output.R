## Write DLS results into output folder

## Before: dls.txt (local)
## After:  dls.txt (ftp)

ftp <- "../../../ftp/wgef/2015/rjm-347d/"

dir.create(paste0(ftp,"output"), showWarnings=FALSE, recursive=TRUE)

# Copy DLS results to local FTP directory
invisible(file.copy("model/dls.txt", paste0(ftp,"output/dls.txt"), overwrite=TRUE))
