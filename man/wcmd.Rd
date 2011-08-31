\name{wcmd}
\alias{wcmd}
\alias{as.wcmd}
\alias{read.wcmd}
\alias{write.wcmd}
\alias{print.wcmd}
\title{Winsteps Command File}
\description{
\code{wcmd} creates a Winsteps command file object. \code{as.wcmd} converts a list to an object of class \dQuote{wcmd}. \code{read.wcmd} and \code{write.wcmd} read and write command files to and from text files.
}
\usage{
wcmd(title = "R2Winsteps Run", data, item1, ni, name1,
  namelen = item1 - name1, codes = 0:1, csv = "y", hlines = "y",
  tfile = NULL, arglist = NULL, anchor = NULL, labels = NULL,
  extra = NULL)

as.wcmd(x)

read.wcmd(filename)

write.wcmd(cmd, filename)
}
\arguments{
  \item{title}{
a title for the Winsteps run, as a string
}
  \item{data}{
data set filename
}
  \item{item1}{
integer, fixed width column number of the first item
}
  \item{ni}{
integer, number of items
}
  \item{name1}{
integer, fixed width column number of the first character of the person name
}
  \item{namelen}{
integer, number of characters in person name, defaulting to the difference between \code{item1} and \code{name1}
}
  \item{codes}{
vector of response codes with default \code{c(0, 1)}
}
  \item{csv}{
character indicating how output files should be written, as csv (\code{"y"}, default) or as tab delimited (\code{"n"}). In order to read in and manipulate files using R2Winsteps, this must be \code{"y"}, and the Winsteps default which includes headers must not change (\code{hlines = "y"})
}
  \item{hlines}{
character indicating whether or not to include header lines in output files, with default \code{"y"}, as required for using functions such as \code{read.ifile} and \code{read.pfile}
}
  \item{tfile}{
numeric vector of table numbers to be included in output
}
  \item{arglist}{
optional list of additional arguments to be appended to the command file, where the name of each list element will be pasted into a string with the value of the element, as \code{name = "value"}
}
  \item{anchor}{
optional matrix of item anchor values, with item sequences in column 1 and anchor values in column 2
}
  \item{labels}{
optional string vector of item labels, to be pasted after the \code{&END} statement in the command file
}
  \item{extra}{
optional vector of additional commands, similar to \code{arglist}, but where element names are ignored and each element is simply pasted into the command file separated by new lines
}
  \item{x}{
list of arguments to be converted into an object of class \dQuote{wcmd}
}
  \item{filename}{
path to which the command file will be written, or from which it will be read
}
  \item{cmd}{
command file object to be written
}
}
\details{
The Winsteps command file specifies the structure of a persons by items matrix and includes all arguments necessary to run the model. Arguments without defaults, which are currently required in the \dQuote{wcmd} class, are \code{data}, \code{item1}, \code{ni}, and \code{name1}. Winsteps accepts a variety of arguments and data specification options within the command file and only a selection of these are currently supported by the \dQuote{wcmd} class, not including those necessary for polytomous models. Thus, for the greatest flexibility, the command file should be written by hand. For details, see the Winsteps manual.

Using \code{write.wcmd}, the command file is written to \code{filename} by separating all arguments and item labels with new lines. As all arguments are read and written as text strings, any argument with integer values such as \code{codes} may also be specified as a string, e.g., \code{codes = "01"}.

The command file can also be used to facilitate reading and writing of data files in R. See \code{\link{read.wdat}} and \code{\link{write.wdat}} for details.
}
\value{
Returns a command file as a list of arguments
}
\author{
Anthony Albano \email{tony.d.albano@gmail.com}
}
\seealso{
\code{\link{winsteps}}
}
\examples{
# Create
tempcmd <- tempfile()
cmd <- wcmd(title = "R2Winsteps Example", data = "example.dat",
  item1 = 1, ni = 15, name1 = 16, namelen = 5,
  labels = paste("i", 1:15, sep = ""), hlines = "Y")

# Write and read
write.wcmd(cmd, tempcmd)
cmd2 <- read.wcmd(tempcmd)
}
\keyword{methods}
