#' Classic Age-Length Key
#'
#' \code{classicALK} returns an Age-Length Key calculated from a matrix with the
#' count of individuals per age- and length-class, as described by Fridriksson
#' (1934).
#' 
#' @param x A \eqn{i \times j} matrix with the count of individuals of age
#' \eqn{i} and length \eqn{j}.
#' @param fi A vector of length \code{i} where \code{fi[i]} is the number of
#' fish in the length-class \code{i} on the population from which \code{x} was
#' sampled. Defaults to the number of samples per length class, which will
#' @param age_classes A vector with the name of each age class. Defaults to the
#' column names of \code{x}.
#' @param length_classes A vector with the name of each length class. Defaults
#' to the row names of \code{x}.
#' 
#' @return An \code{ALKr} object, containing a \eqn{i \times j} matrix with the
#' probability of an individual of length \eqn{i} having age \eqn{j}, i.e.
#' \eqn{P(i|j)}, the vectors of age and length classes, and information about
#' the method used to generate the key.
#' 
#' @references Fridriksson, A. (1934). On the calculation of age-distribution
#' within a stock of cod by means of relatively few age determinations as a key
#' to measurements on a large scale. \emph{Rapp. P.-V. CIEM}, \strong{86}, 1-5.
#' 
#' @examples
#' data(hom)
#' classic_ALK(hom$otoliths[[1]], fi = hom$F1992)
#' 
#' @export
classic_ALK <- function(x, fi = rowSums(x), age_classes = colnames(x),
                       length_classes = rownames(x)) {
  
  if (identical(fi, rowSums(x))) {
    params <- list(Note = "N matrix assumes non-stratified sampling")
  } else {
    params <- list()
  }
  
  new("ALKr",
      alk = calc_ALK(x),
      N = x * fi,
      method = "Classic ALK",
      parameters = params
      )
}