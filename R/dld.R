#' The Power Muth Distribution
#' @export
#' @rdname ddld
#' @param x new numeric vector of data values.
#' @param theta a shape parameter.
#' @description
#' Density, distribution function, quantile function and random generation for the Power Muth distribution with parameters shape and scale.
#' @return [ddld] gives the density, [pdld] gives the distribution function, [qdld] gives the quantile function and [rdld] generates random deviates.
#' @details
#' The discrete Lindley distribution with shape parameter \ifelse{html}{\out{alpha}}{\eqn{\alpha}} and shape1 parameter \ifelse{html}{\out{beta}}{\eqn{\beta}}and scale parameter \ifelse{html}{\out{beta}}{\eqn{\beta}} has density
#'  \ifelse{html}{\out{T<sub>n</sub><sup>(&#8467)</sup>}}{\eqn{T_n^{(\ell)}}}.
#' @references  Gómez-Déniz, E. ve Calderín-Ojeda, E., 2011,
#' *The discrete Lindley distribution: properties and applications*.Journal of statistical computation and simulation, 81 (11), 1405-1416.
#' @examples
#' dDLD(c(1:5),2)
#'dDLD(c(1:5),-2)
#'dDLD(-1,2)
#'dDLD(2,c(2:4))
#'dDLD(c(1:5),c(2:5))
