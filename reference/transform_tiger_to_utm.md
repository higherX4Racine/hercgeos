# Transform native TIGER/Line lat-long features to UTM features

Transform native TIGER/Line lat-long features to UTM features

## Usage

``` r
transform_tiger_to_utm(
  .tiger_features,
  longitude_label = "INTPTLON",
  datum = "NAD83"
)
```

## Arguments

- .tiger_features:

  a shapefile from the Census' TIGER/Line database

- longitude_label:

  optional, the column with longitudes, defaults to "INTPTLON"

- datum:

  optional, the datum that the shapefile uses, defaults to "NAD83

## Value

a \<[sf::sf](https://r-spatial.github.io/sf/reference/sf.html)\> object

## See also

[`central_utm()`](https://higherx4racine.github.io/hercgeos/reference/central_utm.md)

[`utm_crs()`](https://higherx4racine.github.io/hercgeos/reference/utm_crs.md)
