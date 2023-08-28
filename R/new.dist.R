#' The Power Muth Distribution
#' @export
#' @rdname dTMPD
#' @param x new numeric vector of data values.
#' @param beta a shape parameter.
#' @param alpha a scale parameter.
#' @description
#' [dTMPD()] performs a density of The Power Muth Distribution.
#' @return [dTMPD()] returns the density.
#' @details
#' The Power Muth Distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#' @references  Jodra, P., Gomez, H. W., Jimenez-Gamero, M. D., & Alba-Fernandez, M. V. (2017).
#' *The power Muth distribution* . Mathematical Modelling and Analysis, 22(2), 186-201.
#' @examples
#' dTMPD(1,2,3)
#' dTMPD(2,3,4)
#' dTMPD(c(1:5),2,3)
#' dTMPD(c(1:5),c(2:6),3)
#' dTMPD(c(1:5),c(2:6),c(3:6))
dTMPD=function(x,beta,alpha)  {
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
