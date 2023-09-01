#' on the muth distribution
#' @export
#' @rdname omd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for on the muth distribution distribution with parameters shape and scale.
#' @return \code{domd} gives the density, \code{pomd} gives the distribution function, \code{qomd} gives the quantile function and \code{romd} generates random deviates.
#' @details
#' On the muth distribution distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Jodrá, P., Jiménez-Gamero, M. D. ve Alba-Fernández, M. V., 2015,
#' *On the Muth distribution, Mathematical Modelling and Analysis*, 20 (3), 291-310.
#' @examples
#' domd(c(1:5),.2)
#' domd(2,c(.2,.3,.4))
#' domd(c(1:5),c(.2,.3,.4))
domd=function(x,alpha) # x>0, (0,alpha,1]
{
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(alpha<=0)|any(alpha>1)) {stop("alpha must be (0,1]")}
  enuzun = max(length(x),length(alpha))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=(exp(alpha[i]*x[i])-alpha[i])*exp(alpha[i]*x[i]-(1/alpha[i])*(exp(alpha[i]*x[i])-1))
  }
  return(pdf)
}
#' on the muth distribution
#' @export
#' @rdname omd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @examples
#' pomd(c(1:5),.2)
#' pomd(c(-1,-2,-3),.2)
#' pomd(2,c(.2,.3,.4))
#' pomd(c(1:5),c(.2,.3,.4))
#' pomd(-4,c(.2,.3,.4))
#' pomd(.4,c(.2,.3,.4))
pomd=function(x,alpha)# x>0, alpha=(0,1]
{
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(alpha<=0)|any(alpha>1)) {stop("alpha must be (0,1]")}
  enuzun = max(length(x),length(alpha))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=1-exp(alpha[i]*x[i]-(1/alpha[i])*(exp(alpha[i]*x[i])-1)) else cdf[i]=0
  }
  return(cdf)
}
#' on the muth distribution
#' @export
#' @rdname omd
#' @param p new numeric vector of data values.
#' @param alpha a shape parameter.
#' @examples
#' qomd(.8,1)
#' qomd(.9,5)
qomd=function(p,alpha) # 0<p<1, theta > 0
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(alpha<=0)|any(alpha>1)) {stop("alpha must be (0,1]")}
  enuzun=max(length(p),length(alpha))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
  qfonk=NULL
  for (i in 1:enuzun)
  {
    qfonk[i]=(-pracma::lambertWn(-(exp((-1+log(1-p[i])*alpha[i])/alpha[i])/alpha[i]))*alpha[i]-1+log(1-p[i])*alpha[i])/alpha[i]^2
  }
  return(qfonk)
}
#' on the muth distribution
#' @export
#' @rdname omd
#' @param n new numeric vector of data values.
#' @param alpha a shape parameter.
#' @examples
#' romd(10,1)
romd=function(n,alpha)
{
  if(any(n<0)) {stop("n must be (0,inf)")}
  if(any(alpha<0)) {stop("alpha must be (0,inf)")}
  rn=qomd(runif(n),alpha)
  return(rn)
}
