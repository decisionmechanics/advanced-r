#' @title get_greeting
#' @param name name
#' @param time time
get_greeting <- function(name, time) {
  hour <- lubridate::hour(time)

  if (hour < 2 || hour >= 20) {
    greeting = "Good night"
  }
  else if (hour < 12) {
    greeting = "Good morning"
  } else if (hour < 17) {
    greeting = "Good afternoon"
  } else {
    greeting = "Good evening"
  }

  paste0(greeting, ", ", name, ".")
}

#' @title greet
#' @param name name
greet <- function(name) {
  cat(get_greeting(name, Sys.time()), "\n")
}

#' @title main
main <- function() {
  greet("Jane")

  get_greeting("Jane", lubridate::make_datetime(hour = 0))
  get_greeting("Jane", lubridate::make_datetime(hour = 2))
  get_greeting("Jane", lubridate::make_datetime(hour = 12))
  get_greeting("Jane", lubridate::make_datetime(hour = 17))
  get_greeting("Jane", lubridate::make_datetime(hour = 20))
  get_greeting("Jane", lubridate::make_datetime(hour = 24))
}
