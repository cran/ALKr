\name{age_slicing}
\alias{age_slicing}
\title{Age slicing}
\usage{
  age_slicing(fi, li = as.numeric(names(fi)), vb_params,
    age_limits, timing = 0.5)
}
\arguments{
  \item{fi}{A vector with the number of individuals per
  length class.}

  \item{li}{A vector containing the length value for each
  length class. If blank, will use
  \code{as.numeric(names(fi))}.}

  \item{vb_params}{A named vector with the parameters of
  the von Bertalanffy growth equation, \code{Linf},
  \code{K} and \code{t0}.}

  \item{age_limits}{A vector with two elements, containing
  the lowest and highest age classes.}

  \item{timing}{Correction for the offset between the data
  collection and recruitment. Defaults to \code{0.5}, i.e.
  half a year}
}
\value{
  A vector containing the number of individuals in each age
  class.
}
\description{
  Estimation of a population's age distribution from its
  length distribution based on von Bertalanffy's growth
  curve, as described by Kell and Kell (2011)
}
\details{
  Age distribution is calculated by using the inverse of
  the von Bertalanffy growth curve, whose parameters must
  be known. Limits for the minimum and maximum ages must
  also be given.
}
\examples{
data(hom)
age_slicing(fi = hom$F1992,
  vb_params = c(Linf = 54.98, K = 0.064, t0 = -4.68),
  age_limits = c(0,5))
}
\references{
  Kell, L., Kell, A. (2011). A comparison of age slicing
  and statistical age estimation for mediterranean
  swordfish (Xiphias gladius). \emph{Collect. Vol. Sci.
  Pap. ICCAT}. \strong{66}/4, 1522-1534
}

