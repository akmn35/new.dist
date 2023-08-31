#' Uniform-Geometric distribution
#' @export
#' @rdname dugd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Uniform-Geometric distribution with parameters shape and scale.
#' @return \code{dugd} gives the density, \code{pugd} gives the distribution function, \code{qugd} gives the quantile function and \code{rugd} generates random deviates.
#' @details
#' The Uniform-Geometric distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' dugd(c(1:5),.2)
#' dugd(2,c(.2,.4))
#' dugd(c(1:5),c(.2,.3,.4,.5))
dugd=function(x,theta)    #x=1,2,...  , 0<theta<1
{
  x=floor(x)
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(theta<=0)|any(theta>=1)) {stop("theta must be between (0,1)")}
  enuzun = max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=theta[i]*(1-theta[i])^(x[i]-1)*VGAM::lerch((1-theta[i]),1,x[i])
  }
  return(pdf)
}
#' Uniform-Geometric distribution
#' @export
#' @rdname pugd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Uniform-Geometric distribution with parameters shape and scale.
#' @return \code{dugd} gives the density, \code{pugd} gives the distribution function, \code{qugd} gives the quantile function and \code{rugd} generates random deviates.
#' @details
#' The Uniform-Geometric distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' pugd(c(1:5),.2)
#' pugd(2,c(.2,.3,.4))
#' pugd(c(1:5),c(.2,.3,.4,.5))
#' pugd(-2,c(.2,.3,.4))
pugd=function(x,theta)
{
  x=floor(x)
  if(any(x<0)) {stop("x must be (0,inf)")}
  if(any(theta<=0)|any(theta>=1)) {stop("theta must be between (0,1)")}
  enuzun = max(length(x),length(theta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if(x[i]>0) cdf[i]=1-theta[i]*(1-theta[i])^x[i]*((1/theta[i])-x[i]*VGAM::lerch(1-theta[i],1,x[i]+1)) else cdf[i]=0
  }
  return(cdf)
}
#' Uniform-Geometric distribution
#' @export
#' @rdname qugd
#' @param p new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Uniform-Geometric distribution with parameters shape and scale.
#' @return \code{dugd} gives the density, \code{pugd} gives the distribution function, \code{qugd} gives the quantile function and \code{rugd} generates random deviates.
#' @details
#' The Uniform-Geometric distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' qugd(0.6,.1)
qugd=function(p,theta)
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(theta<=0)|any(theta>=1)) {stop("theta must be between (0,1)")}
  enuzun = max(length(p),length(theta))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  theta=rep(theta, enuzun/length(theta)+1)[1:enuzun]
  quant=NULL
  for (i in 1:enuzun)
  {
    x=0
    t=0
    while(t<p[i]){
      t=pugd(x,theta[i])
      x=x+1
    }
    quant[i]=x-1
  }
  {
    return(quant)
  }
}
#' Uniform-Geometric distribution
#' @export
#' @rdname rugd
#' @param n new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Uniform-Geometric distribution with parameters shape and scale.
#' @return \code{dugd} gives the density, \code{pugd} gives the distribution function, \code{qugd} gives the quantile function and \code{rugd} generates random deviates.
#' @details
#' The Uniform-Geometric distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' rugd(100,.1)
rugd=function(n,theta) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be (0,inf)")}
    if(any(theta<=0)|any(theta>=1)) {stop("theta must be between (0,1)")}
    rn=qugd(runif(n),theta)
    return(rn)
  })
