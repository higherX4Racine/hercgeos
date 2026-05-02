# Create a coordinate reference system for a UTM Zone and datum.

Create a coordinate reference system for a UTM Zone and datum.

## Usage

``` r
utm_crs(utm_zone, datum = "NAD83")
```

## Arguments

- utm_zone:

  an integer that refers to a single zone

- datum:

  the name of a model of the earth's shape, such as "NAD83"

## Value

an
\<[`sf::st_crs()`](https://r-spatial.github.io/sf/reference/st_crs.html)\>
object
