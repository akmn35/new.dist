#' The unit inverse Gaussian distribution A new alternative to two parameter distributions on the unit interval
#' @export
#' @rdname duigd
#' @param x new numeric vector of data values.
#' @param mu a shape parameter.
#' @param lambda shape2
#' @description
#' Density, distribution function, quantile function and random generation for the unit inverse Gaussian distribution A new alternative to two parameter distribution with parameters shape and scale.
#' @return \code{duigd} gives the density, \code{puigd} gives the distribution function, \code{quigd} gives the quantile function and \code{ruigd} generates random deviates.
#' @details
#' The unit inverse Gaussian distribution A new alternative to two parameter distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' duigd(1,2,3)
#' duigd(c(1:5),2,3)
#' duigd(c(1:5),c(2:6),3)
#' duigd(c(1:5),c(2:6),c(3:6))
duigd=function(x,mu,lambda) #x,mu,lambda > 0
{
  if(any(x<0)) {stop("x must be between [0,1]")}
  if(any(mu<0)) {stop("mu must be between (0,inf")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  enuzun = max(length(x),length(mu),length(lambda))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  mu=rep(mu, enuzun/length(mu)+1)[1:enuzun]
  lambda=rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)
  {
    pdf[i]=((lambda[i]/(2*pi))^(1/2))*(1/(x[i]^(3/2)))*exp(-(lambda[i]/(2*mu[i]^2*x[i]))*(x[i]-mu[i])^2)
  }
  return(pdf)
}
#' The unit inverse Gaussian distribution A new alternative to two parameter distributions on the unit interval
#' @export
#' @rdname puigd
#' @param x new numeric vector of data values.
#' @param mu a shape parameter.
#' @param lambda shape2
#' @description
#' Density, distribution function, quantile function and random generation for the unit inverse Gaussian distribution A new alternative to two parameter distribution with parameters shape and scale.
#' @return \code{duigd} gives the density, \code{puigd} gives the distribution function, \code{quigd} gives the quantile function and \code{ruigd} generates random deviates.
#' @details
#' The unit inverse Gaussian distribution A new alternative to two parameter distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' puigd(-1,2,3)
#' puigd(c(1:5),2,3)
#' puigd(c(1:5),c(2:6),3)
#' puigd(c(-7),c(2:6),3)
#' puigd(c(1:5),c(2:6),c(3:6))
puigd=function(x,mu,lambda)  #x,mu,lambda > 0
{
  if(any(x<0)) {stop("x must be between [0,1]")}
  if(any(mu<0)) {stop("mu must be between (0,inf")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  enuzun = max(length(x),length(mu),length(lambda))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  mu=rep(mu, enuzun/length(mu)+1)[1:enuzun]
  lambda=rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)
  {
    if (x[i]>0) cdf[i]=pnorm((lambda[i]/x[i])^(1/2)*(x[i]/mu[i]-1))+exp(2*lambda[i]/mu[i])*pnorm(-(lambda[i]/x[i])^(1/2)*(x[i]/mu[i]+1)) else cdf[i]=0
  }
  return(cdf)
}
#' The unit inverse Gaussian distribution A new alternative to two parameter distributions on the unit interval
#' @export
#' @rdname quigd
#' @param p new numeric vector of data values.
#' @param mu a shape parameter.
#' @param lambda shape2
#' @description
#' Density, distribution function, quantile function and random generation for the unit inverse Gaussian distribution A new alternative to two parameter distribution with parameters shape and scale.
#' @return \code{duigd} gives the density, \code{puigd} gives the distribution function, \code{quigd} gives the quantile function and \code{ruigd} generates random deviates.
#' @details
#' The unit inverse Gaussian distribution A new alternative to two parameter distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' quigd(.1,1,1)
quigd=function(p,mu,lambda) # 0<p<1, mu,lambda > 0
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(mu<0)) {stop("mu must be between (0,inf")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  enuzun = max(length(p),length(mu),length(lambda))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  mu=rep(mu, enuzun/length(mu)+1)[1:enuzun]
  lambda=rep(lambda,enuzun/length(lambda)+1)[1:enuzun]
  kok=NULL
  for (i in 1:enuzun)
  {
    F=function(x)
    {
      pnorm((lambda[i]/x)^(1/2)*(x/mu[i]-1))+exp(2*lambda[i]/mu[i])*pnorm(-(lambda[i]/x)^(1/2)*(x/mu[i]+1))-p[i]
    }
    kok[i]=(uniroot(F,c(0,100000)))$root
  }
  return(kok)
}
#' The unit inverse Gaussian distribution A new alternative to two parameter distributions on the unit interval
#' @export
#' @rdname ruigd
#' @param n new numeric vector of data values.
#' @param mu a shape parameter.
#' @param lambda shape2
#' @description
#' Density, distribution function, quantile function and random generation for the unit inverse Gaussian distribution A new alternative to two parameter distribution with parameters shape and scale.
#' @return \code{duigd} gives the density, \code{puigd} gives the distribution function, \code{quigd} gives the quantile function and \code{ruigd} generates random deviates.
#' @details
#' The unit inverse Gaussian distribution A new alternative to two parameter distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' ruigd(100,1,1)
ruigd=function(n,mu,lambda)
{
  if(any(n<0)) {stop("n must be (0,inf)")}
  if(any(mu<0)) {stop("mu must be between (0,inf")}
  if(any(lambda<0)) {stop("lambda must be between (0,inf")}
  rn=quigd(runif(n),mu,lambda)
  return(rn)
}
