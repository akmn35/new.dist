#' A new discrete distribution
#' @export
#' @rdname dndd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for a new discrete distribution with parameters shape and scale.
#' @return \code{dndd} gives the density, \code{pndd} gives the distribution function, \code{qndd} gives the quantile function and \code{rndd} generates random deviates.
#' @details
#' A new discrete distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' dndd(c(1:5),2)
#' dndd(-2,c(2:4))
#' dndd(c(1:5),c(2:5))
#' dndd(1.1,2)
dndd=function(x,theta)  #x=1,2,..., theta > 0
{ #p=exp(-theta)
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
    pdf[i]=(lambda[i]^x[i]/(1+theta[i]))*(theta[i]*(1-2*lambda[i])+(1-lambda[i])*(1+theta[i]*x[i]))
  }
  return(pdf)
}
#' A new discrete distribution
#' @export
#' @rdname pndd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for a new discrete distribution with parameters shape and scale.
#' @return \code{dndd} gives the density, \code{pndd} gives the distribution function, \code{qndd} gives the quantile function and \code{rndd} generates random deviates.
#' @details
#' A new discrete distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' pndd(c(1:5),2)
#' pndd(2,c(2:4))
#' pndd(c(1:5),c(2:5))
#' pndd(-2,c(2:4))
#' pndd(.2,c(2:4))
pndd=function(x,theta)
{
  x=floor(x)
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun = max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  cdf=NULL
  lambda=exp(-theta)
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=1-((1+theta[i]+theta[i]*x[i])/(1+theta[i]))*lambda[i]^x[i] else cdf[i]=0
  }
  return(cdf)
}
#' A new discrete distribution
#' @export
#' @rdname qndd
#' @param p new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for a new discrete distribution with parameters shape and scale.
#' @return \code{dndd} gives the density, \code{pndd} gives the distribution function, \code{qndd} gives the quantile function and \code{rndd} generates random deviates.
#' @details
#' A new discrete distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' qndd(.5,.2)
#' qndd(.8,1)
qndd=function(p,theta)
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun = max(length(p),length(theta))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  quant=NULL
  for (i in 1:enuzun)
  {
    x=0
    t=0
    while(t<p[i]){
      t=pndd(x,theta[i])
      x=x+1
    }
    quant[i]=x-1
  }
  return(quant)
}
#' A new discrete distribution
#' @export
#' @rdname rndd
#' @param n new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for a new discrete distribution with parameters shape and scale.
#' @return \code{dndd} gives the density, \code{pndd} gives the distribution function, \code{qndd} gives the quantile function and \code{rndd} generates random deviates.
#' @details
#' A new discrete distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' rndd(10,.1)
rndd=function(n,theta) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be (0,inf)")}
    if(any(theta<=0)|any(theta>=1)) {stop("theta must be between (0,1)")}
    rn=qndd(runif(n),theta)
    return(rn)
  })
