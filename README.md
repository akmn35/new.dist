
<!-- README.md is generated from README.Rmd. Please edit that file -->

# new.dist

<!-- badges: start -->
<!-- badges: end -->

The goal of new.dist is to Density, distribution function, quantile
function and random generation for a number of distributions. This
package implements the following distributions: The Power Muth
Distribution, A bimodal Weibull distribution, The discrete Lindley
distribution, The gamma-Lomax distribution, Weighted bivariate geometric
distribution, A power log-Dagum distribution, kumaraswamy distribution,
Lindley distribution, The unit-inverse Gaussian distribution, A New Life
Distribution, A new one parameter discrete distribution, Maxwell
distribution, The standard omega distribution, Slashed generalized
Rayleigh distribution, Two-Parameter Rayleigh Distribution, On the Muth
Distribution, Uniform-Geometric distribution, A new discrete
distribution.

## Installation

You can install the development version of new.dist from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("akmn35/new.dist")
```

`new.dist` Density, distribution function, quantile function and random
generation for parameter estimation of distributions.

## Example

`dbwd` Density function for a Bimodal Weibull Distribution with
parameters shape and scale.

``` r
library(new.dist)
dbwd(1,alpha=2,beta=3,sigma=4)
#> [1] 0.01594262
```

`pbwd` distribution function for a Bimodal Weibull Distribution with
parameters shape and scale.

``` r
library(new.dist)
pbwd(1,alpha=2,beta=3,sigma=4)
#> [1] 0.003859685
```

`qbwd` quantile function for a Bimodal Weibull Distribution with
parameters shape and scale.

``` r
library(new.dist)
qbwd(.7,alpha=2,beta=3,sigma=4)
#> [1] 4.759942
```

`rbwd` random generation for a Bimodal Weibull Distribution with
parameters shape and scale.

``` r
library(new.dist)
  rbwd(10,alpha=2,beta=3,sigma=4)
#>  [1] 3.684013 5.019605 6.869678 2.040695 4.303355 2.978730 3.038569 1.617064
#>  [9] 4.418811 3.347773
```

`dsgrd` Density function for a Slashed generalized Rayleigh distribution
with parameters shape, scale and kurtosis.

``` r
library(new.dist)
dsgrd(2,theta=3,alpha=1,q=4)
#> [1] 0.08314235
```

`psgrd` Distribution function for a Slashed generalized Rayleigh
distribution with parameters shape, scale and kurtosis.

``` r
library(new.dist)
psgrd(5,theta=3,alpha=1,q=4)
#> [1] 0.9989333
```

`qsgrd` quantile function for a Slashed generalized Rayleigh
distribution with parameters shape, scale and kurtosis.

``` r
library(new.dist)
qsgrd(.4,theta=3,alpha=1,q=4)
#> [1] 0.8358487
```

`rsgrd` random generation for a Slashed generalized Rayleigh
distribution with parameters shape, scale and kurtosis.

``` r
library(new.dist)
  rsgrd(10,theta=3,alpha=1,q=4)
#>  [1] 1.3838703 0.5591586 0.7872729 2.0804579 1.1706934 1.7319485 0.7705484
#>  [8] 1.8825320 0.8522628 1.3783922
```

`dsod` Density function for a the standard omega distribution with alpha
and beta parameters.

``` r
library(new.dist)
dsod(0.4, alpha=1, beta=2)
#> [1] 0.6986559
```

`psod` Distribution function for a the standard omega distribution with
alpha and beta parameters.

``` r
library(new.dist)
psod(0.4, alpha=1, beta=2)
#> [1] 0.1490371
```

`qsod` quantile function for a the standard omega distribution with
alpha and beta parameters.

``` r
library(new.dist)
qsod(.8, alpha=1, beta=2)
#> [1] 0.9607689
```

`rsod` random generation for a the standard omega distribution with
alpha and beta parameters.

``` r
library(new.dist)
  rsod(10, alpha=1, beta=2)
#>  [1] 0.9855191 0.6863792 0.7591962 0.9168402 0.2500233 0.4733888 0.7741440
#>  [8] 0.4719704 0.9832972 0.6623088
```

`dugd` Density function for the Uniform-Geometric distribution with
theta parameters.

``` r
library(new.dist)
dugd(1, theta=0.5)
#> [1] 0.6931472
```

`pugd` Distribution function for the Uniform-Geometric distribution with
theta parameters.

``` r
library(new.dist)
pugd(1,theta=.5)
#> [1] 0.6931472
```

`qugd` quantile function for the Uniform-Geometric distribution with
theta parameters.

``` r
library(new.dist)
qugd(0.6,theta=.1)
#> [1] 4
```

`rugd` random generation for the Uniform-Geometric distribution with
theta parameters.

``` r
library(new.dist)
  rugd(10,theta=.1)
#>  [1]  1  3  4 15  1  3  7  3  1  2
```

`dtpmd` Density function for the Power Muth distribution with parameters
shape and scale.

``` r
library(new.dist)
dtpmd(1, beta=2, alpha=3)
#> [1] 0.04952547
```

`ptpmd` Distribution function for the Power Muth distribution with
parameters shape and scale.

``` r
library(new.dist)
ptpmd(1,beta=2,alpha=3)
#> [1] 0.008115344
```

`qtpmd` quantile function for the Power Muth distribution with
parameters shape and scale.

``` r
library(new.dist)
qtpmd(.5,beta=2,alpha=3)
#> [1] 1.990084
```

`rtpmd` random generation for the Power Muth distribution with
parameters shape and scale.

``` r
library(new.dist)
  rtpmd(10,beta=2,alpha=3)
