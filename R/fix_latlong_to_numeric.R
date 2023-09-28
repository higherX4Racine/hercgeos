#' Convert interpreted latitude and longitude from text to numbers
#'
#' The census fields of "INTPTLAT" and "INTPTLON" contain "+" and "-"
#' characters. For this reason, `sf::read_sf` interprets them as character, not
#' numeric, columns. This function rectifies that.
#'
#' @param .features a tibble with fields that start with "INTPT"
#' @return the same tibble, but with those fields converted to numbers
#' @export
#' @examples
#' data.frame(
#'   INTPTLAT = c("-4.4", "+3.3", "-2.2", "+1.1"),
#'   INTPTLON = c(3, 1, 4, 1)
#' ) |>
#' fix_latlong_to_numeric()
#'
fix_latlong_to_numeric <- function(.features){
    withCallingHandlers(
        dplyr::mutate(
            .features,
            dplyr::across(tidyselect::starts_with("INTPT"),
                          as.numeric)
        ),
        warning = function(w){
            rlang::abort(
                "Couldn't convert all of the field values to numeric values",
            )
        }
    )
}
