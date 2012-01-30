\name{plot.ifile}
\alias{plot.ifile}
\alias{plot.rirf}
\alias{plot.riif}
\alias{plot.rief}
\alias{plot.rtrf}
\alias{plot.rtif}
\alias{plot.rtef}
\alias{lines.rirf}
\alias{lines.riif}
\alias{lines.rief}
\title{Plotting Item Staistics}
\description{
These are Rasch model plot methods for item response functions, item inforamtion functions, item error functions, the test response function, the test information function, and the test error function, where each applies to an object of the corresponding class. \code{plot.ifile} summarizes the items within an ifile by plotting each of these functions in succession.
}
\usage{
\method{plot}{ifile}(x, theta = seq(-4, 4, length = 100),
  subset = 1:nrow(x), ...)

\method{plot}{rirf}(x, theta = x$theta, add = FALSE,
  xlab = expression(theta), ylab = "P(X)", main = "IRF",
  lwd = 2, col = "r", ...)

\method{plot}{riif}(x, theta = x$theta, add = FALSE,
  xlab = expression(theta), ylab = "Information", main = "IIF",
  lwd = 2, col = "r", ...)

\method{plot}{rief}(x, theta = x$theta, add = FALSE,
  xlab = expression(theta), ylab = "Standard Error",
  main = "IEF", lwd = 2, col = "r", ...)

\method{plot}{rtrf}(x, theta = x$theta, xlab = expression(theta),
  ylab = "Total", main = "TRF", lwd = 2, ...)

\method{plot}{rtif}(x, theta = x$theta, xlab = expression(theta),
  ylab = "Information", main = "TIF", lwd = 2, ...)

\method{plot}{rtef}(x, theta = x$theta, xlab = expression(theta),
  ylab = "Standard Error", main = "TEF", lwd = 2, ...)
}
\arguments{
  \item{x}{
for \code{plot.ifile}, an object of class \dQuote{ifile}, otherwise, either an ifile or a vector of item locations
}
  \item{theta}{
optional vector of theta values over which the functions will be evaluated
}
  \item{subset}{
an index vector indicating the items to plot, as row numbers or item names if present in the ifile
}
  \item{xlab}{
the x-axis label, as a string, defaulting to \code{expression(theta)}
}
  \item{ylab}{
the y-axis label, as a string, with default depending on the method
}
  \item{main}{
the plot title, with default depending on the method
}
  \item{lwd}{
line width, as an integer, defaulting to 2
}
  \item{col}{
vector of line colors, where the default \code{"r"} indicates a selection from the rainbow. Recycled if necessary
}
  \item{add}{
boolean, with default \code{FALSE}, indicating whether or not to add to the current plot
}
  \item{\dots}{
Further arguments passed to \code{plot.default}
}
}
\author{
Anthony Albano \email{tony.d.albano@gmail.com}
}
\seealso{
\code{\link{ifile}}
}
\examples{
plot(ifile(-2:2))
}
\keyword{hplot}
