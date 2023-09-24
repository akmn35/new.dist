
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
#>  [1] 2.884623 3.348114 2.998232 5.316007 3.480185 4.190912 7.450347 4.474475
#>  [9] 2.716492 7.080519
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
#>  [1] 0.7540955 1.8489346 1.2741975 1.3299296 1.5451103 1.0944391 1.0145081
#>  [8] 0.5506817 0.8374524 1.0058021
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
#>  [1] 0.9995790 0.9352094 0.9541714 0.7048582 0.9972995 0.4215912 0.7368336
#>  [8] 0.9996926 0.3553716 0.8146976
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
#>  [1]  2  6  1 25  1  1  1  1  4  4
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
#>  [1] 1.568705 2.411020 1.653554 1.827441 2.077756 2.099398 2.077053 1.611900
#>  [9] 1.842736 1.116277
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
#>  [1]  0.3281643  0.1544984  0.8579063  0.4369039  0.2823575  0.3213465
#>  [7]  0.2795704  0.4761144  0.2212813 -0.2257579
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
#>  [1] 5.7648065 2.9972801 1.0366389 0.4730276 1.4112751 0.7301846 1.8218819
#>  [8] 0.7317292 0.6281037 4.3721664
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
#>  [1] 1 1 1 1 2 2 1 1 1 2
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
#>  [1] 1 0 0 1 3 0 1 1 2 0
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
#>  [1] 1.5004341 1.1915969 0.9158868 0.8698668 1.0976276 1.7116925 0.8203744
#>  [8] 0.3670998 0.7713677 0.5838264
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
#>  [1] 0.3930846 0.7516002 0.2524758 0.4343678 0.4149200 0.6701242 0.2376416
#>  [8] 0.1321771 0.6442339 0.5366133
```

`dgld` Density function for the gamma-Lomax Distribution with parameters
shapes and beta parameter.

``` r
library(new.dist)
dgld(1,a=2,alpha=3,beta=4)
#> [1] 0.2056491
```

`pgld` distribution function for the gamma-Lomax Distribution with
parameters shapes and beta parameter.

``` r
library(new.dist)
dgld(1,a=2,alpha=3,beta=4)
#> [1] 0.2056491
```

`qgld` quantile function for the gamma-Lomax Distribution with
parameters shapes and beta parameter.

``` r
library(new.dist)
qgld(.8,a=2,alpha=3,beta=4)
#> [1] 6.852523
```

`rgld` random generation for the gamma-Lomax Distribution with
parameters shapes and beta parameter.

``` r
library(new.dist)
  rgld(10,a=2,alpha=3,beta=4)
#>  [1] 1.3741059 3.9556406 0.4002432 0.6684525 0.2767997 4.1002978 2.7743749
#>  [8] 4.0961234 2.6304995 1.0819879
```

`dndd` Density function for a new discrete distribution with parameters
theta.

``` r
library(new.dist)
dndd(2,theta=2)
#> [1] 0.03530023
```

`pndd` Distribution function for a new discrete distribution with
parameters theta.

``` r
library(new.dist)
pndd(1,theta=2)
#> [1] 0.7744412
```

`qndd` quantile function for a new discrete distribution with parameters
theta.

``` r
library(new.dist)
qndd(.5,theta=2)
#> [1] 1
```

`rndd` random generation for a new discrete distribution with parameters
theta.

``` r
library(new.dist)
  rndd(10,theta=1)
#>  [1] 1 2 2 2 1 2 1 1 1 2
```

`dnld` Density function for the New Life distribution with lambda and
beta parameters.

``` r
library(new.dist)
dnld(1, lambda=2, beta=3)
#> [1] 0.05165063
```

`pnld` Distribution function for the New Life distribution with lambda
and beta parameters.

``` r
library(new.dist)
pnld(1, lambda=2, beta=3)
#> [1] 0.9836125
```

`qnld` quantile function for the New Life distribution with lambda and
beta parameters.

``` r
library(new.dist)
qnld(.8,lambda=2,beta=3)
#> [1] 0.295895
```

`rnld` random generation for the New Life distribution with lambda and
beta parameters.

``` r
library(new.dist)
  rnld(10,lambda=2,beta=3)
#>  [1] 0.06453395 0.24483072 0.14715556 0.01093512 0.04438933 0.48070067
#>  [7] 0.35515936 0.10258030 0.05765450 0.02260564
```

`dnoPDD` Density function for a new one parameter discrete distribution
with scale parameters.

``` r
library(new.dist)
dnoPDD(1,theta=2)
#> [1] 0.1412194
```

`pnoPDD` Distribution function for a new one parameter discrete
distribution with scale parameters.

``` r
library(new.dist)
pnoPDD(1,theta=2)
#> [1] 0.3115553
```

`qnoPDD` quantile function for a new one parameter discrete distribution
with scale parameters.

``` r
library(new.dist)
dnoPDD(.8,theta=2)
#> [1] 0.163461
```

`rnoPDD` random generation for a new one parameter discrete distribution
with scale parameters.

``` r
library(new.dist)
  rnoPDD(10,theta=2)
#>  [1] 0.40902363 3.93983174 0.14873575 3.26104391 1.64637174 2.89223945
#>  [7] 3.36025102 1.36918087 0.28152633 0.01073475
```

`domd` Density function for on the muth distribution with alpha
parameters.

``` r
library(new.dist)
domd(1,alpha=.2)
#> [1] 0.4123689
```

`pomd` Distribution function for on the muth distribution with alpha
parameters.

``` r
library(new.dist)
pomd(1,alpha=.2)
#> [1] 0.596272
```

`qomd` quantile function for on the muth distribution with alpha
parameters.

``` r
library(new.dist)
domd(.8,alpha=.2)
#> [1] 0.4797929
```

`romd` random generation for on the muth distribution with alpha
parameters.

``` r
library(new.dist)
  domd(10,alpha=.2)
#> [1] 7.105617e-13
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
