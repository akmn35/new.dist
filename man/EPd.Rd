% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EPd.R
\name{EPd}
\alias{EPd}
\alias{dEPd}
\alias{pEPd}
\alias{qEPd}
\alias{rEPd}
\title{EP distribution}
\usage{
dEPd(x, lambda, beta, log = FALSE)

pEPd(q, lambda, beta, lower.tail = TRUE, log.p = FALSE)

qEPd(p, lambda, beta, lower.tail = TRUE)

rEPd(n, lambda, beta)
}
\arguments{
\item{x, q}{vector of quantiles.}

\item{lambda, beta}{are parameters.}

\item{log, log.p}{logical; if TRUE, probabilities p are given as log(p).}

\item{lower.tail}{logical; if TRUE (default), probabilities are
\eqn{P\left[ X\leq x\right]}, otherwise, \eqn{P\left[ X>x\right] }.}

\item{p}{vector of probabilities.}

\item{n}{number of observations. If \code{length(n) > 1}, the length is taken
to be the number required.}
}
\value{
\code{dEPd} gives the density, \code{pEPd} gives the distribution
function, \code{qEPd} gives the quantile function and \code{rEPd} generates
random deviates.
}
\description{
Density, distribution function, quantile function and random generation for
the EP distribution.
}
\details{
The EP distribution with parameters \eqn{\lambda} and \eqn{\beta},
has density
\deqn{f\left( x\right) =\frac{\lambda \beta }
{\left( 1-e^{-\lambda }\right) } e^{-\lambda -\beta x+\lambda e^{-\beta x}},}
where
\deqn{x>\mathbb{R}_{+},~\beta ,\lambda \in \mathbb{R}_{+}.}
}
\examples{
library(new.dist)
dEPd(1, lambda=2, beta=3)
pEPd(1,lambda=2,beta=3)
qEPd(.8,lambda=2,beta=3)
rEPd(10,lambda=2,beta=3)
}
\references{
Kuş, C., 2007,
\emph{A new lifetime distribution}, Computational Statistics & Data Analysis,
51 (9), 4497-4509.
}
