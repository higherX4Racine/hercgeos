#' Import data from US Census TIGER/Line shapefiles
#'
#' @param .path string, the location of the shapefile directory
#'
#' @return a simple features table with one entry per geography
#' @export
#' @examples
#' library(sf)
#'
read_tigershapes <- function(.path) {
    .path |>
        sf::read_sf(
            quiet = TRUE
        ) |>
        fix_old_year_suffixes() |>
        fix_old_geoids() |>
        dplyr::rename_with(
            ~ stringr::str_remove(., pattern = "\\d+$")
        ) |>
        fix_latlong_to_numeric() |>
        sf::st_set_agr(
            hercgeos::TIGER_ATTRIBUTES
        )
}

#' Load geographies from many shapefiles into a tibble of simple features
#'
#' @param .path_list a list of paths, which may include names
#' @param .names_to the output's column that tracks path names
#' @param ... other arguments for <[filtering][dplyr::filter]> the shapefiles
#'
#' @return a tibble that is also a simple features object.
#' @seealso [read_tigershapes()]
#' @export
batch_read_tigershapes <- function(.path_list, .names_to, ...) {
    if (is.null(names(.path_list ))) {
        .path_list <- rlang::set_names(.path_list)
    }
    .shapes <- .path_list |>
        purrr::map(read_tigershapes) |>
        purrr::map(dplyr::filter, ...) |>
        purrr::list_rbind(names_to = .names_to) |>
        sf::st_as_sf()
}
