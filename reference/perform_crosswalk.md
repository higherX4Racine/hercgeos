# Join the blocks from consecutive decennial censuses by their crosswalks

Join the blocks from consecutive decennial censuses by their crosswalks

## Usage

``` r
perform_crosswalk(.blocks, .crosswalk, .vintage)
```

## Arguments

- .blocks:

  `<tbl>` a data frame with columns "State," "County," "Tract," and
  "Block."\]

- .crosswalk:

  `<tbl>` a product of
  [`read_crosswalk()`](https://higherx4racine.github.io/hercgeos/reference/read_crosswalk.md),
  from 10 years earlier to `.vintage`

- .vintage:

  `<int>` the decennial year that defined `.blocks`

## Value

`<tbl>` a lookup table from later blocks to earlier ones

- Vintage:

  `<int>` the later decennial census

- GEOID:

  `<chr>` identifiers for blocks in the later decennial census

- State:

  `<chr>` the state for a block in the earlier census.

- County:

  `<chr>` the county for a block in the earlier census.

- Tract:

  `<chr>` the tract for a block in the earlier census.

- Block:

  `<chr>` the id for a block in the earlier census.

- Overlap:

  `<dbl>` the proportion of the older block that intersects with the
  newer one
