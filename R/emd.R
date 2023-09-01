#' Estimation in Maxwell distribution with randomly censored data
#' @export
#' @name emd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for Estimation in Maxwell distribution with parameters shape and scale.
#' @return \code{demd} gives the density, \code{pemd} gives the distribution function, \code{qemd} gives the quantile function and \code{remd} generates random deviates.
#' @details
#' Estimation in Maxwell distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{1t<sub>n</sub><sup>(&#952)</sup>}}{\eqn{}}.
#' @references  Krishna, H., Vivekanand ve Kumar, K., 2015,
#' *Estimation in Maxwell distribution with randomly censored data*, Journal of statistical computation and simulation, 85 (17), 3560-3578.
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

#' @export
#' @rdname emd
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

#' @export
#' @rdname emd
#' @param p new numeric vector of data values.
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

#' @export
#' @rdname emd
#' @param n new numeric vector of data values.
#' @examples
#' remd(100,1)
remd=function(n,theta) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be (0,inf)")}
    if(any(theta<0)) {stop("theta must be (0,inf)")}
    rn=qemd(runif(n),theta)
    return(rn)
  })
