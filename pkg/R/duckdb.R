# Use standard evaluation to placate package checks

#' @title download_dataset
download_dataset <- function() {
  utils::download.file(
    "https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-03.parquet",
    here::here("data-raw/yellow_tripdata_2024-03.parquet")
  )
}

#' @title read_using_arrow
read_using_arrow <- function() {
  arrow::read_parquet(here::here("data-raw/yellow_tripdata_2024-03.parquet")) |>
    dplyr::select("trip_distance", "fare_amount", "tip_amount")
}

#' @title read_using_duckdb
read_using_duckdb <- function() {
  duckplyr::df_from_parquet(here::here("data-raw/yellow_tripdata_2024-03.parquet")) |>
    duckplyr::as_duckplyr_df() |>
    duckplyr::select("trip_distance", "fare_amount", "tip_amount")
}

#' @title bench_arrow
bench_arrow <- function() {
  bench::bench_time({
    df <- read_using_arrow()
    print(stats::cor(df$fare_amount, df$tip_amount))
  })
}

#' @title explain_duckdb_query_plan
explain_duckdb_query_plan <- function() {
  read_using_duckdb() |>
    duckplyr::explain()
}

#' @title bench_duckdb
bench_duckdb <- function() {
  bench::bench_time({
    df <- read_using_duckdb()
    print(stats::cor(df$fare_amount, df$tip_amount))
  })
}
