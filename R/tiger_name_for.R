#' Create a tigershape filename based upon state, year, and geography
#'
#' @param state `<int>` the two-digit FIPS number for the state
#' @param year `<int>` the four-digit census year
#' @param geography `<chr?>` one of "county subunit", "school district", "place", "tract", "block group", or "blocks"
#'
#' @return `<str>` such as "tl_2000_55_cousub00"
#' @export
#'
#' @examples
#' tiger_name_for(55L, 2000L, "county subunit")
#' tiger_name_for(25L, 2010L, "school district")
#' tiger_name_for(10L, 2020L, "place")
#' tiger_name_for(2L, 2020L, "block")
tiger_name_for <- function(state,
                           year,
                           geography) {
    .state <- sprintf("%02d", state)

    .geography <- rlang::arg_match(geography,
                                   values = c("county subunit",
                                              "school district",
                                              "place",
                                              "tract",
                                              "block group",
                                              "block"))

    .root <- list(
        "county subunit" = "cousub",
        "school district" = "unsd",
        "place" = "place",
        "tract" = "tract",
        "block group" = "bg",
        "block" = "tabblock"
    )[[.geography]]

    .year <- sprintf("%04d", dplyr::if_else(year == 2000L, 2010L, year))

    .suffix <- dplyr::if_else(year < 2020 | geography == "block",
                              sprintf("%02d", year %% 100L),
                              "")
    paste("tl", .year, .state, paste0(.root, .suffix), sep = "_")
}
