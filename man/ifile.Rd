\name{ifile}
\alias{ifile}
\alias{as.ifile}
\alias{read.ifile}
\alias{pfile}
\alias{as.pfile}
\alias{read.pfile}
\title{Item and Person Summary Files}
\description{
An \dQuote{ifile} is a data frame containing statistical output for a set of items. A \dQuote{pfile} is a data frame containing statistical output for a group of people, or examinees. These functions create, read, and convert to \dQuote{ifile} and \dQuote{pfile} objects.
}
\usage{
ifile(measure, entry = 1:length(measure), ...)

pfile(measure, entry = 1:length(measure), ...)

as.ifile(x)

as.pfile(x)

read.ifile(filename, skip = 1, col.names, sep = ",", ...)

read.pfile(filename, skip = 1, col.names, sep = ",", ...)
}
\arguments{
  \item{measure}{
numeric vector of item locations
}
  \item{entry}{
item position numbers, normally a sequence from 1 to the number of items
}
  \item{x}{
a data frame with items as rows, containing, at a minimum, columns titled \dQuote{measure} and \dQuote{entry}
}
  \item{filename}{
path to the file, which is assumed to be a table in 'csv' format
}
  \item{skip}{
number of header lines to skip, defaulting to 1
}
  \item{col.names}{
vector of column names to be added to the file after it is read in
}
  \item{sep}{
the field separator character, sent to \code{read.table}, defaulting to comma separated values
}
  \item{\dots}{
For \code{ifile} and \code{pfile}, additional variables, as vectors of the same length as \code{measure}, to be included in the ifile or pfile; for \code{read.ifile} and \code{read.pfile}, further arguments passed to \code{read.table}
}
}
\details{
The ifile contains item-level information, and the pfile person-level information, based on a fit of the Rasch model to a set of item-response data.

Using \code{read.ifile} and \code{read.pfile}, the ifile and pfile are read in as 'csv' files, i.e., tables with \code{sep = ","}. These functions are simple wrappers for the function \code{read.csv}.
}
\value{
A data frame of class \dQuote{ifile} or \dQuote{pfile}
}
\author{
Anthony Albano \email{tony.d.albano@gmail.com}
}
\seealso{
\code{\link{read.ifile}}, \code{\link{plot.ifile}}
}
\examples{
imeasure <- rnorm(5)
ifile(imeasure, name = paste("item", 1:5, sep = ""))
as.ifile(data.frame(measure = imeasure, entry = 1:5))

pmeasure <- rnorm(3)
pfile(pmeasure, name = c("Skeeter", "Shira", "Soto"))
as.pfile(data.frame(measure = pmeasure, entry = 1:3))
}
\keyword{methods}
