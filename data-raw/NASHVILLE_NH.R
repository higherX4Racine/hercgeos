## code to prepare `NASHVILLE_NH` dataset goes here

## You will have to modify this function to match where your shapefiles reside
system_shapefiles <- hiRx::input_path("Downloads",
                                      "Census Bureau",
                                      "Shapefiles",
                                      "2020")

package_shapefiles <- system.file("extdata",
                                  "NASHVILLE_NH",
                                  package = "hercgeos")

tracts_to_keep <- c("010400", "010500")

nashua <- list(tracts = "tl_2020_33_tract",
               blocks = "tl_2020_33_tabblock20") |>
    purrr::map(
        ~ file.path(system_shapefiles, .) |>
            sf::st_read() |>
            dplyr::filter(dplyr::if_all(tidyselect::starts_with("TRACTCE"),
                                        ~ . %in% tracts_to_keep))
    )

purrr::iwalk(
    nashua, ~ sf::st_write(.x,
                           dsn = package_shapefiles,
                           layer = .y,
                           driver = "ESRI Shapefile",
                           append = TRUE,
                           as_tibble = TRUE)
)

layers <- sf::st_layers(package_shapefiles)$name

NASHVILLE_NH <- layers |>
    rlang::set_names() |>
    purrr::map( ~ sf::st_read(dsn = package_shapefiles,
                              layer = .,
                              drivers = "ESRI Shapefile",
                              quiet = TRUE,
                              as_tibble = TRUE))

usethis::use_data(NASHVILLE_NH, overwrite = TRUE)
