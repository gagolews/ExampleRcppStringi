#include <stringi.h>
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
CharacterVector test_dup(CharacterVector x, IntegerVector i) {
   return stri_dup(x, i);
}

// [[Rcpp::export]]
CharacterVector test_paste(CharacterVector x) {
   IntegerVector y(seq_len(x.size()));
   CharacterVector u = stri_join2(x, y);
   u = stri_flatten(u, CharacterVector(", "));
   return u;
}

