#' Two-Parameter Rayleigh Distribution
#' @export
#' @name tprd
#' @param x new numeric vector of data values.
#' @param lambda a shape1 parameter.
#' @param mu a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Two-Parameter Rayleigh  distribution with parameters shape and scale.
#' @return \code{dtprd} gives the density, \code{ptprd} gives the distribution function, \code{qtprd} gives the quantile function and \code{rtprd} generates random deviates.
#' @details
#' The Two-Parameter Rayleigh distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Dey, S., Dey, T. ve Kundu, D., 2014,
#' *Two-parameter Rayleigh distribution: different methods of estimation*, American Journal of Mathematical and Management Sciences, 33 (1), 55-74.
#' @examples
#' dtprd(c(5),c(4),5)
#' dtprd(c(9),c(4:8),5)
#' dtprd(c(5),c(3,4),c(4:9))
#' dtprd(c(5),c(4),-5)
dtprd=function(x,lambda,mu) #x>mu,  mu,lambda>0
{
  if(any(mu<0)) {stop("mu must be (0,inf)")}
  if(any(lambda<0)) {stop("beta must be (0,inf)")}
  if(any(x<mu)) {stop("x must bigger than mu")}
  enuzun=max(length(x),length(lambda),length(mu))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  mu=rep(mu, enuzun/length(mu)+1)[1:enuzun]
  lambda=rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=2*lambda[i]*(x[i]-mu[i])*exp(-lambda[i]*(x[i]-mu[i])^2)
  }

  return(pdf)
}
#' Two-Parameter Rayleigh Distribution
#' @export
#' @rdname tprd
#' @param p new numeric vector of data values.
#' @param lambda a shape1 parameter.
#' @param mu a shape parameter.
#' @examples
#' ptprd(c(4:5),c(4),3)
#' ptprd(c(6),c(4:5),4)
#' ptprd(4,1,c(1:3))
#' ptprd(-5,c(4:8),4)
ptprd=function(x,lambda,mu) #x>mu,  mu,lambda>0
{
  if(any(mu<0)) {stop("mu must be (0,inf")}
  if(any(lambda<0)) {stop("beta must be (0,inf")}
  #if(any(x<mu)) {stop("x must bigger than mu")}
  enuzun=max(length(x),length(lambda),length(mu))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  lambda=rep(lambda, enuzun/length(lambda)+1)[1:enuzun]
  mu=rep(mu,enuzun/length(mu)+1)[1:enuzun]
  cdf=NULL

  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=1-exp(-lambda[i]*(x[i]-mu[i])^2) else cdf[i]=0
  }

  return(cdf)
}
#' Two-Parameter Rayleigh Distribution
#' @export
#' @rdname tprd
#' @param p new numeric vector of data values.
#' @param lambda a shape1 parameter.
#' @param mu a shape parameter.
#' @examples
#' qtprd(.5,1,2)
#' qtprd(.3,4,2)
qtprd=function(p,lambda,mu)
{
  enuzun=max(length(p),length(lambda),length(mu))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  lambda=rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  mu=rep(mu,enuzun/length(mu)+1)[1:enuzun]
  qfonk=NULL
  for (i in 1:enuzun)
  {
    qfonk[i]=-(-lambda[i]*mu[i]+(-lambda[i]*log(1-p[i]))^(1/2))/lambda[i]
  }
  return(qfonk)
}
#' Two-Parameter Rayleigh Distribution
#' @export
#' @rdname tprd
#' @param n new numeric vector of data values.
#' @param lambda a shape1 parameter.
#' @param mu a shape parameter.
#' @examples
#' rtprd(100,1,2)
rtprd=function(n,lambda,mu)
{
  if(any(n<0)) {stop("n must be (0,inf)")}
  if(any(lambda<0)) {stop("theta must be (0,inf)")}
  if(any(mu<0)) {stop("theta must be (0,inf)")}
  rn=qtprd(runif(n),lambda,mu)
  return(rn)
}
