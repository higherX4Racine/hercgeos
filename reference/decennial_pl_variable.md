# Variable names for PL tables, per the idiosyncrasies of decennial censuses

Decennial censuses record demographic information per Public Law 94-171.
There are four tables (descriptions t.b.d) with the same information
each decade, but the API formatting of the variable names differs for
each decade. This function keeps track of those differences for you.

## Usage

``` r
decennial_pl_variable(.year, .table, .index)
```

## Arguments

- .year:

  the decade of the census

- .table:

  an integer, `[1, 4]`, denoting a PL table.

- .index:

  an integer, `[1, 999]`, denoting a variable in a PL table.

## Value

a character vector of variable names.

## Examples

``` r
decennial_pl_variable(2000L + c(0L, 10L, 20L), 2L, 1L)
#> [1] "PL002001" "P002001"  "P2_001N" 
```
