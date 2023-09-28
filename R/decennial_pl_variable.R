#' Variable names for PL tables, per the idiosyncrasies of decennial censuses
#'
#' Decennial censuses record demographic information per Public Law 94-171.
#' There are four tables (descriptions t.b.d) with the same information each
#' decade, but the API formatting of the variable names differs for each decade.
#' This function keeps track of those differences for you.
#'
#' @param .year the decade of the census
#' @param .table an integer, `[1, 4]`, denoting a PL table.
#' @param .index an integer, `[1, 999]`, denoting a variable in a PL table.
#'
#' @return a character vector of variable names.
#' @export
#' @examples
#' decennial_pl_variable(2000L + c(0L, 10L, 20L), 2L, 1L)
decennial_pl_variable <- function(.year, .table, .index){
    ix <- match(.year, hercgeos::DECENNIAL_POPULATION_VARIABLE_FORMATS$Year)
    if (any(is.na(ix))) {
        cli::cli_abort(
            message = c(
                "Unsupported census year",
                "i" = "You entered {(.year)}, for {.var .year},",
                "i" = "but it must be one of {(hercgeos::DECENNIAL_POPULATION_VARIABLE_FORMATS$Year)}."
            ),
            class = "bad_census_year"
        )
    }
    paste0(hercgeos::DECENNIAL_POPULATION_VARIABLE_FORMATS$Group[ix],
           .table,
           hercgeos::DECENNIAL_POPULATION_VARIABLE_FORMATS$Separator[ix],
           sprintf("%03d", .index),
           hercgeos::DECENNIAL_POPULATION_VARIABLE_FORMATS$Suffix[ix]
    )
}
