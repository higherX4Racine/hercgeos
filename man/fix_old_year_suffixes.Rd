% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fix_old_year_suffixes.R
\name{fix_old_year_suffixes}
\alias{fix_old_year_suffixes}
\title{Remove year numbers from the end of field names}
\usage{
fix_old_year_suffixes(.features)
}
\arguments{
\item{.features}{a tibble}
}
\value{
the same tibble, but with some fields possibly renamed.
}
\description{
Older shapefiles from the census (pre-2010) have the last two digits of the
year appended to the ends of their fields. This function removes all trailing
digits from each field name.
}
\examples{
data.frame(
  LoveIs0 = c("Amor", "Amour", "Amore")
) |> fix_old_year_suffixes()

}
