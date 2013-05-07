\name{gascuel}
\alias{gascuel}
\alias{hoenig_heisey}
\alias{inverse_ALK}
\alias{kimura_chikuni}
\title{Age-Length Key by the methods based on inverse ALKs}
\usage{
  gascuel(x, fi1, fi2, initial_values, threshold = 1e-04,
    maxiter = 2000, age_classes = colnames(x),
    length_classes = rownames(x), name = "",
    description = "")

  hoenig_heisey(x, fi1, fi2, threshold = 1e-04,
    maxiter = 2000, age_classes = colnames(x),
    length_classes = rownames(x), name = "",
    description = "")

  inverse_ALK(x, fi1, fi2, age_classes = colnames(x),
    length_classes = rownames(x), name = "",
    description = "")

  kimura_chikuni(x, fi1, fi2, threshold = 1e-04,
    maxiter = 2000, age_classes = colnames(x),
    length_classes = rownames(x), name = "",
    description = "")
}
\arguments{
  \item{x}{A \eqn{i \times j} matrix with \code{i} lines
  and \code{j} columns, where \code{x[i, j]} is the count
  of individuals of length \code{i} and age \code{j}.}

  \item{fi1}{A vector of length \code{i} where \code{fi[i]}
  is the number of fish in the length-class \code{i} on the
  population from which \code{x} was sampled.}

  \item{fi2}{A vector of length \code{i} where \code{fi[i]}
  is the number of fish in the length-class \code{i} on a
  population with unknown age information.}

  \item{age_classes}{A vector with the name of each age
  class.}

  \item{length_classes}{A vector with the name of each age
  class.}

  \item{threshold}{The value at which convergence is
  considered to be achieved: see `details'.}

  \item{maxiter}{The maximum number of iterations of the EM
  algorithm: see `details'.}

  \item{initial_values}{A vector with the initial values
  for \eqn{\alpha}, \eqn{\beta} and \eqn{\gamma}: see
  `details'.}

  \item{name}{A string with the name of the ALK.}

  \item{description}{A string describing the ALK.}
}
\value{
  An \code{ALKr} object, containing a \eqn{i \times j}
  matrix with the probability of an individual of length
  \code{i} having age \code{j}, i.e. \eqn{P(j|i)}, a \eqn{i
  \times j} matrix with the estimated number of individuals
  of length \code{i} and age \code{j}, and information
  about the method used to generate the key.
}
\description{
  Generation of Age-Length Keys (ALK) using incomplete
  data, by methods based on inverse ALKs.
}
\details{
  \code{inverseALK} calculates an ALK from a sample of
  aged-fish, the length distribution of the sampled
  population and the length distribution of a population
  with unknown age-length data, as described by Clark
  (1981), Bartoo and Parker (1983) and Hilborn and Walters
  (1992).

  \code{kimura_chikuni}, \code{hoenig_heisey} and
  \code{gascuel} use the same inputs as \code{inverseALK}
  to calculate an ALK as described respectively by Kimura
  and Chikuni (1987), Hoenig and Heisey (1987) and Gascuel
  (1994).

  \code{hoenig} employs the generalized method proposed by
  Hoenig \emph{et al.} (1993, 1994), which takes an
  undefined number of data sets with known and unknown age
  information and combines them to calculate the ALK.

  The returned \code{ALKr} object contains information on
  the convergence threshold that was used, the number of
  iterations ran, and if convergence was reached.

  \subsection{Initial values}{

  The method proposed by Gascuel (1994) is based on the
  assumption that the length distribution \emph{within}
  each age class follows a Normal distribution, where the
  standard deviation of length at age
  \eqn{\sigma_j}{\sigma(j)} is given by a linear model as a
  function of three parameters \eqn{\alpha}, \eqn{\beta}
  and \eqn{\gamma}:

  \deqn{\sigma_j = \alpha + \beta\cdot l_j +
  \gamma\cdot\Delta l_j}{\sigma(j) = \alpha + \beta l(j) +
  \gamma \Deltal(j)}

  where \eqn{\Delta l_j}{\Deltal(j)} is the difference
  between the mean lengths at age-class \code{j} and
  age-class \code{j-1}. }

  \subsection{Convergence}{

  The methods proposed by Kimura and Chikuni (1987), Hoenig
  and Heisey (1987) and Gascuel (1994) are all based on the
  EM algorithm as defined by Dempster \emph{et al.} (1997),
  and build the ALK by a series of iterations which are
  repeated until convergence is acheived.

  The convergence is tested by evaluating the sum of the
  absolute differences between the ages distributions
  calculated on the previous and current iterations:
  \code{sum(abs(pj_prev - pj_curr))}. The algorithm exits
  when either this value is smaller than the specified
  \code{threshold} or when the number of iterations reaches
  \code{maxiter}. }
}
\examples{
data(hom)

inverse_ALK(hom$otoliths[[1]], fi1 = hom$F1992, fi2 = hom$F1993)

kimura_chikuni(hom$otoliths[[1]], fi1 = hom$F1992, fi2 = hom$F1993) # converges
kimura_chikuni(hom$otoliths[[1]], fi1 = hom$F1992, fi2 = hom$F1993, maxiter = 10) # won't converge

hoenig_heisey(hom$otoliths[[1]], fi1 = hom$F1992, fi2 = hom$F1993)

gascuel(hom$otoliths[[1]], fi1 = hom$F1992, fi2 = hom$F1993,
  initial_values = c(0.1, 0.07, 0.06))
}
\references{
  Bartoo, N.W., Parker, K.R. (1983). Stochastic
  age-frequency estimation using the von Bertalanffy growth
  equation. \emph{Fishery Bulletin}, \strong{81}/1, 91-96

  Clark, W.G. (1981). Restricted Least-Squares Estimates of
  Age Composition from Length Composition. \emph{Canadian
  Journal of Fisheries and Aquatic Sciences},
  \strong{38}/3, 297-307. DOI: \code{10.1139/f81-041}

  Dempster, A.P., Laird, N.M., Rubin, D.B. (1977). Maximum
  Likelihood from Incomplete Data via the EM Algorithm.
  \emph{Journal of the Royal Statistical Society. Series B
  (Methodological)}, \strong{39}/1, 1-38. DOI:
  \code{10.2307/2984875}

  Gascuel, D. (1994). Une methode simple d'ajustement des
  cles taille/age: application aux captures d'albacores
  (Thunnus albacares) de l'Atlantique Est. \emph{Canadian
  Journal of Fisheries and Aquatic Sciences},
  \strong{51}/3, 723-733. DOI: \code{10.1139/f94-072}

  Hilborn, R., Walters, C.J. (1992). Quantitative fisheries
  stock assessment: Choice, dynamics and uncertainty.
  \emph{Reviews in Fish Biology and Fisheries},
  \strong{2}/2, 177-178. DOI: \code{10.1007/BF00042883}

  Hoenig, J.M., Heisey, D.M. (1987), Use of a Log-Linear
  Model with the EM Algorithm to Correct Estimates of Stock
  Composition and to Convert Length to Age.
  \emph{Transactions of the American Fisheries Society},
  \strong{116}/2, 232-243. DOI:
  \code{10.1577/1548-8659(1987)116<232:UOALMW>2.0.CO;2}
}
\seealso{
  \link{hoenig}
}

