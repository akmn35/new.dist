#' The gamma-Lomax distribution
#' @export
#' @rdname gld
#' @param x new numeric vector of data values.
#' @param a a shape parameter.
#' @param alpha a shape1 parameter.
#' @param beta a shape2 parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the gamma-Lomax distribution with parameters shape and scale.
#' @return \code{dgld} gives the density, \code{pgld} gives the distribution function, \code{qgld} gives the quantile function and \code{rgld} generates random deviates.
#' @details
#' The gamma-Lomax distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Cordeiro, G. M., Ortega, E. M. ve Popović, B. V., 2015,
#' *The gamma-Lomax distribution*, Journal of statistical computation and simulation, 85 (2), 305-319.
#' @examples
#' dgld(1,2,3,4)
#' dgld(c(1:5),2,3,4)
#' dgld(c(1:5),c(2:6),3,4)
#' dgld(c(1:5),c(2:6),c(3:6),4)
dgld=function(x,a,alpha,beta)
{
  if(any(x<0)) {stop("x must be between (0,inf")}
  if(any(a<0)) {stop("a must be between (0,inf")}
  if(any(alpha<0)) {stop("alpha must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  enuzun = max(length(x),length(a),length(alpha),length(beta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  a=rep(a,enuzun/length(a)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=(alpha[i]*beta[i]^alpha[i])/(gamma(a[i])*(beta[i]+x[i])^(alpha[i]+1))*(-alpha[i]*log(beta[i]/(beta[i]+x[i])))^(a[i]-1)
  }
  return(pdf)
}
#' The gamma-Lomax distribution
#' @export
#' @rdname gld
#' @param x new numeric vector of data values.
#' @param a a shape parameter.
#' @param alpha a shape1 parameter.
#' @param beta a shape2 parameter.
#' @examples
#' pgld(1,2,3,4)
#' pgld(c(1:5),2,3,4)
#' pgld(c(1:5),c(2:6),3,4)
pgld=function(x,a,alpha,beta)
{
  if(any(x<0)) {stop("x must be between (0,inf")}
  if(any(a<0)) {stop("a must be between (0,inf")}
  if(any(alpha<0)) {stop("alpha must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  enuzun = max(length(x),length(a),length(alpha),length(beta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  a=rep(a,enuzun/length(a)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if (x[i]>0) cdf[i]=(gamma(a[i])-(expint::gammainc(a[i],(-alpha[i]*log(beta[i]/(beta[i]+x[i]))))))/gamma(a[i]) else cdf[i]=0
  }
  return(cdf)
}
#' The gamma-Lomax distribution
#' @export
#' @rdname gld
#' @param x new numeric vector of data values.
#' @param a a shape parameter.
#' @param alpha a shape1 parameter.
#' @param beta a shape2 parameter.
#' @examples
#' qgld(c(.7,.8),1,2,3)
#' qgld(c(.7,.8),c(1,2),2,3)
#' qgld(.8,2,2,3)
qgld=function(p,a,alpha,beta)
{
  enuzun = max(length(p),length(a),length(alpha),length(beta))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  a=rep(a,enuzun/length(a)+1)[1:enuzun]
  alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  kok=NULL
  for (i in 1:enuzun)
  {
    F=function(x)
    {
      (gamma(a[i])-(expint::gammainc(a[i],(-alpha[i]*log(beta[i]/(beta[i]+x)))))/gamma(a[i]))-p[i]
    }
    kok[i]=(uniroot(F, c(0, 1000000)))$root
  }
  return(kok)
}
#' The gamma-Lomax distribution
#' @export
#' @rdname gld
#' @param x new numeric vector of data values.
#' @param a a shape parameter.
#' @param alpha a shape1 parameter.
#' @param beta a shape2 parameter.
#' @examples
#' rgld(100,1,2,1)
rgld=function(n,a,alpha,beta) suppressWarnings(
  {
    rn=qgld(runif(n),a,alpha,beta)
    return(rn)
  })
