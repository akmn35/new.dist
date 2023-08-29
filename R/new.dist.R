#' The Power Muth Distribution
#' @export
#' @rdname dTMPD
#' @param x new numeric vector of data values.
#' @param beta a shape parameter.
#' @param alpha a scale parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Power Muth distribution with parameters shape and scale.
#' @return [dTPMD] gives the density, [pTPMD] gives the distribution function, [qTPMD] gives the quantile function and [rTPMD] generates random deviates.
#' @details
#' The Power Muth Distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#' \ifelse{html}{\out{"(alpha/(beta^alpha))*(x^(alpha-1))*(exp((x/beta)^alpha)-1)*exp(((x/beta)^alpha)-(exp((x/beta)^alpha)-1))"}}{{\eqn{\\ f\left( x\right) =\frac{\alpha }{\beta ^{\alpha }}x^{\alpha -1}\left\{ \exp\left( \left( \frac{x}{\beta }\right) ^{\alpha }-1\right) \right\} \left\{\exp \left( \left( \frac{x}{\beta }\right) ^{\alpha }-\left( \exp \left(\frac{x}{\beta }\right) ^{\alpha }-1\right) \right) \right\}}}}.
#' @references  Jodra, P., Gomez, H. W., Jimenez-Gamero, M. D., & Alba-Fernandez, M. V. (2017).
#' *The power Muth distribution* . Mathematical Modelling and Analysis, 22(2), 186-201.
#' @note
#' the cumulative hazart ... (a) if ...is increasing in x for any ... (b) if ... then there exist an ... so that h(x) is (strictly) decreasing when ... and... (strictly) when ...
#' @examples
#' dTPMD(1,2,3)
#' dTPMD(2,3,4)
#' dTPMD(c(1:5),2,3)
#' dTPMD(c(1:5),c(2:6),3)
#' dTPMD(c(1:5),c(2:6),c(3:6))
dTPMD=function(x,beta,alpha)  {
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
#' @rdname pTMPD
#' @param x new numeric vector of data values.
#' @param beta a shape parameter.
#' @param alpha a scale parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Power Muth distribution with parameters shape and scale.
#' @return [dTPMD] gives the density, [pTPMD] gives the distribution function, [qTPMD] gives the quantile function and [rTPMD] generates random deviates.
#' @details
#' The Power Muth Distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#' \ifelse{html}{\out{"(alpha/(beta^alpha))*(x^(alpha-1))*(exp((x/beta)^alpha)-1)*exp(((x/beta)^alpha)-(exp((x/beta)^alpha)-1))"}}{{\eqn{\\ f\left( x\right) =\frac{\alpha }{\beta ^{\alpha }}x^{\alpha -1}\left\{ \exp\left( \left( \frac{x}{\beta }\right) ^{\alpha }-1\right) \right\} \left\{\exp \left( \left( \frac{x}{\beta }\right) ^{\alpha }-\left( \exp \left(\frac{x}{\beta }\right) ^{\alpha }-1\right) \right) \right\}}}}.
#' @references  Jodra, P., Gomez, H. W., Jimenez-Gamero, M. D., & Alba-Fernandez, M. V. (2017).
#' *The power Muth distribution* . Mathematical Modelling and Analysis, 22(2), 186-201.
#' @examples
#' pTPMD(1,2,3)
#' pTPMD(c(1:5),2,3)
#' pTPMD(c(1:5),c(2:6),3)
#' pTPMD(c(1:10),c(2:6),c(3:5))
#' pTPMD(-5,c(2:6),3)
dTPMD=function(x,beta,alpha)  {
  if(any(x<0)) {stop("x must be between (0,inf")}
  if(any(beta<0)) {stop("beta must be between (0,inf")}
  if(any(alpha<0)) {stop("alpha must be between (0,inf")}
  enuzun = max(length(x), length(alpha), length(beta))
  x=rep(x,enuzun/length(x)+1)[1:enuzun]
  alpha=rep(alpha, enuzun/length(alpha)+1)[1:enuzun]
  beta=rep(beta,enuzun/length(beta)+1)[1:enuzun]
  pdf=NULL
  for (i in 1:enuzun)  {
    cdf[i]=1-exp(((x[i]/beta[i])^alpha[i])-(exp((x[i]/beta[i])^alpha[i])-1))
  }
  return(cdf)
}







