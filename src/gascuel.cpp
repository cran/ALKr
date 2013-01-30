#include <Rcpp.h>
using namespace Rcpp;

NumericVector calcSigma(NumericVector lj, NumericVector params) {
  int nj = lj.size();
  
  NumericVector dlj = diff(lj);
  NumericVector difflj(nj);
  difflj[0] = lj[0];
  
  for(int j = 0; j < (nj - 1); ++j) 
    difflj[j + 1] = dlj[j];

  return params[0] + params[1]  * lj + params[2] * difflj;
}

// [[Rcpp::export]]
double optimGascuel(NumericVector params, NumericVector lj, NumericVector li,
                    NumericVector pi_, double threshold, int maxiter) {
                      
  int nj = lj.size();
  int ni = li.size();
  
  RNGScope scope;
  
  NumericVector sigmaj = calcSigma(lj, params);
  
  NumericMatrix invALK(ni, nj);
  for (int j = 0; j < nj; ++j) {
    NumericVector jnorms = dnorm(li, lj[j], sigmaj[j]);
    for (int i = 0; i < ni; ++i) {
      if (jnorms[i] > R_NegInf && jnorms[i] < R_PosInf) {
        invALK(i, j) = jnorms[i];
      } else {
        invALK(i, j) = 0.0;
      }
    }
  }
  
  NumericVector pj(nj, 1.0/nj);
  
  NumericVector pj_prev = pj + threshold * 2;
  
  NumericMatrix P(ni, nj);
  NumericVector sumPi(ni, 0.0);
  NumericVector pPi(ni, 0.0);
    
  int iter = 0;
    
  while(sum(abs(pj_prev - pj)) > threshold && iter < maxiter) {
    for (int j = 0; j < nj; ++j) {
      P(_, j) = invALK(_, j) * pj[j];
    }
    
    for (int i = 0; i < ni; ++i) {
      sumPi[i] = 0.0;
      for (int j = 0; j < nj; ++j) {
        sumPi[i] += P(i, j);
      }
      pPi[i] = pi_[i] / sumPi[i];
    }

    for (int j = 0; j < nj; ++j) {
      pj_prev[j] = pj[j];
      pj[j] = 0.0;
      for (int i = 0; i < ni; ++i) {
        pj[j] += P(i, j) * pPi[i];
      }
    }
    iter += 1;
  }
  
  return sum(pow(pj_prev - pj, 2));
}

// [[Rcpp::export]]
NumericMatrix finalGascuel(NumericVector params, NumericVector lj,
                          NumericVector li, NumericVector pi_, double threshold,
                          int maxiter) {
  int nj = lj.size();
  int ni = li.size();
  
  RNGScope scope;
  
  NumericVector sigmaj = calcSigma(lj, params);
  NumericMatrix invALK(ni, nj);
  for (int j = 0; j < nj; ++j) {
    NumericVector jnorms = dnorm(li, lj[j], sigmaj[j]);
    for (int i = 0; i < ni; ++i) {
      if (jnorms[i] > R_NegInf && jnorms[i] < R_PosInf) {
        invALK(i, j) = jnorms[i];
      } else {
        invALK(i, j) = 0.0;
      }
    }    
  }
  
  NumericVector pj(nj, 1.0/nj);
  
  NumericVector pj_prev = pj + threshold * 2;
  
  NumericVector sumPi(ni, 0.0);
  NumericVector pPi(ni, 0.0);
  NumericMatrix P(ni, nj);
  
  int iter = 0;
  
  while(sum(abs(pj_prev - pj)) > threshold && iter < maxiter) {
    for (int j = 0; j < nj; ++j) {
        P(_, j) = invALK(_, j) * pj[j];
    }
    
    for (int i = 0; i < ni; ++i) {
      sumPi[i] = 0.0;
      for (int j = 0; j < nj; ++j) {
        sumPi[i] += P(i, j);
      }
      pPi[i] = pi_[i] / sumPi[i];
    }

    for (int j = 0; j < nj; ++j) {
      pj_prev[j] = pj[j];
      pj[j] = 0.0;
      for (int i = 0; i < ni; ++i) {
        pj[j] += P(i, j) * pPi[i];
      }
    }

    iter += 1;
  }

  for (int i = 0; i < ni; ++i) {
    for (int j = 0; j < nj; ++j) {
      P(i, j) = invALK(i, j) * pj[j];
      if (P(i, j) == R_PosInf) P(i, j) = 0;
    }
  }
  
  return P;
}
