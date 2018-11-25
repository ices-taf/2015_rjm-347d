mkdir("data")
mkdir("library")
mkdir("packages")
.libPaths(c("library", .libPaths()))

## Process data citations
datasets <- bibtex::read.bib("CITATIONS.bib")
for(dat in datasets)
{
  cp(dat$source, file.path("data",attr(dat,"key")))
}

## Download and install dependencies
packages <- bibtex::read.bib("DEPENDENCIES.bib")
for(pkg in packages)
{
  spec <- remotes::parse_repo_spec(pkg$source)
  url <- paste0("https://api.github.com/repos/",
                spec$username, "/", spec$repo, "/tarball/", spec$ref)
  targz <- paste0(sub("@", "_", sub(".*/", "", pkg$source)), ".tar.gz")
  suppressWarnings(download(url, destfile=file.path("packages", targz)))
  remotes::install_github(pkg$source, upgrade=FALSE)
}
