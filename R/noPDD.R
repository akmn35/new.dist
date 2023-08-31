#' A new one parameter discrete distribution and its applications
#' @export
#' @rdname dnoPDD
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for a new one parameter discrete distribution with parameters shape and scale.
#' @return \code{dnoPDD} gives the density, \code{pnoPDD} gives the distribution function, \code{qnoPDD} gives the quantile function and \code{rnoPDD} generates random deviates.
#' @details
#' A new one parameter discrete distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' dnoPDD(c(1:5),2)
#' dnoPDD(2,c(2:4))
#' dnoPDD(c(1:5),c(2:5))
#' dnoPDD(c(1:5),-2)
#' dnoPDD(-2,c(2:4))
dnoPDD=function(x,theta) #x,theta > 0
{
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun = max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=(theta[i]^6/(theta[i]^6+120))*(theta[i]+x[i]^5)*exp(-theta[i]*x[i])
  }
  return(pdf)
}
#' A new one parameter discrete distribution and its applications
#' @export
#' @rdname pnoPDD
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for a new one parameter discrete distribution with parameters shape and scale.
#' @return \code{dnoPDD} gives the density, \code{pnoPDD} gives the distribution function, \code{qnoPDD} gives the quantile function and \code{rnoPDD} generates random deviates.
#' @details
#' A new one parameter discrete distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' pnoPDD(c(1:5),2)
#' pnoPDD(2,c(2:4))
#' pnoPDD(c(1:5),c(2:5))
#' pnoPDD(-2,c(2:4))
#' pnoPDD(.2,c(2:4))
pnoPDD=function(x,theta) #x,theta > 0
{
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun=max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=1-(1+((theta[i]*x[i]*(theta[i]^4*x[i]^4+5*theta[i]^3*x[i]^3+20*theta[i]^2*x[i]^2+60*theta[i]*x[i]+120)/(theta[i]^6+120))))*exp(-theta[i]*x[i]) else cdf[i]=0
  }
  return(cdf)
}
#' A new one parameter discrete distribution and its applications
#' @export
#' @rdname qnoPDD
#' @param p new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for a new one parameter discrete distribution with parameters shape and scale.
#' @return \code{dnoPDD} gives the density, \code{pnoPDD} gives the distribution function, \code{qnoPDD} gives the quantile function and \code{rnoPDD} generates random deviates.
#' @details
#' A new one parameter discrete distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' qnoPDD(.1,1)
qnoPDD=function(p,theta) # 0<p<1, theta > 0
{
  if(any(p<0)) {stop("x must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun=max(length(p),length(theta))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  kok=NULL
  for (i in 1:enuzun)
  {
    F=function(x)
    {
      (1-(1+((theta[i]*x*(theta[i]^4*x^4+5*theta[i]^3*x^3+20*theta[i]^2*x^2+60*theta[i]*x+120)/(theta[i]^6+120))))*exp(-theta[i]*x))-p[i]
    }
    kok[i]=(uniroot(F,c(0,100000000)))$root
  }
  return(kok)
}
#' A new one parameter discrete distribution and its applications
#' @export
#' @rdname rnoPDD
#' @param n new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for a new one parameter discrete distribution with parameters shape and scale.
#' @return \code{dnoPDD} gives the density, \code{pnoPDD} gives the distribution function, \code{qnoPDD} gives the quantile function and \code{rnoPDD} generates random deviates.
#' @details
#' A new one parameter discrete distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' rnoPDD(10,1)
rnoPDD=function(n,theta)
{
  if(any(n<0)) {stop("n must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  rn=qnoPDD(runif(n),theta)
  return(rn)
}
