# Read a file with crosswalk information between the blocks of two consecutive decennial censuses.

Read a file with crosswalk information between the blocks of two
consecutive decennial censuses.

## Usage

``` r
read_crosswalk(.filepath, .newer_vintage, ...)
```

## Arguments

- .filepath:

  `<chr>` the full path to the crosswalk file, which may be a ZIP
  archive

- .newer_vintage:

  `<int>` The more recent of the two decennial censuses being compared.

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Additional arguments for
  [`readr::read_delim()`](https://readr.tidyverse.org/reference/read_delim.html).

## Value

`<tbl>` a many-to-many relationship table between the two census's
blocks.

## See also

[`crosswalk_spec()`](https://higherx4racine.github.io/hercgeos/reference/crosswalk_spec.md)
