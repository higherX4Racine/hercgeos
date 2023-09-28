## code to prepare `UNIT_PENTAGON` dataset goes here

theta <- c(0, 1, 2, 3, 4, 0) * 2 * pi / 5
UNIT_PENTAGON <- matrix(c(cos(theta),
                          sin(theta)),
                        nrow = 6)
UNIT_PENTAGON <- UNIT_PENTAGON |>
    list() |>
    sf::st_polygon() |>
    sf::st_sfc()

UNIT_PENTAGON <- UNIT_PENTAGON / sqrt(sf::st_area(UNIT_PENTAGON))

usethis::use_data(UNIT_PENTAGON, overwrite = TRUE)
