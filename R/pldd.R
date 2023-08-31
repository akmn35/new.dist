#' A Power Log Dagum Distribution
#' @export
#' @rdname dpldd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta shape2
#' @param theta shape3
#' @description
#' Density, distribution function, quantile function and random generation for a Power Log Dagum distribution with parameters shape and scale.
#' @return \code{dpldd} gives the density, \code{ppldd} gives the distribution function, \code{qpldd} gives the quantile function and \code{rpldd} generates random deviates.
#' @details
#' A Power Log Dagum Distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' dpldd(1,2,3,4)
#' dpldd(c(1:5),2,3,4)
#' dpldd(c(1:5),c(2:6),3,4)
#' dpldd(c(1:5),c(2:6),c(3:5),4)
#' dpldd(c(1:5),c(2:6),c(3:5),c(4:6))
#' dpldd(1,2,3,c(4:6))
dpldd=function(x,alpha,beta,theta) suppressWarnings(
  {  #abs=mutlak değer
    if(any(alpha<=0)) {stop("alpha must be between (0,inf")}
    if(any(theta<0)) {stop("theta must be between [0,inf")}
    enuzun=max(length(x),length(alpha),length(beta),length(theta))
    x=rep(x,enuzun/length(x)+1)[1:enuzun]
    alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
    beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
    theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
    pdf=NULL
    for (i in 1:enuzun)
    {
      pdf[i]=alpha[i]*(beta[i]+theta[i]*abs(x[i])^(beta[i]-1))*(exp(-(beta[i]*x[i]+(sign(x[i]))*(theta[i]/beta[i])*abs(x[i])^beta[i])))*
        (1+exp(-(beta[i]*x[i]+(sign(x[i]))*(theta[i]/beta[i])*abs(x[i])^beta[i])))^(-(alpha[i]+1))
    }
    return(pdf)
  })
#' A Power Log Dagum Distribution
#' @export
#' @rdname ppldd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta shape2
#' @param theta shape3
#' @description
#' Density, distribution function, quantile function and random generation for a Power Log Dagum distribution with parameters shape and scale.
#' @return \code{dpldd} gives the density, \code{ppldd} gives the distribution function, \code{qpldd} gives the quantile function and \code{rpldd} generates random deviates.
#' @details
#' A Power Log Dagum Distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' ppldd(-1,2,3,4)
#' ppldd(c(1:3),2,3,4)
#' ppldd(1,c(1:3),3,4)
#' ppldd(1,2,c(1:4),4)
#' ppldd(1,2,3,c(1:4))
#' ppldd(c(-1:3),c(1:3),3,4)
#' ppldd(c(1:5),c(2:6),3,4)
#' ppldd(c(1:5),c(2:6),c(3:6),1)
#' ppldd(c(1:5),c(2:6),c(3:6),c(1:4))
ppldd=function(x,alpha,beta,theta) suppressWarnings(
  {
    if(any(alpha<=0)) {stop("alpha must be between (0,inf")}
    if(any(theta<0)) {stop("theta must be between [0,inf")}
    enuzun=max(length(x),length(alpha),length(beta),length(theta))
    x=rep(x,enuzun/length(x)+1)[1:enuzun]
    alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
    beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
    theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
    cdf=NULL
    for (i in 1:enuzun)
    {
      if(x[i]>0) {cdf[i]=(1+exp(-(beta[i]*x[i]+(sign(x[i]))*(theta[i]/beta[i])*abs(x[i])^beta[i])))^(-alpha[i])} else cdf[i]=0
    }
    return(cdf)
  })
#' A Power Log Dagum Distribution
#' @export
#' @rdname qpldd
#' @param p new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta shape2
#' @param theta shape3
#' @description
#' Density, distribution function, quantile function and random generation for a Power Log Dagum distribution with parameters shape and scale.
#' @return \code{dpldd} gives the density, \code{ppldd} gives the distribution function, \code{qpldd} gives the quantile function and \code{rpldd} generates random deviates.
#' @details
#' A Power Log Dagum Distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' qpldd(c(.7,.8),1,2,3)
#' qpldd(c(.7,.8),c(1,2),2,3)
#' qpldd(.8,1,2,3)
#' qpldd(c(.7,.8),c(1,2),c(2:4),3)
#' qpldd(.7,1,4,3)
qpldd=function(p,alpha,beta,theta) suppressWarnings(
  {
    if(any(p<0 && 1>p)) {stop("p must be between (0,1")}
    if(any(alpha<0)) {stop("alpha must be between (0,inf")}
    if(any(beta<0)) {stop("beta must be between (0,inf")}
    enuzun=max(length(p),length(alpha),length(beta),length(theta))
    p=rep(p,enuzun/length(p)+1)[1:enuzun]
    alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
    beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
    theta=rep(theta,enuzun/length(theta)+1)[1:enuzun]
    kok=NULL
    for (i in 1:enuzun)
    {
      F=function(x)
      {
        (1+exp(-(beta[i]*x+(sign(x))*(theta[i]/beta[i])*abs(x)^beta[i])))^(-alpha[i])-p[i]
      }
      kok[i]=(uniroot(F,c(-10,100)))$root
    }
    return(kok)
  })
#' A Power Log Dagum Distribution
#' @export
#' @rdname rpldd
#' @param n new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta shape2
#' @param theta shape3
#' @description
#' Density, distribution function, quantile function and random generation for a Power Log Dagum distribution with parameters shape and scale.
#' @return \code{dpldd} gives the density, \code{ppldd} gives the distribution function, \code{qpldd} gives the quantile function and \code{rpldd} generates random deviates.
#' @details
#' A Power Log Dagum Distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' rpldd(100,1,2,1)
rpldd=function(n,alpha,beta,theta) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be between (0,inf")}
    if(any(alpha<0)) {stop("alpha must be between (0,inf")}
    if(any(beta<0)) {stop("beta must be between (0,inf")}
    rn=qpldd(runif(n),alpha,beta,theta)
    return(rn)
  })
