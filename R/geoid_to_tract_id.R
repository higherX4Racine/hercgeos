#' Extract the 4- or 6-digit tract codes from full census GEOID
#'
#' @param .geoids a vector of GEOIDs for blocks, block groups, or tracts.
#' @param .years the census vintage year, as an integer, for each GEOID
#'
#' @return a character vector of zero-padded 4- or 6-digit tract codes
#' @export
geoid_to_tract_id <- function(.geoids, .years){
    .geoids |>
        stringr::str_sub(6L, 11L) |>
        hercgeos::truncate_decennial_tract_codes(.years)
}
