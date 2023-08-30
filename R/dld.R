#' The discrete Lindley distribution
#' @export
#' @rdname ddld
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Power Muth distribution with parameters shape and scale.
#' @return \code{ddld} gives the density, \code{pdld} gives the distribution function, \code{qdld} gives the quantile function and \code{rdld} generates random deviates.
#' @details
#' The discrete Lindley distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' dDLD(c(1:5),2)
#' dDLD(c(1:5),-2)
#' dDLD(-1,2)
#' dDLD(2,c(2:4))
#' dDLD(c(1:5),c(2:5))
dDLD=function(x,theta)  #x=0,1,..., #theta > 0
{
  x=floor(x)
  if(any(x<0)) {stop("x must be (0,inf)")}
  #if(any(x!=floor(x))) {stop("x must be (0,1,2,...)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun = max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  pdf=NULL
  lambda=exp(-theta)
  for (i in 1:enuzun)
  {
    pdf[i]=(lambda[i]^x[i]/(1-log(lambda[i])))*(lambda[i]*log(lambda[i])+(1-lambda[i])*(1-log(lambda[i]^(x[i]+1))))
  }
  return(pdf)
}
