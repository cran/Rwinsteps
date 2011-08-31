\name{winsteps}
\alias{winsteps}
\alias{as.winsteps}
\alias{print.winsteps}
\title{Running Winsteps}
\description{
The \code{winsteps} function sends a command file to the program Winsteps and returns the resulting item and person information, optionally saving them as output files. \code{as.winsteps} converts its arguments into an object of class \dQuote{winsteps}.
}
\usage{
winsteps(cmd, cmdfile = "cmdfile", outfile = "outfile",
  ifile = "ifile", pfile = "pfile", newdir = getwd(),
  run = TRUE, windir = "winsteps")

as.winsteps(cmd, ifile, pfile, daterun, comptime)
}
\arguments{
  \item{cmd}{
a command file object, created using \code{wcmd}
}
  \item{cmdfile}{
a path to the command file, when running \code{winsteps}, or a list to be converted into a command file object, when running \code{as.winsteps}
}
  \item{outfile}{
a path to which the standard Winsteps output will be written
}
  \item{ifile}{
a path to the item file, when running \code{winsteps}, or a list to be converted into an ifile object, when running \code{as.winsteps}
}
  \item{pfile}{
a path to the person file, when running \code{winsteps}, or a list to be converted into a pfile object, when running \code{as.winsteps}
}
  \item{newdir}{
an optional, temporary, directory for reading and writing files, defaulting to the current working directory
}
  \item{run}{
boolean, with default \code{TRUE}, indicating whether or not Winsteps should be run. If \code{FALSE}, the Winsteps files cmdfile, ifile, and pfile are read in, assuming they are each specified as strings of length 1.
}
  \item{windir}{
the directory for the Winsteps program, which is sent to the Windows command prompt. If the directory is already included in the Windows PATH variable, the default \code{"winsteps"} will suffice
}
  \item{daterun}{
date and time the model was run
}
  \item{comptime}{
time required to run the model
}
}
\details{
Winsteps is commercial software for analyzing item response data, primarily through applications of the Rasch model, a 1 parameter item response theory model. The \code{winsteps} function interacts with Winsteps in batch mode and retrieves the two main output files produced by the program, referred to as an ifile, which contains item output, and a pfile, which contains person output.

The only argument required by \code{winsteps} is a command file, which can be supplied directly as \code{cmd}, a command file object of class \dQuote{wcmd}, or which can be referenced with the filename \code{cmdfile}. If both are included, the object is written to the filename.

\code{cmdfile}, \code{outfile}, \code{ifile}, and \code{pfile} are all used to  write the corresponding Winsteps files when \code{run = TRUE}. Regardless of whether Winsteps is run or not, the \code{cmdfile}, \code{ifile}, and \code{pfile} will be read into R and returned. If the defaults are retained for these arguments the files will be deleted once the function has completed without errors.

Winsteps is called by invoking the operating system using the \code{system} command. \code{windir} can be used to specify the Winsteps directory folder (e.g., "c:/program files/winsteps"), should the system have a hard time finding it.
}
\value{
A list object of class \dQuote{winsteps} containing:
  \item{cmd}{the command file}
  \item{ifile}{the item file}
  \item{pfile}{the person file}
  \item{daterun}{date and time the model was run}
  \item{comptime}{time required to run the model}
}
\references{
Winsteps is commercial software, available at \url{www.winsteps.com}
}
\author{
Anthony Albano \email{tony.d.albano@gmail.com}
}
\seealso{
\code{\link{wcmd}}, \code{\link{ifile}}, \code{\link{pfile}}
}
\examples{
# Simulate scores for 15 items and 100 people
set.seed(82911)
b <- seq(-3, 3, length = 15)
theta <- rnorm(100, 1)
rmat <- data.frame(ifelse(rirf(b, theta)$p > runif(1500), 1, 0))

# Item and person labels
colnames(rmat) <- paste("i", 1:15, sep = "")
rmat$name <- paste("p", 1:100, sep = "")

# Create a command file object
cmd <- wcmd(title = "R2Winsteps Example", data = "example.dat",
  item1 = 1, ni = 15, name1 = 16, namelen = 5,
  labels = paste("i", 1:15, sep = ""), hlines = "Y")

# The last two steps require access to a local directory and
# are not run

# Write the data to file
# write.wdat(rmat, cmd)

# Run Winsteps, with default filenames, not saving the
# command file or other output to file
# out <- winsteps(cmd)
}
\keyword{methods}
