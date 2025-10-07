## Copyright (C) 2025 by Higher Expectations for Racine County


.fips_pattern <- function(.vintage, .detail) {
    .lowered <- tolower(.detail)
    .lowered |>
        dplyr::case_match(
            "block" ~ "blk",
            "suffix" ~ "blksf",
            .default = .lowered
        ) |>
        paste0(
            "_",
            .vintage
        )
}

.area_pattern <- function(.vintage, .detail) {
    paste0("area", .detail, "_", .vintage)
}

.part_pattern <- function(.vintage, .detail) {
    if (.detail == "Flag") {
        return(paste0("block_part_flag_", .vintage))
    }
    paste0("area", .detail, "_", "int")
}

pattern_functions <- list(FIPS = .fips_pattern,
                          Area = .area_pattern,
                          Part = .part_pattern)

set_year <- function(.vintage, .detail, .is_old) {
    if (.detail == "Flag") {
        return(ifelse(.is_old, "o", "r"))
    }
    .vintage + ifelse(.is_old, -10L, 0L)
}

build_spec_for_vintage <- function(.crosswalk, .vintage, .is_old) {
    .crosswalk |>
        dplyr::pull(
            "Datatype"
        ) |>
        rlang::set_names(
            .crosswalk |>
                purrr::pmap_chr(
                    \(Role, Detail, ...) pattern_functions[[Role]](
                        set_year(.vintage, Detail, .is_old),
                        Detail
                    )
                ) |>
                toupper()
        )
}

#' Compute the names of the columns in a tabulation crosswalk table
#'
#' Tabulation crosswalk tables are used to relate blocks from one decennial
#' census to another.
#' They don't always stay the same, especially if the population or land use
#' in an area has changed rapidly during the ten years between censuses.
#'
#' @param .newer_vintage `<int>` The more recent of the two decennial censuses being compared.
#'
#' @returns `<chr[]>` a named vector of data types for reading the relevant crosswalk's csv file
#'
#' @seealso [`DECENNIAL_TABULATION_CROSSWALK`]
#' @export
crosswalk_spec <- function(.newer_vintage) {

    .post_2k <- .newer_vintage > 2000L

    .xwalk <- dplyr::filter(DECENNIAL_TABULATION_CROSSWALK,
                            .data$`Pre 2000` | .post_2k)

    .xwalk |>
        dplyr::filter(
            .data$`In Older Vintage`
        ) |>
        build_spec_for_vintage(
            .newer_vintage,
            TRUE
        ) |>
        c(
            build_spec_for_vintage(.xwalk,
                                   .newer_vintage,
                                   FALSE)
        )
}

#' Read a file with crosswalk information between the blocks of two consecutive decennial censuses.
#'
#' @param .filepath `<chr>` the full path to the crosswalk file, which may be a ZIP archive
#' @inheritParams crosswalk_spec
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> Additional arguments for [readr::read_delim()].
#'
#' @returns `<tbl>` a many-to-many relationship table between the two census's blocks.
#' @seealso [crosswalk_spec()]
#' @export
read_crosswalk <- function(.filepath, .newer_vintage, ...) {

    .delim <- ifelse(.newer_vintage < 2020, ",", "|")

    .spec <- crosswalk_spec(.newer_vintage)

    readr::read_delim(.filepath,
                      delim = .delim,
                      col_names = names(.spec),
                      skip = ifelse(.newer_vintage > 2000, 1, 0),
                      col_types = .spec,
                      ...)
}
