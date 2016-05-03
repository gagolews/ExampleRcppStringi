library("testthat")
context("ExampleRcppStringi")

test_that("test_dup", {
   expect_equal(test_dup("abc", 1:10), stringi::stri_dup("abc", 1:10))
})


test_that("test_paste", {
   expect_equal(test_paste(LETTERS),
                stringi::stri_flatten(
                   stringi::stri_paste(LETTERS, 1:length(LETTERS)), ", "))
})
