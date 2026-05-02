# Create a factor of terrains based on census reporting of water area and land use.

Create a factor of terrains based on census reporting of water area and
land use.

## Usage

``` r
terrain_factor(.use_type, ...)
```

## Arguments

- .use_type:

  character The census labels blocks as "U" for developed and "R" for
  undeveloped

- ...:

  Arguments passed on to
  [`is_water`](https://higherx4racine.github.io/hercgeos/reference/is_water.md)

  `.water_area`

  :   the area of a geography that is water

  `.land_area`

  :   the area of a geography that is land

## Value

a factor with three levels, the names of
[TERRAIN_COLORS](https://higherx4racine.github.io/hercgeos/reference/TERRAIN_COLORS.md)

## See also

[`is_water()`](https://higherx4racine.github.io/hercgeos/reference/is_water.md)
