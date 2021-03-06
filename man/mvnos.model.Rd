% Generated by roxygen2 (4.0.2): do not edit by hand
\name{mvnos.model}
\alias{mvnos.model}
\title{Multivariate Normal Order-statistics Model.}
\usage{
mvnos.model(y, p, Z, beta0 = NULL, A0 = NULL, alpha = NULL, P = NULL,
  BURN_IN_ITERATIONS = 1000, MAX_ITERATIONS = 10000, DRAW_CYCLE = 20)
}
\arguments{
\item{y}{:an n*k matrix, observed data, each row is an individual's rank of items}

\item{p}{:number of parameters in MVNOS model}

\item{Z}{:a n*k*p array of covariates associated with all judges}

\item{beta0}{:a 1*p matrix, prior normal distribution mean parameters}

\item{A0}{:a p*p matrix, prior normal distribution variance-covariance matrix}

\item{alpha}{:scalar, prior Wishart distribution degree of freedom}

\item{P}{:a (k-1)*(k-1) matrix, prior Wishart distribution scale matrix}

\item{BURN_IN_ITERATIONS}{:number of iterations to burn-in at first}

\item{MAX_ITERATIONS}{:full sample iterations}

\item{DRAW_CYCLE}{:reduce the full sample by draw-cycle(e.g. draw every 20th draw from the full sample)}
}
\value{
A list of Gibbs sampling traces
}
\description{
Using MCMC methods to fit the MVNOS model. Please install JAGS 3.X (\url{http://mcmc-jags.sourceforge.net}) and rjags (\url{http://cran.r-project.org/web/packages/rjags/index.html}) at first.
}
\examples{
# APA data application
# It will take about 10 minutes to run the demo.
data(APA)
y = freq2case(APA, freq.col = 1)
y = 6 - y
# number of observed judges
n = dim(y)[1]
# number of items
k = dim(y)[2]
# number of parameteros of beta
p = k
beta0 = rep(0, p)
alpha = k + 1
A0 = diag(100, ncol = p, nrow = p)
P = diag(k + 1, ncol = k - 1, nrow = k - 1)
# Construct Z
Z = array(0, dim = c(n, k, p))
for (j in 1:n)
{
   Z[j, , ] = diag(1, nrow= k, ncol = p)
}
# Total iterations of Gibbs sampling
MAX_ITERATIONS = 10000
# Number of iterations to be reduced(burnt in)
BURN_IN_ITERATIONS = 1000
# Run the model, time consuming
# output_list = mvnos.model(y, p, Z, beta0, A0, alpha, P,
# MAX_ITERATIONS = MAX_ITERATIONS, BURN_IN_ITERATIONS = BURN_IN_ITERATIONS)
}
\author{
Li Qinglong <liqinglong0830@163.com>
}
\references{
Yu, P. L. H. (2000). Bayesian analysis of order-statistics models for ranking data. Psychometrika, 65(3):281-299.
}

