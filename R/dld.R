#' The discrete Lindley distribution
#' @export
#' @rdname dld
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the discrete Lindley distribution with parameters shape and scale.
#' @return \code{ddld} gives the density, \code{pdld} gives the distribution function, \code{qdld} gives the quantile function and \code{rdld} generates random deviates.
#' @details
#' The discrete Lindley distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{><em>λ</em><sup><em>x</em></sup>/(1−log(<em>λ</em>))</span></p>}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' ddld(c(1:5),2)
#' ddld(c(1:5),-2)
#' ddld(-1,2)
#' ddld(2,c(2:4))
#' ddld(c(1:5),c(2:5))
ddld=function(x,theta)
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
#' The discrete Lindley distribution
#' @export
#' @rdname dld
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @examples
#' pdld(2,1)
#' pdld(1,c(2:4))
pdld=function(x,theta)
{
  x=floor(x)
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun = max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  cdf=NULL
  lambda=exp(-theta)
  for (i in 1:enuzun)
  {
    if (x[i]>=0) cdf[i]=(1-(lambda[i]^(x[i]+1))+(((2+x[i])*lambda[i]^(x[i]+1))-1)*log(lambda[i]))/(1-log(lambda[i])) else cdf[i]=0
  }
  return(cdf)
}
#' The discrete Lindley distribution
#' @export
#' @rdname dld
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @examples
#' qdld(c(.685,.67),.5)
#' qdld(.993,2)
qdld=function(p,theta)
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(theta<0)) {stop("theta must be (0,inf)")}
  enuzun = max(length(p),length(theta))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  theta=rep(theta, enuzun/length(theta)+1)[1:enuzun]
  quant=NULL
  lambda=exp(-theta)
  for (i in 1:enuzun)
  {
    x=0
    t=0
    while(t<p[i]){
      t=pdld(x,theta[i])
      x=x+1
    }
    quant[i]=x-1
  }
  {
    return(quant)
  }
}
#' The discrete Lindley distribution
#' @export
#' @rdname dld
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @examples
#' rdld(10,1)
rdld=function(n,theta) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be (0,inf)")}
    if(any(theta<0)) {stop("lambda must be between (0,inf")}
    rn=qdld(runif(n),theta)
    return(rn)
  })
