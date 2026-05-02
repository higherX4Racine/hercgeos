# Extract the 4- or 6-digit tract codes from full census GEOID values

Extract the 4- or 6-digit tract codes from full census GEOID values

## Usage

``` r
geoid_to_tract_id(.geoids, .years)
```

## Arguments

- .geoids:

  a vector of GEOIDs for blocks, block groups, or tracts.

- .years:

  the census vintage year, as an integer, for each GEOID

## Value

a character vector of zero-padded 4- or 6-digit tract codes

## See also

[`truncate_decennial_tract_codes()`](https://higherx4racine.github.io/hercgeos/reference/truncate_decennial_tract_codes.md)

## Examples

``` r
geoid_to_tract_id("551010001001101", c(2000L, 2010L, 2020L))
#> [1] "0001"   "000100" "000100"
```
