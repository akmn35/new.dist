#' Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution
#' @export
#' @rdname drld
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution with parameters shape and scale.
#' @return \code{drld} gives the density, \code{prld} gives the distribution function, \code{qrld} gives the quantile function and \code{rrld} generates random deviates.
#' @details
#' Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' drld(c(1:5),2)
#' drld(2,c(2:4))
#' drld(c(1:5),c(2:5))
#' drld(c(1:5),-2)
#' drld(-2,c(2:4))
drld=function(x,theta)
{
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun = max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=(theta[i]^2/(1+theta[i]))*(1+x[i])*exp(-theta[i]*x[i])
  }
  return(pdf)
}
#' Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution
#' @export
#' @rdname prld
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution with parameters shape and scale.
#' @return \code{drld} gives the density, \code{prld} gives the distribution function, \code{qrld} gives the quantile function and \code{rrld} generates random deviates.
#' @details
#' Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' prld(c(1:5),2)
#' prld(2,c(2:4))
#' prld(c(1:5),c(2:5))
#' prld(-1,c(2:4))
#' prld(c(-1,-2),c(2:5))
#' prld(c(1:5),-2)
#' prld(-2,c(2:4))
prld=function(x,theta)
{
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun = max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=1-(1+(theta[i]/(1+theta[i]))*x[i])*exp(-theta[i]*x[i]) else cdf[i]=0
  }
  return(cdf)
}
#' Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution
#' @export
#' @rdname qrld
#' @param p new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution with parameters shape and scale.
#' @return \code{drld} gives the density, \code{prld} gives the distribution function, \code{qrld} gives the quantile function and \code{rrld} generates random deviates.
#' @details
#' Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' qrld(.8,1)
#' qrld(.9,5)
qrld=function(p,theta)
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun = max(length(p),length(theta))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  qfonk=NULL
  for (i in 1:enuzun)
  {
    qfonk[i]=-((pracma::lambertWn((1+theta[i])*(-1+p[i])*exp(-1-theta[i]))+1+theta[i])/theta[i])
  }
  return(qfonk)
}
#' Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution
#' @export
#' @rdname rrld
#' @param n new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution with parameters shape and scale.
#' @return \code{drld} gives the density, \code{prld} gives the distribution function, \code{qrld} gives the quantile function and \code{rrld} generates random deviates.
#' @details
#' Inferences on stress–strength reliability based on ranked set sampling data incase of Lindley distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' rrld(10,1)
rrld=function(n,theta)
{
  if(any(n<0)) {stop("n must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  rn=qrld(runif(n),theta)
  return(rn)
}
