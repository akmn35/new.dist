#' A Bimodal Weibull Distribution
#' @export
#' @rdname bwd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta shape2
#' @param sigma shape3
#' @description
#' Density, distribution function, quantile function and random generation for a Bimodal Weibull Distribution with parameters shape and scale.
#' @return \code{dbwd} gives the density, \code{pbwd} gives the distribution function, \code{qbwd} gives the quantile function and \code{rbwd} generates random deviates.
#' @details
#' A Bimodal Weibull distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{\alpha \ast \beta &lt;sup&#62;3&lt;/sup&#62;+\frac13/\alpha}}{\eqn{T_n^{(\ell)}}}.
#' @references  Vila, R. ve Niyazi Çankaya, M., 2022,
#' *A bimodal Weibull distribution: properties and inference*,Journal of Applied Statistics, 49 (12), 3044-3062.
#' @examples
#' dbwd(1,2,3,4)
#' dbwd(c(1:3),2,3,4)
#' dbwd(1,c(1:3),3,4)
#' dbwd(1,2,c(1:4),4)
#' dbwd(1,2,3,c(1:4))
#' dbwd(c(1:3),c(1:3),3,4)
dbwd=function(x,alpha,beta,sigma) suppressWarnings(
  {
    if(any(x<0)) {stop("x must be between (0,inf")}
    if(any(alpha<0)) {stop("alpha must be between (0,inf")}
    if(any(beta<0)) {stop("beta must be between (0,inf")}
    enuzun=max(length(x),length(alpha),length(beta),length(sigma))
    x=rep(x,enuzun/length(x)+1)[1:enuzun]
    alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
    beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
    sigma=rep(sigma,enuzun/length(sigma)+1)[1:enuzun]
    pdf=NULL
    z=NULL
    for (i in 1:enuzun)
    {
      z[i]=2+sigma[i]^2*beta[i]^2*gamma(1+(2/alpha[i]))-2*sigma[i]*beta[i]*gamma(1+(1/alpha[i]))
      pdf[i]=(alpha[i]/(beta[i]*z[i]))*(1+(1-sigma[i]*x[i])^2)*(x[i]/beta[i])^(alpha[i]-1)*exp(-(x[i]/beta[i])^alpha[i])
    }
    return(pdf)
  })
#' A Bimodal Weibull Distribution
#' @export
#' @rdname bwd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta shape2
#' @param sigma shape3
#' @examples
#' pbwd(c(1:3),2,3,4)
#' pbwd(1,c(1:3),3,4)
#' pbwd(1,2,c(1:4),4)
#' pbwd(1,2,3,c(1:4))
pbwd=function(x,alpha,beta,sigma) suppressWarnings(
  {
    if(any(x<0)) {stop("x must be between (0,inf")}
    if(any(alpha<0)) {stop("alpha must be between (0,inf")}
    if(any(beta<0)) {stop("beta must be between (0,inf")}
    enuzun=max(length(x),length(alpha),length(beta),length(sigma))
    x=rep(x,enuzun/length(x)+1)[1:enuzun]
    alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
    beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
    sigma=rep(sigma,enuzun/length(sigma)+1)[1:enuzun]
    cdf=NULL
    for (i in 1:enuzun)
    {
      if(x[i]>0) (cdf[i]=(2-(1+(1-sigma[i]*x[i])^2)*exp(-(x[i]/beta[i])^alpha[i])-((2*sigma[i]*beta[i])/alpha[i])*(pracma::gammainc(x[i]^alpha[i]/beta[i]^alpha[i],1/alpha[i])[1]-sigma[i]*beta[i]*pracma::gammainc(x[i]^alpha[i]/beta[i]^alpha[i],2/alpha[i])[1]))/(2+sigma[i]^2*beta[i]^2*gamma(1+(2/alpha[i]))-2*sigma[i]*beta[i]*gamma(1+(1/alpha[i])))) else cdf[i]=0
    }
    return(cdf)
  })
#' A Bimodal Weibull Distribution
#' @export
#' @rdname bwd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta shape2
#' @param sigma shape3
#' @examples
#' qbwd(c(.7),1,2,3)
#' qbwd(c(.7),2,2,c(3:5))
qbwd=function(p,alpha,beta,sigma) suppressWarnings(
  {
    if(any(alpha<0)) {stop("alpha must be between (0,inf")}
    if(any(beta<0)) {stop("beta must be between (0,inf")}
    enuzun=max(length(p),length(alpha),length(beta),length(sigma))
    p=rep(p,enuzun/length(p)+1)[1:enuzun]
    alpha=rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
    beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
    sigma=rep(sigma,enuzun/length(sigma)+1)[1:enuzun]
    kok=NULL
    for (i in 1:enuzun)
    {
      F=function(x)
      {
        (2-(1+(1-sigma[i]*x)^2)*exp(-(x/beta[i])^alpha[i])-((2*sigma[i]*beta[i])/alpha[i])*(pracma::gammainc(x^alpha[i]/beta[i]^alpha[i],1/alpha[i])[1]-sigma[i]*beta[i]*
        pracma::gammainc(x^alpha[i]/beta[i]^alpha[i],2/alpha[i])[1]))/(2+sigma[i]^2*beta[i]^2*gamma(1+(2/alpha[i]))-2*sigma[i]*beta[i]*gamma(1+(1/alpha[i])))-p[i]
      }
      kok[i]=(uniroot(F, c(0,50)))$root
    }
    return(kok)
  })
#' A Bimodal Weibull Distribution
#' @export
#' @rdname bwd
#' @param x new numeric vector of data values.
#' @param alpha a shape parameter.
#' @param beta shape2
#' @param sigma shape3
#' @examples
#' rbwd(10,1,3,2)
rbwd=function(n,alpha,beta,sigma) suppressWarnings(
  {
    rn=qbwd(runif(n),alpha,beta,sigma)
    return(rn)
  })
