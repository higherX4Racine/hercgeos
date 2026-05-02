# Load geographies from many shapefiles into a tibble of simple features

Load geographies from many shapefiles into a tibble of simple features

## Usage

``` r
batch_read_tigershapes(.path_list, .names_to, ...)
```

## Arguments

- .path_list:

  a list of paths, which may include names

- .names_to:

  the output's column that tracks path names

- ...:

  other arguments for
  \<[filtering](https://dplyr.tidyverse.org/reference/filter.html)\> the
  shapefiles

## Value

a tibble that is also a simple features object.

## See also

[`read_tigershapes()`](https://higherx4racine.github.io/hercgeos/reference/read_tigershapes.md)
