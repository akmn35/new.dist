#' On parameter estimation of the standard omega distribution
#' @export
#' @name sod
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta a shape1 parameter.
#' @description
#' Density, distribution function, quantile function and random generation for On parameter estimation of the standard omega distribution with parameters shape and scale.
#' @return \code{dsod} gives the density, \code{psod} gives the distribution function, \code{qsod} gives the quantile function and \code{rsod} generates random deviates.
#' @details
#' On parameter estimation of the standard omega distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Birbiçer, İ. ve Genç, A. İ., 2022,
#' *On parameter estimation of the standard omega distribution*. Journal of Applied Statistics, 1-17.
#' @examples
#' library(new.dist)
#' dsod(c(0.4),c(4),5)
#' dsod(c(0.4),c(4:8),5)
#' dsod(c(0.3,0.4),c(3,4),c(4:9))
dsod=function(x,alpha,beta) suppressWarnings(
  {
    if(any(x<0)|any(x>1)) {stop("x must be between [0,1]")}
    if(any(alpha<0)) {stop("alpha must be between (0,inf")}
    if(any(beta<0)) {stop("beta must be between (0,inf")}
    enuzun=max(length(x),length(alpha),length(beta))
    x=rep(x,enuzun/length(x)+1)[1:enuzun]
    alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
    beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
    pdf=NULL
    for (i in 1:enuzun)
    {
      pdf[i]=(alpha[i]*beta[i]*x[i]^(beta[i]-1)*(1/(1-x^(2*beta[i])))*((1+x[i]^(beta[i]))/(1-x[i]^(beta[i])))^(-alpha[i]/2))
    }
    return(pdf)
  })
#' On parameter estimation of the standard omega distribution
#' @export
#' @rdname sod
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta a shape1 parameter.
#' @examples
#' psod(c(0.4),c(4),5)
#' psod(c(0.3,0.4),c(3,4),c(4,5))
#' psod(c(-2),c(3,4),c(4,5))
psod=function(x,alpha,beta) #  0<x<1, alpha,beta > 0
{
  if(any(x<0)|any(x>1)) {stop("x must be between [0,1]")}
  if(any(alpha<0)) {stop("alpha must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  enuzun = max(length(x),length(alpha),length(beta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=1-((1+x[i]^beta[i])/(1-x[i]^beta[i]))^(-alpha[i]/2) else cdf[i]=0
  }
  return(cdf)
}
#' On parameter estimation of the standard omega distribution
#' @export
#' @rdname sod
#' @param p new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta a shape1 parameter.
#' @examples
#' qsod(.8,2,3)
qsod=function(p,alpha,beta) # 0<p<1, theta > 0
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(alpha<0)) {stop("alpha must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  enuzun = max(length(p),length(alpha),length(beta))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  qfonk=NULL
  for (i in 1:enuzun)
  {
    qfonk[i]=exp(log((exp(-(2*log(1-p[i])/alpha[i]))-1)/(exp(-(2*log(1-p[i])/alpha[i]))+1))/beta[i])
  }
  return(qfonk)
}
#' On parameter estimation of the standard omega distribution
#' @export
#' @rdname sod
#' @param n new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta a shape1 parameter.
#' @examples
#' rsod(10,1,2)
rsod=function(n,alpha,beta) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be (0,inf)")}
    if(any(alpha<0)) {stop("alpha must be between (0,inf")}
    if(any(beta<0)) {stop("beta must be between (0,inf")}
    rn=qsod(runif(n),alpha,beta)
    return(rn)
  })
