# Create a tigershape filename based upon state, year, and geography

Create a tigershape filename based upon state, year, and geography

## Usage

``` r
tiger_name_for(
  state,
  year,
  geography = c("county subunit", "school district", "place", "tract", "block group",
    "block")
)
```

## Arguments

- state:

  the two-digit FIPS number for the state

- year:

  the four-digit census year

- geography:

  \<chr, optional\> one of "county subunits" (the default), "school
  districts", "places", "tracts", "blocks"

## Value

a string such as "tl_2000_55_cousub00"

## Examples

``` r
tiger_name_for(55L, 2000L, "county subunit")
#> [1] "tl_2010_55_cousub00"
tiger_name_for(25L, 2010L, "school district")
#> [1] "tl_2010_25_unsd10"
tiger_name_for(10L, 2020L, "place")
#> [1] "tl_2020_10_place"
tiger_name_for(2L, 2020L, "block")
#> [1] "tl_2020_02_tabblock20"
```
