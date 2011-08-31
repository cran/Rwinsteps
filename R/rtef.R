rtef <- function(x, theta = seq(-4, 4, length = 100)){

  ni <- length(x)
  out <- list(theta = theta)
  out$e <- 1/sqrt(rtif(x, theta)$pq)

  class(out) <- "rtef"

  return(out)
}
