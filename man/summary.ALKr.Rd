\name{summary.ALKr}
\alias{summary.ALKr}
\title{Summarizing ALK Estimations}
\usage{
  \method{summary}{ALKr} (object, length_classes = NULL,
    ...)
}
\arguments{
  \item{object}{An \code{ALKr} object.}

  \item{length_classes}{A vector with the length value to
  be used for each length class. Defaults to the row names
  of \code{x}, which must be coercible as numerics.}

  \item{...}{other arguments (currently ignored)}
}
\value{
  A \code{summary_ALKr} object, containing the mean
  length-at-age, the variance of the length-at-age, and the
  proportion of the age class in the population, for each
  age class. The name of the method used to calculate the
  ALK and its parameters are also included.
}
\description{
  \code{summary} method for class "\code{ALKr}". Returns
  the mean length-at-age, the variance of the
  length-at-age, and the proportion of the age class in the
  population, for each age class.
}
\examples{
data(hom)
cALK <- classic_ALK(hom$otoliths[[1]], fi = hom$F1992)
summary(cALK)
hhALK <- hoenig_heisey(hom$otoliths[[1]], fi1 = hom$F1992, fi2 = hom$F1993)
summary(hhALK)
}

