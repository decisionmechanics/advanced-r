tweak_tariff_data <- function(df) {
  df |>
    janitor::clean_names() |>
    dplyr::select(
      -reporter_name,
      -agreement_name,
      -partner_name,
      -x8_digit_or_10_digit,
      -preferential_applied_duty_rate_excluded,
      -notes
    ) |>
    tidyr::pivot_longer(
      cols = preferential_duty_rate_from_01_01_2021:preferential_duty_rate_from_01_02_2034,
      names_to = "date",
      values_to = "preferential_duty_rate"
    ) |>
    dplyr::mutate(
      date = date |>
        stringr::str_sub(-10L) |>
        lubridate::parse_date_time("d_m_y"),
      preferential_duty_rate = dplyr::na_if(preferential_duty_rate, "excluded")
    )
}

export_tariff_data <- function() {
  readxl::read_excel(
    here::here("data-raw/1. UK tariffs data for UK-Japan Free Trade Agreement.xlsx"),
    sheet = "tariffs schedule"
  ) |>
    tweak_tariff_data() |>
    arrow::write_parquet(here::here("data-raw/uk-japan-free-trade-agreement.parquet"))
}

tweak_trade_in_goods_data <- function(df) {
  df |>
    janitor::clean_names() |>
    dplyr::rename(
      `2017` = "value_5",
      `2018` = "value_6",
      `2019` = "value_7",
      `2020` = "value_8",
      `2021` = "value_9",
    ) |>
    tidyr::pivot_longer(cols = `2017`:`2021`, names_to = "year") |>
    dplyr::mutate(
      flow = as.factor(flow),
      year = as.integer(year),
    ) |>
    dplyr::left_join(
      readxl::read_excel(
        "data-raw/2. UK trade in goods data (2017-2021).xlsx",
        sheet = "Country Code"
      ) |>
        janitor::clean_names() |>
        dplyr::select(-important_notes),
      by = "country_name"
    ) |>
    dplyr::relocate("country_name", "country_alpha_code", "territory_codes")
}

export_trade_in_goods_data <- function() {
  readxl::read_excel(
    here::here("data-raw/2. UK trade in goods data (2017-2021).xlsx"),
    sheet = "Goods Flows",
    skip = 2
  ) |>
    tweak_trade_in_goods_data() |>
    arrow::write_parquet(here::here("data-raw/trade-in-goods.parquet"))
}

tweak_trade_in_services_data <- function(df) {
  df |>
    janitor::clean_names() |>
    dplyr::rename(
      `2017` = "value_m_6",
      `2018` = "value_m_7",
      `2019` = "value_m_8",
      `2020` = "value_m_9",
      `2021` = "value_m_10",
    ) |>
    tidyr::pivot_longer(cols = `2017`:`2021`, names_to = "year") |>
    dplyr::mutate(value = dplyr::na_if(value, "Suppressed")) |>
    dplyr::mutate(
      flow = as.factor(flow),
      service_type_code = as.integer(service_type_code),
      service_type = as.factor(service_type),
      year = as.integer(year),
      value = as.double(dplyr::na_if(value, "Suppressed"))
    )
}

export_trade_in_services_data <- function() {
  readxl::read_excel(
    here::here("data-raw/3. UK trade in services data (2017-2021).xlsx"),
    sheet = "Services flows",
    skip = 1
  ) |>
    tweak_trade_in_services_data() |>
    arrow::write_parquet(here::here("data-raw/trade-in-services.parquet"))
}

main <- function() {
  export_tariff_data()
  export_trade_in_goods_data()
  export_trade_in_services_data()
}
