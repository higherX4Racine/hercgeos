#' Replace ID fields with "GEOID"
#'
#' Older (pre-2010) shapefiles have geography-specific names for their GEOID fields.
#' For example, a county subdivision shapefile would have a field named "COSBIDFP."
#' This function renames any field that includes "IDFP" to "GEOID."
#'
#' @param .features a simple features object
#'
#' @return the same object, but with one column possibly renamed.
#' @export
#'
fix_old_geoids <- function(.features){
    dplyr::rename_with(.features,
                       .fn = ~ "GEOID",
                       .cols = tidyselect::contains("IDFP",
                                                    ignore.case = FALSE))
}
