#' A new lifetime distribution
#' @export
#' @name nld
#' @param x new numeric vector of data values.
#' @param lambda a shape parameter.
#' @param beta a shape1 parameter.
#' @description
#' Density, distribution function, quantile function and random generation for a new lifetime distribution with parameters shape and scale.
#' @return \code{dnld} gives the density, \code{pnld} gives the distribution function, \code{qnld} gives the quantile function and \code{rnld} generates random deviates.
#' @details
#' A new lifetime distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Kuş, C., 2007,
#' *A new lifetime distribution*, Computational Statistics & Data Analysis, 51 (9), 4497-4509.
#' @examples
#' dnld(1,2,3)
#' dnld(c(1:5),2,3)
#' dnld(c(1:5),c(2:6),3)
#' dnld(c(1:5),c(2:6),c(3:6))
dnld=function(x,lambda,beta)  #x,lambda,beta > 0
{
  if(any(x<0)) {stop("x must be between [0,1]")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  enuzun=max(length(x),length(lambda),length(beta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  lambda=rep(lambda, enuzun/length(lambda)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=(lambda[i]*beta[i])/(1-exp(-lambda[i]))*exp((-lambda[i])-beta[i]*x[i]+lambda[i]*exp(-beta[i]*x[i]))
  }
  return(pdf)
}
#' A new lifetime distribution
#' @export
#' @rdname nld
#' @param x new numeric vector of data values.
#' @param lambda a shape parameter.
#' @param beta a shape1 parameter.
#' @examples
#' pnld(1,2,3)
#' pnld(c(1:5),2,3)
#' pnld(c(1:5),c(2:6),3)
#' pnld(c(1:5),c(2:6),c(3:5))
#' pnld(-5,c(2:6),3)
pnld=function(x,lambda,beta) #x,lambda,beta > 0
{
  if(any(x<0)) {stop("x must be between [0,1]")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  enuzun=max(length(x),length(lambda),length(beta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  lambda=rep(lambda, enuzun/length(lambda)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=((exp(lambda[i]*exp(-beta[i]*x[i]))-exp(lambda[i]))*(1-exp(lambda[i]))^(-1)) else cdf[i]=0
  }
  return(cdf)
}
#' A new lifetime distribution
#' @export
#' @rdname nld
#' @param p new numeric vector of data values.
#' @param lambda a shape parameter.
#' @param beta a shape1 parameter.
#' @examples
#' qnld(.8,2,3)
qnld=function(p,lambda,beta) # 0<p<1, theta > 0
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  enuzun=max(length(p),length(lambda),length(beta))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  lambda=rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  qfonk=NULL
  for (i in 1:enuzun)
  {
    qfonk[i]=-(log(log((exp(lambda[i])+p[i]-p[i]*exp(lambda[i])))/lambda[i])/beta[i])
  }
  return(qfonk)
}
#' A new lifetime distribution
#' @export
#' @rdname nld
#' @param n new numeric vector of data values.
#' @param lambda a shape parameter.
#' @param beta a shape1 parameter.
#' @examples
#' rnld(10,1,2)
rnld=function(n,lambda,beta)
{
  if(any(n<0)) {stop("n must be (0,inf)")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  rn=qnld(runif(n),lambda,beta)
  return(rn)
}
