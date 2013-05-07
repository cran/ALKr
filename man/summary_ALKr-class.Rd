\name{summary_ALKr-class}
\alias{summary_ALKr-class}
\title{Summary of an ALKr object}
\description{
  Summarizes an \code{ALKr} object, calculating the
  proportion of each age on the population, the mean
  length-at-age and the variance of the length-at-age. The
  summary object also contains the name of the algorithm
  used to calculate the ALK, the parameters used, as well
  as the user-defined name and description of the
  \code{ALKr} object.
}
\details{
  \describe{ \item{pj}{A vector of length \eqn{j} with the
  proportion of each age on the population}
  \item{mean_lj}{A vector of length \eqn{j} with the mean
  length-at-age for each age class} \item{var_lj}{A vector
  of length \eqn{j} with the variance of the length-at-age
  for each age class} \item{method}{A string with the name
  of the algorithm used to calculate the ALK}
  \item{params}{A named list with any parameters needed by
  the algorithm} \item{name}{A string with a user-defined
  name for the ALKr object} \item{description}{A string
  with a user-defined description for the ALKr object} }
}

