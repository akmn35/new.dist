#' Estimation in Maxwell distribution with randomly censored data
#' @export
#' @rdname demd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Estimation in Maxwell distribution with parameters shape and scale.
#' @return \code{demd} gives the density, \code{pemd} gives the distribution function, \code{qemd} gives the quantile function and \code{remd} generates random deviates.
#' @details
#' Estimation in Maxwell distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' demd(c(1:5),2)
#' demd(2,c(2:4))
#' demd(c(1:5),c(2:5))
#' demd(c(1:5),-2)
#' demd(-2,c(2:4))
demd=function(x,theta)
{
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun=max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=(4/pi^(1/2))*(1/theta[i]^(3/2))*x[i]^2*exp((-x[i]^2)/theta[i])
  }
  return(pdf)
}
#' Estimation in Maxwell distribution with randomly censored data
#' @export
#' @rdname pemd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Estimation in Maxwell distribution with parameters shape and scale.
#' @return \code{demd} gives the density, \code{pemd} gives the distribution function, \code{qemd} gives the quantile function and \code{remd} generates random deviates.
#' @details
#' Estimation in Maxwell distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' pemd(c(1:5),2)
pemd=function(x,theta) #x,theta > 0
{
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun=max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=pracma::gammainc((x[i]^2/theta[i]),3/2)[3] else cdf[i]=0
  }
  return(cdf)
}
#' Estimation in Maxwell distribution with randomly censored data
#' @export
#' @rdname qemd
#' @param p new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Estimation in Maxwell distribution with parameters shape and scale.
#' @return \code{demd} gives the density, \code{pemd} gives the distribution function, \code{qemd} gives the quantile function and \code{remd} generates random deviates.
#' @details
#' Estimation in Maxwell distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' qemd(c(.7,.8),2)
#' qemd(.4,5)
qemd=function(p,theta) suppressWarnings(
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
        pracma::gammainc((x^2/theta[i]),3/2)[3]-p[i]
      }
      kok[i]=(uniroot(F, c(0,10)))$root
    }
    return(kok)
  })
#' Estimation in Maxwell distribution with randomly censored data
#' @export
#' @rdname remd
#' @param n new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Estimation in Maxwell distribution with parameters shape and scale.
#' @return \code{demd} gives the density, \code{pemd} gives the distribution function, \code{qemd} gives the quantile function and \code{remd} generates random deviates.
#' @details
#' Estimation in Maxwell distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' remd(100,1)
remd=function(n,theta) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be (0,inf)")}
    if(any(theta<0)) {stop("theta must be (0,inf)")}
    rn=qemd(runif(n),theta)
    return(rn)
  })
