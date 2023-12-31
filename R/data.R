#' A named character vector of shapefile attributes for data from TIGER/Line
"TIGER_ATTRIBUTES"

#' A named character vector of hex-encoded colors for water, developed and undeveloped land.
"TERRAIN_COLORS"

#' Formats for decennial census variables of overall population.
#'
#' A tibble with formatting data about the population variable for each
#' decennial census
#'
#' @format ## `DECENNIAL_POPULATION_VARIABLE_FORMATS` A data frame with 3 rows
#'   and 4 columns:
#' \describe{
#'   \item{Year}{Decadal years, e.g. 2010, 2020}
#'   \item{Group}{The table of data that the variables are found in.}
#'   \item{Separator}{The character, if any, that goes between the group name and the variable number}
#'   \item{Suffix}{The suffix, if any, that goes on the end of a variable name}
#' }
#'
#' @source <https://api.census.gov/data/2000/dec/pl/groups.html>
#' @source <https://api.census.gov/data/2010/dec/pl/groups.html>
#' @source <https://api.census.gov/data/2020/dec/pl/groups.html>
"DECENNIAL_POPULATION_VARIABLE_FORMATS"

#' Two 2020 Census tracts from the northern part of Nashua, NH.
#'
#' The northern part of the city of Nashua, NH briefly seceded and becoming its
#' own town, Nashville. These tracts are roughly in that area. This set of
#' simple features was created by filtering, but otherwise not changing, a file
#' with every 2020 Census tract in New Hampshire.
#'
#' @format `NASHVILLE_NH` A list of three tibbles of simple features
#'
#'   **blocks** : All census blocks within the `tracts`.
#'
#'   **tracts** : Tracts "33011010400" and "33011010500" from the 2020 US Census.
#'
#'   **historic_district** : The registered national historic place that once was
#'   Nashville, NH.
#'
#'   For `blocks` and `tracts`, the columns are verbatim what you find in
#'   freshly-downloaded TIGER/Line shapefiles. For `historic_district`, the
#'   columns are "RESNAME", "SRC_DAT", and "NR_PROP"
#'
#' @source The National Register of Historic Places' database of shapefiles:
#'   <https://irma.nps.gov/DataStore/Reference/Profile/2210280>
#' @source The US Censu Bureau's TIGER/Line shapefile database:
#'   <https://www.census.gov/cgi-bin/geo/shapefiles/index.php>
"NASHVILLE_NH"

#' An `sfc` object with one five-sided polygon whose are is one.
"UNIT_PENTAGON"