#>  [1] 2.483482 1.424005 1.462875 1.792980 1.933239 1.759287 1.841671 2.057533
#>  [9] 2.052466 1.103022
```

`dtprd` Density function for the Two-Parameter Rayleigh distribution
with parameters location and scale.

``` r
library(new.dist)
dtprd(5, lambda=4, mu=4)
#> [1] 0.1465251
```

`ptprd` Distribution function for Two-Parameter Rayleigh distribution
with parameters location and scale.

``` r
library(new.dist)
ptprd(2,lambda=2,mu=1)
#> [1] 0.8646647
```

`qtprd` quantile function for Two-Parameter Rayleigh distribution with
parameters location and scale.

``` r
library(new.dist)
qtprd(.5,lambda=2,mu=1)
#> [1] 0.411295
```

`rtprd` random generation for Two-Parameter Rayleigh distribution with
parameters location and scale.

``` r
library(new.dist)
  rtprd(10,lambda=2,mu=1)
#>  [1]  0.19133593  0.56314503  0.02086814  0.81641312  0.22966305 -0.13259365
#>  [7]  0.81568758  0.33935038 -0.23367838  0.79124051
```

`duigd` Density function for the unit inverse Gaussian distribution with
parameters mean and scale.

``` r
library(new.dist)
duigd(1, mu=2, lambda=3)
#> [1] 0.4749088
```

`puigd` Distribution function for the unit inverse Gaussian distribution
with parameters mean and scale.

``` r
library(new.dist)
puigd(1,mu=2,lambda=3)
#> [1] 0.2873867
```

`quigd` quantile function for the unit inverse Gaussian distribution
with parameters mean and scale.

``` r
library(new.dist)
quigd(.1,mu=2,lambda=3)
#> [1] 0.6104128
```

`ruigd` random generation for the unit inverse Gaussian distribution
with parameters mean and scale.

``` r
library(new.dist)
  ruigd(10,mu=2,lambda=3)
#>  [1] 1.642341 1.414783 2.297419 3.503333 2.025741 3.439091 1.192895 4.059060
#>  [9] 1.708921 2.441054
```

`dwbgd` Density function for the Weighted Bivariate Geometric
distribution with alpha and lambda parameters.

``` r
library(new.dist)
dwbgd(1,alpha=.2,lambda=3)
#> [1] 0.79872
```

`pwbgd` Distribution function for the Weighted Bivariate Geometric
distribution with alpha and lambda parameters.

``` r
library(new.dist)
dwbgd(1,alpha=.2,lambda=3)
#> [1] 0.79872
```

`qwbgd` quantile function for the Weighted Bivariate Geometric
distribution with alpha and lambda parameters.

``` r
library(new.dist)
qwbgd(.98,alpha=.2,lambda=3)
#> [1] 3
```

`rwbgd` random generation for the Weighted Bivariate Geometric
distribution with alpha and lambda parameters.

``` r
library(new.dist)
  rwbgd(10,alpha=.2,lambda=3)
#>  [1] 2 1 1 1 1 1 1 1 3 1
```

`ddld` Density function for the discrete Lindley distribution with theta
parameters.

``` r
library(new.dist)
ddld(1,theta=2)
#> [1] 0.1828223
```

`pdld` Distribution function for the discrete Lindley distribution with
theta parameters.

``` r
library(new.dist)
ddld(1,theta=2)
#> [1] 0.1828223
```

`qdld` quantile function for the discrete Lindley distribution with
theta parameters.

``` r
library(new.dist)
qdld(.993,theta=2)
#> [1] 3
```

`rdld` random generation for the discrete Lindley distribution with
theta parameters.

``` r
library(new.dist)
  rdld(10,theta=1)
#>  [1] 1 1 4 0 2 0 0 0 0 1
```

`demd` Density function for a Maxwell distribution with theta
parameters.

``` r
library(new.dist)
demd(1,theta=2)
#> [1] 0.4839414
```

`pemd` Distribution function for a Maxwell distribution with theta
parameters.

``` r
library(new.dist)
pemd(1,theta=2)
#> [1] 0.198748
```

`qemd` quantile function for a Maxwell distribution with theta
parameters.

``` r
library(new.dist)
qemd(.4,theta=5)
#> [1] 2.161694
```

`remd` random generation for a Maxwell distribution with theta
parameters.

``` r
library(new.dist)
  remd(10,theta=1)
#>  [1]  2.1988283  0.7404783  1.3720388 -0.2976837  1.2033490  1.7857045
#>  [7]  0.5492494  0.5437053  1.6248781  1.9475629
```

`depkd` Density function for kumaraswamy distribution with parameters
shapes.

``` r
library(new.dist)
depkd(0.1,lambda=2,alpha=3)
#> [1] 0.58806
```

`pepkd` Distribution function for kumaraswamy distribution with
parameters shapes.

``` r
library(new.dist)
depkd(0.1,lambda=2,alpha=3)
#> [1] 0.58806
```

`qepkd` quantile function for kumaraswamy distribution with parameters
shapes.

``` r
library(new.dist)
pepkd(0.5,lambda=2,alpha=3)
#> [1] 0.578125
```

`repkd` random generation for kumaraswamy distribution with parameters
shapes.

``` r
library(new.dist)
  repkd(10,lambda=2,alpha=3)
#>  [1] 0.51465583 0.62150875 0.78725967 0.84553938 0.46332912 0.07534555
#>  [7] 0.49027008 0.55913722 0.53852101 0.20954724
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.
