#include "ALKr.h"

NumericVector colSums(NumericMatrix x) {
  int n = x.ncol();
  NumericVector sums(n, 0.0);
  
  for (int c = 0; c < n; ++c)
    sums[c] += sum(x(_, c));
  
  return sums;
}

NumericVector rowSums(NumericMatrix x) {
  int n = x.nrow();
  NumericVector sums(n, 0.0);
  
  for (int r = 0; r < n; ++r)
    sums[r] += sum(x(r, _));
  
  return sums;
}

NumericMatrix calc_ALK(NumericMatrix x) {
  NumericVector sums = rowSums(x);
  NumericMatrix alk(x.nrow(), x.ncol());
  
  for (int r = 0; r < x.nrow(); ++r) {
    if(sums[r] == 0) sums[r] = 1;
    alk(r, _) = x(r, _) / sums[r];
  }
  
  return alk;
}
