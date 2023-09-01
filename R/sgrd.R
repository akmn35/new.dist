#' Slashed generalized Rayleigh distribution
#' @export
#' @rdname sgrd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @param alpha a shape1 parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Slashed generalized Rayleigh distribution with parameters shape and scale.
#' @return \code{dsgrd} gives the density, \code{psgrd} gives the distribution function, \code{qsgrd} gives the quantile function and \code{rsgrd} generates random deviates.
#' @details
#' The Slashed generalized Rayleigh distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Iriarte, Y. A., Vilca, F., Varela, H. ve Gómez, H. W., 2017,
#' *Slashed generalized Rayleigh distribution*, Communications in Statistics-Theory and Methods, 46 (10), 4686-4699.
#' @examples
#' dsgrd(1,2,3)
#' dsgrd(c(1:5),2,3)
#' dsgrd(c(1:5),c(2:6),3)
#' dsgrd(c(1:5),c(2:6),c(3:5))
dsgrd=function(x,theta,alpha) #x,theta > 0 ,alpha > -1
{
  if(any(x<0)) {stop("x must be between (0,inf")}
  if(any(theta<0)) {stop("theta must be between (0,inf")}
  if(any(alpha<(-1))) {stop("alpha must be between (-1,inf")}
  enuzun=max(length(x),length(theta),length(alpha))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta, enuzun/length(theta)+1)[1:enuzun]
  alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=(2*theta[i]^(alpha[i]+1)/gamma(alpha[i]+1))*x[i]^(2*alpha[i]+1)*exp(-theta[i]*x[i]^2)
  }
  return(pdf)
}
#' Slashed generalized Rayleigh distribution
#' @export
#' @rdname sgrd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @param alpha a shape1 parameter.
#' @examples
#' psgrd(1,2,3)
#' psgrd(c(1:5),2,3)
#' psgrd(c(1:5),c(2:6),3)
#' psgrd(c(1:5),c(2:6),c(3:5))
#' psgrd(-5,c(2:6),c(3:5))
#' psgrd(.1,1,2)
psgrd=function(x,theta,alpha)
{
  if(any(x<0)) {stop("x must be between (0,inf")}
  if(any(theta<0)) {stop("theta must be between (0,inf")}
  if(any(alpha<(-1))) {stop("alpha must be between (-1,inf")}
  enuzun=max(length(x),length(theta),length(alpha))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta, enuzun/length(theta)+1)[1:enuzun]
  alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=(gamma(alpha[i]+1)-(expint::gammainc(alpha[i]+1,theta[i]*x[i]^2)))/gamma(alpha[i]+1) else cdf[i]=0
  }
  return(cdf)
}
#' Slashed generalized Rayleigh distribution
#' @export
#' @rdname sgrd
#' @param p new numeric vector of data values.
#' @param theta a shape parameter.
#' @param alpha a shape1 parameter.
#' @examples
#' qsgrd(c(.7,.8),2,3)
#' qsgrd(c(.7,.8),c(1,2),2)
qsgrd=function(p,theta,alpha)
{
  enuzun=max(length(p),length(theta),length(alpha))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  theta=rep(theta, enuzun/length(theta)+1)[1:enuzun]
  alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
  kok=NULL
  for (i in 1:enuzun)
  {
    F=function(x)
    {
      (gamma(alpha[i]+1)-(expint::gammainc(alpha[i]+1,theta[i]*x^2)))/gamma(alpha[i]+1)-p[i]
    }
    kok[i]=(uniroot(F, c(0, 100000)))$root
  }
  return(kok)
}
#' Slashed generalized Rayleigh distribution
#' @export
#' @rdname sgrd
#' @param n new numeric vector of data values.
#' @param theta a shape parameter.
#' @param alpha a shape1 parameter.
#' @examples
#' rsgrd(10,1,2)
rsgrd=function(n,theta,alpha) suppressWarnings(
  {
    rn=qsgrd(runif(n),theta,alpha)
    return(rn)
  })
