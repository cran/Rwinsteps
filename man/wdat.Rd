\name{wdat}
\alias{wdat}
\alias{read.wdat}
\alias{write.wdat}
\title{Winsteps Data File}
\description{
These functions read and write Winsteps data files, where formatting is specified in a command file object.
}
\usage{
write.wdat(x, cmd, datfile = cmd$data, na = " ")

read.wdat(cmd, datfile = cmd$data, na = " ", ilabels = NULL)
}
\arguments{
  \item{x}{
data frame of item responses
}
  \item{cmd}{
command file object
}
  \item{datfile}{
path to which the data file will be written, or from which it will be read, defaulting to the path supplied in the command file
}
  \item{na}{
character representing missing data, defaulting to a blank space
}
  \item{ilabels}{
vector of new item labels to be added to the item columns, overriding cmd$labels
}
}
\details{
When reading data, the person names should occupy 1 column and each item should occupy 1 column in the file. A warning is returned if any rows have fewer than the maximum number of columns and the person names are not in the last column, in which case the missing information pertains to items. \code{ilabels} will override the item labels in \code{cmd$labels}, if they exist. If both are \code{NULL}, generic item names are supplied.

When writing data, all unnamed columns are assumed to be item responses. If the command file contains item labels they will be used to extract and reorder the item responses from \code{x} and all other columns in \code{x} will be ignored, except for the person IDs which must have a column name of \code{"name"}. The data are written to the filename \code{datfile} in fixed width format according to the \code{item1}, \code{ni}, \code{name1}, and \code{namelen} command file components.
}
\value{
\code{read.wdat} returns a data frame
}
\author{
Anthony Albano \email{tony.d.albano@gmail.com}
}
\examples{
# Simulate data, with missings
set.seed(82911)
b <- seq(-3, 3, length = 15)
theta <- rnorm(100, 1)
rmat <- ifelse(rirf(b, theta)$p > runif(1500), 1, 0)
rmat[sample(1500, 30)] <- NA
rmat <- data.frame(rmat)

# Item and person labels
colnames(rmat) <- paste("i", 1:15, sep = "")
rmat$name <- paste("p", 1:100, sep = "")

# Create command file
tempdat <- tempfile()
cmd <- wcmd(title = "R2Winsteps Example", data = tempdat,
  item1 = 1, ni = 15, name1 = 16, namelen = 5,
  labels = paste("i", 1:15, sep = ""), hlines = "Y")

# Write to temp file and read back in
write.wdat(rmat, cmd, na = "N")
rmat2 <- read.wdat(cmd, na = "N")
}
\keyword{methods}
