setClass("ALKr",
  representation(
    alk = "matrix",
    N = "matrix",
    method = "character",
    parameters = "list"),
  validity = function(object) {
    if (nrow(object@alk) != length(object@length_classes))
      return("Incorrect number of length classes")
    if (ncol(object@alk) != length(object@age_classes))
      return("Incorrect number of age classes")
    if (!identical(dim(alk), dim(N)))
      return("alk and N matrices have different dimensions")
    return(TRUE)
  }
)

setMethod("initialize", "ALKr",
  function(.Object, alk, N, method, parameters) {
    .Object@alk <- alk
    .Object@N <- N
    .Object@method <- method
    .Object@parameters <- parameters
    .Object
  }
)

setMethod("show",
  signature(object = "ALKr"),
  function(object) {
    print(object@alk)
    cat(paste("\nMethod:", object@method,"\n"))
    if (length(object@parameters) > 0)
      print(matrix(object@parameters, dimnames = list(names(object@parameters), "Value")))
  }
)