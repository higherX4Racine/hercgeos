# Filter one or more geometries by a reference geometry using a single geometric predicate.

Filter one or more geometries by a reference geometry using a single
geometric predicate.

## Usage

``` r
geometry_filter(.target_geoms, .reference_geom, .predicate, ...)
```

## Arguments

- .target_geoms:

  A table of one or more to-be-filtered simple features.

- .reference_geom:

  A single simple feature that the targets will be compared to.

- .predicate:

  A
  \<[`sf::geos_binary_pred()`](https://r-spatial.github.io/sf/reference/geos_binary_pred.html)\>

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  arguments for
  [selecting](https://tidyselect.r-lib.org/reference/language.html)
  columns from `.target_geoms`

## Value

a subset of `.target_geoms` that meets the criteria represented by
`.reference_geom` and `.predicate`

## Examples

``` r
library(sf)
#> Linking to GEOS 3.12.1, GDAL 3.8.4, PROJ 9.4.0; sf_use_s2() is TRUE
targets <- st_sf(label = letters[1:3],
                 geometry = c(UNIT_PENTAGON + c(1, 1),
                              UNIT_PENTAGON + c(2, 2),
                              UNIT_PENTAGON + c(3, 3)),
                 sf_column_name = "geometry")
geometry_filter(targets, UNIT_PENTAGON, st_intersects, "label")
#> [1] label
#> <0 rows> (or 0-length row.names)
```
