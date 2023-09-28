#' Extract the 4- or 6-digit tract codes from full census GEOID values
#'
#' @param .geoids a vector of GEOIDs for blocks, block groups, or tracts.
#' @param .years the census vintage year, as an integer, for each GEOID
#'
#' @return a character vector of zero-padded 4- or 6-digit tract codes
#' @seealso [truncate_decennial_tract_codes()]
#' @export
#' @examples
#' geoid_to_tract_id("551010001001101", c(2000L, 2010L, 2020L))
#'
geoid_to_tract_id <- function(.geoids, .years){
    .geoids |>
        stringr::str_sub(6L, 11L) |>
        truncate_decennial_tract_codes(.years)
}
