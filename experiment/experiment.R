## taken from http://gallery.rcpp.org/articles/dmvnorm_arma/
#
# rm(list=ls())
# set.seed(123)
# sigma <- bayesm::rwishart(10,diag(8))$IW
# means <- rnorm(8)
# X     <- mvtnorm::rmvnorm(100, means, sigma)
# vec1 <- dMvn(X, means, sigma)
# vec2 <- dmvnrm_arma(X, means, sigma)
# vec3 <- dmvnrm_arma_mc(X, means, sigma)

require(rbenchmark)
cores <- 15
set.seed(123)
sigma <- bayesm::rwishart(10,diag(8))$IW
means <- rnorm(8)
X     <- mvtnorm::rmvnorm(900000, means, sigma)
benchmark(dmvnrm_arma(X,means,sigma,F) ,
          dmvnrm_arma_mc(X,means,sigma,F,cores),
          dMvn(X,means,sigma),
          order="relative", replications=100)[,1:4]
