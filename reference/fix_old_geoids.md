# Replace ID fields with "GEOID"

Older (pre-2010) shapefiles have geography-specific names for their
GEOID fields. For example, a county subdivision shapefile would have a
field named "COSBIDFP." This function renames any field that includes
"IDFP" to "GEOID."

## Usage

``` r
fix_old_geoids(.features)
```

## Arguments

- .features:

  a data frame

## Value

the same data frame, but with one column possibly renamed.

## Examples

``` r
data.frame(
  COSIBIDFP = c("55100", "55101", "551012")
) |>
fix_old_geoids()
#>    GEOID
#> 1  55100
#> 2  55101
#> 3 551012
```
