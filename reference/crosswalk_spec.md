# Compute the names of the columns in a tabulation crosswalk table

Tabulation crosswalk tables are used to relate blocks from one decennial
census to another. They don't always stay the same, especially if the
population or land use in an area has changed rapidly during the ten
years between censuses.

## Usage

``` r
crosswalk_spec(.newer_vintage)
```

## Arguments

- .newer_vintage:

  `<int>` The more recent of the two decennial censuses being compared.

## Value

`<chr[]>` a named vector of data types for reading the relevant
crosswalk's csv file

## See also

[`DECENNIAL_TABULATION_CROSSWALK`](https://higherx4racine.github.io/hercgeos/reference/DECENNIAL_TABULATION_CROSSWALK.md)
