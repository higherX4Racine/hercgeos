#' Identify geographies that are all water
#'
#' @param .water_area <numeric> the area of a geography that is water
#' @param .land_area <numeric> the area of a geography that is land
#'
#' @return a logical vector that is `TRUE` for water areas
#' @export
is_water <- function(.water_area, .land_area){
    .water_area > 0 & .land_area == 0
}

#' Create a factor of terrains based on census reporting of water area and land
#' use.
#'
#' @param .use_type character The census labels blocks as "U" for developed and
#'   "R" for undeveloped
#' @inheritDotParams is_water .water_area .land_area
#'
#' @return a factor with three levels, the names of [TERRAIN_COLORS]
#' @seealso [is_water()]
#' @export
terrain_factor <- function(.use_type, ...){
    factor(
        dplyr::case_when(
            is_water(...) ~ names(hercgeos::TERRAIN_COLORS)[1],
            .use_type == "R" ~ names(hercgeos::TERRAIN_COLORS)[2],
            .default = names(hercgeos::TERRAIN_COLORS)[3]
        ),
        levels = names(hercgeos::TERRAIN_COLORS)
    )
}

#' Plot census blocks by water or land use
#'
#' @param .blocks a simple features table from the Census TIGER/Line database
#' @param .line_color optional, the color for block borders, defaults to light gray
#' @param .scale_name optional, a title for the fill scale, defaults to empty
#'
#' @return an list of [ggplot2::ggplot()] commands, suitable for chaining
#' @export
geom_terrain <- function(.blocks, .line_color = "#cccccc66", .scale_name = NULL){
    list(
        ggplot2::geom_sf(
            data = .blocks,
            mapping = ggplot2::aes(fill = .data$Terrain),
            color = .line_color
        ),
        ggplot2::scale_fill_manual(
            name = .scale_name,
            values = hercgeos::TERRAIN_COLORS
        )
    )
}
