# ExampleRcppStringi

This is a showcase package that depends both on [Rcpp](http://www.rcpp.org/)
and the [stringi](https://github.com/gagolews/stringi/) C API.

The `src/import_stringi.cpp` file aims to set up all the required `GetCCallables`.

See `src/test.cpp` for a few examples of calling functions in `stringi`
from within `Rcpp`.
