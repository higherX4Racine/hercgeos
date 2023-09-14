#' Identify census blocks that are all water
#'
#' @param .features a simple features table
#' @param .water_area_label optional, the column that describes water area, defaults to "AWATER"
#' @param .land_area_label optional, the column that describes land area, defaults to "ALAND"
#'
#' @return a logical vector that is `TRUE` for water areas
#' @export
is_water <- function(.features,
                     .water_area_label = "AWATER",
                     .land_area_label = "ALAND") {
    .features[[.water_area_label]] > 0 &
        .features[[.land_area_label]] == 0
}

#' Create a factor of terrains based on census reporting of water area and land use.
#'
#' @param .blocks a simple features table from TIGER/Line
#'
#' @return a factor with three levels, the names of [hercgeos::hercgeos::TERRAIN_COLORS]
#' @export
terrain_factor <- function(.blocks, ...){
    factor(
        dplyr::case_when(
            is_water(.blocks, ...) ~ names(hercgeos::TERRAIN_COLORS)[1],
            .blocks$UR == "R" ~ names(hercgeos::TERRAIN_COLORS)[2],
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
