# The layout for a crosswalk of tabulation blocks between decennial censuses

Blocks from one decennial census do not necessarily correspond to those
from others. A crosswalk between tabulation blocks is used to define
those correspondences.

## Usage

``` r
DECENNIAL_TABULATION_CROSSWALK
```

## Format

### `DECENNIAL_TABULATION_CROSSWALK`

A data frame with 10 rows and 6 columns.

- Role:

  `<chr>` "FIPS" for parts of GEOIDs, "Area" for block size, and "Part"
  for information about overlaps

- Detail:

  `<chr>` several values are possible, depending upon the `Role`

- Data Type:

  `<chr>` usually "c," but occasionally "n" for areas and overlaps.

- In Older Vintage:

  `<lgl>` Is this column used to describe the older vintage in the
  crosswalks?

- Pre 2000:

  `<lgl>` Does this column appear in earlier crosswalks?

- Field Description:

  `<chr>` a short but informative definition of the field's role.

## Source

<https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2020-census-block-record-layout.html>

<https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2000-relationship-file-record-layout.html>

## See also

[`crosswalk_spec()`](https://higherx4racine.github.io/hercgeos/reference/crosswalk_spec.md)
