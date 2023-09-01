#' Weighted Bivariate Geometric Distribution
#' @export
#' @rdname wbgd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param lambda a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Weighted Bivariate Geometric distribution with parameters shape and scale.
#' @return \code{dwbgd} gives the density, \code{pwbgd} gives the distribution function, \code{qwbgd} gives the quantile function and \code{rwbgd} generates random deviates.
#' @details
#' The Weighted Bivariate Geometric distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Najarzadegan, H., Alamatsaz, M. H., Kazemi, I. ve Kundu, D., 2020,
#' *Weighted bivariate geometric distribution: Simulation and estimation*, Communications in Statistics-Simulation and Computation, 49 (9), 2419-2443.
#' @examples
#' dwbgd(1,.2,3)
#' dwbgd(c(1:5),.2,3)
#' dwbgd(c(1:5),c(.2,.3,.4),3)
#' dwbgd(c(1:5),c(.2,.3,.4),c(3:5))
dwbgd=function(x,alpha,lambda)
{
  x=floor(x)
  if(any(x<0)) {stop("x must be between (0,inf")}
  if(any(alpha<0)|any(alpha>1)) {stop("alpha must be between [0,1]")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  enuzun=max(length(x),length(alpha),length(lambda))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  lambda=rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=((1-alpha[i])*(1-alpha[i]^(lambda[i]+1)))/(1-alpha[i]^lambda[i])*alpha[i]^(x[i]-1)*(1-alpha[i]^(lambda[i]*x[i]))
  }
  return(pdf)
}
#' Weighted Bivariate Geometric Distribution
#' @export
#' @rdname wbgd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param lambda a shape parameter.
#' @examples
#' pwbgd(1,.2,3)
#' pwbgd(c(1:5),.2,3)
#' pwbgd(c(1:5),c(.2,.6),3)
#' pwbgd(c(1:5),c(.2,.6),c(3:5))
#' pwbgd(-5,c(.2,.6),c(3:5))
pwbgd=function(x,alpha,lambda) # x=1,2,..., 0<alpha<1, lambda > 0
{
  x=floor(x)
  if(any(x<0)) {stop("x must be between (0,inf")}
  if(any(alpha<0)|any(alpha>1)) {stop("alpha must be between [0,1]")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  enuzun=max(length(x),length(alpha),length(lambda))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  lambda=rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  cdf=NULL

  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=1-(1-alpha[i]^(lambda[i]+1)-alpha[i]^(lambda[i]*(floor(x[i])+1))*(1-alpha[i]))/(1-alpha[i]^lambda[i])*alpha[i]^(floor(x[i])) else cdf[i]=0
  }
  return(cdf)
}
#' Weighted Bivariate Geometric Distribution
#' @export
#' @rdname wbgd
#' @param p new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param lambda a shape parameter.
#' @examples
#' qwbgd(c(.657),.5,1)
#' qwbgd(.98,.2,2)
qwbgd=function(p,alpha,lambda)
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(alpha<0)|any(alpha>1)) {stop("p must be between [0,1]")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  enuzun=max(length(p),length(alpha),length(lambda))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  lambda=rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  quant=NULL
  for (i in 1:enuzun)
  {
    x=0
    t=0
    while(t<p[i]){
      t=pwbgd(x,alpha[i],lambda[i])
      x=x+1
    }
    quant[i]=x-1
  }
  {
    return(quant)
  }
}
#' Weighted Bivariate Geometric Distribution
#' @export
#' @rdname wbgd
#' @param n new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param lambda a shape parameter.
#' @examples
#' qwbgd(c(.657),.5,1)
#' qwbgd(.98,.2,2)
rwbgd=function(n,alpha,lambda) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be (0,inf)")}
    rn=qwbgd(runif(n),alpha,lambda)
    return(rn)
  })
