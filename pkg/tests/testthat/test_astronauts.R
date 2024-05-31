create_data <- function() {
  jsonlite::parse_json("{\"message\": \"success\", \"people\": [{\"name\": \"Jasmin Moghbeli\", \"craft\": \"ISS\"}, {\"name\": \"Andreas Mogensen\", \"craft\": \"ISS\"}, {\"name\": \"Satoshi Furukawa\", \"craft\": \"ISS\"}, {\"name\": \"Konstantin Borisov\", \"craft\": \"ISS\"}, {\"name\": \"Oleg Kononenko\", \"craft\": \"ISS\"}, {\"name\": \"Nikolai Chub\", \"craft\": \"ISS\"}, {\"name\": \"Loral O'Hara\", \"craft\": \"ISS\"}], \"number\": 7}")
}

testthat::test_that(
  "Parsing astronauts returns a tibble",
  {
    # Arrange

    data <- create_data()

    # Act

    astronaut_df <- parse_astronauts(data)

    # Assert

    testthat::expect_s3_class(astronaut_df, "tbl")
  }
)

testthat::test_that(
  "Parsing astronauts returns names and crafts",
  {
    # Arrange

    data <- create_data()

    # Act

    astronaut_df <- parse_astronauts(data)

    # Assert

    testthat::expect_equal(names(astronaut_df), c("name", "craft"))
  }
)
