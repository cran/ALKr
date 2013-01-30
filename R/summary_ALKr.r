setClass("summary_ALKr",
  representation(
    pj = "numeric",
    mean_lj = "numeric",
    var_lj = "numeric",
    method = "character",
    parameters = "list")
)

setMethod("show",
  signature(object = "summary_ALKr"),
    function(object) {
      print(cbind(pj = object@pj, mean_lj = object@mean_lj, var_lj = object@var_lj))
      cat(paste("\nMethod:", object@method,"\n"))
      if(length(object@parameters) > 0)
        print(matrix(object@parameters, dimnames = list(names(object@parameters), "Value")))
    }
)

