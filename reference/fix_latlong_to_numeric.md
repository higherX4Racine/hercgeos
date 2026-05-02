# Convert interpreted latitude and longitude from text to numbers

The census fields of "INTPTLAT" and "INTPTLON" contain "+" and "-"
characters. For this reason,
[`sf::read_sf`](https://r-spatial.github.io/sf/reference/st_read.html)
interprets them as character, not numeric, columns. This function
rectifies that.

## Usage

``` r
fix_latlong_to_numeric(.features)
```

## Arguments

- .features:

  a tibble with fields that start with "INTPT"

## Value

the same tibble, but with those fields converted to numbers

## Examples

``` r
data.frame(
  INTPTLAT = c("-4.4", "+3.3", "-2.2", "+1.1"),
  INTPTLON = c(3, 1, 4, 1)
) |>
fix_latlong_to_numeric()
#>   INTPTLAT INTPTLON
#> 1     -4.4        3
#> 2      3.3        1
#> 3     -2.2        4
#> 4      1.1        1
```
