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

build_fields_for_vintage <- function(.crosswalk, .vintage, .is_old) {
    .crosswalk |>
        purrr::pmap_chr(\(Role, Detail, ...) {
            pattern_functions[[Role]](
                set_year(.vintage, Detail, .is_old),
                Detail
            )
        }) |>
        toupper()
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
#' @returns `<chr[]>` the field names for the relevant crosswalk
#' @export
crosswalk_field_names <- function(.newer_vintage) {

    .post_2k <- .newer_vintage > 2000L

    .xwalk <- dplyr::filter(DECENNIAL_TABULATION_CROSSWALK,
                            .data$`Pre 2000` | .post_2k)

    .before <- build_fields_for_vintage(.xwalk, .newer_vintage, TRUE)

    if (.post_2k) {
        .before <- head(.before, -2)
    }

    c(.before, build_fields_for_vintage(.xwalk, .newer_vintage, FALSE))
}
