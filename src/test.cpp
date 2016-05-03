#include <stringi.h>
#include <Rcpp.h>
using namespace Rcpp;

//' Duplicates a given string
//' @param x a character vector
//' @param i an integer vector
//' @return a character vector
//'
//' @examples
//' test_dup("A", 1)
//'
//' @export
// [[Rcpp::export]]
CharacterVector test_dup(CharacterVector x, IntegerVector i) {
   return stri_dup(x, i);
}


//' Concatenates all strings into a single one
//' @param x a character vector
//' @return a character vector
//'
//' @examples
//' test_paste(letters)
//'
//' @export
// [[Rcpp::export]]
CharacterVector test_paste(CharacterVector x) {
   IntegerVector y(seq_len(x.size()));
   CharacterVector u = stri_join2(x, y);
   u = stri_flatten(u, CharacterVector(", "));
   return u;
}
