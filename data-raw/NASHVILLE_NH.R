## code to prepare `NASHVILLE_NH` dataset goes here

data_source <- system.file("extdata",
                           "NASHVILLE_NH",
                           package = "hercgeos")

layers <- sf::st_layers(data_source)$name

NASHVILLE_NH <- layers |>
    rlang::set_names() |>
    purrr::map( ~ sf::st_read(dsn = system.file("extdata",
                                                "NASHVILLE_NH",
                                                package = "hercgeos"),
                              layer = .,
                              drivers = "ESRI Shapefile",
                              quiet = TRUE,
                              as_tibble = TRUE))

usethis::use_data(NASHVILLE_NH, overwrite = TRUE)
