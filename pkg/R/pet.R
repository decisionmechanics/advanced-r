#' @title new_pet
#' @param name name
#' @param species species
#' @param owner owner
#' @param dob dob
new_pet <- function(name, species, owner, dob) {
  structure(
    name,
    species = species,
    owner = owner,
    dob = dob,
    class = "pet"
  )
}

#' @title validate_pet
#' @param a_pet a_pet
validate_pet <- function(a_pet) {
  dob <- attr(a_pet, "dob")

  if (!lubridate::is.Date(dob)) {
    stop("dob must be a valid date", call. = FALSE)
  }

  if (dob > lubridate::now()) {
    stop("dob must not be in the future", call. = FALSE)
  }
}

#' @title pet
#' @param name name
#' @param species species
#' @param owner owner
#' @param dob dob
pet <- function(species, name, owner = NULL, dob) {
  a_pet <- new_pet(
    species = species,
    name = name,
    owner = owner,
    dob = dob
  )

  validate_pet(a_pet)

  a_pet
}

#' @title print.pet
#' @param a_pet a_pet
print.pet <- function(a_pet) {
  species <- attr(a_pet, "species")
  owner <- attr(a_pet, "owner")
  dob <- attr(a_pet, "dob")

  attr(a_pet, "species") <- NULL
  attr(a_pet, "owner") <- NULL
  attr(a_pet, "dob") <- NULL
  class(a_pet) <- setdiff(class(a_pet), "pet")

  name <- NextMethod()

  if (is.null(owner)) {
    owner <- "no-one"
  }

  today <- lubridate::today()
  age <- trunc(lubridate::interval(dob, today) / lubridate::years(1))

  cat(paste(age, "year old", species, "who is owned by", owner))
}

#' @title main
main <- function() {
  oskar <- pet(
    "Oskar",
    species = "cat",
    dob = as.Date("2016-07-10")
  )

  oskar
}

