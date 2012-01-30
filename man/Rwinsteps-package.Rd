\name{Rwinsteps-package}
\alias{Rwinsteps-package}
\alias{Rwinsteps}
\docType{package}
\title{
Running Winsteps in R
}
\description{
The Rwinsteps package facilitates communication between R and the Rasch modeling software Winsteps. The package currently includes functions for reading and writing command files, sending them to Winsteps, reading and writing data according to command file specifications, reading output into R, and plotting various results.
}
\details{
\tabular{ll}{
Package: \tab Rwinsteps\cr
Version: \tab 1.0-1\cr
Date: \tab 2012-1-30\cr
Depends: \tab R (>= 2.12.0)\cr
LazyLoad: \tab yes\cr
License: \tab GPL (>= 2)\cr
URL: \tab http://www.r-project.org\cr
Built: \tab R 2.13.0; ; 2011-08-30 21:02:07 UTC; windows\cr
}

Index:
\preformatted{
ifile                   Item and Person Summary Files
plot.ifile              Plotting Item Staistics
wdat                    Winsteps Data File
rirf                    Item Functions
wcmd                    Winsteps Command File
winsteps                Running Winsteps
}
Rasch modeling in Winsteps begins with a command file, which specifies the structure and contents of the data file and which includes options for customizing how the model is run and fit and for requesting output tables and files. A command file may be construced in R using the \code{wcmd} function, read in to R using \code{read.wcmd}, or simply referenced in the \code{winsteps} function, in which case it is still read into R but invisibly.

The \code{winsteps} function returns two of the more relevant output files, the ifile and pfile, for further manipulation and analysis in R. These can also be saved to file and they are read into R using the functions \code{read.ifile} and \code{read.pfile}, which are simple wrappers to the function \code{read.csv}. In this case, files should be saved as csv, and the default file headers should always be included.

Rwinsteps includes additional functions for obtaining the response, information, and error functions at both the test and item levels for the dichotomous Rasch model, and for plotting and comparing results. Finally, the \code{read.wdat} and \code{write.wdat} functions read and write fixed width formatted data by extracting required information from a command file.
}
\author{
Anthony Albano <tony.d.albano@gmail.com>, Ben Babcock <ben.babcock@arrt.org>

Maintainer: Anthony Albano <tony.d.albano@gmail.com>
}
\references{
Winsteps is commercial software, available at \url{www.winsteps.com}
}
\keyword{package}
