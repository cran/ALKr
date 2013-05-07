\name{hoenig}
\alias{hoenig}
\title{Age-Length Key by the Hoening \emph{et al.} (1993, 1994) method}
\usage{
  hoenig(Ak, fik, fiz, threshold = 1, maxiter = 2000,
    age_classes = colnames(Ak[[1]]),
    length_classes = rownames(Ak[[1]]), name = "",
    description = "")
}
\arguments{
  \item{Ak}{A list of \code{k} equally dimensioned
  matrices, so that \code{A[[k]][i, j]} is the count of
  individuals of length \code{i} and age \code{j} on sample
  \code{k}.}

  \item{fik}{A list of \code{k} vectors of equal length
  (\code{i}), so that \code{fik[[k]][i]} is the total
  number of fish in the length-class \code{i} on the
  population from which \code{Ak[[k]]} was sampled.}

  \item{fiz}{A list of vectors of equal length (\code{i})
  where \code{fiz[[z]][i]} is the number of fish in the
  length-class \code{i} on population \code{z}, for which
  no age data is available.}

  \item{age_classes}{A vector with the name of each age
  class.}

  \item{length_classes}{A vector with the name of each age
  class.}

  \item{threshold}{The value at which convergence is
  considered to be achieved: see `details'.}

  \item{maxiter}{The maximum number of iterations of the EM
  algorithm: see `details'.}

  \item{name}{A string with the name of the ALK.}

  \item{description}{A string describing the ALK.}
}
\value{
  A list of \code{ALKr} objects, one for each item in the
  \code{fiz} list, each containing a matrix with the
  probability of an individual of age \code{j} having
  length \code{i}, i.e. \eqn{P(i|j)}, the vectors of age
  and length classes, and information about the method used
  to generate the key.
}
\description{
  Generation of Age-Length Keys (ALK) using incomplete
  data, by the method proposed by Hoenig \emph{et al.}
  (1993, 1994).
}
\details{
  Calculates an ALK using the generalized method proposed
  by Hoenig \emph{et al.} (1993, 1994), which uses an
  undefined number of data sets with known and unknown age
  information.

  The returned \code{ALKr} object contains information on
  the convergence threshold that was used, the number of
  iterations ran, and if convergence was reached.

  \subsection{Convergence}{

  The method proposed by Hoenig \emph{et al.} (1993, 1994)
  is based on the EM algorithm as defined by Dempster
  \emph{et al.} (1997), and it generates the ALK by a
  series of iterations which are repeated until convergence
  is acheived.

  Let \code{Nz} be a list of matrices containing the number
  of fish in each length and age class for each of the
  \code{z} populations with unknown age information and
  with length distribution specified by \code{fiz}.
  Convergence is tested by evaluating the greatest of the
  absolute differences between all pairs of \code{Nz}
  matrices generated on the current and previous
  iterations: \code{max(mapply("-", Nz, Nz.old))}. }
}
\examples{
data(hom)

hoenig(Ak = hom$otoliths[1:10],
       fik = replicate(10, hom$F1992, simplify = FALSE),
       fiz = list(hom$F1993))
}
\references{
  Dempster, A.P., Laird, N.M., Rubin, D.B. (1977). Maximum
  Likelihood from Incomplete Data via the EM Algorithm.
  \emph{Journal of the Royal Statistical Society. Series B
  (Methodological)}, \strong{39}/1, 1-38. DOI:
  \code{10.2307/2984875}

  Hoenig, J.M., Heisey, D.M., Hanumara, R.C. (1993). Using
  Prior and Current Information to Estimate Age
  Composition: a new kind of age-length key. \emph{ICES CM
  Documents 1993}, 10.

  Hoenig, J.M., Heisey, D.M., Hanumara, R.C. (1994). A
  computationally simple approach to using current and past
  data in age-length key. \emph{ICES CM Documents 1994}, 5.
}
\seealso{
  \link{inverse_ALK} \link{kimura_chikuni}
  \link{hoenig_heisey} \link{gascuel}
}

