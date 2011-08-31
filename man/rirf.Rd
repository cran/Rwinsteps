\name{rirf}
\alias{rirf}
\alias{riif}
\alias{rief}
\alias{rtrf}
\alias{rtif}
\alias{rtef}
\title{Item Functions}
\description{
These functions return the item response, item inforamtion, item error, test response, the test information, and the test error functions for a set of Rasch item location, i.e., difficulty parameters.
}
\usage{
rirf(x, theta = seq(-4, 4, length = 100))

riif(x, theta = seq(-4, 4, length = 100))

rief(x, theta = seq(-4, 4, length = 100))

rtrf(x, theta = seq(-4, 4, length = 100))

rtif(x, theta = seq(-4, 4, length = 100))

rtef(x, theta = seq(-4, 4, length = 100))
}
\arguments{
  \item{x}{
numeric item location or a vector of item locations, or an ifile
}
  \item{theta}{
optional vector of theta values over which the functions will be evaluated
}
}
\details{
\code{rirf} evaluates the Rasch model for each item location over theta, returning the probabilities correct. The remaining functions all incorporate these probablities to return the information (\code{riif} and standard errors (\code{rief}) for each item across theta, or aggregates of these values across a set of items (\code{rtrf} for the test response function, \code{rtif}for the test information function, and \code{rtef} for the test error function).
}
\value{
A list is returned containing theta and the corresponding item function.
}
\author{
Anthony Albano \email{tony.d.albano@gmail.com}
}
\seealso{
\code{\link{plot.ifile}}
}
\examples{
rirf(-2)
rtrf(-2:2)
}
\keyword{methods}
