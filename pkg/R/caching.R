#' @title is_prime
#' @param n n
is_prime <- function(n) {
  # Handle edge cases for numbers less than 2
  if (n <= 1L) {
    return(FALSE)
  }

  # 2 is the only even prime number
  if (n == 2L) {
    return(TRUE)
  }

  # eliminate even numbers greater than 2
  if (n %% 2L == 0L) {
    return(FALSE)
  }

  # check for factors from 3 to the square root of n
  for (i in seq.int(from = 3L, to = max(as.integer(sqrt(n)), 3L), by = 2L)) {
    if (n %% i == 0L) {
      return(FALSE)
    }
  }

  # if no factors were found, the number is prime
  TRUE
}

#' @title make_caching_prime_checker
#' @param use_cache use_cache
make_caching_prime_checker <- function(use_cache = TRUE) {
  previous_primes = list()

  function(n) {
    if(!use_cache || !rlang::has_name(previous_primes, as.character(n))) {
      previous_primes[[as.character(n)]] <<- is_prime(n)
    }

    previous_primes[[as.character(n)]]
  }
}

# Run these commands individually
#' @title main
main <- function() {
  is_prime_with_cache <- make_caching_prime_checker()
  is_prime_without_cache <- make_caching_prime_checker(use_cache = FALSE)

  is_prime_with_cache <- make_caching_prime_checker()
  is_prime_with_cache(447666980159911)
  is_prime_with_cache(447666980159911)

  bench::bench_time(is_prime_with_cache(933553649548043))
  bench::bench_time(is_prime_with_cache(447666980159911))
}
