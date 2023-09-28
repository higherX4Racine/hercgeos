#' Replace ID fields with "GEOID"
#'
#' Older (pre-2010) shapefiles have geography-specific names for their GEOID
#' fields. For example, a county subdivision shapefile would have a field named
#' "COSBIDFP." This function renames any field that includes "IDFP" to "GEOID."
#'
#' @param .features a data frame
#'
#' @return the same data frame, but with one column possibly renamed.
#' @export
#' @examples
#' data.frame(
#'   COSIBIDFP = c("55100", "55101", "551012")
#' ) |>
#' fix_old_geoids()
#'
fix_old_geoids <- function(.features){
    dplyr::rename_with(.features,
                       .fn = ~ rep("GEOID", length(.)),
                       .cols = tidyselect::contains("IDFP",
                                                    ignore.case = FALSE))
}
