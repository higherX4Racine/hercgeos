# Remove year numbers from the end of field names

Older shapefiles from the census (pre-2010) have the last two digits of
the year appended to the ends of their fields. This function removes all
trailing digits from each field name.

## Usage

``` r
fix_old_year_suffixes(.features)
```

## Arguments

- .features:

  a tibble

## Value

the same tibble, but with some fields possibly renamed.

## Examples

``` r
data.frame(
  LoveIs0 = c("Amor", "Amour", "Amore")
) |> fix_old_year_suffixes()
#>   LoveIs
#> 1   Amor
#> 2  Amour
#> 3  Amore
```
