## taken from http://gallery.rcpp.org/articles/dmvnorm_arma/

#' Tmp
#'
#' @param X tmp
#' @param mu tmp
#' @param Sigma tmp
#'
#' @return tmp
#' @export
dMvn <- function(X,mu,Sigma) {
  k <- ncol(X)
  rooti <- backsolve(chol(Sigma),diag(k))
  quads <- colSums((crossprod(rooti,(t(X)-mu)))^2)
  return(exp(-(k/2)*log(2*pi) + sum(log(diag(rooti))) - .5*quads))
}
