% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wgd.R
\name{wgd}
\alias{wgd}
\alias{dwgd}
\alias{pwgd}
\alias{qwgd}
\alias{rwgd}
\title{Weighted Geometric Distribution}
\usage{
dwgd(x, alpha, lambda, log = FALSE)

pwgd(q, alpha, lambda, lower.tail = TRUE, log.p = FALSE)

qwgd(p, alpha, lambda, lower.tail = TRUE)

rwgd(n, alpha, lambda)
}
\arguments{
\item{x, q}{vector of quantiles.}

\item{alpha, lambda}{are parameters.}

\item{log, log.p}{logical; if TRUE, probabilities p are given as log(p).}

\item{lower.tail}{logical; if TRUE (default), probabilities are
\eqn{P\left[ X\leq x\right]}, otherwise, \eqn{P\left[ X>x\right] }.}

\item{p}{vector of probabilities.}

\item{n}{number of observations. If \code{length(n) > 1}, the length
is taken to be the number required.}
}
\value{
\code{dwgd} gives the density, \code{pwgd} gives the distribution
function, \code{qwgd} gives the quantile function and \code{rwgd} generates
random deviates.
}
\description{
Density, distribution function, quantile function and random generation for
the Weighted Geometric distribution.
}
\details{
The Weighted Geometric distribution with parameters \eqn{\alpha} and
\eqn{\lambda}, has density
\deqn{f\left( x\right) =\frac{\left( 1-\alpha \right)
\left( 1-\alpha ^{\lambda+1}\right) }{1-\alpha ^{\lambda }}\alpha ^{x-1}
\left( 1-\alpha ^{\lambda x}\right),}
where
\deqn{x\in \mathbb {N} =1,2,...~,~\lambda >0~and~0<\alpha <1.}
}
\examples{
library(new.dist)
dwgd(1,alpha=.2,lambda=3)
pwgd(1,alpha=.2,lambda=3)
qwgd(.98,alpha=.2,lambda=3)
rwgd(10,alpha=.2,lambda=3)
}
\references{
Najarzadegan, H., Alamatsaz, M. H., Kazemi, I. ve Kundu, D.,
2020,
\emph{Weighted bivariate geometric distribution: Simulation and estimation},
Communications in Statistics-Simulation and Computation, 49 (9), 2419-2443.
}
