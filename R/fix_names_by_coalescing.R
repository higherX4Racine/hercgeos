#' Coalesce NAME and NAMELSAD fields to fix blank NAME entries
#'
#' Shapefiles have a NAME and a NAMELSAD field, but the NAME one is sometimes blank.
#' The NAMELSAD values are often more informative.
#' That is especially true for things like blocks and tracts.
#' This function condenses both into NAME but doesn't remove NAMELSAD.
#' It prefers the values from NAMELSAD, if they are different.
#'
#' @param .features any tibble with NAME and NAMELSAD features.
#'
#' @return a tibble with an additional column, "Name".
#' @export
fix_names_by_coalescing <- function(.features){
    dplyr::mutate(.features,
                  Name = dplyr::coalesce(.data$NAMELSAD,
                                         .data$NAME)
    )
}
