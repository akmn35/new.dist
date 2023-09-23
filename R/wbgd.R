#' Weighted Bivariate Geometric Distribution
#' @export
#' @name wbgd
#' @param x vector of quantiles.
#' @param alpha,lambda are parameters.
#' @param log,log.p logical; if TRUE, probabilities p are given as log(p).
#' @param lower.tail logical; if TRUE (default), probabilities are \eqn{P\left[ X\leq x\right]}, otherwise,\eqn{P\left[ X>x\right] }.
#' @description
#' Density, distribution function, quantile function and random generation for the Weighted Bivariate Geometric distributions parameters.
#' @return \code{dwbgd} gives the density, \code{pwbgd} gives the distribution function, \code{qwbgd} gives the quantile function and \code{rwbgd} generates random deviates.
#' @details
#' The Weighted Bivariate Geometric distribution with parameters \eqn{\alpha} and \eqn{\lambda}, has density given by
#' \deqn{f\left( x\right) =\frac{\left( 1-\alpha \right) \left( 1-\alpha ^{\lambda+1}\right) }{1-\alpha ^{\lambda }}\alpha ^{x-1}\left( 1-\alpha ^{\lambda x}\right),}
#' where
#' \deqn{x\in \mathbb {N} =1,2,...~,~\lambda >0,~0<\alpha <1.}
#' @references  Najarzadegan, H., Alamatsaz, M. H., Kazemi, I. ve Kundu, D., 2020,
#' *Weighted bivariate geometric distribution: Simulation and estimation*, Communications in Statistics-Simulation and Computation, 49 (9), 2419-2443.
#' @examples
#' dwbgd(1,alpha=.2,lambda=3)
dwbgd<-function(x,alpha,lambda,log=FALSE)
{
  x<-floor(x)
  if(any(alpha<=0)|any(alpha>=1)) {stop("alpha must be between >= 0 and <= 1")}
  if(any(lambda<=0)) {stop("lambda must be > 0")}
  enuzun<-max(length(x),length(alpha),length(lambda))
  x<-rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha<-rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  lambda<-rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  pdf<-NULL
  for (i in 1:enuzun)
  {
    if(x[i]<=0) {pdf[i]<-0} else
    pdf[i]<-((1-alpha[i])*(1-alpha[i]^(lambda[i]+1)))/(1-alpha[i]^lambda[i])*alpha[i]^(x[i]-1)*(1-alpha[i]^(lambda[i]*x[i]))
  }
  if(log==TRUE) pdf<-log(pdf)
  return(pdf)
}
#' Weighted Bivariate Geometric Distribution
#' @export
#' @rdname wbgd
#' @examples
#' pwbgd(1,alpha=.2,lambda=3)
pwbgd=function(x,alpha,lambda,lower.tail=TRUE,log.p=FALSE)
{
  x<-floor(x)
  if(any(alpha<=0)|any(alpha>=1)) {stop("alpha must be between >= 0 and <= 1")}
  if(any(lambda<=0)) {stop("lambda must be > 0")}
  enuzun=max(length(x),length(alpha),length(lambda))
  x<-rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha<-rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  lambda<-rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  cdf<-NULL
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]<-1-(1-alpha[i]^(lambda[i]+1)-alpha[i]^(lambda[i]*(floor(x[i])+1))*(1-alpha[i]))/(1-alpha[i]^lambda[i])*alpha[i]^(floor(x[i])) else cdf[i]=0
  }
  if(lower.tail==FALSE) cdf<-1-cdf
  if(log.p==TRUE) cdf<-log(cdf)
  return(cdf)
}
#' Weighted Bivariate Geometric Distribution
#' @export
#' @rdname wbgd
#' @param p vector of probabilities.
#' @examples
#' qwbgd(.98,alpha=.2,lambda=3)
qwbgd<-function(p,alpha,lambda,lower.tail=TRUE)
{
  if(any(p<0)|any(p>1)) {stop("p must be between >= 0 and <= 1")}
  if(any(alpha<=0)|any(alpha>=1)) {stop("alpha must be between >= 0 and <= 1")}
  if(any(lambda<=0)) {stop("lambda must be > 0")}
  enuzun<-max(length(p),length(alpha),length(lambda))
  p<-rep(p,enuzun/length(p)+1)[1:enuzun]
  alpha<-rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  lambda<-rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  quant<-NULL
  for (i in 1:enuzun)
  {
    x<-0
    t<-0
    while(t<p[i]){
      t<-pwbgd(x,alpha[i],lambda[i])
      x<-x+1
    }
    quant[i]<-x-1
  }
  if(lower.tail==FALSE){
    for (i in 1:enuzun){
    x<-0
    t<-0
    while(t<(1-p[i])){
      t<-pwbgd(x,alpha[i],lambda[i])
      x<-x+1
    }
    quant[i] <- x-1}
  }
  {
    return(quant)
  }
}
#' Weighted Bivariate Geometric Distribution
#' @export
#' @rdname wbgd
#' @param n number of observations. If \code{length(n) > 1}, the length is taken to be the number required.
#' @examples
#' rwbgd(10,alpha=.2,lambda=3)
rwbgd<-function(n,alpha,lambda)
  {
    n<-floor(n)
    if(any(n<1)) {stop("n must be >= 1")}
    if(any(alpha<=0)|any(alpha>=1)) {stop("alpha must be between >= 0 and <= 1")}
    if(any(lambda<=0)) {stop("lambda must be > 0")}
    suppressWarnings({
    rn<-qwbgd(stats::runif(n),alpha,lambda)})
    return(rn)
  }
