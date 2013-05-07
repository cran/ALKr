\name{ALKr-class}
\alias{ALKr-class}
\title{ALKr}
\description{
  Every function used to calculate Age-Length Keys returns
  an \code{ALKr} object.
}
\details{
  \describe{ \item{alk}{A \eqn{i \times j} matrix with the
  probability of an individual of length \eqn{i} having age
  \eqn{j}, i.e. \eqn{P(j|i)}} \item{N}{A \eqn{i \times j}
  matrix with the estimated number of individuals of length
  \eqn{i} and age \eqn{j}} \item{method}{A string with the
  name of the algorithm used to calculate the ALK}
  \item{params}{A named list with any parameters needed by
  the algorithm} \item{name}{A string with a user-defined
  name for the ALKr object} \item{description}{A string
  with a user-defined description for the ALKr object} }
}

