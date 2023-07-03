#' Lop off trailing "00"s from census tract codes from 2000.
#'
#' For inscrutable reasons, the census requires 4-digit tract numbers in some
#' API calls, but ONLY for tracts from the year 2000 that end in "00"
#'
#' @param .tract_codes a character vector of labels like "999999" or "000100"
#' @param .years numeric years.
#'
#' @return a character vector of labels like "999999" or "0001" (or "000100").
#' @export
truncate_decennial_tract_codes <- function(.tract_codes, .years){
    dplyr::if_else(.years == 2000L,
                   stringr::str_remove(.tract_codes,
                                       "00$"),
                   .tract_codes)
}
