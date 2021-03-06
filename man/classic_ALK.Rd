\name{classic_ALK}
\alias{classic_ALK}
\title{Classic Age-Length Key}
\usage{
classic_ALK(x, fi = rowSums(x), age_classes = colnames(x),
  length_classes = rownames(x), name = "", description = "")
}
\arguments{
  \item{x}{A \eqn{i \times j} matrix with the count of
  individuals of length \eqn{i} and age \eqn{j}.}

  \item{fi}{A vector of length \code{i} where \code{fi[i]}
  is the number of fish in the length-class \code{i} on the
  population from which \code{x} was sampled. Defaults to
  the number of samples per length class, which will}

  \item{age_classes}{A vector with the name of each age
  class. Defaults to the column names of \code{x}.}

  \item{length_classes}{A vector with the name of each
  length class. Defaults to the row names of \code{x}.}

  \item{name}{A string with the name of the ALK.}

  \item{description}{A string describing the ALK.}
}
\value{
An \code{ALKr} object, containing a \eqn{i \times j} matrix
with the probability of an individual of length \code{i}
having age \code{j}, i.e. \eqn{P(j|i)}, a \eqn{i \times j}
matrix with the estimated number of individuals of length
\code{i} and age \code{j}, and information about the method
used to generate the key.
}
\description{
\code{classicALK} returns an Age-Length Key calculated from
a matrix with the count of individuals per age- and
length-class, as described by Fridriksson (1934).
}
\examples{
data(hom)
classic_ALK(hom$otoliths[[1]], fi = hom$F1992)
}
\references{
Fridriksson, A. (1934). On the calculation of
age-distribution within a stock of cod by means of
relatively few age determinations as a key to measurements
on a large scale. \emph{Rapp. P.-V. CIEM}, \strong{86},
1-5.
}

