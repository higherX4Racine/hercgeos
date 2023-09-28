#' Filter one or more geometries by a reference geometry using a single
#' geometric predicate.
#'
#' @param .target_geoms A table of one or more to-be-filtered simple features.
#' @param .reference_geom A single simple feature that the targets will be
#'   compared to.
#' @param .predicate A <[sf::geos_binary_pred()]>
#' @param ...  <[`dynamic-dots`][rlang::dyn-dots]> arguments for
#'   [selecting][tidyselect::language()] columns from `.target_geoms`
#'
#' @return a subset of `.target_geoms` that meets the criteria represented by
#'   `.reference_geom` and `.predicate`
#' @export
#' @examples
#' library(sf)
#' targets <- st_sf(label = letters[1:3],
#'                  geometry = c(UNIT_PENTAGON + c(1, 1),
#'                               UNIT_PENTAGON + c(2, 2),
#'                               UNIT_PENTAGON + c(3, 3)),
#'                  sf_column_name = "geometry")
#' geometry_filter(targets, UNIT_PENTAGON, st_intersects, "label")
geometry_filter <- function(.target_geoms, .reference_geom, .predicate, ...){
    .target_geoms |>
        dplyr::select(
            ...
        ) |>
        dplyr::filter(
            .data$geometry |>
                .predicate(.reference_geom,
                           sparse = FALSE) |>
                as.logical()
        ) |>
        sf::st_drop_geometry()
}
