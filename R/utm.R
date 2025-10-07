#' Identify the UTM Zone that corresponds to a longitude
#'
#' @param .longitude a decimal longitude
#'
#' @return an integer UTM code
#' @export
utm_zone_from_longitude <- function(.longitude){
    as.integer((.longitude + 180.0) / 6)
}

#' Create a coordinate reference system for a UTM Zone and datum.
#'
#' @param utm_zone an integer that refers to a single zone
#' @param datum the name of a model of the earth's shape, such as "NAD83"
#'
#' @return an <[sf::st_crs()]> object
#' @export
utm_crs <- function(utm_zone, datum = "NAD83"){
    sf::st_crs(paste("+proj=utm",
                     paste0("+zone=", utm_zone),
                     paste0("+datum=", datum),
                     .sep = " "))
}

#' Find the median UTM Zone from a vector of longitudes.
#'
#' @param .longitudes one or more decimal longitudes
#'
#' @return a single integer code for one UTM Zone
#' @seealso [utm_zone_from_longitude()]
#' @export
central_utm <- function(.longitudes){
    as.integer(round(stats::median(utm_zone_from_longitude(.longitudes))))
}

#' Transform native TIGER/Line lat-long features to UTM features
#'
#' @param .tiger_features a shapefile from the Census' TIGER/Line database
#' @param longitude_label optional, the column with longitudes, defaults to "INTPTLON"
#' @param datum optional, the datum that the shapefile uses, defaults to "NAD83
#'
#' @return a <[sf::sf]> object
#' @seealso [central_utm()]
#' @seealso [utm_crs()]
#' @export
transform_tiger_to_utm <- function(.tiger_features,
                                   longitude_label = "INTPTLON",
                                   datum = "NAD83"){
    sf::st_transform(
        .tiger_features,
        utm_crs(central_utm(.tiger_features[[longitude_label]]),
                datum = datum)
    )
}
