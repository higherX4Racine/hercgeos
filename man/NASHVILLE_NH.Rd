% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{NASHVILLE_NH}
\alias{NASHVILLE_NH}
\title{Two 2020 Census tracts from the northern part of Nashua, NH.}
\format{
\code{NASHVILLE_NH} A list of three tibbles of simple features

\strong{blocks} : All census blocks within the \code{tracts}.

\strong{tracts} : Tracts "33011010400" and "33011010500" from the 2020 US Census.

\strong{historic_district} : The registered national historic place that once was
Nashville, NH.

For \code{blocks} and \code{tracts}, the columns are verbatim what you find in
freshly-downloaded TIGER/Line shapefiles. For \code{historic_district}, the
columns are "RESNAME", "SRC_DAT", and "NR_PROP"
}
\source{
The National Register of Historic Places' database of shapefiles:
\url{https://irma.nps.gov/DataStore/Reference/Profile/2210280}

The US Censu Bureau's TIGER/Line shapefile database:
\url{https://www.census.gov/cgi-bin/geo/shapefiles/index.php}
}
\usage{
NASHVILLE_NH
}
\description{
The northern part of the city of Nashua, NH briefly seceded and becoming its
own town, Nashville. These tracts are roughly in that area. This set of
simple features was created by filtering, but otherwise not changing, a file
with every 2020 Census tract in New Hampshire.
}
\keyword{datasets}
