#' Estimation procedures for kumaraswamy distribution parameters under adaptive type-II hybrid progressive censoring
#' @export
#' @rdname depkd
#' @param x new numeric vector of data values.
#' @param lambda a shape1 parameter.
#' @param alpha a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Estimation procedures for kumaraswamy distribution with parameters shape and scale.
#' @return \code{depkd} gives the density, \code{pepkd} gives the distribution function, \code{qepkd} gives the quantile function and \code{repkd} generates random deviates.
#' @details
#' ...Estimation procedures for kumaraswamy distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' depkd(0.1,2,3)
#' depkd(c(0.1,0.5),2,3)
#' depkd(c(0.1,0.5),c(2:6),3)
#' depkd(c(0.1,0.5),c(2:6),c(3:6))
depkd=function(x,lambda,alpha)
{
  if(any(x<0)|any(x>1)) {stop("x must be between [0,1]")}
  if(any(lambda<0)) {stop("alpha must be between (0,inf")}
  if(any(alpha<0)) {stop("beta must be between (0,inf")}
  enuzun = max(length(x),length(lambda),length(alpha))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  lambda=rep(lambda, enuzun/length(lambda)+1)[1:enuzun]
  alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=alpha[i]*lambda[i]*(x[i]^(lambda[i]-1))*(1-x[i]^lambda[i])^(alpha[i]-1)
  }
  return(pdf)
}
#' Estimation procedures for kumaraswamy distribution parameters under adaptive type-II hybrid progressive censoring
#' @export
#' @rdname pepkd
#' @param p new numeric vector of data values.
#' @param lambda a shape1 parameter.
#' @param alpha a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Estimation procedures for kumaraswamy distribution with parameters shape and scale.
#' @return \code{depkd} gives the density, \code{pepkd} gives the distribution function, \code{qepkd} gives the quantile function and \code{repkd} generates random deviates.
#' @details
#' ...Estimation procedures for kumaraswamy distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' pepkd(0.5,2,3)
#' pepkd(c(0.1,0.5),2,3)
#' pepkd(c(0.1,0.5),c(2:6),3)
#' pepkd(c(0.1,0.5),c(2:6),c(3:6))
#' pepkd(-1,c(2:6),c(3:6))
pepkd=function(x,lambda,alpha) suppressWarnings(
  {
    if(any(x<0)|any(x>1)) {stop("x must be between [0,1]")}
    if(any(lambda<0)) {stop("alpha must be between (0,inf")}
    if(any(alpha<0)) {stop("beta must be between (0,inf")}
    enuzun = max(length(x),length(lambda),length(alpha))
    x=rep(x,enuzun/length(x)+1)[1:enuzun]
    lambda=rep(lambda, enuzun/length(lambda)+1)[1:enuzun]
    alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
    cdf=NULL
    for (i in 1:enuzun)
    {
      if (x[i]>0) cdf[i]=1-(1-x[i]^lambda[i])^alpha[i] else cdf[i]=0
    }
    return(cdf)
  })
#' Estimation procedures for kumaraswamy distribution parameters under adaptive type-II hybrid progressive censoring
#' @export
#' @rdname qepkd
#' @param p new numeric vector of data values.
#' @param lambda a shape1 parameter.
#' @param alpha a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Estimation procedures for kumaraswamy distribution with parameters shape and scale.
#' @return \code{depkd} gives the density, \code{pepkd} gives the distribution function, \code{qepkd} gives the quantile function and \code{repkd} generates random deviates.
#' @details
#' ...Estimation procedures for kumaraswamy distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' qepkd(.8,1,2)
#' qepkd(.4,2,5)
qepkd=function(p,lambda,alpha)
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  if(any(alpha<0)) {stop("alpha must be between (0,inf")}
  enuzun = max(length(p),length(lambda),length(alpha))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  lambda=rep(lambda, enuzun/length(lambda)+1)[1:enuzun]
  alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
  qfonk=NULL
  for (i in 1:enuzun)
  {
    qfonk[i]=exp(log(-exp(log(1-p[i])/alpha[i])+1)/lambda[i])
  }
  return(qfonk)
}
#' Estimation procedures for kumaraswamy distribution parameters under adaptive type-II hybrid progressive censoring
#' @export
#' @rdname repkd
#' @param n new numeric vector of data values.
#' @param lambda a shape1 parameter.
#' @param alpha a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Estimation procedures for kumaraswamy distribution with parameters shape and scale.
#' @return \code{depkd} gives the density, \code{pepkd} gives the distribution function, \code{qepkd} gives the quantile function and \code{repkd} generates random deviates.
#' @details
#' ...Estimation procedures for kumaraswamy distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' repkd(10,1,2)
repkd=function(n,lambda,alpha) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be (0,inf)")}
    if(any(lambda<0)) {stop("lambda must be between (0,inf")}
    if(any(alpha<0)) {stop("alpha must be between (0,inf")}
    rn=qepkd(runif(n),lambda,alpha)
    return(rn)
  })
