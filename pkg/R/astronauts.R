#' @title parse_astronauts
#' @param data data
parse_astronauts <- function(data) {
  data |>
    purrr::pluck("people") |>
    purrr::map_df(tibble::as_tibble)
}

#' @title fetch_astronauts
fetch_astronauts <- function() {
  httr2::request("http://api.open-notify.org/astros") |>
    httr2::req_perform() |>
    httr2::resp_body_json() |>
    parse_astronauts()
}

#' @title main
main <- function() {
  fetch_astronauts()
}

