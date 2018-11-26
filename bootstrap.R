library(icesTAF)

setwd("bootstrap")

mkdir("data")
mkdir("library")
mkdir("software")
.libPaths(c("library", .libPaths()))

## Process data
datasets <- bibtex::read.bib("DATA.bib")
for(dat in datasets)
{
  cp(dat$source, "data")
}

## Process software
software <- bibtex::read.bib("SOFTWARE.bib")
for(soft in software)
{
  if(grepl("@", soft$source))
  {
    spec <- remotes::parse_repo_spec(soft$source)
    url <- paste0("https://api.github.com/repos/",
                  spec$username, "/", spec$repo, "/tarball/", spec$ref)
    targz <- paste0(spec$repo, "_", spec$ref, ".tar.gz")
    suppressWarnings(download(url, destfile=file.path("software", targz)))
    remotes::install_github(soft$source, upgrade=FALSE, force=TRUE)
  }
  else if(grepl("^http", soft$source))
  {
    download(soft$source, dir="software")
  }
  else
  {
    cp(soft$source, "software")
  }
}

## Remove empty folders
sapply(c("data","library","software"), rmdir)

setwd("..")
