# Lop off trailing "00"s from census tract codes from 2000.

For inscrutable reasons, the census requires 4-digit tract numbers in
some API calls, but ONLY for tracts from the year 2000 that end in "00"

## Usage

``` r
truncate_decennial_tract_codes(.tract_codes, .years)
```

## Arguments

- .tract_codes:

  a character vector of labels like "999999" or "000100"

- .years:

  numeric years.

## Value

a character vector of labels like "999999" or "0001" (or "000100").
