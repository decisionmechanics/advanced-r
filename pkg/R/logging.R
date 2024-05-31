main <- function() {
  log_file_path <- file.path(tempdir(), "test.log")

  log_file <- logr::log_open(log_file_path)

  logr::log_print("First five cars")

  first_cars <- mtcars |> head(n = 5)

  logr::log_print(first_cars)

  logr::log_close()

  writeLines(readLines(log_file))
}
