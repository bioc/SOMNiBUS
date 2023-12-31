% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomRegMethModelPred.R
\name{binomRegMethModelPred}
\alias{binomRegMethModelPred}
\title{A smoothed-EM algorithm to estimate covariate effects and test
regional association in Bisulfite Sequencing-derived methylation data}
\usage{
binomRegMethModelPred(
  BEM.obj,
  newdata = NULL,
  type = "proportion",
  verbose = TRUE
)
}
\arguments{
\item{BEM.obj}{an output from the function \code{binomRegMethModel}}

\item{newdata}{the data set whose predictions are calculated; with
columns 'Position', covariate names matching the BEM.obj}

\item{type}{return the predicted methylation proportion or the predicted
response (in logit or other binom.link scale)}

\item{verbose}{logical indicates if the algorithm should provide progress
report information.
The default value is TRUE.}
}
\value{
This function returns the predicted methylation levels
}
\description{
This function returns the predicted methylation levels
}
\examples{
#------------------------------------------------------------#
data(RAdat)
RAdat.f <- na.omit(RAdat[RAdat$Total_Counts != 0, ])
out <- binomRegMethModel(
  data=RAdat.f, n.k=rep(5, 3), p0=0.003307034, p1=0.9,
  epsilon=10^(-6), epsilon.lambda=10^(-3), maxStep=200,
  Quasi = FALSE, RanEff = FALSE
)
binomRegMethModelPred(out)
}
\author{
Kaiqiong Zhao
}
