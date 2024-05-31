#' @title factorial_recursive
#' @param n n
factorial_recursive <- function(n) {
  if (n < 0L) {
    return(NaN)
  }

  if (n == 0L) {
    return(1L)
  }

  n * factorial_recursive(n - 1L)
}

#' @title factorial_procedural
#' @param n n
factorial_procedural <- function(n) {
  if (n < 0L) {
    return(NaN)
  }

  result <- 1

  for (i in seq_along(n)) result <- result * i

  result
}

#' @title factorial_reduce
#' @param n n
factorial_reduce <- function(n) ifelse(n < 0, NaN, Reduce(`*`, seq_len(n)))

#' @title factorial_purrr
#' @param n n
factorial_purrr <- function(n) ifelse(n < 0, NaN, purrr::reduce(seq_len(n), `*`))

#' @title main
main <- function() {
  assertthat::are_equal(factorial_recursive(6), factorial(6))
  assertthat::are_equal(factorial_recursive(6), factorial(6))
  assertthat::are_equal(factorial_reduce(6), factorial(6))
  assertthat::are_equal(factorial_purrr(6), factorial(6))
}
