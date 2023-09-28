## code to prepare `unit_pentagon` dataset goes here

theta <- c(0, 1, 2, 3, 4, 0) * 2 * pi / 5
unit_pentagon <- matrix(c(cos(theta),
                          sin(theta)),
                        nrow = 6)
unit_pentagon <- unit_pentagon |>
    list() |>
    sf::st_polygon() |>
    sf::st_sfc()

unit_pentagon <- unit_pentagon / sqrt(st_area(unit_pentagon))

usethis::use_data(unit_pentagon, overwrite = TRUE)
