#' Remove year numbers from the end of field names
#'
#' Older shapefiles from the census (pre-2010) have the last two digits of the
#' year appended to the ends of their fields. This function removes all trailing
#' digits from each field name.
#'
#' @param .features a tibble
#'
#' @return the same tibble, but with some fields possibly renamed.
#' @export
fix_old_year_suffixes <- function(.features){
    dplyr::rename_with(.features,
                       stringr::str_remove,
                       pattern = "\\d+$")
}
