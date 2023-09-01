#' The Power Muth Distribution
#' @export
#' @rdname tpmd
#' @param x new numeric vector of data values.
#' @param beta a shape parameter.
#' @param alpha a scale parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Power Muth distribution with parameters shape and scale.
#' @return \code{dtpmd} gives the density, \code{ptpmd} gives the distribution function, \code{qtpmd} gives the quantile function and \code{rtpmd} generates random deviates.
#' @details
#' The Power Muth Distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#' \ifelse{html}{\out{"(alpha/(beta^alpha))*(x^(alpha-1))*(exp((x/beta)^alpha)-1)*exp(((x/beta)^alpha)-(exp((x/beta)^alpha)-1))"}}{{\eqn{\\ f\left( x\right) =\frac{\alpha }{\beta ^{\alpha }}x^{\alpha -1}\left\{ \exp\left( \left( \frac{x}{\beta }\right) ^{\alpha }-1\right) \right\} \left\{\exp \left( \left( \frac{x}{\beta }\right) ^{\alpha }-\left( \exp \left(\frac{x}{\beta }\right) ^{\alpha }-1\right) \right) \right\}}}}.
#' @references  Jodra, P., Gomez, H. W., Jimenez-Gamero, M. D., & Alba-Fernandez, M. V. (2017).
#' *The power Muth distribution* . Mathematical Modelling and Analysis, 22(2), 186-201.
#' @note
#' the cumulative hazart ... (a) if ...is increasing in x for any ... (b) if ... then there exist an ... so that h(x) is (strictly) decreasing when ... and... (strictly) when ...
#' @examples
#' dtpmd(1,2,3)
#' dtpmd(2,3,4)
#' dtpmd(c(1:5),2,3)
#' dtpmd(c(1:5),c(2:6),3)
#' dtpmd(c(1:5),c(2:6),c(3:6))
dtpmd=function(x,beta,alpha)  {
  if(any(x<0)) {stop("x must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  if(any(alpha<0)) {stop("alpha must be between (0,inf")}
  enuzun = max(length(x), length(alpha), length(beta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)  {
    pdf[i]=(alpha[i]/(beta[i]^alpha[i]))*(x[i]^(alpha[i]-1))*(exp((x[i]/beta[i])^alpha[i])-1)*exp(((x[i]/beta[i])^alpha[i])-(exp((x[i]/beta[i])^alpha[i])-1))
  }
    return(pdf)
}
#' The Power Muth Distribution
#' @export
#' @rdname tpmd
#' @param x new numeric vector of data values.
#' @param beta a shape parameter.
#' @param alpha a scale parameter.
#' @examples
#' ptpmd(1,2,3)
#' ptpmd(c(1:5),2,3)
#' ptpmd(c(1:5),c(2:6),3)
#' ptpmd(c(1:10),c(2:6),c(3:5))
#' ptpmd(-5,c(2:6),3)
ptpmd=function(x,beta,alpha)  {
  if(any(x<0)) {stop("x must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  if(any(alpha<0)) {stop("alpha must be between (0,inf")}
  enuzun = max(length(x), length(alpha), length(beta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  cdf=NULL
  for (i in 1:enuzun)  {
    if(x[i]>0) cdf[i]=1-exp(((x[i]/beta[i])^alpha[i])-(exp((x[i]/beta[i])^alpha[i])-1)) else cdf[i]=0
  }
  return(cdf)
}
#' The Power Muth Distribution
#' @export
#' @rdname tpmd
#' @param p vector of probabilities.
#' @param beta a shape parameter.
#' @param alpha a scale parameter.
#' @examples
#' qtpmd(.5,5,2)
#' qtpmd(.3,2,5)
qtpmd=function(p,beta,alpha)
{
  if(any(p<0)|any(p>1)) {stop("p must be between [0,1]")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  if(any(alpha<0)) {stop("alpha must be between (0,inf")}
  enuzun = max(length(p), length(alpha), length(beta))
  p=rep(p,enuzun/length(p)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  quant=NULL
  for (i in 1:enuzun)
  {
    quant[i]=exp(log(-pracma::lambertWn((-1+p[i])/exp(1))-1+log(1-p[i]))/alpha[i])*beta[i]
  }
  {
    return(quant)
  }
}
#' The Power Muth Distribution
#' @export
#' @rdname tpmd
#' @param n number of observations.If length(n) > 1, the length is taken to be the number required.
#' @param beta a shape parameter.
#' @param alpha a scale parameter.
#' @examples
#' rtpmd(50,1,2)
#' rtpmd(10,2,3)
rtpmd=function(n,beta,alpha) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be between (0,inf")}
    if(any(beta<0)) {stop("beta must be between (0,inf")}
    if(any(alpha<0)) {stop("alpha must be between (0,inf")}
    rn=qtpmd(runif(n),beta,alpha)
    return(rn)
  })

#' Estimation in Maxwell distribution with randomly censored data
#' @export
#' @rdname emd
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
#' Estimation in Maxwell distribution with randomly censored data
#' @export
#' @rdname emd
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
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
#' Estimation in Maxwell distribution with randomly censored data
#' @export
#' @rdname emd
#' @param p new numeric vector of data values.
#' @param theta a shape parameter.
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
#' Estimation in Maxwell distribution with randomly censored data
#' @export
#' @rdname emd
#' @param n new numeric vector of data values.
#' @param theta a shape parameter.
#' @examples
#' remd(100,1)
remd=function(n,theta) suppressWarnings(
  {
    if(any(n<0)) {stop("n must be (0,inf)")}
    if(any(theta<0)) {stop("theta must be (0,inf)")}
    rn=qemd(runif(n),theta)
    return(rn)
  })

