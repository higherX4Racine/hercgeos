#' Create a tigershape filename based upon state, year, and geography
#'
#' @param state <int> the two-digit FIPS number for the state
#' @param year <int> the four-digit census year
#' @param geography <chr, optional> one of "county subunits" (the default), "school districts", "places", "tracts", "blocks"
#'
#' @return a string such as "tl_2000_55_cousub00"
#' @export
#'
#' @examples
#' tiger_name_for(55L, 2000L, "county subunits")

tiger_name_for <- function(state,
                           year,
                           geography = c("county subunits",
                                         "school districts",
                                         "places",
                                         "tracts",
                                         "blocks")
) {
    state <- sprintf("%02d", state)
    geography <- rlang::arg_match(geography)
    ending <- paste0(
        switch(geography,
               "county subunits" = "cousub",
               "school districts" = "unsd",
               "places" = "place",
               "tracts" = "tract",
               "blocks" = "tabblock"
        ),
        dplyr::if_else(year != 2020L | geography == "blocks",
                       sprintf("%02d", year %% 100L),
                       "")
    )
    paste("tl", year, state, ending, sep = "_")
}
