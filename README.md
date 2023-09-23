
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
#>  [1] 4.653388 3.881313 3.289873 2.981877 6.104698 1.375741 4.559537 5.010804
#>  [9] 3.141568 3.780320
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
#>  [1] 0.6164705 0.6418423 2.6661576 0.4473021 1.5617503 0.8798328 1.3620381
#>  [8] 0.3820371 1.0187997 1.1504822
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
#>  [1] 0.6034772 0.9739799 0.7145625 0.2959310 0.9998763 0.2275438 0.7449968
#>  [8] 0.9823279 0.5115580 0.9696778
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
#>  [1] 1 2 6 8 6 2 1 3 4 1
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
#>  [1] 1.6860444 2.2855633 1.5324437 2.4056539 2.0288727 2.2756597 2.4683097
#>  [8] 0.9959695 2.1578540 2.0586066
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
#>  [1]  0.26744899  0.77117320  0.26741555  0.90003307 -0.41493253  0.86220218
#>  [7]  0.46745077  0.01034139  0.08603320  0.75680357
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
#>  [1] 12.7214363  0.5945712  1.1740251  2.1283198  1.6499318  0.6715343
#>  [7]  0.7871858  1.9339422  0.9058734  0.9048798
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
#>  [1] 1 1 1 1 1 1 2 1 1 1
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
#>  [1] 0 0 0 2 2 1 2 2 4 0
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
#>  [1] 1.0863622 0.8084618 1.9066880 0.9387388 1.3346523 1.3126646 1.2679819
#>  [8] 0.7410911 1.1525105 0.5841748
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
pepkd(10,lambda=2,alpha=3)
#> [1] 0
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
