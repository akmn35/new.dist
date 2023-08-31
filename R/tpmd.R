#' The Power Muth Distribution
#' @export
#' @rdname dtpmd
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
#' @rdname ptpmd
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
#' @rdname qtpmd
#' @param p vector of probabilities.
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
#' @rdname rtpmd
#' @param n number of observations.If length(n) > 1, the length is taken to be the number required.
#' @param beta a shape parameter.
#' @param alpha a scale parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Power Muth distribution with parameters shape and scale.
#' @return \code{dtpmd} gives the density, \code{ptpmd} gives the distribution function, \code{qtpmd} gives the quantile function and \code{rtpmd} generates random deviates.
#' @details
#' The Power Muth Distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#' \ifelse{text}{\out{}}{{\eqn{\\ f\left( x\right) =\frac{\alpha }{\beta ^{\alpha }}x^{\alpha -1}\left\{ \exp\left( \left( \frac{x}{\beta }\right) ^{\alpha }-1\right) \right\} \left\{\exp \left( \left( \frac{x}{\beta }\right) ^{\alpha }-\left( \exp \left(\frac{x}{\beta }\right) ^{\alpha }-1\right) \right) \right\}}}}.
#' @references  Jodra, P., Gomez, H. W., Jimenez-Gamero, M. D., & Alba-Fernandez, M. V. (2017).
#' *The power Muth distribution* . Mathematical Modelling and Analysis, 22(2), 186-201.
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
