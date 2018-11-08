## Set up assessment, download data and software

## Before:
## After:

# libraries
library(icesTAF)

# create data folder in bootstrap
mkdir("bootstrap/data")

# read dataset citations and process
datasets <- bibtex::read.bib("CITATIONS.bib")
for (dataset in datasets) {
  contents <- scan(dataset$url, character(0))
  writeLines(contents, file.path("bootstrap", "data", attr(dataset, "key")))
}

# create dependencies folders in bootstrap
mkdir("bootstrap/packages")
mkdir("bootstrap/library")

# download and install dependencies
op <- .libPaths()
.libPaths("bootstrap/library")

packages <- bibtex::read.bib("DEPENDENCIES.bib")
for (package in packages) {
  url <-
    paste0("https://api.github.com/repos/",
          gsub("@", "/tarball/", package$version))
  fname <- file.path("bootstrap", "packages", paste0(attr(package, "key"), ".tar.gz"))
  download.file(url, destfile = fname, mode = "wb")
  devtools::install_github(package$version, force = TRUE)
}

.libPaths(c("bootstrap/library", op))
