#' Slashed generalized Rayleigh distribution
#' @export
#' @name sgrd
#' @param x vector of quantiles.
#' @param theta a scale parameter.
#' @param alpha a shape parameter.
#' @param q a kurtosis parameter.
#' @param p vector of probabilities.
#' @param n number of observations. If \code{length(n) > 1}, the length is taken
#'  to be the number required.
#' @param log,log.p logical; if TRUE, probabilities p are given as log(p).
#' @param lower.tail logical; if TRUE (default), probabilities are
#' \eqn{P\left[ X\leq x\right]}, otherwise,\eqn{P\left[ X>x\right] }.
#' @description
#' Density, distribution function, quantile function and random generation for
#' the Slashed generalized Rayleigh distribution with parameters \code{shape},
#' \code{scale}, \code{kurtosis}.
#' @return \code{dsgrd} gives the density, \code{psgrd} gives the distribution
#' function, \code{qsgrd} gives the quantile function and \code{rsgrd} generates
#'  random deviates.
#' @details
#' The Slashed generalized Rayleigh distribution with \code{shape} parameter
#' \eqn{\alpha}, \code{scale} parameter \eqn{\theta} and \code{kurtosis}
#' parameter \eqn{q}, has density given by
#' \deqn{f\left( x\right) =\frac{q x^{-\left( q+1\right) }}{\Gamma
#' \left( \alpha+1\right) \theta ^{q/2}}\Gamma \left( \frac{2\alpha +q+2}{2}
#' \right) F\left(\theta x^{2};\frac{2\alpha +q+2}{2},1\right), }
#' where F(.;a,b) is the cdf of the Gamma (a,b) distribution, and
#' \deqn{x>0,~\theta >0,~\alpha >-1,~q>0.}
#' @references  Iriarte, Y. A., Vilca, F., Varela, H. ve Gómez, H. W., 2017,
#' *Slashed generalized Rayleigh distribution*, Communications in Statistics-
#' Theory and Methods, 46 (10), 4686-4699.
#' @examples
#' library(new.dist)
#' dsgrd(2,theta=3,alpha=1,q=4)
dsgrd <- function(x,theta,alpha,q,log=FALSE)
  {
    if(any(alpha<=-1)) {stop("alpha must be > -1")}
    if(any(theta<=0)) {stop("theta must be > 0")}
    if(any(q<=2)) {(stop("the function may not work when q<2 since the
first and second moment does not exist!"))}
    enuzun<-max(length(x),length(theta),length(alpha),length(q))
    x<-rep(x,enuzun/length(x)+1)[1:enuzun]
    alpha<-rep(alpha,enuzun/length(alpha)+1)[1:enuzun]
    q<-rep(q,enuzun/length(q)+1)[1:enuzun]
    theta<-rep(theta,enuzun/length(theta)+1)[1:enuzun]
    pdf<-NULL
    if(log==FALSE){
    for (i in 1:enuzun)suppressWarnings(
    {
      if(x[i]<=0) {pdf[i]<-0} else
      {pdf[i]<-q[i]*x[i]^(-(q[i]+1))/(gamma(alpha[i]+1)*theta[i]^(q[i]/2))*
        gamma((2*alpha[i]+q[i]+2)/2)*stats::pgamma(theta[i]*x[i]^2,(2*
                                                        alpha[i]+q[i]+2)/2,1)}
    })
    return(pdf)} else
    if(log==TRUE)
    {
      for (i in 1:enuzun)suppressWarnings(
        {
          if(x[i]<=0) {pdf[i]<-0} else
          {pdf[i]<-log(q[i]*x[i]^(-(q[i]+1))/(gamma(alpha[i]+1)*
                                                theta[i]^(q[i]/2))*
            gamma((2*alpha[i]+q[i]+2)/2)*stats::pgamma(theta[i]*x[i]^2,(2*
                                                        alpha[i]+q[i]+2)/2,1))}
        })
      return(pdf)}
  }
#' Slashed generalized Rayleigh distribution
#' @export
#' @rdname sgrd
#' @examples
#' psgrd(5,theta=3,alpha=1,q=4)
psgrd<-function(x,theta,alpha,q,lower.tail=TRUE,log.p=FALSE)
  {
  if(any(alpha<=-1)) {stop("alpha must be > -1")}
  if(any(theta<=0)) {stop("theta must be > 0")}
  if(any(q<=2)) {(stop("the function may not work when q<2 since the
first and second moment does not exist!"))}
    enuzun <- max(length(x),length(theta),length(alpha),length(q))
    theta<-rep(theta,enuzun/length(theta)+1)[1:enuzun]
    alpha<-rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
    q<-rep(q,enuzun/length(q)+1)[1:enuzun]
    integral<-NULL
    for (i in 1:enuzun)suppressWarnings(
    {
      if(x[i]>0){integral[i] <- stats::integrate(function(t){q[i]*t^(-(q[i]+1))/
          (gamma(alpha[i]+1)*theta[i]^(q[i]/2))*gamma((2*alpha[i]+q[i]+2)/2)*
          stats::pgamma(theta[i]*t^2,(2*alpha[i]+q[i]+2)/2,1)
      },0,x[i])$value} else {integral[i]<-0}
    })
    if(lower.tail==FALSE) integral <- 1-integral
    if(log.p==TRUE) integral <- log(integral)
    return(integral)
  }
#' Slashed generalized Rayleigh distribution
#' @export
#' @rdname sgrd
#' @examples
#' qsgrd(.4,theta=3,alpha=1,q=4)
qsgrd<-function(p,theta,alpha,q,lower.tail=TRUE)
{
  if(any(p<0)|any(p>1)) {stop("p must be between >= 0 and <= 1")}
  if(any(alpha<=-1)) {stop("alpha must be > -1")}
  if(any(theta<=0)) {stop("theta must be > 0")}
  if(any(q<=2)) {(stop("the function may not work when q<2 since
the first and second moment does not exist!"))}
  enuzun <- max(length(p),length(theta),length(alpha),length(q))
  theta<-rep(theta,enuzun/length(theta)+1)[1:enuzun]
  alpha<-rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  q<-rep(q,enuzun/length(q)+1)[1:enuzun]
  kok<-NULL
  for (i in 1:enuzun)suppressWarnings(
  {
    Ex<-(gamma(1/2+alpha[i]+1)*q[i])/(gamma(alpha[i]+1)*theta[i]^(1/2)*(q[i]-1))
    Y<-function(t)
    {
      abs(psgrd(t,theta[i],alpha[i],q[i])-p[i])
    }
    if(lower.tail==FALSE)
    {
      Y<-function(t)
      {
        abs(psgrd(t,theta[i],alpha[i],q[i])-(1-p[i]))
      }
    }
    kok[i]<-(stats::optim(Ex,Y,method="Brent",lower=0,upper=20))$par
  })
  return(kok)
}
#' Slashed generalized Rayleigh distribution
#' @export
#' @rdname sgrd
#' @examples
#' rsgrd(10,theta=3,alpha=1,q=4)
rsgrd<-function(n,theta,alpha,q)
{
  n<-floor(n)
  if(any(n<1)) {stop("n must be >= 1")}
  if(any(alpha<=-1)) {stop("alpha must be > -1")}
  if(any(theta<=0)) {stop("theta must be > 0")}
  if(any(q<=2)) {(stop("the function may not work when q<2 since
the first and second moment does not exist!"))}
  rn<-qsgrd(stats::runif(n),theta,alpha,q)
  return(rn)
}
