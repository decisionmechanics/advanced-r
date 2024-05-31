#unused_import_linter
library(lobstr)

# absolute_path_linter
# nonportable_path_linter
home_folder <- "/home/janedoe"

# any_duplicated_linter
any(duplicated(mtcars))

# any_is_na_linter
any(is.na(1L:10L))

# assignment_linter
x = 1L

# backport_linter
list2DF()

# boolean_arithmetic_linter
length(which(c(1L:3L) == c(4L:6L))) == 0

# brace_linter
if (x == 0L) FALSE else {
  TRUE
}

# class_equals_linter
class(x) == "character"

# commas_linter
c(1L,2L)

# commented_code_linter
# x <- 1

# condition_message_linter
message(paste("Hello", "World"))

# conjunct_test_linter
testthat::expect_true(TRUE && TRUE)

# consecutive_assertion_linter
assertthat::assert_that(x != 0L)
assertthat::assert_that(x != 1L)

# trailing_blank_lines_linter


# cyclocomp_linter
if (x == 0L) {
  while (x == 999L) {
    if (x == 2L) {}
  }
}

# duplicate_argument_linter
list(x = 1L, x = 2L)

# empty_assignment_linter
x <- {}

# equals_na_linter
x == NA

# expect_comparison_linter
testthat::expect_true(x > 0L)

# expect_identical_linter
testthat::expect_equal(x, 1L)

# expect_length_linter
testthat::expect_equal(length(x), 1L)

# expect_named_linter
testthat::expect_equal(names(x), "a")

# expect_not_linter
testthat::expect_true(!x)

# expect_null_linter
testthat::expect_true(is.null(x))

# expect_s3_class_linter
testthat::expect_identical(class(x), "integer")

# expect_s4_class_linter
testthat::expect_true(is(x, "integer"))

# expect_true_false_linter
testthat::expect_identical(x, TRUE)

# expect_type_linter
testthat::expect_identical(typeof(x), "integer")

# extraction_operator_linter
mtcars$mpg
# fixed_regex_linter
gsub("abc", "", x)

# for_loop_index_linter
for (x in x) {}

# function_argument_linter
function (x = 1, y) {}

# function_left_parentheses_linter
sum (1L:10L)

# function_return_linter
# implicit_assignment_linter
function() {
  return(x <- 1L)
}

# if_not_else_linter
if (!x) x else 1L

# ifelse_censor_linter
ifelse(x > y, y, x)

# implicit_integer_linter
x < 1

# indentation_linter
function(
    x,
  y
) {}

# infix_spaces_linter
x<-1L

# inner_combine_linter
x <- c(sin(30.0), sin(60.0))

# is_numeric_linter
is.numeric(x) || is.integer(x)

# keyword_quote_linter
x <- c("a" = 1L)

# length_levels_linter
length(levels(x))

# length_test_linter
length(x == 1L)

# lengths_linter
vapply(x, length, integer(1L))

# library_call_linter
library(tibble)
df <- tibble(a = 1L)
library(dplyr)
df |> mutate(b = a)

# line_length_linter
first_20_primes <- c(2L, 3L, 5L, 7L, 11L, 13L, 17L, 19L, 23L, 29L, 31L, 37L, 41L, 43L, 47L, 53L, 59L, 61L, 67L, 71L)

# literal_coercion_linter
as.integer(1.0)

# matrix_apply_linter
apply(x, 1L, sum)

# missing_argument_linter
mean(1L, )

# missing_package_linter
library(foobar)

# namespace_linter
foobar::do_stuff()

# nested_ifelse_linter
ifelse(x == 1L, 2L, ifelse(x == 3L, 4L, 5L))

# numeric_leading_zero_linter
x <- .1

# object_length_linter
first_two_primes_squared_with_three_added_to_them <- c(2L, 3L) ** 2L + 3L

# object_name_linter
myName <- "Jane Doe"

# object_usage_linter
foo <- function() {
  x <- 1L
}

# outer_negation_linter
any(!x)

# package_hooks_linter
.onLoad <- function(lib, ...) { }

# paren_body_linter
function()1L

# paste_linter
paste(1L, 2L, 3L, sep = "")

# pipe_call_linter
# pipe_consistency_linter
c(1L:10L) %>% sum

# pipe_continuation_linter
c(1L:10L) |>
  sqrt() |> sum()

# quotes_linter
greeting <- 'Hello World'

# redundant_equals_linter
if (x == TRUE) 1L

# redundant_ifelse_linter
ifelse(x == 1L, TRUE, FALSE)

# regex_subset_linter
x[grep(pattern, x)]

# repeat_linter
while (TRUE) {}

# routine_registration_linter
.Call("cpp_routine", PACKAGE = "mypkg")

# scalar_in_linter
1L %in% 1L

# semicolon_linter
x <- 1;

# seq_linter
1L:nrow(x)

# sort_linter
x[order(x)]

# spaces_inside_linter
x <- c( 1L, 2L)

# spaces_left_parentheses_linter
while(x == 1L) {}

# sprintf_linter
sprintf("Hello %s", "World", "Again")

# string_boundary_linter
grepl("^the ", x)

# strings_as_factors_linter
data.frame(x = "a")

# system_file_linter
system.file(file.path("a", "b"), package = "foo")

# T_and_F_symbol_linter
x <- T

# todo_comment_linter
x <- 1 # TODO

# trailing_whitespace_linter
x <- 1L 

# undesirable_function_linter
sapply(x, sum)

#undesirable_operator_linter
a <<- log(10L)

# unnecessary_concatenation_linter
x <- c(1L)

# unnecessary_lambda_linter
lapply(x, \(y) sum(y))

# unnecessary_nested_if_linter
if (x) {
  if (y) {
  }
}

# unnecessary_placeholder_linter
# pipe_consistency_linter
x %>% sum(.)

# unreachable_code_linter
function() {
  return(1L)
  2L
}

# vector_logic_linter
if (TRUE | FALSE) 1L

#whitespace_linter
	x <- "indented with tab!"
	
# yoda_test_linter
expect_identical(1L, x)