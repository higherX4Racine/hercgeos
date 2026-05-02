# Coalesce NAME and NAMELSAD fields to fix blank NAME entries

Census TIGER/Line shapefiles have a NAME and a NAMELSAD field, but the
NAME one is sometimes blank. The NAMELSAD values are often more
informative. That is especially true for things like blocks and tracts.
This function condenses both into NAME but doesn't remove NAMELSAD. It
prefers the values from NAMELSAD, if they are different. Both NAME and
NAMELSAD are removed.

## Usage

``` r
fix_names_by_coalescing(.features)
```

## Arguments

- .features:

  any tibble with NAME and NAMELSAD features.

## Value

a tibble with an additional column, "Name," and neither "NAME" nor
"NAMELSAD"

## Examples

``` r
data.frame(
  NAME = c("Townsville", "", NA),
  NAMELSAD = c("The City of Townsville", "Metrograd", "Locationopolis")
) |> fix_names_by_coalescing()
#>                     Name
#> 1 The City of Townsville
#> 2              Metrograd
#> 3         Locationopolis
```
