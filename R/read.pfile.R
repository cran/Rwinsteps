read.pfile <- function(filename, skip = 1, col.names, ...) {

  out <- read.csv(filename, skip = skip, ...)

  if(!missing(col.names))
    colnames(out) <- col.names
  else
    colnames(out) <- tolower(colnames(out))

  out <- as.pfile(out)

  return(out)
}
